<?php

namespace App\Http\Servicecruds;

use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\{
    Supplier
};

class Suppliercrud
{
    // ========================supplier===================    
    public function supplierindex($request)
    {
        $supplier = Supplier::latest()->get();

        if ($request->ajax()) {
            $supplier = Supplier::latest()->get();

            return Datatables::of($supplier)
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
                            data-image="' . $row->image . '"                    
                            data-name="' . $row->name . '"
                            data-address="' . $row->address . '"  
                             data-company_name="' . $row->company_name . '"                    
                            data-vat_number="' . $row->vat_number . '"
                            data-email="' . $row->email . '"   
                            data-phone_number="' . $row->phone_number . '"                    
                            data-city="' . $row->city . '"
                            data-postal_code="' . $row->postal_code . '"
                            data-country="' . $row->country . '"

                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletesupplier"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.supplier.index', compact('supplier'));

    }
    public function suppliercreate()
    {
        $suppliers = Supplier::get();
        return view('superadmin.supplier.create', compact('suppliers'));
    }


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


    public function supplierimagesearch($request)
    {
       
    }
    
}