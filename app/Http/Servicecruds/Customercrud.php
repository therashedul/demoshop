<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use \Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;
use App\Models\{
    Customer,
    CustomerGroup
};

class Customercrud
{
    // ========================Coustomer===================    
    public function customerindex($request)
    {
        if ($request->ajax()) {
            $customer = Customer::latest()->get();

            return Datatables::of($customer)
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
                ->addColumn('image', function ($row) {
                    if (!isset($row->image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->image) .
                            '" alt="' . $row->name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->image) .
                        '" alt="' . $row->name . '" style="height: 40px;" >';
                })
                ->addColumn('coustomer', function ($row) {

                    $customer = $row->name . "</br>" . $row->phone_number . "</br>" . $row->address;
                    return $customer;

                })
                ->addColumn('discountplan', function ($row) {
                    // $product_data = DB::table('customers')
                    //     ->join('discount_plan_customers', 'customers.id', '=', 'discount_plan_customers.customer_id')  
                    //     ->join('discount_plan_discounts', 'discount_plan_customers.discount_plan_id', '=', 'discount_plan_discounts.discount_plan_id')
                    //     ->join('discount_plans', 'discount_plans.id', '=', 'discount_plan_discounts.discount_plan_id')  
                    //     ->select('discount_plans.*')
                    //     ->where('customers.id', $row->id)
                    //     ->get();
    
                    // return $product_data;
    
                    // ====================== oR =========
    
                    foreach ($row->discountPlans as $index => $discount_plan) {
                        if ($index) {
                            return (',' . $discount_plan->name);
                            // return  (','.$discount_plan->name);
                            // $discount_plan = (', '.$discount_plan->name);
                            // return $discount_plan;
                        } else {
                            $discount_plan = $discount_plan->name;
                            return $discount_plan;
                        }
                    }
                })
                ->addColumn('diposiblanse', function ($row) {
                    $diposit = ($row->deposit - $row->expense);
                    $dipovalue = number_format($diposit, 2);
                    return $dipovalue;
                })
                ->addColumn('due', function ($row) {
                    $returned_amount = DB::table('sales')
                        ->join('returns', 'sales.id', '=', 'returns.sale_id')
                        ->where([
                            ['sales.customer_id', $row->id],
                            ['sales.payment_status', '!=', 4]
                        ])
                        ->sum('returns.grand_total');
                    $saleData = DB::table('sales')->where([
                        ['customer_id', $row->id],
                        ['payment_status', '!=', 4]
                    ])
                        ->selectRaw('SUM(grand_total) as grand_total,SUM(paid_amount) as paid_amount')
                        ->first();

                    $diposit = ($saleData->grand_total - $returned_amount - $saleData->paid_amount);
                    $dipovalue = number_format($diposit, 2);
                    return $dipovalue;
                })
                ->addColumn('cgroup', function ($row) {
                    $cgroups = DB::table('customers')
                        ->join('customer_groups', 'customer_groups.id', '=', 'customers.customer_group_id')
                        ->select('customer_groups.*')
                        ->where('customer_groups.id', $row->customer_group_id)
                        ->get();
                    foreach ($cgroups as $cgroup) {
                        return $cgroup->name;
                    }

                })

                ->addColumn('sale_status', function ($row) {

                    if ($row->sale_status == 1) {
                        $completed = '<div class="badge badge-success">' . trans('Completed') . '</div>';
                        return $completed;
                    } elseif ($row->sale_status == 2) {
                        $pending = '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                        return $pending;
                    } else {
                        $draft = '<div class="badge badge-warning">' . trans('Draft') . '</div>';
                        return $draft;
                    }
                })
                ->addColumn('payment_status', function ($row) {
                    if ($row->payment_status == 1) {
                        $pending = '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                        return $pending;
                    } elseif ($row->payment_status == 2) {
                        $due = '<div class="badge badge-danger">' . trans('Due') . '</div>';
                        return $due;
                    } elseif ($row->payment_status == 3) {
                        $draft = '<div class="badge badge-warning">' . trans('Partial') . '</div>';
                        return $draft;
                    } else {
                        $paid = '<div class="badge badge-success">' . trans('Paid') . '</div>';
                        return $paid;
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
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-customer_group_id="' . $row->customer_group_id . '" 
                            data-user_id="' . $row->user_id . '" 
                            data-image="' . $row->image . '"                    
                            data-name="' . $row->name . '"
                            data-address="' . $row->address . '"  
                            data-company_name="' . $row->company_name . '"                    
                            data-email="' . $row->email . '"   
                            data-phone_number="' . $row->phone_number . '"                    
                            data-city="' . $row->city . '"
                            data-postal_code="' . $row->postal_code . '"
                            data-country="' . $row->country . '"
                            data-deposit="' . $row->deposit . '"
                            data-tax_number="' . $row->tax_no . '"
                            data-expense="' . $row->expense . '"
                            data-points="' . $row->points . '"
                            data-status="' . $row->is_active . '" 

                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletecustomer"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        return view('superadmin.customer.index', compact('lims_customer_group_all'));
    }
    public function customercreate()
    {
        $customers = Customer::get();
        return view('superadmin.customer', compact('customers'));
    }
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

    
    public function customerimagesearch($request)
    {
        // return (new Categorycrud)->customerimagesearch($request);
    }
    
    
    // =============== Custome Group ========================
    public function coustomergroupindex($request)
    {

        if ($request->ajax()) {
            $coustomergroups = CustomerGroup::latest()->get();
            return Datatables::of($coustomergroups)
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
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '"                 
                            data-name="' . $row->name . '"    
                            data-percentage="' . $row->percentage . '"                                                        
                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletetex"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        return view('superadmin.customer_group.index', compact('lims_customer_group_all'));
    }
    public function coustomergroupstore($request)
    {
        $lims_customer_group_data = $request->all();
        $lims_customer_group_data['is_active'] = true;
        CustomerGroup::create($lims_customer_group_data);
        return redirect('superAdmin/coustomergroup')->with('message', 'Data inserted successfully');
    }
    public function coustomergroupedit($id)
    {
        $lims_customer_group_data = CustomerGroup::find($id);
        return $lims_customer_group_data;
    }
    public function coustomergroupupdate($request)
    {

        $input = $request->all();
        $lims_customer_group_data = CustomerGroup::find($input['customer_group_id']);

        $lims_customer_group_data->update($input);
        return redirect('superAdmin/coustomergroup')->with('message', 'Data updated successfully');
    }
    public function importCustomerGroup($request)
    {
        //get file
        $upload = $request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        if ($ext != 'csv')
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
        $filename = $upload->getClientOriginalName();
        $upload = $request->file('file');
        $filePath = $upload->getRealPath();
        //open and read
        $file = fopen($filePath, 'r');
        $header = fgetcsv($file);
        $escapedHeader = [];
        //validate
        foreach ($header as $key => $value) {
            $lheader = strtolower($value);
            $escapedItem = preg_replace('/[^a-z]/', '', $lheader);
            array_push($escapedHeader, $escapedItem);
        }
        //looping through othe columns
        while ($columns = fgetcsv($file)) {
            if ($columns[0] == "")
                continue;
            foreach ($columns as $key => $value) {
                $value = preg_replace('/\D/', '', $value);
            }
            $data = array_combine($escapedHeader, $columns);

            $customer_group = CustomerGroup::firstOrNew(['name' => $data['name'], 'is_active' => true]);
            $customer_group->name = $data['name'];
            $customer_group->percentage = $data['percentage'];
            $customer_group->is_active = true;
            $customer_group->save();
        }
        return redirect('superAdmin/coustomergroup')->with('message', 'Customer Group imported successfully');

    }
    public function coustomergroupdestroy($id)
    {
        $lims_customer_group_data = CustomerGroup::find($id);
        $lims_customer_group_data->is_active = false;
        $lims_customer_group_data->save();
        return redirect('superAdmin/coustomergroup')->with('not_permitted', 'Data deleted successfully');
    }
    public function exportCustomerGroup($request)
    {
        $lims_customer_group_data = $request['customer_groupArray'];
        $csvData = array('name, percentage');
        foreach ($lims_customer_group_data as $customer_group) {
            if ($customer_group > 0) {
                $data = CustomerGroup::where('id', $customer_group)->first();
                $csvData[] = $data->name . ',' . $data->percentage;
            }
        }
        $filename = "customer_group- " . date('d-m-Y') . ".csv";
        $file_path = public_path() . '/downloads/' . $filename;
        $file_url = url('/') . '/downloads/' . $filename;
        $file = fopen($file_path, "w+");
        foreach ($csvData as $exp_data) {
            fputcsv($file, explode(',', $exp_data));
        }
        fclose($file);
        return $file_url;
    }

    public function coustomerGroupDeleteBySelection($request)
    {
        $customer_group_id = $request['customer_groupIdArray'];
        foreach ($customer_group_id as $id) {
            $lims_customer_group_data = CustomerGroup::find($id);
            $lims_customer_group_data->is_active = false;
            $lims_customer_group_data->save();
        }
        return 'Customer Group deleted successfully!';
    }

}