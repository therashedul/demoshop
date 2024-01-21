<?php

namespace App\Http\Servicecruds;

use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\{
    Brand,
    Barcode,
    Product
};

class Barcodecrud
{
    // ========================barcode===================    
    public function barcodeindex($request)
    {
        $products = Product::latest()->where('is_active', '1')->get();
        $barcodes = Barcode::latest()->get();
        $brands = Brand::latest()->where('status', '1')->get();

        // dd($newUrl);

        if ($request->ajax()) {
            $barcodes = Barcode::latest()->get();
            return Datatables::of($barcodes)
                ->addIndexColumn()
                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('product_name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['product_name'], $request->get('product_name')) ? true : false;
                        });
                    }
                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['product_name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['product_name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('product_code', function ($row) {
                    if (!isset($row->product_code)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->product_code) .
                            '" alt="' . $row->product_name . '" style="height: 40px;" >';
                    }
                    $image = asset('' . $row->product_code);
                    $url = str_replace('\\', '/', $image);
                    $newUrl = str_replace('//', '/', $url);
                    $url = preg_replace('#/+#', '/', $newUrl);
                    $urls = str_replace(':/', '://', $url);

                    // // // // $current_url = url()->current();
                    // // // // $newUrl = str_replace($current_url, '/', $image);
                    // // // // $newUrl = str_replace('/', '', $newUrl);
                    // // // // $newUrl =  $newUrl;
                    // // // // $url = str_replace('\\', '/', $image);
                    // // // // $newUrl = str_replace('//', '/', $url);
                    // // // // $url = preg_replace('#/+#', '/', $newUrl);
                    // // // // $urls = str_replace(':/', '://', $url);
    
                    // // // // $newUrl = str_replace('\\', '/', $newUrl);
                    // // // // $string = preg_replace('/\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|$!:,.;]*[A-Z0-9+&@#\/%=~_|$]/i', '', $image);
    
                    return '<img src="' . $urls . '" alt="' . $row->product_name . '" style="height: 40px;" >';
                })
                ->addColumn('action', function ($row) {
                    $brand = '';
                    $barcode = '';
                    $brand_names = DB::table('barcodes')
                        ->join('brands', 'brands.id', '=', 'barcodes.brand')
                        ->where('brands.id', $row->brand)
                        ->select('brands.brand_name', 'brands.id')
                        ->get();
                    foreach ($brand_names as $brand_name) {
                        $brand = optional($brand_name)->id;
                    }
                    $barcodes = DB::table('barcodes')
                        ->join('products', 'products.id', '=', 'barcodes.product_id')
                        ->where('products.id', $row->product_id)
                        ->select('products.product_code')
                        ->get();
                    foreach ($barcodes as $barcode) {
                        $barcode = optional($barcode)->product_code;
                    }

                    // Update Button                  
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                             data-toggle="modal"
                             data-target="#ajaxModelexa"
                             data-id="' . $row->id . '" 
                             data-product_name="' . $row->product_name . '"
                             data-brand="' . $brand . '" 
                             data-price="' . $row->price . '" 
                             data-product_code="' . $barcode . '" 
                             data-description="' . $row->description . '"
                             data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';
                    // Delete Button    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletebarcode"><i class="fa fa-trash"></i></a>';
                    $nasted = '<div class="btn-group">
                             <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                             <span class="caret"></span>
                             <span class="sr-only">Toggle Dropdown</span>
                             </button>
                             <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                 <li>
                                     <button type="button" class="open-EditCategoryDialog btn btn-link" data-toggle="modal" data-target="#editModal" ><i class="dripicons-document-edit"></i> ' . $updateButton . ' </button>
                                 </li>
                                 <li class="divider"></li>
                                 <li>
                                 <button type="submit" class="btn btn-link" onclick="return confirmDelete()">' . $deleteButton . '
                                 </button> 
                                 </li>
                             </ul>
                         </div>';
                    return $nasted;
                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        return view('superadmin.barcode.index', compact('barcodes', 'products', 'brands'));
        // return (new Categorycrud)->categoryindex($request);
        // Log::channel('categorylog')->critical('Category Log file', ['data' => $categories]);
    }

    public function barcodestore($request)
    {

        $request->validate([
            'product_name' => 'required',
        ], [
            'product_name.required' => 'product name is requeired',
        ]);
        // $imageCode = DNS1D::getBarcodePNG($request->product_code, 'C39+', 2, 50);

        $varcode = DNS1D::getBarcodePNGPath($request->product_code, 'C39+', 2, 50);
        // Replace the absolute server path with an empty string
        $relativePath = str_replace('/home2/webhatbd/myshop.webhatbd.com/public', '', $varcode);
        Barcode::updateOrCreate(['id' => $request->id],
            [
                'product_name' => $request->product_name,
                'brand' => $request->brand,
                'price' => $request->price,

                'product_code' => $relativePath,   // for bar code
                // 'product_code' => DNS1D::getBarcodePNGPath($request->product_code, 'C39+', 2, 50),   // for bar code
                // 'product_code' => DNS2D::getBarcodePNGPath($request->product_code, 'QRCODE', 2, 2),   //for QR code
                'description' => $request->description,
            ]);

        // $nestedData['imagedata'] = DNS1D::getBarcodePNG($product->code, $product->barcode_symbology);
        // $output_file = '/' . $request->product_code . '.png';
        // \Storage::disk('local')->put($output_file, DNS1D::getBarcodePNGPath($request->product_code, 'C39+', 2, 50)); 

        return response()->json([
            'status' => "success",
            'error' => "error"
        ]);
    }
    public function barcodeprint($request)
    {

        $barcodes = Barcode::orderBy('id', 'DESC')->paginate(18);
        ;
        // $barcodes = Barcode::query()->take(12)->orderBy('id', 'DESC')->get();
        return view('superadmin.barcode.print', compact('barcodes'));

        // return view('superadmin.barcode.print');
        // return response()->json(['status' => "success", 'barcodes' => $barcodes]);

        // $barcode = Barcode::findOrFail($id);         
        // $barcode->delete();
        // return response()->json(['status' => "success"]);

    }
    public function barcodedestroy($id)
    {
        $barcode = Barcode::findOrFail($id);
        $barcode->delete();
        return response()->json(['status' => "success"]);
    }
}