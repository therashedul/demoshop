<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use \Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Yajra\DataTables\Facades\DataTables;
use App\Models\{
    User,
    Customer,
    GiftCard,
    GiftCardRecharge
};

class GiftCardcrud
{
// ========================giftcard===================    
public function giftcardindex($request)
{
    $lims_customer_list = Customer::where('is_active', true)->get();
    $lims_user_list = User::where('status_id', true)->get();
    $lims_gift_card_all = GiftCard::where('is_active', true)->orderBy('id', 'desc')->get();
    if ($request->ajax()) {
        $giftcards = Giftcard::latest()->get();
        return Datatables::of($giftcards)
            ->addIndexColumn()
            ->filter(function ($instance) use ($request) {
                if (!empty($request->get('card_no'))) {
                    $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                        return Str::contains($row['card_no'], $request->get('card_no')) ? true : false;
                    });
                }

                if (!empty($request->get('search'))) {
                    $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                        if (Str::contains(Str::lower($row['card_no']), Str::lower($request->get('search')))) {
                            return true;
                        } else if (Str::contains(Str::lower($row['card_no']), Str::lower($request->get('search')))) {
                            return true;
                        }
                        return false;
                    });
                }
            })
            ->addColumn('cuser', function ($row) {
                if ($row->customer_id) {
                    $customer = DB::table('customers')->find($row->customer_id);
                    $client = $customer->name;
                    return $client;
                } else {
                    $user = DB::table('users')->find($row->user_id);
                    $client = $user->name;
                    return $client;
                }
            })
            ->addColumn('blance', function ($row) {
                return ($row->amount - $row->expense);
            })
            ->addColumn('expired_date', function ($row) {
                if ($row->expired_date >= date("Y-m-d")) {
                    return '<div class="badge badge-success">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                } else {
                    return '<div class="badge badge-danger">' . date('d-m-Y', strtotime($row->expired_date)) . '</div>';
                }
            })
            ->addColumn('user_name', function ($row) {
                $username = DB::table('users')->find($row->created_by);
                $username = $username->name;
                return $username;
            })

            ->addColumn('status', function ($row) {
                if (!empty($row->is_active)) {
                    return '<button  data-id="' . $row->id . '" data-original-title="Publish" class="btn btn-info btn-sm publish text-white"><i class="fa fa-arrow-circle-up" aria-hidden="true"></i></button>';
                } else {
                    return '<button  data-id="' . $row->id . '" data-original-title="Unpublish" class="btn btn-warning btn-sm unpublish text-white"> <i class="fa fa-arrow-circle-down" aria-hidden="true"></i></button>';
                }
            })
            ->addColumn('action', function ($row) {
                $customer = DB::table('customers')->find($row->customer_id);
                $client = $customer->name;
                // Update Button   
                $rechargBtn = '<a href="javascript:void(0)" data-toggle="tooltip"  
                        data-toggle="modal"
                        data-target="#rechargeModal"
                        data-id="' . $row->id . '" 
                        data-amount="' . $row->amount . '"      
                        data-card_no="' . $row->card_no . '"      
                        data-original-title="Edit" class="edit btn btn-primary btn-sm recharge"><i class="fas fa-money-bill-wave-alt"></i></a>';


                $giftCard = '<a href="javascript:void(0)" data-toggle="tooltip"  
                        data-toggle="modal"
                        data-target="#viewModal"
                        data-id="' . $row->id . '"                             
                        data-coustomer="' . $client . '"                             
                        data-card_no="' . $row->card_no . '"      
                        data-amount="' . $row->amount . '"    
                        data-expense="' . $row->expense . '"   
                        data-expired_date="' . date('Y-m-d', strtotime($row->expired_date)) . '"   

                        data-original-title="View" class="btn  view-btn"><i class="fas fa-print"></i></a>';

                $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"  
                        data-toggle="modal"
                        data-target="#ajaxModelexa"
                        data-id="' . $row->id . '" 
                        data-card_no="' . $row->card_no . '"
                        data-amount="' . $row->amount . '"                            
                        data-customer_id="' . $row->customer_id . '"      
                        data-created_by="' . $row->created_by . '"                                           
                        data-expired_date="' . date('Y-m-d', strtotime($row->expired_date)) . '"                                           
                        data-user_id="' . $row->user_id . '"                                           
                        data-status="' . $row->is_active . '" 
                        data-original-title="Edit" class="edit btn btn-primary btn-sm  editgiftcard open-Edit_gift_card_Dialog"> <i class="fas fa-edit"></i></a>';

                // Delete Button    
                $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletegiftcard"><i class="fa fa-trash"></i></a>';
                return $updateButton . " " . $deleteButton . "" . $rechargBtn . "" . $giftCard;

            })
            ->escapeColumns([])
            // ->rawColumns(['action','status'])
            ->make(true);
    }
    return view('superadmin.giftcard.index', compact('lims_customer_list', 'lims_user_list'));
}
/**
 * Summary of giftcardGenerateCode
 * @return mixed
 */
