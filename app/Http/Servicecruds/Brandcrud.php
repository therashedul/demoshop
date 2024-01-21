<?php

namespace App\Http\Servicecruds;
use App\Models\Brand;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Traits\TenantInfo;
use App\Traits\CacheForget;
class Brandcrud
{
    use CacheForget;
    use TenantInfo;
    // ================================ Brand=================================
    public function brandindex($request)
    {
        $brand = Brand::latest()->get();

        if ($request->ajax()) {
            $brand = Brand::latest()->get();

            return Datatables::of($brand)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('brand_name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['brand_name'], $request->get('brand_name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['brand_name']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['brand_name']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('brand_image', function ($row) {
                    if (!isset($row->brand_image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->brand_image) .
                            '" alt="' . $row->brand_name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->brand_image) .
                        '" alt="' . $row->brand_name . '" style="height: 40px;" >';
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
                            data-brand_name="' . $row->brand_name . '"
                            data-brand_image="' . $row->brand_image . '"
                            data-status="' . $row->status . '"
                            data-original-title="Edit" class="edit btn btn-primary btn-sm submitUpImage editPost "> <i class="fas fa-edit"></i></a>';

                    // Delete Button

                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletebrand"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }

        return view('superadmin.brand.index', compact('brand'));

    }
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
            $this->cacheForget('brand_list');
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


}
