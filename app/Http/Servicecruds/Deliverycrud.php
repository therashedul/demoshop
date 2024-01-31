<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Mail\DeliveryDetails;
use App\Mail\DeliveryChallan;
use Mail;
use \App\Traits\MailInfo;
use Illuminate\Support\Facades\Cache;

use Yajra\DataTables\Facades\DataTables;
use App\Models\{
    Product,
    ProductVariant,
    ProductBatch,
    Sale,
    Customer,
    ProductSale,
    Delivery
};

class Deliverycrud
{
    use MailInfo;
   // ========================Delivery===================
   public function deliveryindex( $request)
   {

       $lims_delivery_all = Delivery::latest()->get();
       $couriarName = DB::table('couriers')->get();
       if ($request->ajax()) {
           $deliverys = Delivery::latest()->get();

           return Datatables::of($deliverys)
               ->addIndexColumn()

               ->filter(function ($instance) use ($request) {
                   if (!empty($request->get('name'))) {
                       $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                           return Str::contains($row['reference_no'], $request->get('name')) ? true : false;
                       });
                   }

                   if (!empty($request->get('search'))) {
                       $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                           if (Str::contains(Str::lower($row['reference_no']), Str::lower($request->get('search')))) {
                               return true;
                           } else if (Str::contains(Str::lower($row['reference_no']), Str::lower($request->get('search')))) {
                               return true;
                           }
                           return false;
                       });
                   }
               })

               ->addColumn('sale_ref', function ($row) {
                   $sale_ref = optional($row->sale)->reference_no;
                   return $sale_ref;
               })
               ->addColumn('coustomer', function ($row) {
                   $customer_sale = DB::table('sales')
                       ->join('customers', 'sales.customer_id', '=', 'customers.id')
                       ->where('sales.id', $row->sale_id)
                       ->select('sales.reference_no', 'customers.name', 'customers.phone_number', 'customers.city', 'sales.grand_total')
                       ->get();
                   foreach ($customer_sale as $customer) {
                       return $customer->name . '<br>' . $customer->phone_number;
                   }
               })
               ->addColumn('couriar', function ($row) {
                   $couriars = DB::table('deliveries')
                       ->join('couriers', 'couriers.id', '=', 'deliveries.courier_id')
                       ->where('couriers.id', '=', $row->courier_id)
                       ->select('couriers.name')
                       ->get();
                   foreach ($couriars as $couriar) {
                       return $couriar->name;
                   }
               })
               ->addColumn('product', function ($row) {
                   $product_names = DB::table('sales')
                       ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                       ->join('products', 'products.id', '=', 'product_sales.product_id')
                       ->where('sales.id', $row->sale_id)
                       ->pluck('products.product_name')
                       ->toArray();
                   $product = implode(',', $product_names);
                   return $product;
               })
               ->addColumn('grand_total', function ($row) {
                   $customer_sales = DB::table('sales')
                       ->join('customers', 'sales.customer_id', '=', 'customers.id')
                       ->where('sales.id', $row->sale_id)
                       ->select('sales.reference_no', 'customers.name', 'customers.phone_number', 'customers.city', 'sales.grand_total')
                       ->get();
                   foreach ($customer_sales as $customer_sale) {
                       $grandTotal = number_format($customer_sale->grand_total, 2);
                       return $grandTotal;
                   }
               })
               ->addColumn('status', function ($row) {
                   if ($row->status == 1) {
                       $status = trans('Packing');
                       return $status;
                   } elseif ($row->status == 2) {
                       $status = trans('Delivering');
                       return $status;
                   } else {
                       $status = trans('Delivered');
                       return $status;
                   }
               })

               ->addColumn('action', function ($row) {
                   $customer = '';
                   $grandTotal = '';
                   $customerphone = '';
                   $couriarId = '';

                   $product_names = DB::table('sales')
                       ->join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                       ->join('products', 'products.id', '=', 'product_sales.product_id')
                       ->where('sales.id', $row->sale_id)
                       ->pluck('products.product_name')
                       ->toArray();
                   $product = implode(',', $product_names);
                   $customer_sales = DB::table('sales')
                       ->join('customers', 'sales.customer_id', '=', 'customers.id')
                       ->where('sales.id', $row->sale_id)
                       ->select('sales.reference_no', 'customers.name', 'customers.phone_number', 'customers.city', 'sales.grand_total')
                       ->get();
                   foreach ($customer_sales as $customer_sale) {
                       $customer = optional($customer_sale)->name;
                       $grandTotal = optional($customer_sale)->grand_total;
                       $customerphone = optional($customer_sale)->phone_number;
                   }
                   $couriars = DB::table('deliveries')
                       ->join('couriers', 'couriers.id', '=', 'deliveries.courier_id')
                       ->where('deliveries.id', '=', $row->courier_id)
                       ->select('couriers.name')
                       ->get();
                   foreach ($couriars as $couriar) {
                       $couriarId = $couriar->name;
                   }

                   $username = DB::table('users')->find($row->user_id);
                   // $barcode = DNS2D::getBarcodePNG($row->reference_no, 'QRCODE');
                   // Update Button

                   $updateButton = '<a href="javascript:void(0)" data-toggle="tooltip"
                               data-toggle="modal"
                               data-target="#ajaxModelexa"
                               data-id="' . $row->id . '"
                               data-reference_no="' . $row->reference_no . '"
                               data-sale_reference_no="' . optional($row->sale)->reference_no . '"
                               data-product_name="' . $product . '"
                               data-customer="' . $customer . '"
                               data-couriar="' . $couriarId . '"
                               data-grand_total="' . $grandTotal . '"
                               data-address="' . $row->address . '"
                               data-delivered_by="' . $row->delivered_by . '"
                               data-recieved_by="' . $row->recieved_by . '"
                               data-note="' . $row->note . '"
                               data-status="' . $row->status . '"

                               data-original-title="Edit" class="edit btn btn-primary btn-sm  editdelivery "> <i class="fas fa-edit"></i></a>';

                   // Print button

                   $printButton = '<a href="javascript:void(0)" data-toggle="tooltip"
                                   data-toggle="modal"
                                   data-target="#delivery-details"
                                   data-id="' . $row->id . '"
                                   data-date="' . date("Y-m-d", strtotime($row->created_at->toDateString())) . '"
                                   data-reference_no="' . $row->reference_no . '"
                                   data-sale_reference_no="' . optional($row->sale)->reference_no . '"
                                   data-product_name="' . $product . '"
                                   data-customer="' . $customer . '"
                                   data-phone="' . $customerphone . '"
                                   data-address="' . $row->address . '"
                                   data-grand_total="' . $grandTotal . '"
                                   data-address="' . $row->address . '"
                                   data-user_name="' . $username->name . '"
                                   data-status="' . $row->status . '"
                                   data-note="' . $row->note . '"
                                   data-delivered_by="' . $row->delivered_by . '"
                                   data-recieved_by="' . $row->recieved_by . '"



                                   data-original-title="Edit" class="edit btn btn-success btn-sm  delivery-link "> <i class="fas fa-file-invoice"></i> </a>';

                   // Delete Button
                   $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deletedelivery"><i class="fa fa-trash"></i></a>';
                   return $updateButton . " " . $deleteButton . "" . $printButton;

               })
               ->escapeColumns([])
               // ->rawColumns(['action','status'])
               ->make(true);

       }

       return view('superadmin.delivery.index', compact('lims_delivery_all', 'couriarName'));

   }
   public function deliveryedit($id)
   {
       $lims_delivery_data = Delivery::find($id);
       $customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $lims_delivery_data->sale_id)->select('sales.reference_no', 'customers.name')->get();
       $delivery_data[] = $lims_delivery_data->reference_no;
       $delivery_data[] = $customer_sale[0]->reference_no;
       $delivery_data[] = $lims_delivery_data->status;
       $delivery_data[] = $lims_delivery_data->delivered_by;
       $delivery_data[] = $lims_delivery_data->recieved_by;
       $delivery_data[] = $customer_sale[0]->name;
       $delivery_data[] = $lims_delivery_data->address;
       $delivery_data[] = $lims_delivery_data->note;
       return $delivery_data;
   }
   public function deliveryupdate( $request)
   {
       // dd($request->all());
       $input = $request->except('reference_no');
       // return $input['id'];
       $lims_delivery_data = Delivery::find($input['id']);
       // $document = $request->file;
       // if ($document) {
       //     $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
       //     $documentName = $input['reference_no'] . '.' . $ext;
       //     $document->move('public/documents/delivery', $documentName);
       //     $input['file'] = $documentName;
       // }
       $lims_delivery_data->update($input);
       $lims_sale_data = Sale::find($lims_delivery_data->sale_id);
       $lims_customer_data = Customer::find($lims_sale_data->customer_id);
       $message = 'Delivery updated successfully';

       if ($lims_customer_data->email && $input['status'] != 1) {
           $mail_data['email'] = $lims_customer_data->email;
           $mail_data['customer'] = $lims_customer_data->name;
           $mail_data['sale_reference'] = $lims_sale_data->reference_no;
           $mail_data['delivery_reference'] = $lims_delivery_data->reference_no;
           $mail_data['status'] = $input['status'];
           $mail_data['address'] = $input['address'];
           $mail_data['delivered_by'] = $input['delivered_by'];
           $mail_data['recieved_by'] = $input['recieved_by'];
           try {
               Mail::send('mail.delivery_details', $mail_data, function ($message) use ($mail_data) {
                   $message->to($mail_data['email'])->subject('Delivery Details');
               });
           } catch (\Exception $e) {
               $message = 'Delivery updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
           }
       }

       return redirect('superAdmin/delivery')->with('message', $message);
   }

   public function productDeliveryData($id)
   {
       $lims_delivery_data = Delivery::find($id);
       //return 'madarchod';
       $lims_product_sale_data = ProductSale::where('sale_id', $lims_delivery_data->sale->id)->get();

       foreach ($lims_product_sale_data as $key => $product_sale_data) {
           $product = Product::select('product_name', 'product_code')->find($product_sale_data->product_id);
           if ($product_sale_data->variant_id) {
               $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
               $product->code = $lims_product_variant_data->item_code;
           }
           if ($product_sale_data->product_batch_id) {
               $product_batch_data = ProductBatch::select('batch_no', 'expired_date')->find($product_sale_data->product_batch_id);
               if ($product_batch_data) {
                   $batch_no = $product_batch_data->batch_no;
                   $expired_date = date(config('date_format'), strtotime($product_batch_data->expired_date));
               }
           } else {
               $batch_no = 'N/A';
               $expired_date = 'N/A';
           }
           $product_sale[0][$key] = $product->product_code;
           $product_sale[1][$key] = $product->product_name;
           $product_sale[2][$key] = $batch_no;
           $product_sale[3][$key] = $expired_date;
           $product_sale[4][$key] = $product_sale_data->qty;
       }
       return $product_sale;
   }
   public function deliverysendMail(Request $request)
   {

       $data = $request->all();
       $lims_delivery_data = Delivery::find($data['delivery_id']);
       $lims_sale_data = Sale::find($lims_delivery_data->sale->id);
       $lims_product_sale_data = ProductSale::where('sale_id', $lims_delivery_data->sale->id)->get();
       $lims_customer_data = Customer::find($lims_sale_data->customer_id);
       if ($lims_customer_data->email) {
           //collecting male data
           $mail_data['email'] = $lims_customer_data->email;
           $mail_data['date'] = date(config('date_format'), strtotime($lims_delivery_data->created_at->toDateString()));
           $mail_data['delivery_reference_no'] = $lims_delivery_data->reference_no;
           $mail_data['sale_reference_no'] = $lims_sale_data->reference_no;
           $mail_data['status'] = $lims_delivery_data->status;
           $mail_data['customer_name'] = $lims_customer_data->name;
           $mail_data['address'] = $lims_customer_data->address . ', ' . $lims_customer_data->city;
           $mail_data['phone_number'] = $lims_customer_data->phone_number;
           $mail_data['note'] = $lims_delivery_data->note;
           $mail_data['prepared_by'] = $lims_delivery_data->user->name;
           if ($lims_delivery_data->delivered_by)
               $mail_data['delivered_by'] = $lims_delivery_data->delivered_by;
           else
               $mail_data['delivered_by'] = 'N/A';
           if ($lims_delivery_data->recieved_by)
               $mail_data['recieved_by'] = $lims_delivery_data->recieved_by;
           else
               $mail_data['recieved_by'] = 'N/A';
           //return $mail_data;

           foreach ($lims_product_sale_data as $key => $product_sale_data) {
               $lims_product_data = Product::select('product_code', 'product_name')->find($product_sale_data->product_id);
               $mail_data['codes'][$key] = $lims_product_data->product_code;
               $mail_data['name'][$key] = $lims_product_data->product_name;
               if ($product_sale_data->variant_id) {
                   $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
                   $mail_data['codes'][$key] = $lims_product_variant_data->item_code;
               }
               $mail_data['qty'][$key] = $product_sale_data->qty;
           }

           //return $mail_data;

           try {
               Mail::send('mail.delivery_challan', $mail_data, function ($message) use ($mail_data) {
                   $message->to($mail_data['email'])->subject('Delivery Challan');
               });
               $message = 'Mail sent successfully';
           } catch (\Exception $e) {
               $message = 'Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
           }
       } else
           $message = 'Customer does not have email!';

       return redirect()->back()->with('message', $message);
   }
   public function deliverydestroy($id)
   {
       $lims_delivery_data = Delivery::find($id);
       $lims_delivery_data->delete();
       return redirect('superAdmin/delivery')->with('not_permitted', 'Delivery deleted successfully');
   }

}
