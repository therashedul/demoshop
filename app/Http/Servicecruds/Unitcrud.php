<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Unit;
use Yajra\DataTables\Facades\DataTables;

class Unitcrud
{
    // ================================ Unit=================================
    public function unitindex($request)
    {
        $units = Unit::latest()->get();

        if ($request->ajax()) {
            $units = Unit::latest()->get();

            return Datatables::of($units)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('base_unit'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['base_unit'], $request->get('base_unit')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['base_unit']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['base_unit']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })


                ->addColumn('status', function ($row) {
                    if (!empty($row->status)) {
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
                            data-base_unit="' . $row->base_unit . '"
                            data-short_name="' . $row->short_name . '"    
                            data-unit_code="' . $row->unit_code . '"
                            data-operator="' . $row->operator . '"      
                            data-operation_value="' . $row->operation_value . '"                                           
                            data-status="' . $row->status . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deleteunit"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.unit.index', compact('units'));

    }
    public function unitstore($request)
    {
        $request->validate([
            'base_unit' => 'required',

        ], [
            'base_unit.required' => 'en name is requeired',
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
    public function unitdestroy($id)
    {
        $unit = Unit::findOrFail($id);
        $unit->delete();
        return response()->json(['status' => "success"]);

    }
    public function unitpublish($id)
    {
        $publish = Unit::find($id);
        $publish->status = 0;
        $publish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
    }
    public function unitunpublish($id)
    {

        $unpublish = Unit::find($id);
        $unpublish->status = 1;
        $unpublish->save();
        return response()->json(['status' => "success"]);
        // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
    }
}