<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Yajra\DataTables\Facades\DataTables;
use App\Models\{
    Product,
    Customer,
    Discount,
    DiscountPlan,
    DiscountPlanCustomer,
    DiscountPlanDiscount
};


class DiscountPlancrud
{
     // ========================discount===================    
     public function discountindex( $request)
     {
         $discounts = Discount::latest()->get();
         //   $discounts = Discount::with('discountPlans')->orderBy('id', 'desc')->get();
         if ($request->ajax()) {
             $discounts = Discount::with('discountPlans')->orderBy('id', 'desc')->get();
             return Datatables::of($discounts)
                 ->addIndexColumn()
 
                 ->filter(function ($instance) use ($request) {
                     if (!empty($request->get('name'))) {
                         $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                             return Str::contains($row['name'], $request->get('name')) ? true : false;
                         });
                     }
 
                     if (!empty($request->get('search'))) {
                         $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                             if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                 return true;
                             } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                                 return true;
                             }
                             return false;
                         });
                     }
                 })
 
                 ->addColumn('descountrate', function ($row) {
                     return $row->value . ' (' . $row->type . ')';
                 })
 
                 ->addColumn('startdate', function ($row) {
                     $stardate = date('d-M-Y', strtotime($row->valid_from));
                     return $stardate;
                 })
 
                 ->addColumn('enddate', function ($row) {
                     $stardate = date('d-M-Y', strtotime($row->valid_till));
                     return $stardate;
                 })
 
                 ->addColumn('descountPlan', function ($row) {
 
                     // $product_data = DB::table('discount_plan_discounts')
                     //         ->join('discount_plans', 'discount_plans.id', '=', 'discount_plan_discounts.discount_plan_id')  
                     //         ->join('discounts', 'discounts.id', '=', 'discount_plan_discounts.discount_id')
                     //         ->select('discount_plans.*')
                     //         ->where('discount_plan_discounts.discount_id', $row->id)
                     //         ->get();
     
 
                     foreach ($row->discountPlans as $key => $discount_plan) {
                         if ($key) {
                             return (',' . $discount_plan->name);
                         } else {
                             return $discount_plan->name;
                         }
                     }
                 })
 
                 ->addColumn('status', function ($row) {
                     if (!empty($row->is_active)) {
                         return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                     } else {
                         return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                     }
                 })
                 ->addColumn('action', function ($row) {
                     // Update Button              
     
                     $updateButton = '<a href="' . route('superAdmin.discount.edit', $row->id) . '" data-toggle="tooltip"  
                             data-id="' . $row->id . '" 
                             data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editdiscount "> <i class="fas fa-edit"></i></a>';
 
                     // Delete Button
     
                     $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletedisconunt"><i class="fa fa-trash"></i></a>';
                     return $updateButton . " " . $deleteButton;
 
                 })
                 ->escapeColumns([])
                 // ->rawColumns(['action','status'])
                 ->make(true);
 
         }
         return view('superadmin.discount.index', compact('discounts'));
 
     }
     public function discountcreate( $request)
     {
         $lims_discount_plan_list = DiscountPlan::where('is_active', true)->get();
         return view('superadmin.discount.create', compact('lims_discount_plan_list'));
     }
     public function discountstore( $request)
     {
         // print_r($request->all());
         // die();
         $data = $request->all();
         $data['valid_from'] = date('Y-m-d', strtotime($data['valid_from']));
         $data['valid_till'] = date('Y-m-d', strtotime($data['valid_till']));
         if (isset($data['product_list'])) {
             $data['product_list'] = implode(",", $data['product_list']);
         }
         $data['days'] = implode(",", $data['days']);
         $lims_discount_data = Discount::create($data);
         foreach ($data['discount_plan_id'] as $key => $discount_plan_id) {
             DiscountPlanDiscount::create([
                 'discount_id' => $lims_discount_data->id,
                 'discount_plan_id' => $discount_plan_id
             ]);
         }
         return redirect()->route('superAdmin.discount')->with('message', 'Discount created successfully');
 
         // print_r($request->all());
         // die();
         // return (new Categorycrud)->discountstore($request);
     }
 
     public function discountedit($id)
     {
 
         $lims_discount_data = Discount::find($id);
 
 
 
         $discount_plan_ids = DiscountPlanDiscount::where('discount_id', $id)->pluck('discount_plan_id')->toArray();
         $lims_discount_plan_list = DiscountPlan::where('is_active', true)->get();
         return view('superadmin.discount.edit', compact('lims_discount_data', 'discount_plan_ids', 'lims_discount_plan_list'));
     }
 
     public function discountupdate( $request, $id)
     {
         // print_r($request->discount_plan_id );
         // die();
         $data = $request->all();
         $lims_discount_data = Discount::find($id);
         $data['valid_from'] = date('Y-m-d', strtotime(str_replace("/", "-", $data['valid_from'])));
         $data['valid_till'] = date('Y-m-d', strtotime(str_replace("/", "-", $data['valid_till'])));
         if (!isset($data['is_active']))
             $data['is_active'] = 0;
         if ($data['applicable_for'] == 'All')
             $data['product_list'] = '';
         elseif (isset($data['product_list']))
             $data['product_list'] = implode(",", $data['product_list']);
         $data['days'] = implode(",", $data['days']);
         $pre_discount_plan_ids = DiscountPlanDiscount::where('discount_id', $id)->pluck('discount_plan_id')->toArray();
         //deleting previous discount plan id if not exist
         foreach ($pre_discount_plan_ids as $key => $discount_plan_id) {
             if (!in_array($discount_plan_id, $data['discount_plan_id'])) {
                 DiscountPlanDiscount::where([
                     ['discount_plan_id', $discount_plan_id],
                     ['discount_id', $id]
                 ])->first()->delete();
             }
         }
         //inserting new discount plan id
         foreach ($data['discount_plan_id'] as $key => $discount_plan_id) {
             if (!in_array($discount_plan_id, $pre_discount_plan_ids)) {
                 DiscountPlanDiscount::create(['discount_plan_id' => $discount_plan_id, 'discount_id' => $id]);
             }
         }
         $lims_discount_data->update($data);
         return redirect()->route('superAdmin.discount')->with('message', 'Discount updated successfully');
 
         // print_r($request->all());
         // die();
         // return (new Categorycrud)->discountstore($request);
     }
 
     public function discountproductSearch($code)
     {
 
         $lims_product_data = Product::where([
             ['product_code', $code],
             ['is_active', true]
         ])->select('id', 'product_name', 'product_code')->first();
 
         if (!$lims_product_data) {
             $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')->where([
                 ['product_variants.item_code', $code],
                 ['products.is_active', true]
             ])->whereNotNull(['is_variant'])->select('products.id', 'products.product_name', 'products.product_code', 'product_variants.item_code')->first();
         }
 
         if ($lims_product_data) {
             $product[] = $lims_product_data->id;
             $product[] = $lims_product_data->product_name;
             $product[] = $lims_product_data->product_code;
             if (!empty($lims_product_data->item_code)) {
                 $product[] = $lims_product_data->item_code;
             } else {
                 $product[] = 'Null';
             }
             return $product;
         } else {
             return "Product not found";
         }
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


 
   // ========================discount Plan===================    
   public function discountplanindex($request)
   {
       $lims_discount_plan_all = DiscountPlan::with('customers')->orderBy('id', 'desc')->get();

       if ($request->ajax()) {
           $discounts = DiscountPlan::latest()->get();
           return Datatables::of($discounts)
               ->addIndexColumn()

               ->filter(function ($instance) use ($request) {
                   if (!empty($request->get('name'))) {
                       $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                           return Str::contains($row['name'], $request->get('name')) ? true : false;
                       });
                   }

                   if (!empty($request->get('search'))) {
                       $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                           if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                               return true;
                           } else if (Str::contains(Str::lower($row['name']), Str::lower($request->get('search')))) {
                               return true;
                           }
                           return false;
                       });
                   }
               })


               ->addColumn('status', function ($row) {
                   if (!empty($row->is_active)) {
                       return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                   } else {
                       return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                   }
               })
               ->addColumn('action', function ($row) {
                   // Update Button              
   
                   $updateButton = 'Discount';

                   // Delete Button
   
                   $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletetex"><i class="fa fa-trash"></i></a>';
                   return $updateButton . " " . $deleteButton;

               })
               ->escapeColumns([])
               // ->rawColumns(['action','status'])
               ->make(true);

       }
       return view('superadmin.discount_plan.index', compact('lims_discount_plan_all'));

   }
   public function discountPlancreate()
   {
       $lims_customer_list = Customer::where('is_active', true)->get();
       return view('superadmin.discount_plan.create', compact('lims_customer_list'));
   }
   public function discountPlanstore( $request)
   {
       $data = $request->all();
       if (!isset($data['is_active'])) {
           $data['is_active'] = 0;
       }
       $lims_discount_plan = DiscountPlan::create($data);
       foreach ($data['customer_id'] as $key => $customer_id) {
           DiscountPlanCustomer::create(['discount_plan_id' => $lims_discount_plan->id, 'customer_id' => $customer_id]);
       }
       return redirect()->route('superAdmin.discountPlan')->with('message', 'DiscountPlan created successfully');
   }


   public function discountPlanedit($id)
   {
       $lims_discount_plan = DiscountPlan::find($id);
       $lims_customer_list = Customer::where('is_active', true)->get();
       $customer_ids = DiscountPlanCustomer::where('discount_plan_id', $id)->pluck('customer_id')->toArray();
       return view('superadmin.discount_plan.edit', compact('lims_discount_plan', 'lims_customer_list', 'customer_ids'));
   }

   public function discountPlanupdate( $request, $id)
   {
       $data = $request->all();
       $lims_discount_plan = DiscountPlan::find($id);
       if (!isset($data['is_active'])) {
           $data['is_active'] = 0;
       }
       $pre_customer_ids = DiscountPlanCustomer::where('discount_plan_id', $id)->pluck('customer_id')->toArray();
       //deleting previous customer id if not exist
       foreach ($pre_customer_ids as $key => $customer_id) {
           if (!in_array($customer_id, $data['customer_id'])) {
               DiscountPlanCustomer::where([
                   ['discount_plan_id', $id],
                   ['customer_id', $customer_id]
               ])->first()->delete();
           }
       }
       //inserting new customer id
       foreach ($data['customer_id'] as $key => $customer_id) {
           if (!in_array($customer_id, $pre_customer_ids)) {
               DiscountPlanCustomer::create(['discount_plan_id' => $id, 'customer_id' => $customer_id]);
           }
       }
       $lims_discount_plan->update($data);
       return redirect()->route('superAdmin.discountPlan')->with('message', 'DiscountPlan updated successfully');
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

 
   public function discountplandestroy($id)        {
    $discountplan = DiscountPlan::findOrFail($id);         
    $discountplan->delete();
    return response()->json(['status' => "success"]);

}

}