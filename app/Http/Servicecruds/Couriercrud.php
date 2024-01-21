<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Courier;
use Yajra\DataTables\Facades\DataTables;
use \Illuminate\Support\Facades\Auth;

class Couriercrud
{
    public function courierindex($request)
    {
        $couriers = Courier::latest()->get();

        if ($request->ajax()) {
            $couriers = Courier::latest()->get();

            return Datatables::of($couriers)
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
                ->addColumn('action', function ($row) {
                    // Update Button              
    
                    $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                            data-toggle="modal"
                            data-target="#ajaxModelexa"
                            data-id="' . $row->id . '" 
                            data-name="' . $row->name . '"
                            data-phone="' . $row->phone . '"                                             
                            data-address="' . $row->address . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletecourier"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.courier.index', compact('couriers'));

    }
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
}