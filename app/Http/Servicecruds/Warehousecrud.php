<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Warehouse;
use Yajra\DataTables\Facades\DataTables;

class Warehousecrud
{
    public function warehouseindex( $request)
    {
        $warehouses = Warehouse::latest()->get();

        if ($request->ajax()) {
            $warehouses = Warehouse::latest()->get();

            return Datatables::of($warehouses)
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


                ->addColumn('is_active', function ($row) {
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
                            data-phone="' . $row->phone . '"    
                            data-email="' . $row->email . '"
                            data-address="' . $row->address . '"      
                            data-status="' . $row->is_active . '"      
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletewarehouse"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.warehouse.index', compact('warehouses'));

    }
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
}