<?php

namespace App\Http\Servicecruds;

use Carbon\Carbon;
use Illuminate\Http\Request;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use \Symfony\Component\HttpFoundation\Session\Session;
use \Illuminate\Support\Facades\Auth;
use Stripe\Stripe;
use App\Models\{
    Supplier,
    Unit,
    Warehouse,
    Product,
    ProductWarehouse,
    Variant,
    ProductVariant,
    Purchase,
    ProductPurchase,
    ReturnPurchase,
    PurchaseProductReturn,
    Sale,
    Customer,
    ProductSale,
    Returns,
    Payment,
    ProductQuotation,
    Quotation,
    ProductReturn,
    Transfer,
    ProductTransfer,
    Payroll,
    Expense
};


class Reportcrud
{
    // ================== Reporting =============
    public function productQuantityAlert()
    {
        $lims_product_data = Product::select('product_name', 'product_code', 'product_image', 'qty', 'alert_quantity')->where('is_active', true)->whereColumn('alert_quantity', '>', 'qty')->get();
        return view('superadmin.report.qty_alert_report', compact('lims_product_data'));
    }

    public function dailySaleObjective($request)
    {
        if ($request->input('starting_date')) {
            $starting_date = $request->input('starting_date');
            $ending_date = $request->input('ending_date');
        } else {
            $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 month', strtotime(date('Y-m-d'))))));
            $ending_date = date("Y-m-d");
        }
        return view('superadmin.report.daily_sale_objective', compact('starting_date', 'ending_date'));
    }

