<?php

namespace App\Http\Servicecruds;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use \Illuminate\Support\Facades\Auth;
use App\Models\{
    Sale,
    Returns,
    CashRegister,
    Expense
};

class CashRegistercrud
{
 // ========================cashRegister===================    
 public function cashRegisterindex($request)
 {
     $lims_cash_register_all = CashRegister::with('user', 'warehouse')->get();
     if ($request->ajax()) {
         $cashRegisters = CashRegister::latest()->get();
         // $lims_cash_register_all = CashRegister::with('user', 'warehouse')->get();

         return Datatables::of($cashRegisters)
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
                         data-original-title="Edit" class="edit btn btn-primary btn-sm  editcashRegister "> <i class="fas fa-edit"></i></a>';



                 // Delete Button
 
                 $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletecashRegister"><i class="fa fa-trash"></i></a>';
                 return $updateButton . " " . $deleteButton;

             })
             ->escapeColumns([])
             // ->rawColumns(['action','status'])
             ->make(true);

     }
     return view('superadmin.cash_register.index', compact('lims_cash_register_all'));

 }

 /**
  * Summary of cashRegisterGenerateCode
  * @return mixed
  */
 public function cashRegisterGenerateCode()
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
 public function cashRegisterstore($request)
 {
     // print_r($request->id);
     // die();
    $user_id =  Auth::id();
     
    CashRegister::updateOrCreate(['id' => $request->id],
    [
        'cash_in_hand'      => $request->cash_in_hand,    
        'warehouse_id'      => $request->warehouse_id,                
        'user_id' =>  $user_id, 
        'status' => true, 

    ]);            

     return redirect('superAdmin/cashRegister')->with('message', 'cashRegister created successfully');
 }
 public function cashRegisterdestroy($id)        {
     $cashRegister = CashRegister::findOrFail($id);  
     $cashRegister->delete();
     return response()->json(['status' => "success"]);
 
     }
 public function cashRegisterpublish($id)
 {
     $publish            = cashRegister::find($id);
     $publish->is_active = 0;
     $publish->save();
     return response()->json(['status' => "success"]);
     // return redirect()->route('superAdmin.category')->with('success', 'Publish successfully');
 }
 public function cashRegisterunpublish($id)
 {

     $unpublish            = cashRegister::find($id);
     $unpublish->is_active = 1;
     $unpublish->save();
     return response()->json(['status' => "success"]);
     // return redirect()->route('superAdmin.category')->with('success', 'Unpublish successfully');
 } 

 public function getDetails($id)
 {
     $cash_register_data = CashRegister::find($id);

     $data['cash_in_hand'] = $cash_register_data->cash_in_hand;
     $data['total_sale_amount'] = Sale::where([
                                     ['cash_register_id', $cash_register_data->id],
                                     ['sale_status', 1]
                                 ])->sum('grand_total');
     $data['total_payment'] = Payment::where('cash_register_id', $cash_register_data->id)->sum('amount');
     $data['cash_payment'] = Payment::where([
                                 ['cash_register_id', $cash_register_data->id],
                                 ['paying_method', 'Cash']
                             ])->sum('amount');
     $data['credit_card_payment'] = Payment::where([
                                 ['cash_register_id', $cash_register_data->id],
                                 ['paying_method', 'Credit Card']
                             ])->sum('amount');
     $data['gift_card_payment'] = Payment::where([
                                 ['cash_register_id', $cash_register_data->id],
                                 ['paying_method', 'Gift Card']
                             ])->sum('amount');
     $data['deposit_payment'] = Payment::where([
                                 ['cash_register_id', $cash_register_data->id],
                                 ['paying_method', 'Deposit']
                             ])->sum('amount');
     $data['cheque_payment'] = Payment::where([
                                 ['cash_register_id', $cash_register_data->id],
                                 ['paying_method', 'Cheque']
                             ])->sum('amount');
     $data['paypal_payment'] = Payment::where([
                                 ['cash_register_id', $cash_register_data->id],
                                 ['paying_method', 'Paypal']
                             ])->sum('amount');
     $data['total_sale_return'] = Returns::where('cash_register_id', $cash_register_data->id)->sum('grand_total');
     $data['total_expense'] = Expense::where('cash_register_id', $cash_register_data->id)->sum('amount');
     $data['total_cash'] = $data['cash_in_hand'] + $data['total_payment'] - ($data['total_sale_return'] + $data['total_expense']);
     $data['status'] = $cash_register_data->status;
     return $data;
 }

 public function cashRegisterclose($request)
 {
     $cash_register_data = CashRegister::find($request->cash_register_id);
     $cash_register_data->status = 0;
     $cash_register_data->save();
     return redirect()->back()->with('message', 'Cash register closed successfully');
 }
}