public function giftcardGenerateCode()
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
public function giftcardecharge($request, $id)
{
    $data = $request->all();
    $data['user_id'] = Auth::id();
    $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
    if ($lims_gift_card_data->customer_id)
        $lims_customer_data = Customer::find($lims_gift_card_data->customer_id);
    else
        $lims_customer_data = User::find($lims_gift_card_data->user_id);

    $lims_gift_card_data->amount += $data['amount'];
    $lims_gift_card_data->save();
    GiftCardRecharge::create($data);
    $message = 'GiftCard recharged successfully';
    if ($lims_customer_data->email) {
        $data['email'] = $lims_customer_data->email;
        $data['name'] = $lims_customer_data->name;
        $data['card_no'] = $lims_gift_card_data->card_no;
        $data['balance'] = $lims_gift_card_data->amount - $lims_gift_card_data->expense;
        try {
            Mail::send('mail.gift_card_recharge', $data, function ($message) use ($data) {
                $message->to($data['email'])->subject('GiftCard Recharge Info');
            });
        } catch (\Exception $e) {
            $message = 'GiftCard recharged successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
        }
    }
    return redirect('superAdmin/gifcard')->with('message', $message);
}
public function giftcardrecharge($request, $id)
{
    $data = $request->all();
    $data['user_id'] = Auth::id();
    $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
    if ($lims_gift_card_data->customer_id)
        $lims_customer_data = Customer::find($lims_gift_card_data->customer_id);
    else
        $lims_customer_data = User::find($lims_gift_card_data->user_id);
    $lims_gift_card_data->amount += $data['amount'];
    $lims_gift_card_data->save();
    GiftCardRecharge::create($data);
    $message = 'GiftCard recharged successfully';
    if ($lims_customer_data->email) {
        $data['email'] = $lims_customer_data->email;
        $data['name'] = $lims_customer_data->name;
        $data['card_no'] = $lims_gift_card_data->card_no;
        $data['balance'] = $lims_gift_card_data->amount - $lims_gift_card_data->expense;
        try {
            Mail::send('mail.gift_card_recharge', $data, function ($message) use ($data) {
                $message->to($data['email'])->subject('GiftCard Recharge Info');
            });
        } catch (\Exception $e) {
            $message = 'GiftCard recharged successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
        }
    }
    return redirect('superAdmin/giftcard')->with('message', $message);
}

public function giftcardupdate($request, $id)
{
    $request['card_no'] = $request['card_no_edit'];

    $data = $request->all();
    $lims_gift_card_data = GiftCard::find($data['id']);
    $lims_gift_card_data->card_no = $data['card_no_edit'];
    $lims_gift_card_data->amount = $data['amount_edit'];
    if ($data['user_edit']) {
        $lims_gift_card_data->user_id = $data['user_id_edit'];
        $lims_gift_card_data->customer_id = null;
    } else {
        $lims_gift_card_data->customer_id = $data['customer_id_edit'];
        $lims_gift_card_data->user_id = null;
    }
    $lims_gift_card_data->expired_date = $data['expired_date_edit'];
    $lims_gift_card_data->save();
    return redirect('superAdmin/giftcard')->with('message', 'GiftCard updated successfully');
}
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
}