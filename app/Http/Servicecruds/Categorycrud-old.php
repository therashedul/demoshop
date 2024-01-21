<?php

namespace App\Http\Servicecruds;



use App\Models\User;
use \Illuminate\Support\Facades\DB;
use Hash;
use \Yajra\DataTables\Html\Editor\Fields\Image;
use Session;
use Carbon\Carbon;
use App\Models\Tax;
use App\Models\Unit;
use App\Models\menu;
use App\Models\Brand;
use App\Models\Barcode;
use App\Models\Purchase;
use Milon\Barcode\DNS1D;
use Milon\Barcode\DNS2D;
use App\Models\Category;
use App\Models\Supplier;
use App\Models\Customer;
use App\Models\CustomerGroup;
use App\Models\Discount;
use App\Models\DiscountPlan;
use App\Models\DiscountPlanCustomer;
use App\Models\Coupon;
use App\Models\CashRegister;
use App\Models\GiftCard;

use App\Models\Biller;
use App\Models\Menuitem;
use App\Models\promotion;
use App\Models\Warehouse;
use App\Models\ImageUpload;
use App\Models\Courier;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Http;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class Categorycrud
{
    public function categoryindex($request)
    {
        $categories = Category::where('parent_id', '==', '')->Orwhere('parent_id', '==', '')->orderBy('id','desc')->paginate(5);
        // if ($request->ajax()) {   
        //     return view('superadmin.category.pagination-index', compact('categories'))->render();        
        // }
        return view('superadmin.category.index', compact('categories'));

            // return Response::json(View::make('superadmin.category.pagination-index', compact('categories'))->render());
    }

    public function categorystore($request)
    {   
        $request->validate([
                'name_en'=>'required',
                'title_en'=>'required'
    
        ],[
                'name_en.required'=>'en name is requeired',
                'title_en.required'=>'en title is requeired'
        ]);

        Category::updateOrCreate(['id' => $request->id],
                [
                'status' => $request->status,
                'name_bn' => $request->name_bn,
                'name_en' => $request->name_en,
                'slug_en' => $request->slug_en,
                'slug_bn' => $request->slug_bn,
                'title_bn' => $request->name_bn,
                'title_en' => $request->name_en,
                'parent_id' => $request->parent_id,
                'category_img' => $request->image_name, 
            ]);

            // $category->save();
            // $category             = new Category();
            // $category->status    = $request->status;
            // $category->slug_bn    = $request->slug_bn;
            // $category->slug_en    = $request->slug_en;
            // $category->name_en    = $request->name_en;
            // $category->title_en   = $request->name_en;
            // $category->name_bn    = $request->name_bn;
            // $category->title_bn   = $request->name_bn;
            // $category->parent_id  = $request->parent_id;
            // $category->category_img = $request->image_name;

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
            
        // Log::channel('categorylog')->critical('Category Log file', ['data' => $data]);
        // return redirect()->route('superAdmin.category')
        //     ->with('success', 'Category created successfully.');
    }
    
    
    public function categoryedit($id)
    {
        $cat = Category::findOrFail($id);
        $categories = Category::all();
        return response()->json([
            'cat'=>$cat,
            'categories'=>$categories,
        ], 200);
        // return view('superAdmin.category.edit', compact('cat', 'categories'));
    }
    public function categoryupdate($request, $id)
    {
    
        $ids    = $request->id;
        $request->validate([
                'name_en'=>'required',
                'title_en'=>'required'
    
        ],[
                'name_en.required'=>'update en name is requeired',
                'title_bn.required'=>'update bn title is requeired'
        ]);
            $category             =  Category::find($id);
            $category->name_en    = $request->name_en;
            $category->name_bn    = $request->name_bn;
            $category->title_en   = $request->name_en;
            $category->title_bn   = $request->name_bn;

            $category->slug_en    = $request->slug_en;
            $category->slug_bn    = $request->slug_bn;

            $category->parent_id  = $request->parent_id;
            $category->category_img = $request->image_name;
            $category->status    = $request->status;
            $category->save(); 
             
        // $input                 = $request->all();
        // // $input['id']           = $request->id;
        // $input['name_en']      = $request->name_en;
        // $input['title_en']     = $request->title_en;
        // $input['slug_en']      = $request->slug_en;

        // $input['name_bn']      = $request->name_bn;
        // $input['title_bn']     = $request->title_bn;
        // $input['slug_bn']      = $request->slug_bn;

        // $input['parent_id']    = $request->parent_id;
        // $input['category_img'] = $request->image_name;
        // $input['status']       = $request->status;
        // $cateogy = Category::find($id);
        // $cateogy->update($input);
        
        return response()->json(['status' => "success"]);


        // menu update
        // $menuitem = DB::table('menuitems')->where('slug_en', '=', $request->input('slug_en'))->Orwhere('slug_bn', '=', $request->input('slug_bn'))->first();
        // if (!empty($menuitem)) {
        //     $menuitemUpdate = Menuitem::findOrFail($menuitem->id);

        //     $menuitemUpdate->title_en = $request->input('name_en');
        //     $menuitemUpdate->name_en  = $request->input('name_en');
        //     $menuitemUpdate->slug_en  = $request->input('slug_en');

        //     $menuitemUpdate->title_bn = $request->input('name_bn');
        //     $menuitemUpdate->name_bn  = $request->input('name_bn');
        //     $menuitemUpdate->slug_bn  = $request->input('slug_bn');
        //     $menuitemUpdate->save();
        // }
        // // ==============================================
        // return redirect()->route('superAdmin.category')
        //     ->with('success', 'Category Updated successfully.');
    }

    public function categorypublish($id)
    {
        $publish         = Category::find($id);
        $publish->status = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function categoryunpublish($id)
    {

        $unpublish         = Category::find($id);
        $unpublish->status = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }

    public function categorydestroy($id)
    {
        $category = Category::findOrFail($id);
        if (count($category->subcategory)) {
            $subcategories = $category->subcategory;
            foreach ($subcategories as $cat) {
                $cat = Category::findOrFail($cat->id);
                $cat->parent_id = '';
                $cat->save();
            }
        }
        $category->delete();
        return response()->json(['status' => "success"]);

        // return redirect()->route('superAdmin.category')
        //     ->with('success', 'Category Deleted successfully.');
    }
    public function categoryName($category)
    {
        $categories = \Illuminate\Support\Facades\DB::table('categories')
            ->where('slug', $category)
            ->get();
        $cat = $categories[0];
        $postmetas = DB::table('postmetas')
            ->where('cat_id', $cat->id)
            ->get();
        $posts = DB::table('posts')
            ->get();
        return view('superAdmin.category.single-cat', compact(['postmetas', 'posts', 'categories']));
    }
    public function categoryupload($request)
    {
        $userName = Auth::user()->name;
        if ($request->file('file')) {
            $file = $request->file('file');
            $fullImagename = $file->getClientOriginalName();
            $imagename = pathinfo($fullImagename, PATHINFO_FILENAME);
            $extension = pathinfo($fullImagename, PATHINFO_EXTENSION);
            $filePath = $imagename . '_' . time() . '.' . $extension;
            $allowedfileExtension = ['png', 'jpg', 'gif', 'bmp', 'jpeg'];
            $check = in_array($extension, $allowedfileExtension);
            if ($check) {
                $imgFile = \Yajra\DataTables\Html\Editor\Fields\Image::make($file->getRealPath());

                $imagepath = public_path('/images');
                $imgFile->resize(450, null, function ($constraint) {
                    $constraint->aspectRatio();
                })->save($imagepath . '/' . $filePath);

                $imagesPath = public_path('/thumbnail');
                $imgFile->resize(100, 80)->save($imagesPath . '/' . $filePath);

                $singleImagesPath = public_path('/singleimg');
                $imgFile->resize(750, null, function ($constraint) {
                    $constraint->aspectRatio();
                })->save($singleImagesPath . '/' . $filePath);

                $destinationPath = public_path('/upload');
                $path = $file->move($destinationPath, $filePath);
            } else {
                $path = $file->move(public_path('/files'), $filePath);
            }
        }
        $imageUpload = new ImageUpload;
        $imageUpload->name = $filePath;
        $imageUpload->title = $imagename;
        $imageUpload->alt = $imagename;
        $imageUpload->path = $filePath;
        $imageUpload->slug = $filePath;
        $imageUpload->status = '1';
        $imageUpload->username = $userName;
        $imageUpload->extention = '.' . $extension;
        $imageUpload->save();
        return response()->json(['success' => $imageUpload]);
    }
   





    public function categoryuploaddelete($request)
    {
        $val = $request->name;
        $categoryNames = Category::where('profile_image', $val)->get();
        if (!empty($categoryNames[0]->profile_image)) {
            if (($val == $categoryNames[0]->profile_image)) {
                $msg = '<div class="alert alert-success text-center">This image is already used.</div>';
                $action = "image";
                return response()->json(array('msg' => $msg, 'action' => $action), 200);
            }
        } else {
            ImageUpload::where('name', $val)->delete();
            $lines = ['upload/', 'images/', 'single/', 'thumbnail/'];
            for ($i = 0; $i < count($lines); $i++) {
                $value = $lines[$i];
                $path = public_path($value) . $val;
                if (file_exists($path)) {
                    unlink($path);
                }
            }
            return response()->json(['data' => $val], 200);
        }
    }
    public function categoryimagesearch($request)
    {
        $images = DB::table('image_uploads')
            ->where('name', 'LIKE', '%' . $request->search . "%")
            ->get();
        foreach ($images as $image):
            echo '<div class="col-file-manager" id="img_col_id_' . $image->id . '">';
            echo '<div class="file-box" data-file-name="' . $image->name . '"  data-file-id="' . $image->id . '" data-file-path="' . asset('upload/' . $image->name) . '" data-file-path-editor="' . asset('upload/' . $image->name) . '">';
            echo '<div class="image-container">';
            echo '<img src="' . asset('images/' . $image->name) . '" alt="" name="file" class="img-responsive">';
            $name = substr($image->name, 0, 20) . '...';
            echo '<span class="file-name">' . $name . '</span>';
            echo '</div>';
            echo '</div> </div>';
        endforeach;
    }
    // ================================ Brand=================================
    public function brandstore($request)
    {   
        $request->validate([
                'brand_name'=>'required',
    
        ],[
                'brand_name.required'=>'en name is requeired',
        ]);

        Brand::updateOrCreate(['id' => $request->id],
                [
                    'brand_name' => $request->brand_name, 
                    'brand_image' => $request->brand_image, 
                    'status' => $request->status, 
            ]);  

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
            
    }
    public function branddestroy($id)        {
            $brand = Brand::findOrFail($id);         
            $brand->delete();
            return response()->json(['status' => "success"]);
    
        }
          public function brandpublish($id)
    {
        $publish         = Brand::find($id);
        $publish->status = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function brandunpublish($id)
    {

        $unpublish         = Brand::find($id);
        $unpublish->status = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }

        // ================================ unit=================================
    public function unitstore($request)
    {   
        $request->validate([
                'base_unit'=>'required',
    
        ],[
                'base_unit.required'=>'en name is requeired',
        ]);

        Unit::updateOrCreate(['id' => $request->id],
                [
                    'base_unit' => $request->base_unit, 
                    'short_name' => $request->short_name,    
                     'unit_code' => $request->unit_code, 
                    'operator' => $request->operator,    
                     'operation_value' => $request->operation_value, 
                    'status' => $request->status, 
            ]);  

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
            
    }
    public function unitdestroy($id)        {
            $unit = Unit::findOrFail($id);         
            $unit->delete();
            return response()->json(['status' => "success"]);
    
        }
          public function unitpublish($id)
    {
        $publish         = Unit::find($id);
        $publish->status = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function unitunpublish($id)
    {

        $unpublish         = Unit::find($id);
        $unpublish->status = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }       
    // ================================ tax=================================
    public function taxstore($request)
    {   
        Tax::updateOrCreate(['id' => $request->id],
                [
                    'name'      => $request->name,    
                    'rate'      => $request->rate,                
                    'is_active' => $request->status, 
                ]); 

            return response()->json([
                'status' => "success",
                'error'  => "error"
            ]);            
    }
    public function taxdestroy($id)        {
            $tex = Tax::findOrFail($id);         
            $tex->delete();
            return response()->json(['status' => "success"]);
    
        }
    public function taxpublish($id)
    {
        $publish            = Tax::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function taxunpublish($id)
    {

        $unpublish            = Tax::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    } 
     // ================================ Courier=================================
    public function courierstore($request)
    {   
        Courier::updateOrCreate(['id' => $request->id],
                [
                    'name'      => $request->name,    
                    'phone'      => $request->phone,                
                    'address' => $request->address, 
                ]); 

            return response()->json([
                'status' => "success",
                'error'  => "error"
            ]);            
    }
    public function courierdestroy($id)        {
            $tex = Courier::findOrFail($id);         
            $tex->delete();
            return response()->json(['status' => "success"]);
    
        }
    public function courierpublish($id)
    {
        $publish            = Courier::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function courierunpublish($id)
    {

        $unpublish            = Courier::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }  
  
    // ================================ discount=================================
    public function discountstore($request)
    {   
        Discount::updateOrCreate(['id' => $request->id],
                [
                    'name'      => $request->name,    
                    'rate'      => $request->rate,                
                    'is_active' => $request->status, 
                ]); 

            return response()->json([
                'status' => "success",
                'error'  => "error"
            ]);            
    }
    public function discountdestroy($id)        {
            $discount = Discount::findOrFail($id);         
            $discount->delete();
            return response()->json(['status' => "success"]);
    
        }
    public function discountpublish($id)
    {
        $publish            = Discount::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function discountunpublish($id)
    {

        $unpublish            = Discount::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }     
     // ================================ discount Dlan=================================
    public function discountplanstore($request)
    {   
        DiscountPlan::updateOrCreate(['id' => $request->id],
                [
                    'name'      => $request->name,    
                    'rate'      => $request->rate,                
                    'is_active' => $request->status, 
                ]); 

            return response()->json([
                'status' => "success",
                'error'  => "error"
            ]);            
    }
    public function discountplandestroy($id)        {
            $discountplan = DiscountPlan::findOrFail($id);         
            $discountplan->delete();
            return response()->json(['status' => "success"]);
    
        }
    public function discountplanpublish($id)
    {
        $publish            = DiscountPlan::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function discountplanunpublish($id)
    {

        $unpublish            = DiscountPlan::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }   
     // ================================ Barcode =================================
    public function barcodestore($request)
    {      

        $request->validate([
            'product_name'=>'required',    
        ],[
            'product_name.required'=>'product name is requeired',
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
    public function barcodeprint($request){

        $barcodes = Barcode::orderBy('id', 'DESC')->paginate(18);;
        // $barcodes = Barcode::query()->take(12)->orderBy('id', 'DESC')->get();
        return view('superadmin.barcode.print',compact('barcodes'));        
        
        // return view('superadmin.barcode.print');
        // return response()->json(['status' => "success", 'barcodes' => $barcodes]);
    
        // $barcode = Barcode::findOrFail($id);         
        // $barcode->delete();
        // return response()->json(['status' => "success"]);
    
        }    
        public function barcodedestroy($id)        {
            $barcode = Barcode::findOrFail($id);         
            $barcode->delete();
            return response()->json(['status' => "success"]);
        }    

           // ================================ warehouse=================================
    public function warehousestore($request)
    {   
        $request->validate([
                'warehouse'=>'required',    
        ],[
                'warehouse.required'=>'en name is requeired',
        ]);

        Warehouse::updateOrCreate(['id' => $request->id],
                [
                    'name' => $request->warehouse,    
                    'phone' => $request->number, 
                    'email' => $request->email,    
                    'address' => $request->address, 
                    'is_active' => $request->is_active, 
            ]);  

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
            
    }
 
    public function warehousepublish($id)
    {
        $publish         = Warehouse::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function warehouseunpublish($id)
    {

        $unpublish         = Warehouse::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    } 
       public function warehousedestroy($id)        {
            $warehouse = Warehouse::findOrFail($id);         
            $warehouse->delete();
            return response()->json(['status' => "success"]);
    
        } 
         
// ================================ Coupon=================================
    public function couponstore($request)
    {
        // print_r($request->id);
        // die();
       $user_id =  Auth::id();
        
        Coupon::updateOrCreate(['id' => $request->id],
                [
                    'code'      => $request->code,    
                    'type'      => $request->type,                
                    'amount' => $request->amount, 
                    'minimum_amount' => $request->minimum_amount, 
                    'quantity' => $request->quantity, 
                    'expired_date' => date('Y-m-d', strtotime($request->expired_date)), 
                    'user_id' =>  $user_id, 
                    'is_active' => true, 

                ]);             

        return redirect('superAdmin/coupon')->with('message', 'Coupon created successfully');
    }
    public function coupondestroy($id)        {
        $coupon = Coupon::findOrFail($id);  
        $coupon->delete();
        return response()->json(['status' => "success"]);
    
        }
    public function couponpublish($id)
    {
        $publish            = coupon::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function couponunpublish($id)
    {

        $unpublish            = coupon::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }  
// ================================ cashRegister=================================
    public function cashRegisterstore($request)
    {
        // print_r($request->id);
        // die();
       $user_id =  Auth::id();
        
        CashRegister::updateOrCreate(['id' => $request->id],
                [
                    'code'      => $request->code,    
                    'type'      => $request->type,                
                    'amount' => $request->amount, 
                    'minimum_amount' => $request->minimum_amount, 
                    'quantity' => $request->quantity, 
                    'expired_date' => date('Y-m-d', strtotime($request->expired_date)), 
                    'user_id' =>  $user_id, 
                    'is_active' => true, 

                ]);             

        return redirect('superAdmin/cashRegister')->with('message', 'cashRegister created successfully');
    }
    public function cashRegisterdestroy($id)        {
        $cashRegister = CashRegister::findOrFail($id);  
        $cashRegister->delete();
        return response()->json(['status' => "success"]);
    
        }
    public function cashRegisterpublish($id)
    {
        $publish            = cashRegister::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function cashRegisterunpublish($id)
    {

        $unpublish            = cashRegister::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    } 
    // ================================ giftcard=================================
    public function giftcardstore($request)
    {
        $data = $request->all();

        if($request->input('user'))
            $data['customer_id'] = null;
        else
            $data['user_id'] = null;
        $data['is_active'] = true;
        $data['created_by'] = Auth::id();
        $data['expense'] = 0;
        GiftCard::create($data);

        $message = 'GiftCard created successfully';
        if($data['user_id']){
            $lims_user_data = User::find($data['user_id']);
            $data['email'] = $lims_user_data->email;
            $data['name'] = $lims_user_data->name;
            try{
                Mail::send( 'mail.gift_card_create', $data, function( $message ) use ($data)
                {
                    $message->to( $data['email'] )->subject( 'GiftCard' );
                });
            }
            catch(\Exception $e){
                $message = 'GiftCard created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        else{
            $lims_customer_data = Customer::find($data['customer_id']);
            if($lims_customer_data->email){
                $data['email'] = $lims_customer_data->email;
                $data['name'] = $lims_customer_data->name;
                try{
                    Mail::send( 'mail.gift_card_create', $data, function( $message ) use ($data)
                    {
                        $message->to( $data['email'] )->subject( 'GiftCard' );
                    });
                }
                catch(\Exception $e){
                    $message = 'GiftCard created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
                }
            }
        }
        return redirect('superAdmin/giftcard')->with('message', $message);
    }
    public function giftcarddestroy($id)        {
        $giftcard = Giftcard::findOrFail($id);  
        $giftcard->delete();
        return response()->json(['status' => "success"]);
    
        }
    public function giftcardpublish($id)
    {
        $publish            = Giftcard::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function giftcardunpublish($id)
    {

        $unpublish            = Giftcard::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    } 
    // ================================ Supplier=================================
   public function supplierstore($request)
    {
        Supplier::updateOrCreate(['id' => $request->id],
                [
                    'name' => $request->name, 
                    'image' => $request->image, 
                    'company_name' => $request->company_name,   
                    'vat_number' => $request->vat_number, 
                    'email' => $request->email, 
                    'phone_number' => $request->phone_number,    
                    'address' => $request->address, 
                    'city' => $request->city, 
                    'postal_code' => $request->postal_code, 
                    'country' => $request->country, 
                    'is_active' => $request->status, 
            ]);  

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
  
    }
 
    public function supplierpublish($id)
    {
        $publish         = Supplier::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function supplierunpublish($id)
    {

        $unpublish         = Supplier::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    } 
    public function supplierdestroy($id)        {
            $suppliers = Supplier::findOrFail($id);         
            $suppliers->delete();
            return response()->json(['status' => "success"]);
    
    }    
    
     // ================================ Coustomer Group=================================
     public function coustomerstore($request)
     {   
         CustomerGroup::updateOrCreate(['id' => $request->id],
                 [
                     'name'      => $request->name,    
                     'rate'      => $request->rate,                
                     'is_active' => $request->status, 
                 ]); 
 
             return response()->json([
                 'status' => "success",
                 'error'  => "error"
             ]);            
     }
     public function coustomerdestroy($id)        {
             $coustomer = CustomerGroup::findOrFail($id);         
             $coustomer->delete();
             return response()->json(['status' => "success"]);
     
         }
     public function coustomerpublish($id)
     {
         $publish            = CustomerGroup::find($id);
         $publish->is_active = 0;
         $publish->save();
         return response()->json(['status' => "success"]);
         // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function coustomerunpublish($id)
    {

        $unpublish            = CustomerGroup::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
         // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }     
     // ================================Customer=================================

    public function customerstore($request)
    {
        // print_r($request->all());
        // die();
    
        $userId = Auth::id();

        Customer::updateOrCreate(['id' => $request->id],
                [
                    'name' => $request->customer_name, 
                    'customer_group_id' => $request->customer_group_id, 
                    'image' => $request->image_id, 
                    'company_name' => $request->company_name,   
                    'tax_no' => $request->tax_number, 
                    'email' => $request->email, 
                    'phone_number' => $request->phone_number,    
                    'address' => $request->address, 
                    'city' => $request->city, 
                    'postal_code' => $request->postal_code, 
                    'country' => $request->country, 
                    'user_id' =>  $userId, 
                    'is_active' => $request->status, 
            
            ]);

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
    }

    public function customerpublish($id)
    {
        $publish            = Customer::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function customerunpublish($id)
    {

        $unpublish         = Customer::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    } 
    public function customerdestroy($id)        {
            $customer = Customer::findOrFail($id);         
            $customer->delete();
            return response()->json(['status' => "success"]);
    
    }         
    // ================================ billerr=================================

   public function billerstore($request)
    {
        Biller::updateOrCreate(['id' => $request->id],
                [
                    'name' => $request->name, 
                    'image' => $request->image, 
                    'company_name' => $request->company_name,   
                    'vat_number' => $request->vat_number, 
                    'email' => $request->email, 
                    'phone_number' => $request->phone_number,    
                    'address' => $request->address, 
                    'city' => $request->city, 
                    'postal_code' => $request->postal_code, 
                    'country' => $request->country, 
                    'is_active' => $request->status, 
            ]);  

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
  
    }
 
    public function billerpublish($id)
    {
        $publish         = Biller::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function billerunpublish($id)
    {

        $unpublish         = Biller::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    } 
    public function billerdestroy($id)        {
            $billers = Biller::findOrFail($id);         
            $billers->delete();
            return response()->json(['status' => "success"]);
    
    } 
         // ================================ purchase=================================
   public function purchasestore($request)
    {

        
        Purchase::updateOrCreate(['id' => $request->id],
                [
                    'name' => $request->name, 
                    'image' => $request->image, 
                    'company_name' => $request->company_name,   
                    'vat_number' => $request->vat_number, 
                    'email' => $request->email, 
                    'phone_number' => $request->phone_number,    
                    'address' => $request->address, 
                    'city' => $request->city, 
                    'postal_code' => $request->postal_code, 
                    'country' => $request->country, 
                    'is_active' => $request->status, 
            ]);  

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
  
    }
       public function purchasedestroy($id)        {
            $billers = biller::findOrFail($id);         
            $billers->delete();
            return response()->json(['status' => "success"]);
    
        } 
         // ================================ promotion=================================
    public function promotionstore($request)
    {   
        
        $request->validate([
                'promotion'=>'required',
    
        ],[
                'promotion.required'=>'en name is requeired',
        ]);

        Promotion::updateOrCreate(['id' => $request->id],
                [
                    'name' => $request->promotion,    
                    'phone' => $request->number, 
                    'email' => $request->email,    
                    'address' => $request->address, 
                    'is_active' => $request->is_active, 
            ]);  

            return response()->json([
                'status' => "success",
                'error' => "error"
            ]);
            
    }
 
    public function promotionpublish($id)
    {
        $publish         = Promotion::find($id);
        $publish->is_active = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function promotionunpublish($id)
    {

        $unpublish         = Promotion::find($id);
        $unpublish->is_active = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    } 
       public function promotiondestroy($id)        {
            $promotion = Promotion::findOrFail($id);         
            $promotion->delete();
            return response()->json(['status' => "success"]);
    
        } 
        
        
}