<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Coupon;
use Yajra\DataTables\Facades\DataTables;
use \Illuminate\Support\Facades\Auth;

class Couponcrud
{
    public function couponindex( $request)
    {
        $coupons = Coupon::latest()->get();
        // $coupons = Coupon::where('is_active', true)->orderBy('id', 'desc')->get();        
        if ($request->ajax()) {
            $coupons = Coupon::latest()->get();

            return Datatables::of($coupons)
                ->addIndexColumn()

                ->filter(function ($instance) use ($request) {
                    if (!empty($request->get('name'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            return Str::contains($row['code'], $request->get('name')) ? true : false;
                        });
                    }

                    if (!empty($request->get('search'))) {
                        $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                            if (Str::contains(Str::lower($row['code']), Str::lower($request->get('search')))) {
                                return true;
                            } else if (Str::contains(Str::lower($row['code']), Str::lower($request->get('search')))) {
                                return true;
                            }
                            return false;
                        });
                    }
                })
                ->addColumn('type', function ($row) {
                    if ($row->type == 'percentage') {
                        return '<div class="badge badge-primary">' . $row->type . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . $row->type . '</div>';
                    }
                })
                ->addColumn('minimum_amount', function ($row) {
                    if ($row->minimum_amount) {
                        return $row->minimum_amount;
                    } else {
                        return 'N/A';
                    }
                })
                ->addColumn('qty', function ($row) {
                    if (($row->quantity - $row->used)) {
                        return '<div class="badge badge-success">' . ($row->quantity - $row->used) . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . ($row->quantity - $row->used) . '</div>';
                    }
                })
                ->addColumn('expired_date', function ($row) {
                    if ($row->expired_date >= date("Y-m-d")) {
                        return '<div class="badge badge-success">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                    }
                })
                ->addColumn('user_name', function ($row) {
                    $created_by = DB::table('users')->find($row->user_id);
                    return $created_by->name;
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
                            data-code="' . $row->code . '"
                            data-type="' . $row->type . '"    
                            data-amount="' . $row->amount . '"
                            data-minimum_amount="' . $row->minimum_amount . '"      
                            data-quantity="' . $row->quantity . '"                                           
                            data-used="' . $row->used . '"                                           
                            data-expired_date="' . date('Y-m-d', strtotime($row->expired_date)) . '"                                           
                            data-user_id="' . $row->user_id . '"                                           
                            data-status="' . $row->is_active . '" 
                            data-original-title="Edit" class="edit btn btn-primary btn-sm  editCoupon "> <i class="fas fa-edit"></i></a>';

                    // Delete Button
    
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletecoupon"><i class="fa fa-trash"></i></a>';
                    return $updateButton . " " . $deleteButton;

                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);

        }
        return view('superadmin.coupon.index', compact('coupons'));

    }

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
    public function couponGenerateCode()
    {
        // Available alpha caracters
        $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

        // generate a pin based on 2 * 7 digits + a random character
        $pin = mt_rand(1000000, 9999999)
            . mt_rand(1000000, 9999999)
            . $characters[rand(0, strlen($characters) - 1)];

        // shuffle the result
        $string = str_shuffle($pin);
        return $string;
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
}