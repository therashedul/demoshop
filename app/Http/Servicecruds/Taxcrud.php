<?php

namespace App\Http\Servicecruds;

use App\Models\Tax;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Str;

class Taxcrud
{
    public function taxindex($request)
    {
        $taxs = Tax::latest()->get();

        if ($request->ajax()) {
            $taxs = Tax::latest()->get();

            return Datatables::of($taxs)
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
                            data-rate="' . $row->rate . '"                                             
                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletetax"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.tax.index', compact('taxs'));

    }
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
}