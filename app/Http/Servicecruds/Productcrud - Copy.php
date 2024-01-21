<?php

namespace App\Http\Servicecruds;


use Keygen;
// Event
use Arr;
// language
// try  catch
use Carbon\Carbon;
use \App\Mail\SendMail;
use Milon\Barcode\DNS2D;
// use App\Models\Brand;
use Milon\Barcode\DNS1D;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use \Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;
use \Symfony\Component\HttpFoundation\Session\Session;

use Stripe\Stripe;
use App\Models\{
    Category,
    Brand,
    Unit,
    Tax,
    Warehouse,
    Barcode,
    Product,
    ProductWarehouse,
    Variant,
    ProductVariant
};

use App\Traits\TenantInfo;
use App\Traits\CacheForget;
class Productcrud
{
    use CacheForget;
    use TenantInfo;
    // ========================Product===================    
    public function productsindex( $request)
    {
        $products = Product::latest()->get();

        if ($request->ajax()) {
            $products = Product::latest()->get();
            if ($request->filled('from_date') && $request->filled('to_date')) {
                $start_date = $request->from_date;
                $end_date = $request->to_date;
                if ($start_date && $end_date) {
                    $start_date = date('Y-m-d', strtotime($start_date));
                    $end_date = date('Y-m-d', strtotime($end_date));

                    $products = $products->whereBetween('created_at', [$start_date, $end_date]);
                }
            }
            // custom field search
            $custompurchase = Product::select('*');
            if ($request->filled('brand_id')) {
                $products = $custompurchase->where('brand_id', $request->brand_id);

            }
            if ($request->filled('category_id')) {
                $products = $custompurchase->where('category_id', $request->category_id);
            }
            if ($request->filled('product_name')) {
                $products = $custompurchase->where('product_name', 'like', '%' . $request->product_name . '%');
            }
            return Datatables::of($products)
                ->addIndexColumn()

                // ->filter(function ($instance) use ($request) {

                //     if (!empty($request->get('product_name'))) {
                //         $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                //             return Str::contains($row['product_name'], $request->get('product_name')) ? true : false;
                //         });
                //     }

                //     if (!empty($request->get('search'))) {
                //         $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                //             if (Str::contains(Str::lower($row['product_name']), Str::lower($request->get('search')))) {
                //                 return true;
                //             } else if (Str::contains(Str::lower($row['product_name']), Str::lower($request->get('search')))) {
                //                 return true;
                //             }
                //             return false;
                //         });
                //     }

                // })

                ->addColumn('image', function ($row) {
                    if (!isset($row->product_image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->product_image) .
                            '" alt="' . $row->product_name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('thumbnail/' . $row->product_image) .
                        '" alt="' . $row->product_name . '" style="height: 40px;" >';
                })
                ->addColumn('status', function ($row) {
                    if (!empty($row->is_active)) {
                        return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';

                        // return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                    } else {
                        return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                    }
                })

                ->addColumn('brand', function ($row) {
                    $brands = DB::table('products')
                        ->join('brands', 'brands.id', '=', 'products.brand_id')
                        ->select('brands.brand_name')
                        ->where('brands.id', $row->brand_id)
                        ->get();
                    foreach ($brands as $brand) {
                        return $brand->brand_name;
                    }

                })
                ->addColumn('category', function ($row) {
                    $categories = DB::table('products')
                        ->join('categories', 'categories.id', '=', 'products.category_id')
                        ->select('categories.name_en')
                        ->where('categories.id', $row->category_id)
                        ->get();
                    foreach ($categories as $category) {
                        return $category->name_en;
                    }

                })
                ->addColumn('unit', function ($row) {
                    $units = DB::table('products')
                        ->join('units', 'units.id', '=', 'products.unit_id')
                        ->select('units.unit_code')
                        ->where('units.id', $row->unit_id)
                        ->get();
                    foreach ($units as $unit) {
                        return $unit->unit_code;
                    }
                })
                ->addColumn('publish', function ($row) {
                    $publishs = DB::table('products')
                        ->where('id', $row->id)
                        ->get();
                    foreach ($publishs as $publish) {
                        $date = date('d-M-Y', strtotime($publish->publish_at));
                        return $date;
                    }
                })


                // date('Y-m-d', strtotime($data['start_date']));
                ->addColumn('action', function ($row) {
                    // Update Button   
    
                    // '<a href="' . route('superAdmin.products.edit', $row->id ) .'">Edit</a>'; 
                    $updateButton = '<a href="' . route('superAdmin.products.edit', $row->id) . '" data-toggle="tooltip"  
                        data-id="' . $row->id . '" 
                        data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editproduct "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '"         data-original-title="Delete" class="btn btn-danger btn-sm deleteproducts"><i class="fa fa-trash"></i></a>';

                    // $nasted =  '<div class="btn-group">
                    //     <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                    //       <span class="caret"></span>
                    //       <span class="sr-only">Toggle Dropdown</span>
                    //     </button>
                    //     <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                    //         <li>
                    //             <button type="button" class="open-EditCategoryDialog btn btn-link" data-toggle="modal" data-target="#editModal" ><i class="dripicons-document-edit"></i> '.$updateButton. ' </button>
                    //         </li>
                    //         <li class="divider"></li>
                    //         <li>
                    //           <button type="submit" class="btn btn-link" onclick="return confirmDelete()">'.$deleteButton.'
                    //         </button> 
                    //         </li>
                    //     </ul>
                    // </div>';
    
                    // return  $nasted;    
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        $brands = Brand::where('status', true)->get();
        $categories = Category::where('status', true)->get();
        return view('superadmin.product.index', compact('products', 'brands', 'categories'));

        // return (new Categorycrud)->categoryindex($request);
        // Log::channel('categorylog')->critical('Category Log file', ['data' => $categories]);

    }

    public function productscreate()
    {
        $lims_product_list_without_variant = $this->productWithoutVariant();
        $lims_product_list_with_variant = $this->productWithVariant();
        $unites = Unit::where('status', '1')->get();
        $categories = Category::where('status', '1')->get();
        $brands = Brand::where('status', '1')->get();
        $taxs = Tax::where('is_active', '1')->get();
        // print_r($taxs);
        // die();        
        return view('superadmin.product.create', compact('unites', 'categories', 'brands', 'taxs'));
    }
    public function productsstore( $request)
    {
        $data = $request->except('product_name');

        if (isset($data['is_variant'])) {
            $data['variant_option'] = json_encode($data['variant_option']);
            $data['variant_value'] = json_encode($data['variant_value']);
        } else {
            $data['variant_option'] = $data['variant_value'] = null;
        }

        $data['product_name'] = preg_replace('/[\n\r]/', "<br>", htmlspecialchars(trim($request->name)));
        $data['slug'] = trim($request->slug);
        $data['barcode_id'] = $request->barcode_id;
        if ($data['product_type'] == 'combo') {
            $data['product_list'] = implode(",", $data['product_id']);
            $data['variant_list'] = implode(",", $data['variant_id']);
            $data['qty_list'] = implode(",", $data['product_qty']);
            $data['price_list'] = implode(",", $data['unit_price']);
            $data['prodcut_coust'] = $data['unit_id'] = $data['purchase_unit_id'] = $data['sale_unit_id'] = 0;
        } elseif ($data['product_type'] == 'digital' || $data['product_type'] == 'service')
            $data['prodcut_coust'] = $data['unit_id'] = $data['purchase_unit_id'] = $data['sale_unit_id'] = 0;

        $data['product_details'] = str_replace('"', '@', $data['product_details']);

        if ($data['start_date'])
            $data['start_date'] = date('Y-m-d', strtotime($data['start_date']));
        if ($data['end_date'])
            $data['end_date'] = date('Y-m-d', strtotime($data['end_date']));
        $data['is_active'] = $request->status;
        $data['trending'] = $request->trending;
        $data['product_image'] = $request->image_name;
        $data['product_sell_price'] = $request->product_sell_price;
        $data['product_regular_price'] = $request->product_regular_price;
        // print_r($data);
        // die();

        $lims_product_data = Product::create($data);
        // Product variant
        if (!isset($data['is_batch']))
            $data['is_batch'] = null;
        if (isset($data['is_variant'])) {
            foreach ($data['variant_name'] as $key => $variant_name) {
                $lims_variant_data = Variant::firstOrCreate(['variant_name' => $data['variant_name'][$key]]);
                $lims_variant_data->variant_name = $data['variant_name'][$key];
                $lims_variant_data->save();
                $lims_product_variant_data = new ProductVariant;
                $lims_product_variant_data->product_id = $lims_product_data->id;
                $lims_product_variant_data->variant_id = $lims_variant_data->id;
                $lims_product_variant_data->position = $key + 1;
                $lims_product_variant_data->item_code = $data['item_code'][$key];
                $lims_product_variant_data->additional_cost = $data['additional_cost'][$key];
                $lims_product_variant_data->additional_price = $data['additional_price'][$key];
                $lims_product_variant_data->qty = $data['stock'][$key];
                ;
                $lims_product_variant_data->save();
            }
        }
        // Warehouse
        if (isset($data['is_diffPriceWareHouse'])) {
            // if(isset($data['is_diffPrice'])) {
            foreach ($data['diff_price'] as $key => $diff_price) {
                if ($diff_price) {
                    ProductWarehouse::create([
                        "product_id" => $lims_product_data->id,
                        "warehouse_id" => $data["warehouse_id"][$key],
                        "stock" => $data["stock"][$key] ?? 0,
                        "qty" => 0,
                        "price" => $diff_price
                    ]);
                }
            }
        }

        // Product Barcode            
        Barcode::create([
            'product_id' => $lims_product_data->id,
            'product_name' => $lims_product_data->product_name,
            'brand' => $lims_product_data->brand_id,
            'price' => $lims_product_data->product_price,
            'product_code' => DNS1D::getBarcodePNGPath($lims_product_data->product_code, 'C39+', 2, 50),
            // for bar code
            // 'product_code' => DNS2D::getBarcodePNGPath($request->product_code, 'QRCODE', 2, 2),   //for QR code
        ]);
        $request->session()->flash('edit_message', 'Product save successfully');
        return Redirect::to('superAdmin/products')->with('success', 'Product Update successfully');
        // return (new Categorycrud)->productstore($request);


    }
    public function productsedit($id)
    {

        $lims_product_list_without_variant = $this->productWithoutVariant();
        $lims_product_list_with_variant = $this->productWithVariant();
        $lims_brand_list = Brand::where('status', true)->get();
        $lims_category_list = Category::where('status', true)->get();
        $lims_unit_list = Unit::where('status', '1')->get();
        $lims_tax_list = Tax::where('is_active', '1')->get();
        $lims_product_data = Product::where('id', $id)->first();
        if ($lims_product_data->variant_option) {
            $lims_product_data->variant_option = json_decode($lims_product_data->variant_option);
            $lims_product_data->variant_value = json_decode($lims_product_data->variant_value);
        }
        $lims_product_variant_data = $lims_product_data->variant()->orderBy('position')->get();

        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $noOfVariantValue = 0;

        return view('superadmin.product.edit', compact('lims_product_list_without_variant', 'lims_product_list_with_variant', 'lims_brand_list', 'lims_category_list', 'lims_unit_list', 'lims_tax_list', 'lims_product_data', 'lims_product_variant_data', 'lims_warehouse_list', 'noOfVariantValue'));


        // $product = Product::findOrFail($id);
        // print_r($product);
        // return view('superadmin.product.edit',compact('product'));
    }

    public function productsupdate( $request)
    {
        // print_r($request->all());
        // die();

        $lims_product_data = Product::findOrFail($request->input('id'));
        // $data = $request->except('image', 'file', 'prev_img');
        $data = $request->except('name');
        $data['product_name'] = preg_replace('/[\n\r]/', "<br>", htmlspecialchars(trim($request->name)));

        if ($data['product_type'] == 'combo') {
            $data['product_list'] = implode(",", $data['product_id']);
            $data['variant_list'] = implode(",", $data['variant_id']);
            $data['qty_list'] = implode(",", $data['product_qty']);
            $data['price_list'] = implode(",", $data['unit_price']);
            $data['prodcut_coust'] = $data['unit_id'] = $data['purchase_unit_id'] = $data['sale_unit_id'] = 0;
        } elseif ($data['product_type'] == 'digital' || $data['product_type'] == 'service')
            $data['prodcut_coust'] = $data['unit_id'] = $data['purchase_unit_id'] = $data['sale_unit_id'] = 0;

        if (!isset($data['featured']))
            $data['featured'] = 0;

        if (!isset($data['is_embeded']))
            $data['is_embeded'] = 0;

        if (!isset($data['promotion']))
            $data['promotion'] = null;

        if (!isset($data['is_batch']))
            $data['is_batch'] = null;

        if (!isset($data['is_imei']))
            $data['is_imei'] = null;

        $data['product_details'] = str_replace('"', '@', $data['product_details']);
        // $data['product_details'] = $data['product_details'];
        $data['is_active'] = $request->status;
        $data['trending'] = $request->trending;
        $data['product_image'] = $request->image_name;
        if ($data['start_date'])
            $data['start_date'] = date('Y-m-d', strtotime($data['start_date']));
        if ($data['end_date'])
            $data['end_date'] = date('Y-m-d', strtotime($data['end_date']));

        $old_product_variant_ids = ProductVariant::where('product_id', $request->input('id'))->pluck('id')->toArray();
        $new_product_variant_ids = [];
        //dealing with product variant
        if (isset($data['is_variant'])) {
            if (isset($data['variant_option']) && isset($data['variant_value'])) {
                $data['variant_option'] = json_encode($data['variant_option']);
                $data['variant_value'] = json_encode($data['variant_value']);
            }
            foreach ($data['variant_name'] as $key => $variant_name) {
                $lims_variant_data = Variant::firstOrCreate(['variant_name' => $data['variant_name'][$key]]);
                $lims_product_variant_data = ProductVariant::where([
                    ['product_id', $lims_product_data->id],
                    ['variant_id', $lims_variant_data->id]
                ])->first();
                if ($lims_product_variant_data) {
                    $lims_product_variant_data->update([
                        'position' => $key + 1,
                        'item_code' => $data['item_code'][$key],
                        'additional_cost' => $data['additional_cost'][$key],
                        'additional_price' => $data['additional_price'][$key],
                        'qty' => $data['additional_qty'][$key]
                    ]);
                } else {
                    $lims_product_variant_data = new ProductVariant();
                    $lims_product_variant_data->product_id = $lims_product_data->id;
                    $lims_product_variant_data->variant_id = $lims_variant_data->id;
                    $lims_product_variant_data->position = $key + 1;
                    $lims_product_variant_data->item_code = $data['item_code'][$key];
                    $lims_product_variant_data->additional_cost = $data['additional_cost'][$key];
                    $lims_product_variant_data->additional_price = $data['additional_price'][$key];
                    $lims_product_variant_data->qty = $data['additional_qty'][$key];
                    // $lims_product_variant_data->qty = 0;
                    $lims_product_variant_data->save();
                }
                $new_product_variant_ids[] = $lims_product_variant_data->id;
            }
        } else {
            $data['is_variant'] = null;
            $data['variant_option'] = null;
            $data['variant_value'] = null;
        }
        //deleting old product variant if not exist
        foreach ($old_product_variant_ids as $key => $product_variant_id) {
            if (!in_array($product_variant_id, $new_product_variant_ids))
                ProductVariant::find($product_variant_id)->delete();
        }
        if (isset($data['is_diffPrice'])) {
            foreach ($data['diff_price'] as $key => $diff_price) {
                if ($diff_price) {
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($lims_product_data->id, $data['warehouse_id'][$key])->first();
                    if ($lims_product_warehouse_data) {
                        $lims_product_warehouse_data->price = $diff_price;
                        $lims_product_warehouse_data->qty = $data["warehouse_qty"][$key];
                        $lims_product_warehouse_data->save();
                    } else {
                        ProductWarehouse::create([
                            "product_id" => $lims_product_data->id,
                            "warehouse_id" => $data["warehouse_id"][$key],
                            "qty" => 0,
                            "price" => $diff_price
                        ]);
                    }
                }
            }
        }

        // if (isset($data['is_diffPriceWareHouse'])) {
        //     foreach ($data['diff_price'] as $key => $diff_price) {
        //         if ($diff_price) {
        //             $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($lims_product_data->id, $data['warehouse_id'][$key])->first();
        //             if ($lims_product_warehouse_data) {
        //                 $lims_product_warehouse_data->price = $diff_price;
        //                 $lims_product_warehouse_data->qty = $data["warehouse_qty"][$key];
        //                 $lims_product_warehouse_data->save();
        //             } else {
        //                 ProductWarehouse::create([
        //                     "product_id" => $lims_product_data->id,
        //                     "warehouse_id" => $data["warehouse_id"][$key],

        //                     "qty" => $data["warehouse_qty"][$key],
        //                     "price" => $diff_price
        //                 ]);
        //             }
        //         }
        //     }
        // }
        else {
            $data['is_diffPriceWareHouse'] = false;
            foreach ($data['warehouse_id'] as $key => $warehouse_id) {
                $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($lims_product_data->id, $warehouse_id)->first();
                if ($lims_product_warehouse_data) {
                    $lims_product_warehouse_data->price = null;
                    $lims_product_warehouse_data->save();
                }
            }
        }

        // Product Barcode            
        $barcode = Barcode::where('product_id', $lims_product_data->id)->first();
        if ($barcode !== null) {
            $barcode->update(
                [
                    'product_id' => $lims_product_data->id,
                    'product_name' => $lims_product_data->product_name,
                    'brand' => $lims_product_data->brand_id,
                    'price' => $lims_product_data->product_price,
                    'product_code' => DNS1D::getBarcodePNGPath($request->product_code, 'C39', 2, 50),
                    // for bar code
                    // 'product_code' => DNS2D::getBarcodePNGPath($request->product_code, 'QRCODE', 2, 2),   //for QR code
                ]
            );
        }

        $lims_product_data->update($data);
        // flash('Your contact has been removed.');

        $request->session()->flash('edit_message', 'Product updated successfully');
        // Session::Flash('edit_message', 'Product updated successfully');    
        return Redirect::to('superAdmin/products')->with('success', 'Product Update successfully');
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');          
    }

    public function productWithoutVariant()
    {
        return Product::ActiveStandard()->select('id', 'product_name', 'product_code')
            ->whereNull('is_variant')->get();
    }

    public function productWithVariant()
    {
        return Product::join('product_variants', 'products.id', 'product_variants.product_id')
            ->ActiveStandard()
            ->whereNotNull('is_variant')
            ->select('products.id', 'products.product_name', 'product_variants.item_code')
            ->orderBy('position')->get();
    }

    //   public function saleUnit($id)
// {
//     $unit = Unit::where("base_unit", $id)->orWhere('id', $id)->pluck('unit_code','id');
//     return json_encode($unit);
// }
// public function  productssellUnit(Request $request, $id){
//     // https://www.itsolutionstuff.com/post/laravel-country-state-city-dropdown-using-ajax-exampleexample.html
//         $data['states'] = Unit::where("id", $request->unit_id)
//                 ->get(["unit_code","id"]);
//     return response()->json($data);
// } 
// public function  productspurchaseUnit(Request $request, $id){
//     $data['cities'] = Unit::where("id", $request->unit_id)
//                 ->get(["unit_code","id"]);
//     return response()->json($data);
// }    

    public function productssellUnitId($id)
    {
        $unit = Unit::where("id", $id)->get(["unit_code", "id"]);
        return json_encode($unit);
    }
    public function productspurchaseUnitId($id)
    {
        $unit = Unit::where("id", $id)->get(["unit_code", "id"]);
        return json_encode($unit);
    }
    public function productspublish($id)
    {
        $publish = Product::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function productsunpublish($id)
    {
        $unpublish = Product::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }


    public function productsslugsearch( $request)
    {
        if ($request->ajax()) {
            $output = "";
            $products = DB::table('products')
                ->where('product_name', $request->slug)
                ->orderBy('id', 'DESC')
                ->first();
            $output = $products->slug;
            $data = array(
                'slug' => $output,
            );
            // echo json_encode($output); // display for output
            return Response($output);
            // return Response::json($output);
        }
    }

    // Product search
    public function limsProductSearch( $request)
    {

        $product_code = explode("|", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $lims_product_data = Product::where([
            ['product_code', $product_code[0]],
            ['is_active', true]
        ])
            ->whereNull('is_variant')
            ->first();
        if (!$lims_product_data) {
            $lims_product_data = Product::where([
                ['product_name', $product_code[1]],
                ['is_active', true]
            ])
                ->whereNotNull(['is_variant'])
                ->first();
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->where([
                    ['product_variants.item_code', $product_code[0]],
                    ['products.is_active', true]
                ])
                ->whereNotNull('is_variant')
                ->select('products.*', 'product_variants.item_code', 'product_variants.additional_cost')
                ->first();
            $lims_product_data->product_cost += $lims_product_data->additional_cost;
        }
        $product[] = $lims_product_data->product_name;
        if ($lims_product_data->is_variant)
            $product[] = $lims_product_data->item_code;
        else
            $product[] = $lims_product_data->product_code;
        $product[] = $lims_product_data->product_cost;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;

        $units = Unit::where("base_unit", $lims_product_data->unit_id)
            ->orWhere('id', $lims_product_data->unit_id)
            ->get();
        $unit_code = array();
        $unit_operator = array();
        $unit_operation_value = array();
        foreach ($units as $unit) {
            if ($lims_product_data->purchase_unit_id == $unit->id) {
                array_unshift($unit_code, $unit->unit_code);
                array_unshift($unit_operator, $unit->operator);
                array_unshift($unit_operation_value, $unit->operation_value);
            } else {
                $unit_code[] = $unit->unit_code;
                $unit_operator[] = $unit->operator;
                $unit_operation_value[] = $unit->operation_value;
            }
        }

        $product[] = implode(",", $unit_code) . ',';
        $product[] = implode(",", $unit_operator) . ',';
        $product[] = implode(",", $unit_operation_value) . ',';
        $product[] = $lims_product_data->id;
        $product[] = $lims_product_data->is_batch;
        $product[] = $lims_product_data->is_imei;
        return $product;


        // $product_code = explode("|", $request['data']);
        // $product_code[0] = rtrim($product_code[0], " ");
        // $lims_product_data = Product::where([
        //     ['product_code', $product_code[0]],
        //     ['is_active', true]
        // ])
        //     ->whereNull('is_variant')
        //     ->first();
        // if (!$lims_product_data) {
        //     $lims_product_data = Product::where([
        //         ['product_name', $product_code[1]],
        //         ['is_active', '1']
        //     ])
        //         ->whereNotNull(['is_variant'])
        //         ->first();
        //     $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
        //         ->where([
        //             ['product_variants.item_code', $product_code[0]],
        //             ['products.is_active', '1']
        //         ])
        //         ->whereNotNull('is_variant')
        //         ->select('products.*', 'product_variants.item_code', 'product_variants.additional_cost')
        //         ->first();
        //     $lims_product_data->product_cost += $lims_product_data->additional_cost;
        // }
        // $product[] = $lims_product_data->product_name;
        // if ($lims_product_data->is_variant)
        //     $product[] = $lims_product_data->item_code;
        // else
        //     $product[] = $lims_product_data->product_code;
        // $product[] = $lims_product_data->product_cost;

        // if ($lims_product_data->tax_id) {
        //     $lims_tax_data = Tax::find($lims_product_data->tax_id);
        //     $product[] = $lims_tax_data->rate;
        //     $product[] = $lims_tax_data->name;
        // } else {
        //     $product[] = 0;
        //     $product[] = 'No Tax';
        // }
        // $product[] = $lims_product_data->tax_method;

        // $units = Unit::where("id", $lims_product_data->unit_id)
        //     ->orWhere('id', $lims_product_data->unit_id)
        //     ->get();
        // $short_name = array();
        // $unit_operator = array();
        // $unit_operation_value = array();
        // foreach ($units as $unit) {
        //     if ($lims_product_data->purchase_unit_id == $unit->id) {
        //         array_unshift($short_name, $unit->short_name);
        //         array_unshift($unit_operator, $unit->operator);
        //         array_unshift($unit_operation_value, $unit->operation_value);
        //     } else {
        //         $short_name[] = $unit->short_name;
        //         $unit_operator[] = $unit->operator;
        //         $unit_operation_value[] = $unit->operation_value;
        //     }
        // }

        // $product[] = implode(",", $short_name) . ',';
        // $product[] = implode(",", $unit_operator) . ',';
        // $product[] = implode(",", $unit_operation_value) . ',';
        // $product[] = $lims_product_data->id;
        // $product[] = $lims_product_data->is_batch;
        // $product[] = $lims_product_data->is_imei;
        // return $product;

    }
    public function productsdestroy($id)
    {
        $lims_product_data = Product::findOrFail($id);
        $lims_product_data->is_active = false;
        if ($lims_product_data->image != 'zummXD2dvAtI.png') {
            $images = explode(",", $lims_product_data->image);
            foreach ($images as $key => $image) {
                if (file_exists('public/images/product/' . $image))
                    unlink('public/images/product/' . $image);
            }
        }
        $lims_product_data->save();
        return response()->json(['status' => "success"]);
    }
}