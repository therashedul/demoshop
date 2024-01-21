<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use \Illuminate\Support\Facades\Auth;

use App\Models\{
    Category,
    Brand,
    Warehouse,
    Product,
    StockCount
};
use Yajra\DataTables\Facades\DataTables;

class StockCountcrud
{
    public function stockCountindex()
    {
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_brand_list = Brand::where('status', true)->get();
        $lims_category_list = Category::where('status', true)->get();
        $general_setting = DB::table('general_settings')->latest()->first();

        if (Auth::user()->role_id > 2 && $general_setting->staff_access == 'own')
            $lims_stock_count_all = StockCount::orderBy('id', 'desc')->where('user_id', Auth::id())->get();
        else
            $lims_stock_count_all = StockCount::orderBy('id', 'desc')->get();
        return view('superadmin.stock_count.index', compact('lims_warehouse_list', 'lims_brand_list', 'lims_category_list', 'lims_stock_count_all'));

    }

    public function stockCountStore($request)
    {
        $data = $request->all();
        if (isset($data['brand_id']) && isset($data['category_id'])) {
            $lims_product_list = DB::table('products')
                ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
                ->whereIn('products.category_id', $data['category_id'])
                ->whereIn('products.brand_id', $data['brand_id'])
                ->where([['products.is_active', true], ['product_warehouses.warehouse_id', $data['warehouse_id']]])
                ->select('products.product_name', 'products.product_code', 'product_warehouses.imei_number', 'product_warehouses.qty')
                ->get();

            $data['category_id'] = implode(",", $data['category_id']);
            $data['brand_id'] = implode(",", $data['brand_id']);
        } elseif (isset($data['category_id'])) {
            $lims_product_list = DB::table('products')
                ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
                ->whereIn('products.category_id', $data['category_id'])
                ->where([['products.is_active', true], ['product_warehouses.warehouse_id', $data['warehouse_id']]])
                ->select('products.product_name', 'products.product_code', 'product_warehouses.imei_number', 'product_warehouses.qty')
                ->get();

            $data['category_id'] = implode(",", $data['category_id']);
        } elseif (isset($data['brand_id'])) {
            $lims_product_list = DB::table('products')
                ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
                ->whereIn('products.brand_id', $data['brand_id'])
                ->where([['products.is_active', true], ['product_warehouses.warehouse_id', $data['warehouse_id']]])
                ->select('products.product_name', 'products.product_code', 'product_warehouses.imei_number', 'product_warehouses.qty')
                ->get();

            $data['brand_id'] = implode(",", $data['brand_id']);
        } else {
            $lims_product_list = DB::table('products')
                ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
                ->where([['products.is_active', true], ['product_warehouses.warehouse_id', $data['warehouse_id']]])
                ->select('products.product_name', 'products.product_code', 'product_warehouses.imei_number', 'product_warehouses.qty')
                ->get();
        }
        if (count($lims_product_list)) {
            $csvData = array('Product Name, Product Code, IMEI or Serial Numbers, Expected, Counted');
            foreach ($lims_product_list as $product) {
                $csvData[] = $product->product_name . ',' . $product->product_code . ',' . str_replace(",", "/", $product->imei_number) . ',' . $product->qty . ',' . '';
            }
            //return $csvData;
            $filename = date('Ymd') . '-' . date('his') . ".csv";
            $file_path = public_path() . '/stock_count/' . $filename;
            $file = fopen($file_path, "w+");
            foreach ($csvData as $cellData) {
                fputcsv($file, explode(',', $cellData));
            }
            fclose($file);

            $data['user_id'] = Auth::id();
            $data['reference_no'] = 'scr-' . date("Ymd") . '-' . date("his");
            $data['initial_file'] = $filename;
            $data['is_adjusted'] = false;
            StockCount::create($data);
            return redirect()->back()->with('message', 'Stock Count created successfully! Please download the initial file to complete it.');
        } else
            return redirect()->back()->with('not_permitted', 'No product found!');
    }

    public function finalize($request)
    {
        $ext = pathinfo($request->final_file->getClientOriginalName(), PATHINFO_EXTENSION);
        //checking if this is a CSV file
        if ($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');

        $data = $request->all();
        $document = $request->final_file;
        $documentName = date('Ymd') . '-' . date('his') . ".csv";
        $document->move('public/stock_count/', $documentName);
        $data['final_file'] = $documentName;
        $lims_stock_count_data = StockCount::find($data['stock_count_id']);
        $lims_stock_count_data->update($data);
        return redirect()->back()->with('message', 'Stock Count finalized successfully!');
    }

    public function stockDif($id)
    {
        $lims_stock_count_data = StockCount::find($id);
        $file_handle = fopen('public/stock_count/' . $lims_stock_count_data->final_file, 'r');
        $i = 0;
        $temp_dif = -1000000;
        $data = [];
        $product = [];
        while (!feof($file_handle)) {
            $current_line = fgetcsv($file_handle);
            if ($current_line && $i > 0 && ($current_line[3] != $current_line[4])) {
                $product[] = $current_line[0] . ' [' . $current_line[1] . ']';
                $expected[] = $current_line[3];
                $product_data = Product::where('product_code', $current_line[1])->first();

                if ($current_line[4]) {
                    $difference[] = $temp_dif = $current_line[4] - $current_line[3];
                    $counted[] = $current_line[4];
                } else {
                    $difference[] = $temp_dif = $current_line[3] * (-1);
                    $counted[] = 0;
                }
                $cost[] = $product_data->product_cost * $temp_dif;
            }
            $i++;
        }
        if ($temp_dif == -1000000) {
            $lims_stock_count_data->is_adjusted = true;
            $lims_stock_count_data->save();
        }
        if (count($product)) {
            $data[] = $product;
            $data[] = $expected;
            $data[] = $counted;
            $data[] = $difference;
            $data[] = $cost;
            $data[] = $lims_stock_count_data->is_adjusted;
        }
        return $data;
    }

    public function qtyAdjustment($id)
    {
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_stock_count_data = StockCount::find($id);
        $warehouse_id = $lims_stock_count_data->warehouse_id;
        $file_handle = fopen('public/stock_count/' . $lims_stock_count_data->final_file, 'r');
        $i = 0;
        $product_id = [];
        while (!feof($file_handle)) {
            $current_line = fgetcsv($file_handle);
            if ($current_line && $i > 0 && ($current_line[3] != $current_line[4])) {
                $product_data = Product::where('product_code', $current_line[1])->first();
                $product_id[] = $product_data->id;
                $names[] = $current_line[0];
                $code[] = $current_line[1];

                if ($current_line[4])
                    $temp_qty = $current_line[4] - $current_line[3];
                else
                    $temp_qty = $current_line[3] * (-1);

                if ($temp_qty < 0) {
                    $qty[] = $temp_qty * (-1);
                    $action[] = '-';
                } else {
                    $qty[] = $temp_qty;
                    $action[] = '+';
                }
            }
            $i++;
        }
        return view('superadmin.stock_count.qty_adjustment', compact('lims_warehouse_list', 'warehouse_id', 'id', 'product_id', 'names', 'code', 'qty', 'action'));
    }
}