    public function dailySaleObjectiveData($request)
    {
        $starting_date = date("Y-m-d", strtotime("+1 day", strtotime($request->input('starting_date'))));
        $ending_date = date("Y-m-d", strtotime("+1 day", strtotime($request->input('ending_date'))));

        $columns = array(
            1 => 'created_at',
        );
        $totalData = DB::table('dso_alerts')
            ->whereDate('created_at', '>=', $starting_date)
            ->whereDate('created_at', '<=', $ending_date)
            ->count();
        $totalFiltered = $totalData;

        if ($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if (empty($request->input('search.value'))) {
            $lims_dso_alert_data = DB::table('dso_alerts')
                ->whereDate('created_at', '>=', $starting_date)
                ->whereDate('created_at', '<=', $ending_date)
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        } else {
            $search = $request->input('search.value');
            $lims_dso_alert_data = DB::table('dso_alerts')
                ->whereDate('dso_alerts.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir)
                ->get();
        }
        $data = array();
        if (!empty($lims_dso_alert_data)) {
            foreach ($lims_dso_alert_data as $key => $dso_alert_data) {
                $nestedData['id'] = $dso_alert_data->id;
                $nestedData['key'] = $key;
                $nestedData['date'] = date(config('date_format'), strtotime("-1 day", strtotime($dso_alert_data->created_at)));
                foreach (json_decode($dso_alert_data->product_info) as $index => $product_info) {
                    if ($index)
                        $nestedData['product_info'] .= ', ';
                    $nestedData['product_info'] = $product_info->name . ' [' . $product_info->code . ']';
                }
                $nestedData['number_of_products'] = $dso_alert_data->number_of_products;
                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw" => intval($request->input('draw')),
            "recordsTotal" => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data" => $data
        );
        echo json_encode($json_data);
    }

    public function productExpiry()
    {
        $date = date('Y-m-d', strtotime('+10 days'));
        $lims_product_data = DB::table('products')
            ->join('product_batches', 'products.id', '=', 'product_batches.product_id')
            ->whereDate('product_batches.expired_date', '<=', $date)
            ->where([
                ['products.is_active', true],
                ['product_batches.qty', '>', 0]
            ])
            ->select('products.product_name', 'products.product_code', 'products.product_image', 'product_batches.batch_no', 'product_batches.batch_no', 'product_batches.expired_date', 'product_batches.qty')
            ->get();
        return view('superadmin.report.product_expiry_report', compact('lims_product_data'));
    }

    public function warehouseStock($request)
    {

        if (isset($request->warehouse_id))
            $warehouse_id = $request->warehouse_id;
        else
            $warehouse_id = 0;
        if (!$warehouse_id) {
            $total_item = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.qty', '>', 0]
                ])->count();

            $total_qty = Product::where('is_active', true)->sum('qty');
            $total_price = DB::table('products')->where('is_active', true)->sum(DB::raw('product_price * qty'));
            $total_cost = DB::table('products')->where('is_active', true)->sum(DB::raw('product_cost * qty'));
        } else {
            $total_item = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.qty', '>', 0],
                    ['product_warehouses.warehouse_id', $warehouse_id]
                ])->count();
            $total_qty = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.warehouse_id', $warehouse_id]
                ])->sum('product_warehouses.qty');
            $total_price = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.warehouse_id', $warehouse_id]
                ])->sum(DB::raw('products.product_price * product_warehouses.qty'));
            $total_cost = DB::table('product_warehouses')
                ->join('products', 'product_warehouses.product_id', '=', 'products.id')
                ->where([
                    ['products.is_active', true],
                    ['product_warehouses.warehouse_id', $warehouse_id]
                ])->sum(DB::raw('products.product_cost * product_warehouses.qty'));
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.warehouse_stock', compact('total_item', 'total_qty', 'total_price', 'total_cost', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function dailySale($year, $month)
    {

        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while ($start <= $number_of_day) {
            if ($start < 10)
                $date = $year . '-' . $month . '-0' . $start;
            else
                $date = $year . '-' . $month . '-' . $start;
            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $sale_data = Sale::whereDate('created_at', $date)->selectRaw(implode(',', $query1))->get();
            $total_discount[$start] = $sale_data[0]->total_discount;
            $order_discount[$start] = $sale_data[0]->order_discount;
            $total_tax[$start] = $sale_data[0]->total_tax;
            $order_tax[$start] = $sale_data[0]->order_tax;
            $shipping_cost[$start] = $sale_data[0]->shipping_cost;
            $grand_total[$start] = $sale_data[0]->grand_total;
            $start++;
        }
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        return view('superadmin.report.daily_sale', compact('total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function dailySaleByWarehouse($request, $year, $month)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();
        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while ($start <= $number_of_day) {
            if ($start < 10)
                $date = $year . '-' . $month . '-0' . $start;
            else
                $date = $year . '-' . $month . '-' . $start;
            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $sale_data = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', $date)->selectRaw(implode(',', $query1))->get();
            $total_discount[$start] = $sale_data[0]->total_discount;
            $order_discount[$start] = $sale_data[0]->order_discount;
            $total_tax[$start] = $sale_data[0]->total_tax;
            $order_tax[$start] = $sale_data[0]->order_tax;
            $shipping_cost[$start] = $sale_data[0]->shipping_cost;
            $grand_total[$start] = $sale_data[0]->grand_total;
            $start++;
        }
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];
        return view('superadmin.report.daily_sale', compact('total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function dailyPurchase($year, $month)
    {

        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while ($start <= $number_of_day) {
            if ($start < 10)
                $date = $year . '-' . $month . '-0' . $start;
            else
                $date = $year . '-' . $month . '-' . $start;
            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $purchase_data = Purchase::whereDate('created_at', $date)->selectRaw(implode(',', $query1))->get();
            $total_discount[$start] = $purchase_data[0]->total_discount;
            $order_discount[$start] = $purchase_data[0]->order_discount;
            $total_tax[$start] = $purchase_data[0]->total_tax;
            $order_tax[$start] = $purchase_data[0]->order_tax;
            $shipping_cost[$start] = $purchase_data[0]->shipping_cost;
            $grand_total[$start] = $purchase_data[0]->grand_total;
            $start++;
        }
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        return view('superadmin.report.daily_purchase', compact('total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function dailyPurchaseByWarehouse($request, $year, $month)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();
        $start = 1;
        $number_of_day = date('t', mktime(0, 0, 0, $month, 1, $year));
        while ($start <= $number_of_day) {
            if ($start < 10)
                $date = $year . '-' . $month . '-0' . $start;
            else
                $date = $year . '-' . $month . '-' . $start;
            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $purchase_data = Purchase::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', $date)->selectRaw(implode(',', $query1))->get();
            $total_discount[$start] = $purchase_data[0]->total_discount;
            $order_discount[$start] = $purchase_data[0]->order_discount;
            $total_tax[$start] = $purchase_data[0]->total_tax;
            $order_tax[$start] = $purchase_data[0]->order_tax;
            $shipping_cost[$start] = $purchase_data[0]->shipping_cost;
            $grand_total[$start] = $purchase_data[0]->grand_total;
            $start++;
        }
        $start_day = date('w', strtotime($year . '-' . $month . '-01')) + 1;
        $prev_year = date('Y', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $prev_month = date('m', strtotime('-1 month', strtotime($year . '-' . $month . '-01')));
        $next_year = date('Y', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $next_month = date('m', strtotime('+1 month', strtotime($year . '-' . $month . '-01')));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];

        return view('superadmin.report.daily_purchase', compact('total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'start_day', 'year', 'month', 'number_of_day', 'prev_year', 'prev_month', 'next_year', 'next_month', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function monthlySale($year)
    {

        $start = strtotime($year . '-01-01');
        $end = strtotime($year . '-12-31');
        while ($start <= $end) {
            $start_date = $year . '-' . date('m', $start) . '-' . '01';
            $end_date = $year . '-' . date('m', $start) . '-' . '31';

            $temp_total_discount = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('total_discount');
            $total_discount[] = number_format((float) $temp_total_discount, 2, '.', '');

            $temp_order_discount = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('order_discount');
            $order_discount[] = number_format((float) $temp_order_discount, 2, '.', '');

            $temp_total_tax = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('total_tax');
            $total_tax[] = number_format((float) $temp_total_tax, 2, '.', '');

            $temp_order_tax = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('order_tax');
            $order_tax[] = number_format((float) $temp_order_tax, 2, '.', '');

            $temp_shipping_cost = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('shipping_cost');
            $shipping_cost[] = number_format((float) $temp_shipping_cost, 2, '.', '');

            $temp_total = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('grand_total');
            $total[] = number_format((float) $temp_total, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        return view('superadmin.report.monthly_sale', compact('year', 'total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'total', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function monthlySaleByWarehouse($request, $year)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();

        $start = strtotime($year . '-01-01');
        $end = strtotime($year . '-12-31');
        while ($start <= $end) {
            $start_date = $year . '-' . date('m', $start) . '-' . '01';
            $end_date = $year . '-' . date('m', $start) . '-' . '31';

            $temp_total_discount = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('total_discount');
            $total_discount[] = number_format((float) $temp_total_discount, 2, '.', '');

            $temp_order_discount = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('order_discount');
            $order_discount[] = number_format((float) $temp_order_discount, 2, '.', '');

            $temp_total_tax = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('total_tax');
            $total_tax[] = number_format((float) $temp_total_tax, 2, '.', '');

            $temp_order_tax = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('order_tax');
            $order_tax[] = number_format((float) $temp_order_tax, 2, '.', '');

            $temp_shipping_cost = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('shipping_cost');
            $shipping_cost[] = number_format((float) $temp_shipping_cost, 2, '.', '');

            $temp_total = Sale::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('grand_total');
            $total[] = number_format((float) $temp_total, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];
        return view('superadmin.report.monthly_sale', compact('year', 'total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'total', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function monthlyPurchase($year)
    {

        $start = strtotime($year . '-01-01');
        $end = strtotime($year . '-12-31');
        while ($start <= $end) {
            $start_date = $year . '-' . date('m', $start) . '-' . '01';
            $end_date = $year . '-' . date('m', $start) . '-' . '31';

            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $purchase_data = Purchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query1))->get();

            $total_discount[] = number_format((float) $purchase_data[0]->total_discount, 2, '.', '');
            $order_discount[] = number_format((float) $purchase_data[0]->order_discount, 2, '.', '');
            $total_tax[] = number_format((float) $purchase_data[0]->total_tax, 2, '.', '');
            $order_tax[] = number_format((float) $purchase_data[0]->order_tax, 2, '.', '');
            $shipping_cost[] = number_format((float) $purchase_data[0]->shipping_cost, 2, '.', '');
            $grand_total[] = number_format((float) $purchase_data[0]->grand_total, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        return view('superadmin.report.monthly_purchase', compact('year', 'total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function monthlyPurchaseByWarehouse($request, $year)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();

        $start = strtotime($year . '-01-01');
        $end = strtotime($year . '-12-31');
        while ($start <= $end) {
            $start_date = $year . '-' . date('m', $start) . '-' . '01';
            $end_date = $year . '-' . date('m', $start) . '-' . '31';

            $query1 = array(
                'SUM(total_discount) AS total_discount',
                'SUM(order_discount) AS order_discount',
                'SUM(total_tax) AS total_tax',
                'SUM(order_tax) AS order_tax',
                'SUM(shipping_cost) AS shipping_cost',
                'SUM(grand_total) AS grand_total'
            );
            $purchase_data = Purchase::where('warehouse_id', $data['warehouse_id'])->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query1))->get();

            $total_discount[] = number_format((float) $purchase_data[0]->total_discount, 2, '.', '');
            $order_discount[] = number_format((float) $purchase_data[0]->order_discount, 2, '.', '');
            $total_tax[] = number_format((float) $purchase_data[0]->total_tax, 2, '.', '');
            $order_tax[] = number_format((float) $purchase_data[0]->order_tax, 2, '.', '');
            $shipping_cost[] = number_format((float) $purchase_data[0]->shipping_cost, 2, '.', '');
            $grand_total[] = number_format((float) $purchase_data[0]->grand_total, 2, '.', '');
            $start = strtotime("+1 month", $start);
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];
        return view('superadmin.report.monthly_purchase', compact('year', 'total_discount', 'order_discount', 'total_tax', 'order_tax', 'shipping_cost', 'grand_total', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function bestSeller()
    {

        $start = strtotime(date("Y-m", strtotime("-2 months")) . '-01');
        $end = strtotime(date("Y") . '-' . date("m") . '-31');

        while ($start <= $end) {
            $start_date = date("Y-m", $start) . '-' . '01';
            $end_date = date("Y-m", $start) . '-' . '31';

            $best_selling_qty = ProductSale::select(DB::raw('product_id, sum(qty) as sold_qty'))->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->groupBy('product_id')->orderBy('sold_qty', 'desc')->take(1)->get();
            if (!count($best_selling_qty)) {
                $product[] = '';
                $sold_qty[] = 0;
            }
            foreach ($best_selling_qty as $best_seller) {
                $product_data = Product::find($best_seller->product_id);
                $product[] = $product_data->product_name . ': ' . $product_data->product_code;
                $sold_qty[] = $best_seller->sold_qty;
            }
            $start = strtotime("+1 month", $start);
        }
        $start_month = date("F Y", strtotime('-2 month'));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = 0;
        //return $product;
        return view('superadmin.report.best_seller', compact('product', 'sold_qty', 'start_month', 'lims_warehouse_list', 'warehouse_id'));

    }

    public function bestSellerByWarehouse($request)
    {
        $data = $request->all();
        if ($data['warehouse_id'] == 0)
            return redirect()->back();

        $start = strtotime(date("Y-m", strtotime("-2 months")) . '-01');
        $end = strtotime(date("Y") . '-' . date("m") . '-31');

        while ($start <= $end) {
            $start_date = date("Y-m", $start) . '-' . '01';
            $end_date = date("Y-m", $start) . '-' . '31';

            $best_selling_qty = DB::table('sales')
                ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')->select(DB::raw('product_sales.product_id, sum(product_sales.qty) as sold_qty'))->where('sales.warehouse_id', $data['warehouse_id'])->whereDate('sales.created_at', '>=', $start_date)->whereDate('sales.created_at', '<=', $end_date)->groupBy('product_id')->orderBy('sold_qty', 'desc')->take(1)->get();

            if (!count($best_selling_qty)) {
                $product[] = '';
                $sold_qty[] = 0;
            }
            foreach ($best_selling_qty as $best_seller) {
                $product_data = Product::find($best_seller->product_id);
                $product[] = $product_data->product_name . ': ' . $product_data->product_code;
                $sold_qty[] = $best_seller->sold_qty;
            }
            $start = strtotime("+1 month", $start);
        }
        $start_month = date("F Y", strtotime('-2 month'));
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $warehouse_id = $data['warehouse_id'];
        return view('superadmin.report.best_seller', compact('product', 'sold_qty', 'start_month', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function profitLoss($request)
    {
        $start_date = $request['start_date'];
        $end_date = $request['end_date'];
        $query1 = array(
            'SUM(grand_total) AS grand_total',
            'SUM(paid_amount) AS paid_amount',
            'SUM(total_tax + order_tax) AS tax',
            'SUM(total_discount + order_discount) AS discount'
        );
        $query2 = array(
            'SUM(grand_total) AS grand_total',
            'SUM(total_tax + order_tax) AS tax'
        );
        config()->set('database.connections.mysql.strict', false);
        DB::reconnect();
        $product_sale_data = ProductSale::select(DB::raw('product_id, product_batch_id, sale_unit_id, sum(qty) as sold_qty, sum(total) as sold_amount'))
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)
            ->groupBy('product_id', 'product_batch_id')
            ->get();
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();
        $data = $this->calculateAverageCOGS($product_sale_data);
        $product_cost = $data[0];
        $product_tax = $data[1];
        /*$product_revenue = 0;
        $product_cost = 0;
        $product_tax = 0;
        $profit = 0;
        foreach ($product_sale_data as $key => $product_sale) {
            if($product_sale->product_batch_id)
                $product_purchase_data = ProductPurchase::where([
                    ['product_id', $product_sale->product_id],
                    ['product_batch_id', $product_sale->product_batch_id]
                ])->get();
            else
                $product_purchase_data = ProductPurchase::where('product_id', $product_sale->product_id)->get();

            $purchased_qty = 0;
            $purchased_amount = 0;
            $purchased_tax = 0;
            $sold_qty = $product_sale->sold_qty;
            $product_revenue += $product_sale->sold_amount;
            foreach ($product_purchase_data as $key => $product_purchase) {
                $purchased_qty += $product_purchase->qty;
                $purchased_amount += $product_purchase->total;
                $purchased_tax += $product_purchase->tax;
                if($purchased_qty >= $sold_qty) {
                    $qty_diff = $purchased_qty - $sold_qty;
                    $unit_cost = $product_purchase->total / $product_purchase->qty;
                    $unit_tax = $product_purchase->tax / $product_purchase->qty;
                    $purchased_amount -= ($qty_diff * $unit_cost);
                    $purchased_tax -= ($qty_diff * $unit_tax);
                    break;
                }
            }
            $product_cost += $purchased_amount;
            $product_tax += $purchased_tax;
        }*/
        $purchase = Purchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query1))->get();
        $total_purchase = Purchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $sale = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query1))->get();
        $total_sale = Sale::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $return = Returns::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
        $total_return = Returns::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $purchase_return = ReturnPurchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
        $total_purchase_return = ReturnPurchase::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $expense = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('amount');
        $total_expense = Expense::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $payroll = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('amount');
        $total_payroll = Payroll::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->count();
        $total_item = DB::table('product_warehouses')
            ->join('products', 'product_warehouses.product_id', '=', 'products.id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.qty', '>', 0]
            ])->count();
        $payment_recieved_number = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)->count();
        $payment_recieved = DB::table('payments')->whereNotNull('sale_id')->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('payments.amount');
        $credit_card_payment_sale = DB::table('payments')
            ->where('paying_method', 'Credit Card')
            ->whereNotNull('payments.sale_id')
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
        $cheque_payment_sale = DB::table('payments')
            ->where('paying_method', 'Cheque')
            ->whereNotNull('payments.sale_id')
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
        $gift_card_payment_sale = DB::table('payments')
            ->where('paying_method', 'Gift Card')
            ->whereNotNull('sale_id')
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)
            ->sum('amount');
        $paypal_payment_sale = DB::table('payments')
            ->where('paying_method', 'Paypal')
            ->whereNotNull('sale_id')
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)
            ->sum('amount');
        $deposit_payment_sale = DB::table('payments')
            ->where('paying_method', 'Deposit')
            ->whereNotNull('sale_id')
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)
            ->sum('amount');
        $cash_payment_sale = $payment_recieved - $credit_card_payment_sale - $cheque_payment_sale - $gift_card_payment_sale - $paypal_payment_sale - $deposit_payment_sale;
        $payment_sent_number = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date)->count();
        $payment_sent = DB::table('payments')->whereNotNull('purchase_id')->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('payments.amount');
        $credit_card_payment_purchase = DB::table('payments')
            ->where('paying_method', 'Gift Card')
            ->whereNotNull('payments.purchase_id')
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
        $cheque_payment_purchase = DB::table('payments')
            ->where('paying_method', 'Cheque')
            ->whereNotNull('payments.purchase_id')
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)->sum('payments.amount');
        $cash_payment_purchase = $payment_sent - $credit_card_payment_purchase - $cheque_payment_purchase;
        $lims_warehouse_all = Warehouse::where('is_active', true)->get();
        $warehouse_name = [];
        foreach ($lims_warehouse_all as $warehouse) {
            $warehouse_name[] = $warehouse->name;
            $warehouse_sale[] = Sale::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
            $warehouse_purchase[] = Purchase::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
            $warehouse_return[] = Returns::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
            $warehouse_purchase_return[] = ReturnPurchase::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->selectRaw(implode(',', $query2))->get();
            $warehouse_expense[] = Expense::where('warehouse_id', $warehouse->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->sum('amount');
        }

        return view('superadmin.report.profit_loss', compact('purchase', 'product_cost', 'product_tax', 'total_purchase', 'sale', 'total_sale', 'return', 'purchase_return', 'total_return', 'total_purchase_return', 'expense', 'payroll', 'total_expense', 'total_payroll', 'payment_recieved', 'payment_recieved_number', 'cash_payment_sale', 'cheque_payment_sale', 'credit_card_payment_sale', 'gift_card_payment_sale', 'paypal_payment_sale', 'deposit_payment_sale', 'payment_sent', 'payment_sent_number', 'cash_payment_purchase', 'cheque_payment_purchase', 'credit_card_payment_purchase', 'warehouse_name', 'warehouse_sale', 'warehouse_purchase', 'warehouse_return', 'warehouse_purchase_return', 'warehouse_expense', 'start_date', 'end_date'));
    }

    public function calculateAverageCOGS($product_sale_data)
    {
        $product_cost = 0;
        $product_tax = 0;
        foreach ($product_sale_data as $key => $product_sale) {
            $product_data = Product::select('product_type', 'product_list', 'variant_list', 'qty_list')->find($product_sale->product_id);
            if ($product_data->product_type == 'combo') {
                $product_list = explode(",", $product_data->product_list);
                if ($product_data->variant_list)
                    $variant_list = explode(",", $product_data->variant_list);
                else
                    $variant_list = [];
                $qty_list = explode(",", $product_data->qty_list);

                foreach ($product_list as $index => $product_id) {
                    if (count($variant_list) && $variant_list[$index]) {
                        $product_purchase_data = ProductPurchase::where([
                            ['product_id', $product_id],
                            ['variant_id', $variant_list[$index]]
                        ])
                            ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                            ->get();
                    } else {
                        $product_purchase_data = ProductPurchase::where('product_id', $product_id)
                            ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                            ->get();
                    }
                    $total_received_qty = 0;
                    $total_purchased_amount = 0;
                    $total_tax = 0;
                    $sold_qty = $product_sale->sold_qty * $qty_list[$index];
                    foreach ($product_purchase_data as $key => $product_purchase) {
                        $purchase_unit_data = Unit::select('operator', 'operation_value')->find($product_purchase->purchase_unit_id);
                        if ($purchase_unit_data->operator == '*')
                            $total_received_qty += $product_purchase->recieved * $purchase_unit_data->operation_value;
                        else
                            $total_received_qty += $product_purchase->recieved / $purchase_unit_data->operation_value;
                        $total_purchased_amount += $product_purchase->total;
                        $total_tax += $product_purchase->tax;
                    }
                    if ($total_received_qty) {
                        $averageCost = $total_purchased_amount / $total_received_qty;
                        $averageTax = $total_tax / $total_received_qty;
                    } else {
                        $averageCost = 0;
                        $averageTax = 0;
                    }
                    $product_cost += $sold_qty * $averageCost;
                    $product_tax += $sold_qty * $averageTax;
                }
            } else {
                if ($product_sale->product_batch_id) {
                    $product_purchase_data = ProductPurchase::where([
                        ['product_id', $product_sale->product_id],
                        ['product_batch_id', $product_sale->product_batch_id]
                    ])
                        ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                        ->get();
                } elseif ($product_sale->variant_id) {
                    $product_purchase_data = ProductPurchase::where([
                        ['product_id', $product_sale->product_id],
                        ['variant_id', $product_sale->variant_id]
                    ])
                        ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                        ->get();
                } else {
                    $product_purchase_data = ProductPurchase::where('product_id', $product_sale->product_id)
                        ->select('recieved', 'purchase_unit_id', 'tax', 'total')
                        ->get();
                }
                $total_received_qty = 0;
                $total_purchased_amount = 0;
                $total_tax = 0;
                if ($product_sale->sale_unit_id) {
                    $sale_unit_data = Unit::select('operator', 'operation_value')->find($product_sale->sale_unit_id);
                    if ($sale_unit_data->operator == '*')
                        $sold_qty = $product_sale->sold_qty * $sale_unit_data->operation_value;
                    else
                        $sold_qty = $product_sale->sold_qty / $sale_unit_data->operation_value;
                } else {
                    $sold_qty = $product_sale->sold_qty;
                }
                foreach ($product_purchase_data as $key => $product_purchase) {
                    $purchase_unit_data = Unit::select('operator', 'operation_value')->find($product_purchase->purchase_unit_id);
                    if ($purchase_unit_data->operator == '*')
                        $total_received_qty += $product_purchase->recieved * $purchase_unit_data->operation_value;
                    else
                        $total_received_qty += $product_purchase->recieved / $purchase_unit_data->operation_value;
                    $total_purchased_amount += $product_purchase->total;
                    $total_tax += $product_purchase->tax;
                }
                if ($total_received_qty) {
                    $averageCost = $total_purchased_amount / $total_received_qty;
                    $averageTax = $total_tax / $total_received_qty;
                } else {
                    $averageCost = 0;
                    $averageTax = 0;
                }
                $product_cost += $sold_qty * $averageCost;
                $product_tax += $sold_qty * $averageTax;
            }
        }
        return [$product_cost, $product_tax];
    }

    public function productReport($request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $warehouse_id = $data['warehouse_id'];
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.product_report', compact('start_date', 'end_date', 'warehouse_id', 'lims_warehouse_list'));
    }

    public function productReportData($request)
    {

        $lims_product_all = Product::latest()->get();

        if ($request->ajax()) {
            $lims_product_all = Product::latest()->get();
            return Datatables::of($lims_product_all)
                ->addIndexColumn()
                ->addColumn('productname', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $item_code => $variant_id) {
                            $variant_data = Variant::select('variant_name')->find($variant_id);
                            $productname = $row->product_name . ' [' . $variant_data->variant_name . ']' . '<br>' . $item_code;
                            return $productname;
                        }

                    } else {

                        return $row->product_name . '<br>' . $row->product_code;
                    }
                })
                ->addColumn('category', function ($row) {
                    $category = $row->category->name_en;
                    return $category;
                })
                ->addColumn('purchased_amount', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $purchased_amount = ProductPurchase::where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->sum('total');
                            return $purchased_amount;
                        }
                    } else {
                        $purchased_amount = ProductPurchase::where('product_id', $row->id)
                            ->sum('total');
                        return $purchased_amount;
                    }

                })
                ->addColumn('purchased_qty', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $lims_product_purchase_data = ProductPurchase::select('purchase_unit_id', 'qty')->where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->get();
                            $purchased_qty = 0;
                            if (count($lims_product_purchase_data)) {
                                foreach ($lims_product_purchase_data as $product_purchase) {
                                    $unit = DB::table('units')->find($product_purchase->purchase_unit_id);
                                    if ($unit->operator == '*') {
                                        $purchased_qty += $product_purchase->qty * $unit->operation_value;
                                    } elseif ($unit->operator == '/') {
                                        $purchased_qty += $product_purchase->qty / $unit->operation_value;
                                    }
                                }
                            }
                            return $purchased_qty;
                        }
                    } else {
                        $lims_product_purchase_data = ProductPurchase::select('purchase_unit_id', 'qty')->where([
                            ['product_id', $row->id]
                        ])->get();
                        $purchased_qty = 0;
                        if (count($lims_product_purchase_data)) {
                            foreach ($lims_product_purchase_data as $product_purchase) {
                                $unit = DB::table('units')->find($product_purchase->purchase_unit_id);
                                if ($unit->operator == '*') {
                                    $purchased_qty += $product_purchase->qty * $unit->operation_value;
                                } elseif ($unit->operator == '/') {
                                    $purchased_qty += $product_purchase->qty / $unit->operation_value;
                                }
                            }
                        }
                        return $purchased_qty;
                    }

                })

                ->addColumn('sold_amount', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $sold_amount = ProductSale::where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->sum('total');
                            return $sold_amount;
                        }
                    } else {

                        $sold_amount = ProductSale::where([
                            ['product_id', $row->id],
                        ])->sum('total');
                        return $sold_amount;
                    }
                })
                ->addColumn('sold_qty', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $lims_product_sale_data = ProductSale::select('sale_unit_id', 'qty')->where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->get();

                            $sold_qty = 0;
                            if (count($lims_product_sale_data)) {
                                foreach ($lims_product_sale_data as $product_sale) {
                                    $unit = DB::table('units')->find($product_sale->sale_unit_id);
                                    if ($unit->operator == '*') {
                                        $sold_qty += $product_sale->qty * $unit->operation_value;
                                    } elseif ($unit->operator == '/') {
                                        $sold_qty += $product_sale->qty / $unit->operation_value;
                                    }
                                }
                            }
                            return $sold_qty;
                        }
                    } else {
                        $lims_product_sale_data = ProductSale::select('sale_unit_id', 'qty')->where([
                            ['product_id', $row->id]
                        ])->get();

                        $sold_qty = 0;
                        if (count($lims_product_sale_data)) {
                            foreach ($lims_product_sale_data as $product_sale) {
                                $unit = DB::table('units')->find($product_sale->sale_unit_id);
                                if ($unit->operator == '*') {
                                    $sold_qty += $product_sale->qty * $unit->operation_value;
                                } elseif ($unit->operator == '/') {
                                    $sold_qty += $product_sale->qty / $unit->operation_value;
                                }
                            }
                        }
                        return $sold_qty;
                    }
                })
                ->addColumn('returned_amount', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $returned_amount = ProductReturn::where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->sum('total');
                            return $returned_amount;
                        }
                    } else {
                        $returned_amount = ProductReturn::where([
                            ['product_id', $row->id]
                        ])->sum('total');
                        return $returned_amount;

                    }
                })
                ->addColumn('returned_qty', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $lims_product_return_data = ProductReturn::select('sale_unit_id', 'qty')->where([
                                ['product_id', $row->id],
                                ['product_id', $variant_id]
                            ])->get();

                            $returned_qty = 0;
                            if (count($lims_product_return_data)) {
                                foreach ($lims_product_return_data as $product_return) {
                                    $unit = DB::table('units')->find($product_return->sale_unit_id);
                                    if ($unit->operator == '*') {
                                        $returned_qty += $product_return->qty * $unit->operation_value;
                                    } elseif ($unit->operator == '/') {
                                        $returned_qty += $product_return->qty / $unit->operation_value;
                                    }
                                }
                            }
                            return $returned_qty;
                        }
                    } else {
                        $lims_product_return_data = ProductReturn::select('sale_unit_id', 'qty')->where([
                            ['product_id', $row->id]
                        ])->get();

                        $returned_qty = 0;
                        if (count($lims_product_return_data)) {
                            foreach ($lims_product_return_data as $product_return) {
                                $unit = DB::table('units')->find($product_return->sale_unit_id);
                                if ($unit->operator == '*') {
                                    $returned_qty += $product_return->qty * $unit->operation_value;
                                } elseif ($unit->operator == '/') {
                                    $returned_qty += $product_return->qty / $unit->operation_value;
                                }
                            }
                        }
                        return $returned_qty;
                    }
                })
                ->addColumn('purchase_returned_amount', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $purchase_returned_amount = PurchaseProductReturn::where([
                                ['product_id', $row->id],
                                ['variant_id', $variant_id]
                            ])->sum('total');
                            return $purchase_returned_amount;
                        }
                    } else {
                        $purchase_returned_amount = PurchaseProductReturn::where([
                            ['product_id', $row->id]
                        ])->sum('total');
                        return $purchase_returned_amount;
                    }
                })
                ->addColumn('purchase_returned_qty', function ($row) {
                    if ($row->is_variant) {
                        $variant_id_all = ProductVariant::where('product_id', $row->id)->pluck('variant_id', 'item_code');
                        foreach ($variant_id_all as $variant_id) {
                            $lims_product_return_data = ProductReturn::select('sale_unit_id', 'qty')->where([
                                ['product_id', $row->id],
                                ['product_id', $variant_id]
                            ])->get();

                            $returned_qty = 0;
                            if (count($lims_product_return_data)) {
                                foreach ($lims_product_return_data as $product_return) {
                                    $unit = DB::table('units')->find($product_return->sale_unit_id);
                                    if ($unit->operator == '*') {
                                        $returned_qty += $product_return->qty * $unit->operation_value;
                                    } elseif ($unit->operator == '/') {
                                        $returned_qty += $product_return->qty / $unit->operation_value;
                                    }
                                }
                            }
                            return $returned_qty;
                        }
                    } else {
                        $lims_product_purchase_return_data = PurchaseProductReturn::select('purchase_unit_id', 'qty')->where([
                            ['product_id', $row->id]
                        ])->get();

                        $purchase_returned_qty = 0;
                        if (count($lims_product_purchase_return_data)) {
                            foreach ($lims_product_purchase_return_data as $product_purchase_return) {
                                $unit = DB::table('units')->find($product_purchase_return->purchase_unit_id);
                                if ($unit->operator == '*') {
                                    $purchase_returned_qty += $product_purchase_return->qty * $unit->operation_value;
                                } elseif ($unit->operator == '/') {
                                    $purchase_returned_qty += $product_purchase_return->qty / $unit->operation_value;
                                }
                            }
                        }
                        return $purchase_returned_qty;
                    }
                })
                ->addColumn('profit', function ($row) {
                    $sold_amount = ProductSale::where([
                        ['product_id', $row->id],
                    ])->sum('total');

                    $purchased_amount = ProductPurchase::where('product_id', $row->id)
                        ->sum('total');

                    $lims_product_purchase_data = ProductPurchase::select('purchase_unit_id', 'qty')->where([
                        ['product_id', $row->id]
                    ])->get();
                    $purchased_qty = 0;
                    if (count($lims_product_purchase_data)) {
                        foreach ($lims_product_purchase_data as $product_purchase) {
                            $unit = DB::table('units')->find($product_purchase->purchase_unit_id);
                            if ($unit->operator == '*') {
                                $purchased_qty += $product_purchase->qty * $unit->operation_value;
                            } elseif ($unit->operator == '/') {
                                $purchased_qty += $product_purchase->qty / $unit->operation_value;
                            }
                        }
                    }

                    $lims_product_sale_data = ProductSale::select('sale_unit_id', 'qty')->where([
                        ['product_id', $row->id]
                    ])->get();
                    $sold_qty = 0;
                    if (count($lims_product_sale_data)) {
                        foreach ($lims_product_sale_data as $product_sale) {
                            $unit = DB::table('units')->find($product_sale->sale_unit_id);
                            if ($unit->operator == '*') {
                                $sold_qty += $product_sale->qty * $unit->operation_value;
                            } elseif ($unit->operator == '/') {
                                $sold_qty += $product_sale->qty / $unit->operation_value;
                            }
                        }
                    }
                    // return $sold_amount .','. $purchased_amount.','.$purchased_qty.','.$sold_qty;
                    if ($purchased_qty > 0) {
                        $profit = $sold_amount - (($purchased_amount / $purchased_qty) * $sold_qty);
                        return $profit;

                    } else {
                        return $sold_amount;
                    }
                })
                ->addColumn('qty', function ($row) {
                    return $row->qty;
                })

                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }

        return view('superadmin.report.product_report.blade', compact('lims_customer_list', 'lims_user_list', 'lims_gift_card_all'));


    }

    public function purchaseReport($request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $warehouse_id = $data['warehouse_id'];
        $product_id = [];
        $variant_id = [];
        $product_name = [];
        $product_qty = [];
        $lims_product_all = Product::select('id', 'product_name', 'qty', 'is_variant')->where('is_active', true)->get();
        foreach ($lims_product_all as $product) {
            $lims_product_purchase_data = null;
            $variant_id_all = [];
            if ($warehouse_id == 0) {
                if ($product->is_variant)
                    $variant_id_all = ProductPurchase::distinct('variant_id')->where('product_id', $product->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->pluck('variant_id');
                else
                    $lims_product_purchase_data = ProductPurchase::where('product_id', $product->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->first();
            } else {
                if ($product->is_variant)
                    $variant_id_all = DB::table('purchases')
                        ->join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')
                        ->distinct('variant_id')
                        ->where([
                            ['product_purchases.product_id', $product->id],
                            ['purchases.warehouse_id', $warehouse_id]
                        ])->whereDate('purchases.created_at', '>=', $start_date)
                        ->whereDate('purchases.created_at', '<=', $end_date)
                        ->pluck('variant_id');
                else
                    $lims_product_purchase_data = DB::table('purchases')
                        ->join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')->where([
                                ['product_purchases.product_id', $product->id],
                                ['purchases.warehouse_id', $warehouse_id]
                            ])->whereDate('purchases.created_at', '>=', $start_date)
                        ->whereDate('purchases.created_at', '<=', $end_date)
                        ->first();
            }

            if ($lims_product_purchase_data) {
                $product_name[] = $product->name;
                $product_id[] = $product->id;
                $variant_id[] = null;
                if ($warehouse_id == 0) {
                    $product_qty[] = $product->qty;
                } else {
                    $product_qty[] = ProductWarehouse::where([
                        ['product_id', $product->id],
                        ['warehouse_id', $warehouse_id]
                    ])->sum('qty');
                }
            } elseif (count($variant_id_all)) {
                foreach ($variant_id_all as $key => $variantId) {
                    $variant_data = Variant::find($variantId);
                    $product_name[] = $product->product_name . ' [' . $variant_data->variant_name . ']' ?? '';
                    $product_id[] = $product->id;
                    $variant_id[] = $variant_data->id;
                    if ($warehouse_id == 0)
                        $product_qty[] = ProductVariant::FindExactProduct($product->id, $variant_data->id)->first()->qty;
                    else
                        $product_qty[] = ProductWarehouse::where([
                            ['product_id', $product->id],
                            ['variant_id', $variant_data->id],
                            ['warehouse_id', $warehouse_id]
                        ])->first()->qty;

                }
            }
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.purchase_report', compact('product_id', 'variant_id', 'product_name', 'product_qty', 'start_date', 'end_date', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function saleReport($request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $warehouse_id = $data['warehouse_id'];
        $product_id = [];
        $variant_id = [];
        $product_name = [];
        $product_qty = [];
        $lims_product_all = Product::select('id', 'product_name', 'qty', 'is_variant')->where('is_active', true)->get();

        foreach ($lims_product_all as $product) {
            $lims_product_sale_data = null;
            $variant_id_all = [];
            if ($warehouse_id == 0) {
                if ($product->is_variant)
                    $variant_id_all = ProductSale::distinct('variant_id')->where('product_id', $product->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->pluck('variant_id');
                else
                    $lims_product_sale_data = ProductSale::where('product_id', $product->id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->first();
            } else {
                if ($product->is_variant)
                    $variant_id_all = DB::table('sales')
                        ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                        ->distinct('product_sales.variant_id')
                        ->where([
                            ['product_sales.product_id', $product->id],
                            ['sales.warehouse_id', $warehouse_id]
                        ])->whereDate('sales.created_at', '>=', $start_date)
                        ->whereDate('sales.created_at', '<=', $end_date)
                        ->pluck('product_sales.variant_id');
                else
                    $lims_product_sale_data = DB::table('sales')
                        ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')->where([
                                ['product_sales.product_id', $product->id],
                                ['sales.warehouse_id', $warehouse_id]
                            ])->whereDate('sales.created_at', '>=', $start_date)
                        ->whereDate('sales.created_at', '<=', $end_date)
                        ->first();
            }
            // return dd($variant_id_all);
            if ($lims_product_sale_data) {
                $product_name[] = $product->product_name;
                $product_id[] = $product->id;
                $variant_id[] = null;
                if ($warehouse_id == 0) {

                    $product_qty[] = $product->qty;
                } else {
                    $product_qty[] = ProductWarehouse::where([
                        ['product_id', $product->id],
                        ['warehouse_id', $warehouse_id]
                    ])->sum('qty');
                }
            } elseif (count($variant_id_all)) {
                foreach ($variant_id_all as $key => $variantId) {
                    $variant_data = Variant::find($variantId);
                    $product_name[] = optional($product)->product_name . ' [' . optional($variant_data)->variant_name . ']' ?? '';
                    $product_id[] = $product->id;
                    $variant_id[] = optional($variant_data)->id;
                    if ($warehouse_id == 0) {
                        $product_qtys = ProductVariant::FindExactProduct($product->id, optional($variant_data)->id)->first();
                        $product_qty[] = optional($product_qtys)->qty;
                    } else {
                        $product_qtys = ProductWarehouse::where([
                            ['product_id', $product->id],
                            ['variant_id', optional($variant_data)->id],
                            ['warehouse_id', $warehouse_id]
                        ])->first();
                        $product_qty[] = optional($product_qtys)->qty;
                    }

                }
            }
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.sale_report', compact('product_id', 'variant_id', 'product_name', 'product_qty', 'start_date', 'end_date', 'lims_warehouse_list', 'warehouse_id'));
    }

    public function saleReportChart($request)
    {
      
        $start_date = $request->start_date;
        $end_date = strtotime($request->end_date);
        $warehouse_id = $request->warehouse_id;
        $time_period = $request->time_period;
        if ($time_period == 'monthly') {
            for ($i = strtotime($start_date); $i <= $end_date; $i = strtotime('+1 month', $i)) {
                $date_points[] = date('Y-m-d', $i);
            }
        } else {
            for ($i = strtotime('Saturday', strtotime($start_date)); $i <= $end_date; $i = strtotime('+1 week', $i)) {
                $date_points[] = date('Y-m-d', $i);
            }
        }
        $date_points[] = $request->end_date;
        //return $date_points;
        foreach ($date_points as $key => $date_point) {
            $q = DB::table('sales')
                ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                ->whereDate('sales.created_at', '>=', $start_date)
                ->whereDate('sales.created_at', '<', $date_point);
            if ($warehouse_id)
                $qty = $q->where('sales.warehouse_id', $warehouse_id);
            if (isset($request->product_list)) {
                $product_ids = Product::whereIn('product_code', explode(",", trim($request->product_list)))->pluck('id')->toArray();
                $q->whereIn('product_sales.product_id', $product_ids);
            }
            $qty = $q->sum('product_sales.qty');
            $sold_qty[$key] = $qty;
            $start_date = $date_point;
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->select('id', 'name')->get();
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        return view('superadmin.report.sale_report_chart', compact('start_date', 'end_date', 'warehouse_id', 'time_period', 'sold_qty', 'date_points', 'lims_warehouse_list'));
    }

    public function paymentReportByDate($request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];

        $lims_payment_data = Payment::whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->get();
        return view('superadmin.report.payment_report', compact('lims_payment_data', 'start_date', 'end_date'));
    }

    public function warehouseReport($request)
    {
        $data = $request->all();
        $warehouse_id = $data['warehouse_id'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];

        $lims_purchase_data = Purchase::where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_sale_data = Sale::with('customer')->where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_quotation_data = Quotation::with('customer')->where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_return_data = Returns::with('customer', 'biller')->where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_expense_data = Expense::with('expenseCategory')->where('warehouse_id', $warehouse_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();

        $lims_product_purchase_data = [];
        $lims_product_sale_data = [];
        $lims_product_quotation_data = [];
        $lims_product_return_data = [];

        foreach ($lims_purchase_data as $key => $purchase) {
            $lims_product_purchase_data[$key] = ProductPurchase::where('purchase_id', $purchase->id)->get();
        }
        foreach ($lims_sale_data as $key => $sale) {
            $lims_product_sale_data[$key] = ProductSale::where('sale_id', $sale->id)->get();
        }
        foreach ($lims_quotation_data as $key => $quotation) {
            $lims_product_quotation_data[$key] = ProductQuotation::where('quotation_id', $quotation->id)->get();
        }
        foreach ($lims_return_data as $key => $return) {
            $lims_product_return_data[$key] = ProductReturn::where('return_id', $return->id)->get();
        }
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.report.warehouse_report', compact('warehouse_id', 'start_date', 'end_date', 'lims_purchase_data', 'lims_product_purchase_data', 'lims_sale_data', 'lims_product_sale_data', 'lims_warehouse_list', 'lims_quotation_data', 'lims_product_quotation_data', 'lims_return_data', 'lims_product_return_data', 'lims_expense_data'));
    }

    public function userReport($request)
    {
        $data = $request->all();
        $user_id = $data['user_id'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $lims_product_sale_data = [];
        $lims_product_purchase_data = [];
        $lims_product_quotation_data = [];
        $lims_product_transfer_data = [];

        $lims_sale_data = Sale::with('customer', 'warehouse')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_purchase_data = Purchase::with('warehouse')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_quotation_data = Quotation::with('customer', 'warehouse')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_transfer_data = Transfer::with('fromWarehouse', 'toWarehouse')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_payment_data = DB::table('payments')
            ->where('user_id', $user_id)
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)
            ->orderBy('created_at', 'desc')
            ->get();
        $lims_expense_data = Expense::with('warehouse', 'expenseCategory')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_payroll_data = Payroll::with('employee')->where('user_id', $user_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();

        foreach ($lims_sale_data as $key => $sale) {
            $lims_product_sale_data[$key] = ProductSale::where('sale_id', $sale->id)->get();
        }
        foreach ($lims_purchase_data as $key => $purchase) {
            $lims_product_purchase_data[$key] = ProductPurchase::where('purchase_id', $purchase->id)->get();
        }
        foreach ($lims_quotation_data as $key => $quotation) {
            $lims_product_quotation_data[$key] = ProductQuotation::where('quotation_id', $quotation->id)->get();
        }
        foreach ($lims_transfer_data as $key => $transfer) {
            $lims_product_transfer_data[$key] = ProductTransfer::where('transfer_id', $transfer->id)->get();
        }

        $lims_user_list = User::where('is_active', true)->get();
        return view('superadmin.report.user_report', compact('lims_sale_data', 'user_id', 'start_date', 'end_date', 'lims_product_sale_data', 'lims_payment_data', 'lims_user_list', 'lims_purchase_data', 'lims_product_purchase_data', 'lims_quotation_data', 'lims_product_quotation_data', 'lims_transfer_data', 'lims_product_transfer_data', 'lims_expense_data', 'lims_payroll_data'));
    }

    public function customerReport($request)
    {
        $data = $request->all();
        $customer_id = $data['customer_id'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $lims_sale_data = Sale::with('warehouse')->where('customer_id', $customer_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_quotation_data = Quotation::with('warehouse')->where('customer_id', $customer_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_return_data = Returns::with('warehouse', 'biller')->where('customer_id', $customer_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_payment_data = DB::table('payments')
            ->join('sales', 'payments.sale_id', '=', 'sales.id')
            ->where('customer_id', $customer_id)
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)
            ->select('payments.*', 'sales.reference_no as sale_reference')
            ->orderBy('payments.created_at', 'desc')
            ->get();

        $lims_product_sale_data = [];
        $lims_product_quotation_data = [];
        $lims_product_return_data = [];

        foreach ($lims_sale_data as $key => $sale) {
            $lims_product_sale_data[$key] = ProductSale::where('sale_id', $sale->id)->get();
        }
        foreach ($lims_quotation_data as $key => $quotation) {
            $lims_product_quotation_data[$key] = ProductQuotation::where('quotation_id', $quotation->id)->get();
        }
        foreach ($lims_return_data as $key => $return) {
            $lims_product_return_data[$key] = ProductReturn::where('return_id', $return->id)->get();
        }
        $lims_customer_list = Customer::where('is_active', true)->get();
        return view('superadmin.report.customer_report', compact('lims_sale_data', 'customer_id', 'start_date', 'end_date', 'lims_product_sale_data', 'lims_payment_data', 'lims_customer_list', 'lims_quotation_data', 'lims_product_quotation_data', 'lims_return_data', 'lims_product_return_data'));
    }

    public function supplierReport($request)
    {
        $data = $request->all();
        $supplier_id = $data['supplier_id'];
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $lims_purchase_data = Purchase::with('warehouse')->where('supplier_id', $supplier_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_quotation_data = Quotation::with('warehouse', 'customer')->where('supplier_id', $supplier_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_return_data = ReturnPurchase::with('warehouse')->where('supplier_id', $supplier_id)->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date)->orderBy('created_at', 'desc')->get();
        $lims_payment_data = DB::table('payments')
            ->join('purchases', 'payments.purchase_id', '=', 'purchases.id')
            ->where('supplier_id', $supplier_id)
            ->whereDate('payments.created_at', '>=', $start_date)
            ->whereDate('payments.created_at', '<=', $end_date)
            ->select('payments.*', 'purchases.reference_no as purchase_reference')
            ->orderBy('payments.created_at', 'desc')
            ->get();

        $lims_product_purchase_data = [];
        $lims_product_quotation_data = [];
        $lims_product_return_data = [];

        foreach ($lims_purchase_data as $key => $purchase) {
            $lims_product_purchase_data[$key] = ProductPurchase::where('purchase_id', $purchase->id)->get();
        }
        foreach ($lims_return_data as $key => $return) {
            $lims_product_return_data[$key] = PurchaseProductReturn::where('return_id', $return->id)->get();
        }
        foreach ($lims_quotation_data as $key => $quotation) {
            $lims_product_quotation_data[$key] = ProductQuotation::where('quotation_id', $quotation->id)->get();
        }
        $lims_supplier_list = Supplier::where('is_active', true)->get();
        return view('superadmin.report.supplier_report', compact('lims_purchase_data', 'lims_product_purchase_data', 'lims_payment_data', 'supplier_id', 'start_date', 'end_date', 'lims_supplier_list', 'lims_quotation_data', 'lims_product_quotation_data', 'lims_return_data', 'lims_product_return_data'));
    }

    public function customerDueReportByDate($request)
    {
        $data = $request->all();
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $q = Sale::where('payment_status', '!=', 4)
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date);
        if ($request->customer_id)
            $q = $q->where('customer_id', $request->customer_id);
        $lims_sale_data = $q->get();
        return view('superadmin.report.due_report', compact('lims_sale_data', 'start_date', 'end_date'));
    }

    public function supplierDueReportByDate($request)
    {
        $data = $request->all();

        // return dd($data);
        $start_date = $data['start_date'];
        $end_date = $data['end_date'];
        $q = Purchase::where('payment_status', 1)
            ->whereDate('created_at', '>=', $start_date)
            ->whereDate('created_at', '<=', $end_date);
        if ($request->supplier_id)
            $q = $q->where('supplier_id', $request->supplier_id);
        $lims_purchase_data = $q->get();
        return view('superadmin.report.supplier_due_report', compact('lims_purchase_data', 'start_date', 'end_date'));
    }
}