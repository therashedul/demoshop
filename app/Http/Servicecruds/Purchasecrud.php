<?php

namespace App\Http\Servicecruds;
use Keygen;
// Event
use Arr;
// language
// try  catch
use Carbon\Carbon;

use App\Models\Account;
use Illuminate\Support\Facades\Mail;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use \Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;
use \Symfony\Component\HttpFoundation\Session\Session;

use Stripe\Stripe;
use App\Models\{
    Supplier,
    CustomField,
    Unit,
    Tax,
    Warehouse,
    Product,
    ProductWarehouse,
    Variant,
    ProductVariant,
    Purchase,
    ProductPurchase,
    ReturnPurchase,
    PurchaseProductReturn,
    ProductBatch,
    PosSetting,
    Payment,
    PaymentWithCheque,
    PaymentWithCreditCard
};

class Purchasecrud
{
    public function purchaseindex( $request)
    {
        $purchase = Purchase::latest()->get();
        $supplier = Supplier::latest()->get();
        if ($request->ajax()) {
            $purchase = Purchase::latest()->get();
            if ($request->filled('from_date') && $request->filled('to_date')) {
                $purchase = $purchase->whereBetween('created_at', [$request->from_date, $request->to_date]);
            }
            // custom field search
            $custompurchase = Purchase::select('*');
            if ($request->filled('warehouse_id')) {
                $purchase = $custompurchase->where('warehouse_id', $request->warehouse_id);
            }
            if ($request->filled('purchase_status')) {
                $purchase = $custompurchase->where('purchase_status', $request->purchase_status);
            }
            if ($request->filled('payment_status')) {
                $purchase = $custompurchase->where('payment_status', $request->payment_status);
            }
            if ($request->filled('purchase_name')) {
                $purchase = $custompurchase->where('reference_no', 'like', '%' . $request->purchase_name . '%');
            }
            return Datatables::of($purchase)
                ->addIndexColumn()

                // ->filter(function ($instance) use ($request) {
                //     if (!empty($request->get('purchase_name'))) {
                //         $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                //             return Str::contains($row['reference_no'], $request->get('purchase_name')) ? true : false;
                //         });
                //     }
                //     if (!empty($request->get('search'))) {
                //         $instance->collection = $instance->collection->filter(function ($row) use ($request) {
                //             if (Str::contains(Str::lower($row['reference_no' ]), Str::lower($request->get('search')))){
                //                 return true;
                //             }else if (Str::contains(Str::lower($row['reference_no' ]), Str::lower($request->get('search')))) {
                //                 return true;
                //             }
                //             return false;
                //         });
                //     }
                // })

                ->addColumn('image', function ($row) {
                    if (!isset($row->image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->image) .
                            '" alt="' . $row->name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->image) .
                        '" alt="' . $row->name . '" style="height: 40px;" >';
                })

                ->addColumn('suppler', function ($row) {
                    $suppliers = DB::table('purchases')
                        ->join('suppliers', 'suppliers.id', '=', 'purchases.supplier_id')
                        ->select('suppliers.name')
                        ->where('suppliers.id', $row->supplier_id)
                        ->get();
                    foreach ($suppliers as $supplier) {
                        return $supplier->name;
                    }
                })

                ->addColumn('purchase_status', function ($row) {
                    if ($row->purchase_status == 1) {
                        return '<div class="badge badge-success">' . trans('Recieved') . '</div>';
                    } elseif ($row->purchase_status == 2) {
                        return '<div class="badge badge-success">' . trans('Partial') . '</div>';
                    } elseif ($row->purchase_status == 3) {
                        return '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . trans('Ordered') . '</div>';
                    }
                })

                ->addColumn('name', function ($row) {
                    $products = DB::table('purchases')
                        ->join('product_purchases', 'product_purchases.purchase_id', '=', 'purchases.id')
                        ->join('products', 'product_purchases.product_id', '=', 'products.id')
                        ->select('products.product_name')
                        ->where('product_purchases.purchase_id', $row->id)
                        ->get();
                    foreach ($products as $product) {
                        return $product->product_name;
                    }
                    //     if ($row->is_variant) {
                    //         $product_variant_data = \App\Models\ProductVariant::FindExactProduct('id', $row->is_variant)
                    //                                 ->select('item_code')
                    //                                 ->first();
                    //                                 $row->product_code = $product_variant_data->item_code;
                    //                             }
                    // return $product_variant_data ;
                })

                ->addColumn('returned_amount', function ($row) {
                    $returned_amount = DB::table('return_purchases')->where('purchase_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    return $returned_amount;
                })

                ->addColumn('due', function ($row) {
                    $returned_amount = DB::table('return_purchases')->where('purchase_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    $dueamount = number_format($row->grand_total - $returned_amount - $row->paid_amount, 2);
                    return $dueamount;
                })

                ->addColumn('payment_status', function ($row) {
                    if ($row->payment_status == 1)
                        return '<div class="badge badge-danger">' . trans('Due') . '</div>';
                    else
                        return '<div class="badge badge-success">' . trans('Paid') . '</div>';
                })

                ->addColumn('date', function ($row) {
                    $date = date('d-M-Y', strtotime($row->created_at));
                    return $date;
                })

                ->addColumn('action', function ($row) {
                    if ($row->supplier_id) {
                        $supplier = $row->supplier;
                    } else {
                        $supplier = new Supplier();
                    }
                    if ($row->user_id) {

                        $user = $row->supplier;
                    } else {
                        $user = new User();
                    }
                    if ($row->purchase_status == 1) {
                        $purchase_status = '<strong>' . trans('Recieved') . '</strong>';
                    } elseif ($row->purchase_status == 2) {
                        $purchase_status = '<strong>' . trans('Partial') . '</strong>';
                    } elseif ($row->purchase_status == 3) {
                        $purchase_status = '<strong>' . trans('Pending') . '</strong>';
                    } else {
                        $purchase_status = '<strong>' . trans('Ordered') . '</strong>';
                    }
                    // Update Button
                    $viewButton = '<a href="javascript:void(0)" style="box-shadow:none;" class="btn btn-link view"
                                        data-id = "' . $row->id . '"
                                        data-date = "' . date('d-m-Y', strtotime($row->created_at)) . '"
                                        data-reference_no = "' . $row->reference_no . '"
                                        data-purchase_status = "' . $purchase_status . '"
                                        data-warehouse_name = "' . $row->warehouse->name . '"
                                        data-warehouse_phone = "' . $row->warehouse->phone . '"
                                        data-warehouse_address = "' . $row->warehouse->address . '"
                                        data-supplier_name = "' . $supplier->name . '"
                                        data-company_name = "' . $supplier->company_name . '"
                                        data-supplier_phone_number = "' . $supplier->phone_number . '"
                                        data-supplier_email = "' . $supplier->email . '"
                                        data-supplier_address = "' . $supplier->address . '"
                                        data-total_tax = "' . $row->total_tax . '"
                                        data-total_discount = "' . $row->total_discount . '"
                                        data-total_cost = "' . $row->total_cost . '"
                                        data-order_tax = "' . $row->order_tax . '"
                                        data-order_tax_rate = "' . $row->order_tax_rate . '"
                                        data-order_discount = "' . $row->order_discount . '"
                                        data-shipping_cost = "' . $row->shipping_cost . '"
                                        data-grand_total = "' . $row->grand_total . '"
                                        data-paid_amount = "' . $row->paid_amount . '"
                                        data-user_name = "' . $user->name . '"
                                        data-user_email = "' . $user->email . '"
                                        data-note = "' . preg_replace('/\s+/S', " ", $row->note) . '"
                                        ><i class="fa fa-eye"></i> ' . trans('View') . '</a>';

                    $updateButton = '<a href="' . route('superAdmin.purchase.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i> ' . trans('Edit') . '</a>';

                    // View payment
                    $viewpayment = '<a href="javascript:void(0)" class="get-payment btn btn-link" data-id = "' . $row->id . '"><i class="fas fa-money-bill-wave-alt"></i> ' . trans('View Payment') . '</a>';

                    // Add payment
                    $addpayment = '<button type="button" class="add-payment btn btn-link" data-id = "' . $row->id . '" data-toggle="modal" data-target="#add-payment"><i class="fas fa-shopping-basket"></i> ' . trans('Add Payment') . '</button>';

                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-link  deletepurchase"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';

                    $nasted = '<div class="btn-group">
                                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                                            <span class="caret"></span>
                                            <span class="sr-only">Toggle Dropdown</span>
                                            </button>
                                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default menuScrolling" user="menu">
                                                <li>' . $updateButton . '</li>

                                                <li>' . $viewpayment . '</li>

                                                <li>' . $viewButton . '</li>

                                                <li>' . $addpayment . '</li>

                                                <li>' . $deleteButton . '</li>
                                            </ul>
                                        </div>';

                    return $nasted;

                    // return $updateButton . " " . $deleteButton . "" . $viewpayment . "" . $addpayment . "" . $viewButton;
                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }

        if ($request->input('warehouse_id'))
            $warehouse_id = $request->input('warehouse_id');
        else
            $warehouse_id = 0;

        if ($request->input('purchase_status'))
            $purchase_status = $request->input('purchase_status');
        else
            $purchase_status = 0;

        if ($request->input('payment_status'))
            $payment_status = $request->input('payment_status');
        else
            $payment_status = 0;

        if ($request->input('starting_date')) {
            $starting_date = $request->input('starting_date');
            $ending_date = $request->input('ending_date');
        } else {
            $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d'))))));
            $ending_date = date("Y-m-d");
        }
        $lims_warehouse_list = Warehouse::where('is_active', '1')->get();
        $lims_account_list = Account::where('is_active', true)->get();
        $all_permission = '';
        return view('superadmin.purchase.index', compact('purchase', 'lims_account_list', 'all_permission', 'starting_date', 'ending_date', 'warehouse_id', 'purchase_status', 'payment_status', 'lims_warehouse_list'));
    }
    public function purchasecreate()
    {
        $data = [
            'lims_supplier_list' => Supplier::where('is_active', true)->get(),
            'lims_warehouse_list' => Warehouse::where('is_active', '1')->get(),
            'lims_tax_list' => Tax::where('is_active', '1')->get(),
            'lims_product_list_without_variant' => $this->productWithoutVariant(),
            'lims_product_list_with_variant' => $this->productWithVariant(),
        ];

        return view('superadmin.purchase.create', $data);
    }
    #create

    public function purchasestore($request)
    {

        $data = $request->except('name');
        // return dd($data);
        $data['user_id'] = Auth::id();
        $data['reference_no'] = 'pr-' . date("Ymd") . '-'. date("his");
        // $document = $request->document;
        // if ($document) {
        //     $v = Validator::make(
        //         [
        //             'extension' => strtolower($request->document->getClientOriginalExtension()),
        //         ],
        //         [
        //             'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
        //         ]
        //     );
        //     if ($v->fails())
        //         return redirect()->back()->withErrors($v->errors());

        //     $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
        //     $documentName = date("Ymdhis");
        //     if(!config('database.connections.saleprosaas_landlord')) {
        //         $documentName = $documentName . '.' . $ext;
        //         $document->move('public/documents/purchase', $documentName);
        //     }
        //     else {
        //         $documentName = $this->getTenantId() . '_' . $documentName . '.' . $ext;
        //         $document->move('public/documents/purchase', $documentName);
        //     }
        //     $data['document'] = $documentName;
        // }
        if(isset($data['created_at']))
            $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
        else
            $data['created_at'] = date("Y-m-d H:i:s");
        $lims_purchase_data = Purchase::create($data);
        // return dd($lims_purchase_data);
        //inserting data for custom fields
        $custom_field_data = [];
        $custom_fields = CustomField::where('belongs_to', 'purchase')->select('name', 'type')->get();
        foreach ($custom_fields as $type => $custom_field) {
            $field_name = str_replace(' ', '_', strtolower($custom_field->name));
            if(isset($data[$field_name])) {
                if($custom_field->type == 'checkbox' || $custom_field->type == 'multi_select')
                    $custom_field_data[$field_name] = implode(",", $data[$field_name]);
                else
                    $custom_field_data[$field_name] = $data[$field_name];
            }
        }
        if(count($custom_field_data))
            DB::table('purchases')->where('id', $lims_purchase_data->id)->update($custom_field_data);
        $product_id = $data['product_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $recieved = $data['recieved'];
        $batch_no = $data['batch_no'];
        $expired_date = $data['expired_date'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $imei_numbers = $data['imei_number'];
        $product_purchase = [];

        foreach ($product_id as $i => $id) {
            $lims_purchase_unit_data  = Unit::where('unit_code', $purchase_unit[$i])->first();

            if ($lims_purchase_unit_data->operator == '*') {
                $quantity = $recieved[$i] * $lims_purchase_unit_data->operation_value;
            } else {
                $quantity = $recieved[$i] / $lims_purchase_unit_data->operation_value;
            }
            $lims_product_data = Product::find($id);
            $price = $lims_product_data->product_price;
            //dealing with product barch
            if($batch_no[$i]) {
                $product_batch_data = ProductBatch::where([
                                        ['product_id', $lims_product_data->id],
                                        ['batch_no', $batch_no[$i]]
                                    ])->first();
                if($product_batch_data) {
                    $product_batch_data->expired_date = $expired_date[$i];
                    $product_batch_data->qty += $quantity;
                    $product_batch_data->save();
                }
                else {
                    $product_batch_data = ProductBatch::create([
                                            'product_id' => $lims_product_data->id,
                                            'batch_no' => $batch_no[$i],
                                            'expired_date' => $expired_date[$i],
                                            'qty' => $quantity
                                        ]);
                }
                $product_purchase['product_batch_id'] = $product_batch_data->id;
            }
            else
                $product_purchase['product_batch_id'] = null;

            if($lims_product_data->is_variant) {
                $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($lims_product_data->id, $product_code[$i])->first();
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $id],
                    ['variant_id', $lims_product_variant_data->variant_id],
                    ['warehouse_id', $data['warehouse_id']]
                ])->first();
                $product_purchase['variant_id'] = $lims_product_variant_data->variant_id;
                //add quantity to product variant table
                $lims_product_variant_data->qty += $quantity;
                $lims_product_variant_data->save();
            }
            else {
                $product_purchase['variant_id'] = null;
                if($product_purchase['product_batch_id']) {
                    //checking for price
                    $lims_product_warehouse_data = ProductWarehouse::where([
                                                    ['product_id', $id],
                                                    ['warehouse_id', $data['warehouse_id'] ],
                                                ])
                                                ->whereNotNull('price')
                                                ->select('price')
                                                ->first();
                    if($lims_product_warehouse_data)
                        $price = $lims_product_warehouse_data->price;
                    else
                        $price = null;
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $id],
                        ['product_batch_id', $product_purchase['product_batch_id'] ],
                        ['warehouse_id', $data['warehouse_id'] ],
                    ])->first();
                }
                else {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $id],
                        ['warehouse_id', $data['warehouse_id'] ],
                    ])->first();
                }
            }
            //add quantity to product table
            $lims_product_data->qty = $lims_product_data->qty + $quantity;
            $lims_product_data->save();
            //add quantity to warehouse
            if ($lims_product_warehouse_data) {
                $lims_product_warehouse_data->qty = $lims_product_warehouse_data->qty + $quantity;
                $lims_product_warehouse_data->product_batch_id = $product_purchase['product_batch_id'];
            }
            else {
                $lims_product_warehouse_data = new ProductWarehouse();
                $lims_product_warehouse_data->product_id = $id;
                $lims_product_warehouse_data->product_batch_id = $product_purchase['product_batch_id'];
                $lims_product_warehouse_data->warehouse_id = $data['warehouse_id'];
                $lims_product_warehouse_data->qty = $quantity;
                if($price)
                    $lims_product_warehouse_data->price = $price;
                if($lims_product_data->is_variant)
                    $lims_product_warehouse_data->variant_id = $lims_product_variant_data->variant_id;
            }
            //added imei numbers to product_warehouse table
            if($imei_numbers[$i]) {
                if($lims_product_warehouse_data->imei_number)
                    $lims_product_warehouse_data->imei_number .= ',' . $imei_numbers[$i];
                else
                    $lims_product_warehouse_data->imei_number = $imei_numbers[$i];
            }
            $lims_product_warehouse_data->save();

            $product_purchase['purchase_id'] = $lims_purchase_data->id ;
            $product_purchase['product_id'] = $id;
            $product_purchase['imei_number'] = $imei_numbers[$i];
            $product_purchase['qty'] = $qty[$i];
            $product_purchase['recieved'] = $recieved[$i];
            $product_purchase['purchase_unit_id'] = $lims_purchase_unit_data->id;
            $product_purchase['net_unit_cost'] = $net_unit_cost[$i];
            $product_purchase['discount'] = $discount[$i];
            $product_purchase['tax_rate'] = $tax_rate[$i];
            $product_purchase['tax'] = $tax[$i];
            $product_purchase['total'] = $total[$i];
            ProductPurchase::create($product_purchase);
        }
        return redirect('superAdmin/purchase')->with('message', 'Purchase created successfully');
    }

    public function purchaseAddPayment($request)
    {
        $data = $request->all();
        // print_r($data);
        // die();

        $lims_purchase_data = Purchase::find($data['purchase_id']);
        $lims_purchase_data->paid_amount += $data['amount'];
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_purchase_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_purchase_data->payment_status = 2;
        $lims_purchase_data->save();

        if ($data['paid_by_id'] == 1)
            $paying_method = 'Cash';
        elseif ($data['paid_by_id'] == 2)
            $paying_method = 'Gift Card';
        elseif ($data['paid_by_id'] == 3)
            $paying_method = 'Credit Card';
        else
            $paying_method = 'Cheque';

        $lims_payment_data = new Payment();
        $lims_payment_data->user_id = Auth::id();
        $lims_payment_data->purchase_id = $lims_purchase_data->id;
        $lims_payment_data->account_id = $data['account_id'];
        $lims_payment_data->payment_reference = 'ppr-' . date("Ymd") . '-' . date("his");
        $lims_payment_data->amount = $data['amount'];
        $lims_payment_data->change = $data['paying_amount'] - $data['amount'];
        $lims_payment_data->paying_method = $paying_method;
        $lims_payment_data->payment_note = $data['payment_note'];
        $lims_payment_data->save();

        $lims_payment_data = Payment::latest()->first();
        $data['payment_id'] = $lims_payment_data->id;

        if ($paying_method == 'Credit Card') {
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            $token = $data['stripeToken'];
            $amount = $data['amount'];

            // Charge the Customer
            $charge = \Stripe\Charge::create([
                'amount' => $amount * 100,
                'currency' => 'usd',
                'source' => $token,
            ]);

            $data['charge_id'] = $charge->id;
            PaymentWithCreditCard::create($data);

        } elseif ($paying_method == 'Cheque') {
            PaymentWithCheque::create($data);
        }
        return redirect('superAdmin/purchase')->with('message', 'Payment created successfully');
    }
    public function purchaseUpdatePayment($request)
    {
        $data = $request->all();
        $lims_payment_data = Payment::find($data['payment_id']);
        $lims_purchase_data = Purchase::find($lims_payment_data->purchase_id);
        //updating purchase table
        $amount_dif = $lims_payment_data->amount - $data['edit_amount'];
        $lims_purchase_data->paid_amount = $lims_purchase_data->paid_amount - $amount_dif;
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_purchase_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_purchase_data->payment_status = 2;
        $lims_purchase_data->save();

        //updating payment data
        $lims_payment_data->account_id = $data['account_id'];
        $lims_payment_data->amount = $data['edit_amount'];
        $lims_payment_data->change = $data['edit_paying_amount'] - $data['edit_amount'];
        $lims_payment_data->payment_note = $data['edit_payment_note'];
        if ($data['edit_paid_by_id'] == 1)
            $lims_payment_data->paying_method = 'Cash';
        elseif ($data['edit_paid_by_id'] == 2)
            $lims_payment_data->paying_method = 'Gift Card';
        elseif ($data['edit_paid_by_id'] == 3) {
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            $token = $data['stripeToken'];
            $amount = $data['edit_amount'];
            if ($lims_payment_data->paying_method == 'Credit Card') {
                $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $lims_payment_data->id)->first();

                \Stripe\Refund::create(array(
                    "charge" => $lims_payment_with_credit_card_data->charge_id,
                ));

                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'source' => $token,
                ]);

                $lims_payment_with_credit_card_data->charge_id = $charge->id;
                $lims_payment_with_credit_card_data->save();
            } else {
                // Charge the Customer
                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'source' => $token,
                ]);

                $data['charge_id'] = $charge->id;
                PaymentWithCreditCard::create($data);
            }
            $lims_payment_data->paying_method = 'Credit Card';
        } else {
            if ($lims_payment_data->paying_method == 'Cheque') {
                $lims_payment_data->paying_method = 'Cheque';
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $data['payment_id'])->first();
                $lims_payment_cheque_data->cheque_no = $data['edit_cheque_no'];
                $lims_payment_cheque_data->save();
            } else {
                $lims_payment_data->paying_method = 'Cheque';
                $data['cheque_no'] = $data['edit_cheque_no'];
                PaymentWithCheque::create($data);
            }
        }
        $lims_payment_data->save();
        return redirect('superAdmin/purchase')->with('message', 'Payment updated successfully');
    }
    public function purchaseedit($id)
    {

        $lims_supplier_list = Supplier::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_product_list_without_variant = $this->productWithoutVariant();
        $lims_product_list_with_variant = $this->productWithVariant();
        $lims_purchase_data = Purchase::find($id);
        $lims_product_purchase_data = ProductPurchase::where('purchase_id', $id)->get();

        return view('superadmin.purchase.edit', compact('lims_warehouse_list', 'lims_supplier_list', 'lims_product_list_without_variant', 'lims_product_list_with_variant', 'lims_tax_list', 'lims_purchase_data', 'lims_product_purchase_data'));
    }

    public function purchasesProductPurchase($id)
    {
        try {
            $lims_product_purchase_data = ProductPurchase::where('purchase_id', $id)->get();
            foreach ($lims_product_purchase_data as $key => $product_purchase_data) {
                $product = Product::find($product_purchase_data->product_id);
                $unit = Unit::find($product_purchase_data->purchase_unit_id);
                if ($product_purchase_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::FindExactProduct($product->id, $product_purchase_data->variant_id)->select('item_code')->first();
                    $product->code = $lims_product_variant_data->item_code;
                }
                if ($product_purchase_data->product_batch_id) {
                    $product_batch_data = ProductBatch::select('batch_no')->find($product_purchase_data->product_batch_id);
                    $product_purchase[7][$key] = $product_batch_data->batch_no;
                } else
                    $product_purchase[7][$key] = 'N/A';
                $product_purchase[0][$key] = $product->name . ' [' . $product->code . ']';
                if ($product_purchase_data->imei_number) {
                    $product_purchase[0][$key] .= '<br>IMEI or Serial Number: ' . $product_purchase_data->imei_number;
                }
                $product_purchase[1][$key] = $product_purchase_data->qty;
                $product_purchase[2][$key] = $unit->unit_code;
                $product_purchase[3][$key] = $product_purchase_data->tax;
                $product_purchase[4][$key] = $product_purchase_data->tax_rate;
                $product_purchase[5][$key] = $product_purchase_data->discount;
                $product_purchase[6][$key] = $product_purchase_data->total;
            }
            return $product_purchase;
        } catch (\Exception $e) {
            /*return response()->json('errors' => [$e->getMessage());*/
            //return response()->json(['errors' => [$e->getMessage()]], 422);
            return 'Something is wrong!';
        }

    }
    public function purchaselimsProductSearch($request)
    {
        $product_code = explode("|", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $lims_product_data = Product::where([
            ['product_code', $product_code[0]],
            ['is_active', true]
        ])
            ->whereNull('is_variant')
            ->first();
        if (!$lims_product_data) {
            $lims_product_data = Product::where([
                ['name', $product_code[1]],
                ['is_active', true]
            ])
                ->whereNotNull(['is_variant'])
                ->first();
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->where([
                    ['product_variants.item_code', $product_code[0]],
                    ['products.is_active', true]
                ])
                ->whereNotNull('is_variant')
                ->select('products.*', 'product_variants.item_code', 'product_variants.additional_cost')
                ->first();
            $lims_product_data->cost += $lims_product_data->additional_cost;
        }
        $product[] = $lims_product_data->name;
        if ($lims_product_data->is_variant)
            $product[] = $lims_product_data->item_code;
        else
            $product[] = $lims_product_data->code;
        $product[] = $lims_product_data->cost;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;

        $units = Unit::where("base_unit", $lims_product_data->unit_id)
            ->orWhere('id', $lims_product_data->unit_id)
            ->get();
        $unit_code = array();
        $unit_operator = array();
        $unit_operation_value = array();
        foreach ($units as $unit) {
            if ($lims_product_data->purchase_unit_id == $unit->id) {
                array_unshift($unit_code, $unit->unit_code);
                array_unshift($unit_operator, $unit->operator);
                array_unshift($unit_operation_value, $unit->operation_value);
            } else {
                $unit_code[] = $unit->unit_code;
                $unit_operator[] = $unit->operator;
                $unit_operation_value[] = $unit->operation_value;
            }
        }

        $product[] = implode(",", $unit_code) . ',';
        $product[] = implode(",", $unit_operator) . ',';
        $product[] = implode(",", $unit_operation_value) . ',';
        $product[] = $lims_product_data->id;
        $product[] = $lims_product_data->is_batch;
        $product[] = $lims_product_data->is_imei;
        return $product;
    }

    public function purchaseupdate($request, $id)
    {
        $data = $request->except('name');
        $document = $request->document;
        // return dd($data);
        $balance = $data['grand_total'] - $data['paid_amount'];
        if ($balance < 0 || $balance > 0) {
            $data['payment_status'] = 1;
        } else {
            $data['payment_status'] = 2;
        }
        $lims_purchase_data = Purchase::find($id);
        $lims_product_purchase_data = ProductPurchase::where('purchase_id', $id)->get();

        $data['created_at'] = date("Y-m-d", strtotime(str_replace("/", "-", $data['created_at'])));

        // $data['expired_date'] = date("Y-m-d", strtotime($data['expired_date']));
        // return dd( $data['expired_date']);

        $product_id = $data['product_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $recieved = $data['recieved'];
        $batch_no = $data['batch_no'];
        $expired_date = $data['expired_date'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $imei_number = $new_imei_number = $data['imei_number'];
        $product_purchase = [];

        foreach ($lims_product_purchase_data as $product_purchase_data) {
            $old_recieved_value = $product_purchase_data->recieved;

            $lims_purchase_unit_data = Unit::find($product_purchase_data->purchase_unit_id);
            if ($lims_purchase_unit_data->operator == '*') {
                $old_recieved_value = ($old_recieved_value * $lims_purchase_unit_data->operation_value);
            } else {
                $old_recieved_value = ($old_recieved_value / $lims_purchase_unit_data->operation_value);
            }
            $lims_product_data = Product::find($product_purchase_data->product_id);
            // print_r($lims_purchase_unit_data);
            if ($lims_product_data->is_variant) {
                $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProduct($lims_product_data->id, $product_purchase_data->variant_id)->first();
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $lims_product_data->id],
                    ['variant_id', $product_purchase_data->variant_id],
                    ['warehouse_id', $lims_purchase_data->warehouse_id]
                ])->first();
                $lims_product_variant_data->qty -= $old_recieved_value;
                $lims_product_variant_data->save();
            } elseif ($product_purchase_data->product_batch_id) {
                $product_batch_data = ProductBatch::find($product_purchase_data->product_batch_id);
                $product_batch_data->qty -= $old_recieved_value;
                $product_batch_data->save();

                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $product_purchase_data->product_id],
                    ['product_batch_id', $product_purchase_data->product_batch_id],
                    ['warehouse_id', $lims_purchase_data->warehouse_id],
                ])->first();
            } else {
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $product_purchase_data->product_id],
                    ['warehouse_id', $lims_purchase_data->warehouse_id],
                ])->first();
            }
            if ($product_purchase_data->imei_number) {
                $position = array_search($lims_product_data->id, $product_id);
                if ($imei_number[$position]) {
                    $prev_imei_numbers = explode(",", $product_purchase_data->imei_number);
                    $new_imei_numbers = explode(",", $imei_number[$position]);
                    foreach ($prev_imei_numbers as $prev_imei_number) {
                        if (($pos = array_search($prev_imei_number, $new_imei_numbers)) !== false) {
                            unset($new_imei_numbers[$pos]);
                        }
                    }
                    $new_imei_number[$position] = implode(",", $new_imei_numbers);
                }
            }
            $lims_product_data->qty -= $old_recieved_value;
            $lims_product_warehouse_data->qty -= $old_recieved_value;
            $lims_product_warehouse_data->save();
            $lims_product_data->save();
            $product_purchase_data->delete();
        }

        // die();

        foreach ($product_id as $key => $pro_id) {
            $lims_purchase_unit_data = Unit::where('unit_code', $purchase_unit[$key])->first();
            if ($lims_purchase_unit_data->operator == '*') {
                $new_recieved_value = $recieved[$key] * $lims_purchase_unit_data->operation_value;
            } else {
                $new_recieved_value = $recieved[$key] / $lims_purchase_unit_data->operation_value;
            }
            $lims_product_data = Product::find($pro_id);

            // print_r($lims_product_data);

            //dealing with product barch

            if ($batch_no[$key]) {
                $product_batch_data = ProductBatch::where([
                    ['product_id', $lims_product_data->id],
                    ['batch_no', $batch_no[$key]]
                ])->first();
                if ($product_batch_data) {
                    $product_batch_data->qty += $new_recieved_value;
                    $product_batch_data->expired_date = $expired_date[$key];
                    $product_batch_data->save();
                } else {
                    $product_batch_data = ProductBatch::create([
                        'product_id' => $lims_product_data->id,
                        'batch_no' => $batch_no[$key],
                        'expired_date' => $expired_date[$key],
                        'qty' => $new_recieved_value
                    ]);
                }
                $product_purchase['product_batch_id'] = $product_batch_data->id;
            } else
                $product_purchase['product_batch_id'] = null;

            if ($lims_product_data->is_variant) {
                $lims_product_variant_data = ProductVariant::select('*')->FindExactProductWithCode($pro_id, $product_code[$key])->first();
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $pro_id],
                    ['variant_id', $lims_product_variant_data->variant_id],
                    ['warehouse_id', $data['warehouse_id']]
                ])->first();
                $product_purchase['variant_id'] = $lims_product_variant_data->variant_id;
                //add quantity to product variant table
                $lims_product_variant_data->qty += $new_recieved_value;
                $lims_product_variant_data->save();
            } else {
                $product_purchase['variant_id'] = null;
                if ($product_purchase['product_batch_id']) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $pro_id],
                        ['product_batch_id', $product_purchase['product_batch_id']],
                        ['warehouse_id', $data['warehouse_id']],
                    ])->first();
                } else {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $pro_id],
                        ['warehouse_id', $data['warehouse_id']],
                    ])->first();
                }
            }
            $qty = $data['qty'];
            $recievedNumber = $data['recieved'];
            print_r($recievedNumber[0]);
            $lims_product_data->qty += $new_recieved_value;
            if ($lims_product_warehouse_data) {
                // $lims_product_warehouse_data->qty =  $qty['0'];
                $lims_product_warehouse_data->qty += $new_recieved_value; // Old qurery
                $lims_product_warehouse_data->save();
            } else {
                $lims_product_warehouse_data = new ProductWarehouse();
                $lims_product_warehouse_data->product_id = $pro_id;
                $lims_product_warehouse_data->product_batch_id = $product_purchase['product_batch_id'];
                if ($lims_product_data->is_variant) {
                    $lims_product_warehouse_data->variant_id = $lims_product_variant_data->variant_id;
                }
                $lims_product_warehouse_data->warehouse_id = $data['warehouse_id'];
                // $lims_product_warehouse_data->qty = $qty['0'];
                $lims_product_warehouse_data->qty = $new_recieved_value;
            }
            //dealing with imei numbers
            if ($imei_number[$key]) {
                if ($lims_product_warehouse_data->imei_number) {
                    $lims_product_warehouse_data->imei_number .= ',' . $new_imei_number[$key];
                } else {
                    $lims_product_warehouse_data->imei_number = $new_imei_number[$key];
                }
            }

            $lims_product_data->save();
            $lims_product_warehouse_data->save();

            $product_purchase['purchase_id'] = $request->id;
            $product_purchase['product_id'] = $pro_id;
            $product_purchase['qty'] = $qty[$key];
            $product_purchase['recieved'] = $recieved[$key]; //$recievedNumber['0'];
            $product_purchase['purchase_unit_id'] = $lims_purchase_unit_data->id;
            $product_purchase['net_unit_cost'] = $net_unit_cost[$key];
            $product_purchase['discount'] = $discount[$key];
            $product_purchase['tax_rate'] = $tax_rate[$key];
            $product_purchase['tax'] = $tax[$key];
            $product_purchase['total'] = $total[$key];
            $product_purchase['imei_number'] = $imei_number[$key];
            ProductPurchase::create($product_purchase);
        }


        // die();
        $lims_purchase_data->update($data);
        return redirect('superAdmin/purchase')->with('message', 'Purchase updated successfully');

    }

    public function purchaseGetPayment($id)
    {
        $lims_payment_list = Payment::where('purchase_id', $id)->get();
        $date = [];
        $payment_reference = [];
        $paid_amount = [];
        $paying_method = [];
        $payment_id = [];
        $payment_note = [];
        $cheque_no = [];
        $change = [];
        $paying_amount = [];
        $account_name = [];
        $account_id = [];
        foreach ($lims_payment_list as $payment) {
            $date[] = date("Y-m-d", strtotime(str_replace("/", "-", $payment['created_at'])));
            $payment_reference[] = $payment->payment_reference;
            $paid_amount[] = $payment->amount;
            $change[] = $payment->change;
            $paying_method[] = $payment->paying_method;
            $paying_amount[] = $payment->amount + $payment->change;
            if ($payment->paying_method == 'Cheque') {
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $payment->id)->first();
                $cheque_no[] = $lims_payment_cheque_data->cheque_no;
            } else {
                $cheque_no[] = null;
            }
            $payment_id[] = $payment->id;
            $payment_note[] = $payment->payment_note;
            $lims_account_data = Account::find($payment->account_id);
            // print_r( $lims_account_data);
            $account_name[] = $lims_account_data->name;
            $account_id[] = $lims_account_data->id;
        }
        $payments[] = $date;
        $payments[] = $payment_reference;
        $payments[] = $paid_amount;
        $payments[] = $paying_method;
        $payments[] = $payment_id;
        $payments[] = $payment_note;
        $payments[] = $cheque_no;
        $payments[] = $change;
        $payments[] = $paying_amount;
        $payments[] = $account_name;
        $payments[] = $account_id;
        // return response()->json(['status' => "success"]);
        return $payments;
    }

    public function purchaseDeletePayment($request)
    {
        $lims_payment_data = Payment::find($request['id']);
        $lims_purchase_data = Purchase::where('id', $lims_payment_data->purchase_id)->first();
        $lims_purchase_data->paid_amount -= $lims_payment_data->amount;
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_purchase_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_purchase_data->payment_status = 2;
        $lims_purchase_data->save();

        if ($lims_payment_data->paying_method == 'Credit Card') {
            $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $request['id'])->first();
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            \Stripe\Refund::create(array(
                "charge" => $lims_payment_with_credit_card_data->charge_id,
            ));

            $lims_payment_with_credit_card_data->delete();
        } elseif ($lims_payment_data->paying_method == 'Cheque') {
            $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $request['id'])->first();
            $lims_payment_cheque_data->delete();
        }
        $lims_payment_data->delete();
        return redirect('superAdmin/purchase')->with('not_permitted', 'Payment deleted successfully');
    }

    public function updatePayment( $request)
    {
        $data = $request->all();
        $lims_payment_data = Payment::find($data['payment_id']);
        $lims_purchase_data = Purchase::find($lims_payment_data->purchase_id);
        //updating purchase table
        $amount_dif = $lims_payment_data->amount - $data['edit_amount'];
        $lims_purchase_data->paid_amount = $lims_purchase_data->paid_amount - $amount_dif;
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_purchase_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_purchase_data->payment_status = 2;
        $lims_purchase_data->save();

        //updating payment data
        $lims_payment_data->account_id = $data['account_id'];
        $lims_payment_data->amount = $data['edit_amount'];
        $lims_payment_data->change = $data['edit_paying_amount'] - $data['edit_amount'];
        $lims_payment_data->payment_note = $data['edit_payment_note'];
        if ($data['edit_paid_by_id'] == 1)
            $lims_payment_data->paying_method = 'Cash';
        elseif ($data['edit_paid_by_id'] == 2)
            $lims_payment_data->paying_method = 'Gift Card';
        elseif ($data['edit_paid_by_id'] == 3) {
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            $token = $data['stripeToken'];
            $amount = $data['edit_amount'];
            if ($lims_payment_data->paying_method == 'Credit Card') {
                $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $lims_payment_data->id)->first();

                \Stripe\Refund::create(array(
                    "charge" => $lims_payment_with_credit_card_data->charge_id,
                ));

                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'source' => $token,
                ]);

                $lims_payment_with_credit_card_data->charge_id = $charge->id;
                $lims_payment_with_credit_card_data->save();
            } else {
                // Charge the Customer
                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'source' => $token,
                ]);

                $data['charge_id'] = $charge->id;
                PaymentWithCreditCard::create($data);
            }
            $lims_payment_data->paying_method = 'Credit Card';
        } else {
            if ($lims_payment_data->paying_method == 'Cheque') {
                $lims_payment_data->paying_method = 'Cheque';
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $data['payment_id'])->first();
                $lims_payment_cheque_data->cheque_no = $data['edit_cheque_no'];
                $lims_payment_cheque_data->save();
            } else {
                $lims_payment_data->paying_method = 'Cheque';
                $data['cheque_no'] = $data['edit_cheque_no'];
                PaymentWithCheque::create($data);
            }
        }

        $lims_payment_data->save();
        return redirect('superAdmin/purchase')->with('message', 'Payment updated successfully');
    }

    public function deletePayment( $request)
    {
        $lims_payment_data = Payment::find($request['id']);
        $lims_purchase_data = Purchase::where('id', $lims_payment_data->purchase_id)->first();
        $lims_purchase_data->paid_amount -= $lims_payment_data->amount;
        $balance = $lims_purchase_data->grand_total - $lims_purchase_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_purchase_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_purchase_data->payment_status = 2;
        $lims_purchase_data->save();

        if ($lims_payment_data->paying_method == 'Credit Card') {
            $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $request['id'])->first();
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            \Stripe\Refund::create(array(
                "charge" => $lims_payment_with_credit_card_data->charge_id,
            ));

            $lims_payment_with_credit_card_data->delete();
        } elseif ($lims_payment_data->paying_method == 'Cheque') {
            $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $request['id'])->first();
            $lims_payment_cheque_data->delete();
        }
        $lims_payment_data->delete();
        return redirect('superAdmin/purchase')->with('not_permitted', 'Payment deleted successfully');
    }

    public function purchasedestroy($id)
    {
        $lims_purchase_data = Purchase::find($id);
        $lims_product_purchase_data = ProductPurchase::where('purchase_id', $id)->get();
        $lims_payment_data = Payment::where('purchase_id', $id)->get();
        foreach ($lims_product_purchase_data as $product_purchase_data) {
            $lims_purchase_unit_data = Unit::find($product_purchase_data->purchase_unit_id);
            if ($lims_purchase_unit_data->operator == '*')
                $recieved_qty = $product_purchase_data->recieved * $lims_purchase_unit_data->operation_value;
            else
                $recieved_qty = $product_purchase_data->recieved / $lims_purchase_unit_data->operation_value;

            $lims_product_data = Product::find($product_purchase_data->product_id);
            if ($product_purchase_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($lims_product_data->id, $product_purchase_data->variant_id)->first();
                $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_purchase_data->product_id, $product_purchase_data->variant_id, $lims_purchase_data->warehouse_id)
                    ->first();
                $lims_product_variant_data->qty -= $recieved_qty;
                $lims_product_variant_data->save();
            } elseif ($product_purchase_data->product_batch_id) {
                $lims_product_batch_data = ProductBatch::find($product_purchase_data->product_batch_id);
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_batch_id', $product_purchase_data->product_batch_id],
                    ['warehouse_id', $lims_purchase_data->warehouse_id]
                ])->first();

                $lims_product_batch_data->qty -= $recieved_qty;
                $lims_product_batch_data->save();
            } else {
                $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_purchase_data->product_id, $lims_purchase_data->warehouse_id)
                    ->first();
            }
            //deduct imei number if available
            if ($product_purchase_data->imei_number) {
                $imei_numbers = explode(",", $product_purchase_data->imei_number);
                $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                foreach ($imei_numbers as $number) {
                    if (($j = array_search($number, $all_imei_numbers)) !== false) {
                        unset($all_imei_numbers[$j]);
                    }
                }
                $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
            }

            $lims_product_data->qty -= $recieved_qty;
            $lims_product_warehouse_data->qty -= $recieved_qty;

            $lims_product_warehouse_data->save();
            $lims_product_data->save();
            $product_purchase_data->delete();
        }
        foreach ($lims_payment_data as $payment_data) {
            if ($payment_data->paying_method == "Cheque") {
                $payment_with_cheque_data = PaymentWithCheque::where('payment_id', $payment_data->id)->first();
                $payment_with_cheque_data->delete();
            } elseif ($payment_data->paying_method == "Credit Card") {
                $payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $payment_data->id)->first();
                $lims_pos_setting_data = PosSetting::latest()->first();
                \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
                \Stripe\Refund::create(array(
                    "charge" => $payment_with_credit_card_data->charge_id,
                ));

                $payment_with_credit_card_data->delete();
            }
            $payment_data->delete();
        }
        $lims_purchase_data->delete();
        return response()->json(['status' => "success"]);



    }

    // ========================Return Purchase===================
    public function returnPurchaseIndex($request)
    {
        if ($request->ajax()) {
            $purchase = ReturnPurchase::latest()->get();
            $purchaseReturns = ReturnPurchase::latest()->get();
            if ($request->filled('from_date') && $request->filled('to_date')) {
                $purchase = $purchaseReturns->whereBetween('created_at', [$request->from_date, $request->to_date]);
            }
            // custom field search
            $customPurchagseReturns = ReturnPurchase::select('*');
            if ($request->filled('warehouse_id')) {
                $purchase = $customPurchagseReturns->where('warehouse_id', $request->warehouse_id);
            }
            if ($request->filled('reference_no')) {
                $purchase = $customPurchagseReturns->where('reference_no', 'like', '%' . $request->reference_no . '%');
            }
            return Datatables::of($purchase)
                ->addIndexColumn()
                ->addColumn('date', function ($row) {
                    $date = date("Y-m-d", strtotime($row->created_at));
                    return $date;
                })
                ->addColumn('purchase_reference', function ($row) {
                    if ($row->purchase_id) {
                        $purchase_data = Purchase::select('reference_no')->find($row->purchase_id);
                        $purchase_reference = $purchase_data->reference_no;
                        return $purchase_reference;
                    } else {
                        return 'N/A';
                    }
                })

                ->addColumn('supplier', function ($row) {

                    if ($row->supplier) {
                        $supplier = $row->supplier;
                        $supplier = $row->supplier->name;
                        return $supplier;
                    } else {
                        return "Null";
                    }

                })
                ->addColumn('groundTotal', function ($row) {
                    $ground = number_format($row->grand_total, 2);
                    return ($ground);
                })


                ->addColumn('warehouse', function ($row) {
                    $warehouse = $row->warehouse->name;
                    return $warehouse;

                })



                ->addColumn('purchase_status', function ($row) {
                    if ($row->purchase_status == 1) {
                        return '<div class="badge badge-success">' . trans('Recieved') . '</div>';
                    } elseif ($row->purchase_status == 2) {
                        return '<div class="badge badge-success">' . trans('Partial') . '</div>';
                    } elseif ($row->purchase_status == 3) {
                        return '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                    } else {
                        return '<div class="badge badge-danger">' . trans('Ordered') . '</div>';
                    }
                })

                ->addColumn('name', function ($row) {
                    $products = DB::table('purchases')
                        ->join('product_purchases', 'product_purchases.purchase_id', '=', 'purchases.id')
                        ->join('products', 'product_purchases.product_id', '=', 'products.id')
                        ->select('products.product_name')
                        ->where('product_purchases.purchase_id', $row->id)
                        ->get();
                    foreach ($products as $product) {
                        return $product->product_name;
                    }
                    //     if ($row->is_variant) {
                    //         $product_variant_data = \App\Models\ProductVariant::FindExactProduct('id', $row->is_variant)
                    //                                 ->select('item_code')
                    //                                 ->first();
                    //                                 $row->product_code = $product_variant_data->item_code;
                    //                             }
                    // return $product_variant_data ;
                })

                ->addColumn('returned_amount', function ($row) {
                    $returned_amount = DB::table('return_purchases')->where('purchase_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    return $returned_amount;
                })

                ->addColumn('due', function ($row) {
                    $returned_amount = DB::table('return_purchases')->where('purchase_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    $dueamount = number_format($row->grand_total - $returned_amount - $row->paid_amount, 2);
                    return $dueamount;
                })

                ->addColumn('payment_status', function ($row) {
                    if ($row->payment_status == 1)
                        return '<div class="badge badge-danger">' . trans('Due') . '</div>';
                    else
                        return '<div class="badge badge-success">' . trans('Paid') . '</div>';
                })

                ->addColumn('date', function ($row) {
                    $date = date('d-M-Y', strtotime($row->created_at));
                    return $date;
                })

                ->addColumn('action', function ($row) {
                    if ($row->supplier_id) {
                        $supplier = $row->supplier;
                    } else {
                        $supplier = new Supplier();
                    }
                    if ($row->user_id) {

                        $user = $row->supplier;
                    } else {
                        $user = new User();
                    }
                    if ($row->purchase_status == 1) {
                        $purchase_status = '<strong>' . trans('Recieved') . '</strong>';
                    } elseif ($row->purchase_status == 2) {
                        $purchase_status = '<strong>' . trans('Partial') . '</strong>';
                    } elseif ($row->purchase_status == 3) {
                        $purchase_status = '<strong>' . trans('Pending') . '</strong>';
                    } else {
                        $purchase_status = '<strong>' . trans('Ordered') . '</strong>';
                    }
                    if ($row->purchase_id) {
                        $purchase_data = Purchase::select('reference_no')->find($row->purchase_id);
                        $purchase_reference = $purchase_data->reference_no;

                    }
                    // Update Button
                    $viewButton =
                        '<a href="javascript:void(0)" style="box-shadow:none;" class="btn btn-link view"
                                data-id = "' . $row->id . '"
                                data-date = "' . date('d-m-Y', strtotime($row->created_at)) . '"
                                data-reference_no = "' . $row->reference_no . '"
                                data-purchase_reference = "' . $purchase_reference . '"

                                data-total_discount = "' . $row->total_discount . '"
                                data-purchase_status = "' . $purchase_status . '"
                                data-warehouse_name = "' . $row->warehouse->name . '"
                                data-warehouse_phone = "' . $row->warehouse->phone . '"
                                data-warehouse_address = "' . $row->warehouse->address . '"
                                data-supplier_name = "' . $supplier->name . '"
                                data-company_name = "' . $supplier->company_name . '"
                                data-supplier_phone_number = "' . $supplier->phone_number . '"
                                data-supplier_email = "' . $supplier->email . '"
                                data-supplier_address = "' . $supplier->address . '"

                                data-order_tax = "' . $row->order_tax . '"
                                data-total_cost = "' . $row->total_cost . '"
                                data-total_tax = "' . $row->total_tax . '"
                                data-grand_total = "' . $row->grand_total . '"

                                data-return_note = "' . $row->return_note . '"
                                data-staff_note = "' . $row->staff_note . '"

                                data-user_name = "' . $user->name . '"
                                data-user_email = "' . $user->email . '"

                                ><i class="fa fa-eye"></i> ' . trans('View') . '</a>';

                    $updateButton = '<a href="' . route('superAdmin.return-purchase.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i> ' . trans('Edit') . '</a>';


                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-link  deletereturnpurchase"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';

                    $nasted = '<div class="btn-group">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                        <li>' . $updateButton . '</li>

                                        <li>' . $viewButton . '</li>

                                        <li>' . $deleteButton . '</li>
                                    </ul>
                                </div>';

                    // return $nasted ;

                    return $updateButton . " " . $deleteButton . "" . $viewButton;
                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }
        // dd("kk");
        if ($request->input('warehouse_id'))
            $warehouse_id = $request->input('warehouse_id');
        else
            $warehouse_id = 0;

        if ($request->input('starting_date')) {
            $starting_date = $request->input('starting_date');
            $ending_date = $request->input('ending_date');
        } else {
            $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d'))))));
            $ending_date = date("Y-m-d");
        }

        $lims_warehouse_list = Warehouse::where('is_active', true)->get();

        return view('superadmin.return_purchase.index', compact('starting_date', 'ending_date', 'warehouse_id', 'lims_warehouse_list'));

    }
    public function returnPurchaseReturnData($request)
    {
        $columns = array(
            1 => 'created_at',
            2 => 'reference_no',
        );

        $warehouse_id = $request->input('warehouse_id');

        if (Auth::user()->role_id > 2 && config('staff_access') == 'own')
            $totalData = ReturnPurchase::where('user_id', Auth::id())
                ->whereDate('created_at', '>=', $request->input('starting_date'))
                ->whereDate('created_at', '<=', $request->input('ending_date'))
                ->count();
        elseif ($warehouse_id != 0)
            $totalData = ReturnPurchase::where('warehouse_id', $warehouse_id)
                ->whereDate('created_at', '>=', $request->input('starting_date'))
                ->whereDate('created_at', '<=', $request->input('ending_date'))
                ->count();
        else
            $totalData = ReturnPurchase::whereDate('created_at', '>=', $request->input('starting_date'))
                ->whereDate('created_at', '<=', $request->input('ending_date'))
                ->count();

        $totalFiltered = $totalData;
        if ($request->input('length') != -1)
            $limit = $request->input('length');
        else
            $limit = $totalData;
        $start = $request->input('start');
        $order = 'return_purchases.' . $columns[$request->input('order.0.column')];
        $dir = $request->input('order.0.dir');
        if (empty($request->input('search.value'))) {
            $q = ReturnPurchase::with('supplier', 'warehouse', 'user')
                ->whereDate('created_at', '>=', $request->input('starting_date'))
                ->whereDate('created_at', '<=', $request->input('ending_date'))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir);
            if (Auth::user()->role_id > 2 && config('staff_access') == 'own')
                $q = $q->where('user_id', Auth::id());
            elseif ($warehouse_id != 0)
                $q = $q->where('warehouse_id', $warehouse_id);
            $returnss = $q->get();
        } else {
            $search = $request->input('search.value');
            $q = ReturnPurchase::leftJoin('suppliers', 'return_purchases.supplier_id', '=', 'suppliers.id')
                ->whereDate('return_purchases.created_at', '=', date('Y-m-d', strtotime(str_replace('/', '-', $search))))
                ->offset($start)
                ->limit($limit)
                ->orderBy($order, $dir);
            if (Auth::user()->role_id > 2 && config('staff_access') == 'own') {
                $returnss = $q->select('return_purchases.*')
                    ->with('supplier', 'warehouse', 'user')
                    ->where('return_purchases.user_id', Auth::id())
                    ->orwhere([
                        ['return_purchases.reference_no', 'LIKE', "%{$search}%"],
                        ['return_purchases.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['suppliers.name', 'LIKE', "%{$search}%"],
                        ['return_purchases.user_id', Auth::id()]
                    ])
                    ->get();

                $totalFiltered = $q->where('return_purchases.user_id', Auth::id())
                    ->orwhere([
                        ['return_purchases.reference_no', 'LIKE', "%{$search}%"],
                        ['return_purchases.user_id', Auth::id()]
                    ])
                    ->orwhere([
                        ['suppliers.name', 'LIKE', "%{$search}%"],
                        ['return_purchases.user_id', Auth::id()]
                    ])
                    ->count();
            } else {
                $returnss = $q->select('return_purchases.*')
                    ->with('supplier', 'warehouse', 'user')
                    ->orwhere('return_purchases.reference_no', 'LIKE', "%{$search}%")
                    ->orwhere('suppliers.name', 'LIKE', "%{$search}%")
                    ->get();

                $totalFiltered = $q->orwhere('return_purchases.reference_no', 'LIKE', "%{$search}%")
                    ->orwhere('suppliers.name', 'LIKE', "%{$search}%")
                    ->count();
            }
        }
        $data = array();
        if (!empty($returnss)) {
            foreach ($returnss as $key => $returns) {
                $nestedData['id'] = $returns->id;
                $nestedData['key'] = $key;
                $nestedData['date'] = date(config('date_format'), strtotime($returns->created_at->toDateString()));
                $nestedData['reference_no'] = $returns->reference_no;
                $nestedData['warehouse'] = $returns->warehouse->name;
                if ($returns->purchase_id) {
                    $purchase_data = Purchase::select('reference_no')->find($returns->purchase_id);
                    $nestedData['purchase_reference'] = $purchase_data->reference_no;
                } else
                    $nestedData['purchase_reference'] = 'N/A';
                if ($returns->supplier) {
                    $supplier = $returns->supplier;
                    $nestedData['supplier'] = $returns->supplier->name;
                } else {
                    $supplier = new Supplier;
                    $nestedData['supplier'] = 'N/A';
                }
                $nestedData['grand_total'] = number_format($returns->grand_total, 2);
                $nestedData['options'] = '<div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' . trans("action") . '
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" class="btn btn-link view"><i class="fa fa-eye"></i> ' . trans('View') . '</button>
                                </li>';
                if (in_array("returns-edit", $request['all_permission'])) {
                    $nestedData['options'] .= '<li>
                        <a href="' . route('return-purchase.edit', $returns->id) . '" class="btn btn-link"><i class="dripicons-document-edit"></i> ' . trans('edit') . '</a>
                        </li>';
                }
                '</ul>
                    </div>';
                // data for purchase details by one click

                $nestedData['return'] = array(
                    '[ "' . date(config('date_format'), strtotime($returns->created_at->toDateString())) . '"',
                    ' "' . $returns->reference_no . '"',
                    ' "' . $returns->warehouse->name . '"',
                    ' "' . $returns->warehouse->phone . '"',
                    ' "' . $returns->warehouse->address . '"',
                    ' "' . $supplier->name . '"',
                    ' "' . $supplier->company_name . '"',
                    ' "' . $supplier->email . '"',
                    ' "' . $supplier->phone_number . '"',
                    ' "' . $supplier->address . '"',
                    ' "' . $supplier->city . '"',
                    ' "' . $returns->id . '"',
                    ' "' . $returns->total_tax . '"',
                    ' "' . $returns->total_discount . '"',
                    ' "' . $returns->total_cost . '"',
                    ' "' . $returns->order_tax . '"',
                    ' "' . $returns->order_tax_rate . '"',
                    ' "' . $returns->grand_total . '"',
                    ' "' . preg_replace('/[\n\r]/', "<br>", $returns->return_note) . '"',
                    ' "' . preg_replace('/[\n\r]/', "<br>", $returns->staff_note) . '"',
                    ' "' . $returns->user->name . '"',
                    ' "' . $returns->user->email . '"',
                    ' "' . $nestedData['purchase_reference'] . '"]'
                );
                $data[] = $nestedData;
            }
        }
        $json_data = array(
            "draw" => intval($request->input('draw')),
            "recordsTotal" => intval($totalData),
            "recordsFiltered" => intval($totalFiltered),
            "data" => $data
        );

        echo json_encode($json_data);
    }
    public function returnPurchaseCreate($request)
    {

        $lims_purchase_data = Purchase::select('id')->where('reference_no', $request->input('reference_no'))->first();

        // return  $lims_purchase_data;
        $lims_product_purchase_data = ProductPurchase::where('purchase_id', $lims_purchase_data->id)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_account_list = Account::where('is_active', true)->get();
        return view('superadmin.return_purchase.create', compact('lims_warehouse_list', 'lims_tax_list', 'lims_account_list', 'lims_purchase_data', 'lims_product_purchase_data'));

    }
    public function returnPurchaseStore($request)
    {
        $data = $request->except('document');
        //return dd($data);
        $data['reference_no'] = 'prr-' . date("Ymd") . '-' . date("his");
        $data['user_id'] = Auth::id();
        $lims_purchase_data = Purchase::select('warehouse_id', 'supplier_id')->find($data['purchase_id']);
        $data['user_id'] = Auth::id();
        $data['supplier_id'] = $lims_purchase_data->supplier_id;
        $data['warehouse_id'] = $lims_purchase_data->warehouse_id;
        $document = $request->document;
        // if ($document) {
        //     $v = Validator::make(
        //         [
        //             'extension' => strtolower($request->document->getClientOriginalExtension()),
        //         ],
        //         [
        //             'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
        //         ]
        //     );
        //     if ($v->fails())
        //         return redirect()->back()->withErrors($v->errors());

        //     $documentName = $document->getClientOriginalName();
        //     $document->move('public/return/documents', $documentName);
        //     $data['document'] = $documentName;
        // }

        $lims_return_data = ReturnPurchase::create($data);
        $mail_data['email'] = '';
        if ($data['supplier_id']) {
            $lims_supplier_data = Supplier::find($data['supplier_id']);
            //collecting male data
            $mail_data['email'] = $lims_supplier_data->email;
            $mail_data['reference_no'] = $lims_return_data->reference_no;
            $mail_data['total_qty'] = $lims_return_data->total_qty;
            $mail_data['total_price'] = $lims_return_data->total_price;
            $mail_data['order_tax'] = $lims_return_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
            $mail_data['grand_total'] = $lims_return_data->grand_total;
        }

        $product_id = $data['is_return'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];

        foreach ($product_id as $pro_id) {
            $key = array_search($pro_id, $data['product_id']);
            //return $key;
            $lims_product_data = Product::find($pro_id);
            $variant_id = null;
            if ($purchase_unit[$key] != 'n/a') {
                $lims_purchase_unit_data = Unit::where('unit_code', $purchase_unit[$key])->first();
                $purchase_unit_id = $lims_purchase_unit_data->id;
                if ($lims_purchase_unit_data->operator == '*')
                    $quantity = $qty[$key] * $lims_purchase_unit_data->operation_value;
                elseif ($lims_purchase_unit_data->operator == '/')
                    $quantity = $qty[$key] / $lims_purchase_unit_data->operation_value;

                if ($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::
                        select('id', 'variant_id', 'qty')
                        ->FindExactProductWithCode($pro_id, $product_code[$key])
                        ->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])->first();
                    $lims_product_variant_data->qty -= $quantity;
                    $lims_product_variant_data->save();
                    $variant_data = Variant::find($lims_product_variant_data->variant_id);
                    $variant_id = $variant_data->id;
                } elseif ($product_batch_id[$key]) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_batch_id[$key]],
                        ['warehouse_id', $data['warehouse_id']]
                    ])->first();
                    $lims_product_batch_data = ProductBatch::find($product_batch_id[$key]);
                    //increase product batch quantity
                    $lims_product_batch_data->qty -= $quantity;
                    $lims_product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])->first();

                $lims_product_data->qty -= $quantity;
                $lims_product_warehouse_data->qty -= $quantity;

                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            } else {
                if ($lims_product_data->type == 'combo') {
                    $product_list = explode(",", $lims_product_data->product_list);
                    $variant_list = explode(",", $lims_product_data->variant_list);
                    $qty_list = explode(",", $lims_product_data->qty_list);
                    $price_list = explode(",", $lims_product_data->price_list);

                    foreach ($product_list as $index => $child_id) {
                        $child_data = Product::find($child_id);
                        if ($variant_list[$index]) {
                            $child_product_variant_data = ProductVariant::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$index]]
                            ])->first();

                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['variant_id', $variant_list[$index]],
                                ['warehouse_id', $data['warehouse_id']],
                            ])->first();

                            $child_product_variant_data->qty += $qty[$key] * $qty_list[$index];
                            $child_product_variant_data->save();
                        } else {
                            $child_warehouse_data = ProductWarehouse::where([
                                ['product_id', $child_id],
                                ['warehouse_id', $data['warehouse_id']],
                            ])->first();
                        }

                        $child_data->qty -= $qty[$key] * $qty_list[$index];
                        $child_warehouse_data->qty -= $qty[$key] * $qty_list[$index];

                        $child_data->save();
                        $child_warehouse_data->save();
                    }
                }
                $purchase_unit_id = 0;
            }
            //add imei number if available
            if ($imei_number[$key]) {
                if ($lims_product_warehouse_data->imei_number)
                    $lims_product_warehouse_data->imei_number .= ',' . $imei_number[$key];
                else
                    $lims_product_warehouse_data->imei_number = $imei_number[$key];
                $lims_product_warehouse_data->save();
            }
            if ($lims_product_data->is_variant)
                $mail_data['products'][$key] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
            else
                $mail_data['products'][$key] = $lims_product_data->product_name;

            if ($purchase_unit_id)
                $mail_data['unit'][$key] = $lims_purchase_unit_data->unit_code;
            else
                $mail_data['unit'][$key] = '';

            $mail_data['qty'][$key] = $qty[$key];
            $mail_data['total'][$key] = $total[$key];
            PurchaseProductReturn::insert(
                ['return_id' => $lims_return_data->id, 'product_id' => $pro_id, 'product_batch_id' => $product_batch_id[$key], 'variant_id' => $variant_id, 'imei_number' => $imei_number[$key], 'qty' => $qty[$key], 'purchase_unit_id' => $purchase_unit_id, 'net_unit_cost' => $net_unit_cost[$key], 'discount' => $discount[$key], 'tax_rate' => $tax_rate[$key], 'tax' => $tax[$key], 'total' => $total[$key], 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]
            );
        }
        $message = 'Return created successfully';
        if ($mail_data['email']) {
            try {
                Mail::send('mail.return_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Return Details');
                });
            } catch (\Exception $e) {
                $message = 'Return created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/return-purchase')->with('message', $message);
    }
    public function returnPurchaseEdit($id)
    {
        $lims_supplier_list = Supplier::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_account_list = Account::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_return_data = ReturnPurchase::find($id);
        $lims_product_return_data = PurchaseProductReturn::where('return_id', $id)->get();
        return view('superadmin.return_purchase.edit', compact('lims_supplier_list', 'lims_warehouse_list', 'lims_tax_list', 'lims_account_list', 'lims_return_data', 'lims_product_return_data'));

    }
    public function returnPurchaseUpdate($request, $id)
    {
        $data = $request->except('document');
        //return dd($data);
        $document = $request->document;
        // if ($document) {
        //     $v = Validator::make(
        //         [
        //             'extension' => strtolower($request->document->getClientOriginalExtension()),
        //         ],
        //         [
        //             'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
        //         ]
        //     );
        //     if ($v->fails())
        //         return redirect()->back()->withErrors($v->errors());

        //     $documentName = $document->getClientOriginalName();
        //     $document->move('public/return/documents', $documentName);
        //     $data['document'] = $documentName;
        // }

        $lims_return_data = ReturnPurchase::find($id);
        $lims_product_return_data = PurchaseProductReturn::where('return_id', $id)->get();

        $product_id = $data['product_id'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $product_variant_id = $data['product_variant_id'];
        $qty = $data['qty'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];

        foreach ($lims_product_return_data as $key => $product_return_data) {
            $old_product_id[] = $product_return_data->product_id;
            $old_product_variant_id[] = null;
            $lims_product_data = Product::find($product_return_data->product_id);
            if ($product_return_data->purchase_unit_id != 0) {
                $lims_purchase_unit_data = Unit::find($product_return_data->purchase_unit_id);
                if ($lims_purchase_unit_data->operator == '*')
                    $quantity = $product_return_data->qty * $lims_purchase_unit_data->operation_value;
                elseif ($lims_purchase_unit_data->operator == '/')
                    $quantity = $product_return_data->qty / $lims_purchase_unit_data->operation_value;

                if ($product_return_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_return_data->product_id, $product_return_data->variant_id, $lims_return_data->warehouse_id)
                        ->first();
                    $old_product_variant_id[$key] = $lims_product_variant_data->id;
                    $lims_product_variant_data->qty += $quantity;
                    $lims_product_variant_data->save();
                } elseif ($product_return_data->product_batch_id) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $product_return_data->product_id],
                        ['product_batch_id', $product_return_data->product_batch_id],
                        ['warehouse_id', $lims_return_data->warehouse_id]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_return_data->product_batch_id);
                    $product_batch_data->qty += $quantity;
                    $product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_return_data->product_id, $lims_return_data->warehouse_id)
                        ->first();

                if ($product_return_data->imei_number) {
                    if ($lims_product_warehouse_data->imei_number)
                        $lims_product_warehouse_data->imei_number .= ',' . $product_return_data->imei_number;
                    else
                        $lims_product_warehouse_data->imei_number = $product_return_data->imei_number;
                }

                $lims_product_data->qty += $quantity;
                $lims_product_warehouse_data->qty += $quantity;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            if ($product_return_data->variant_id && !(in_array($old_product_variant_id[$key], $product_variant_id))) {
                $product_return_data->delete();
            } elseif (!(in_array($old_product_id[$key], $product_id)))
                $product_return_data->delete();
        }
        foreach ($product_id as $key => $pro_id) {
            $lims_product_data = Product::find($pro_id);
            $product_return['variant_id'] = null;
            if ($purchase_unit[$key] != 'n/a') {
                $lims_purchase_unit_data = Unit::where('unit_code', $purchase_unit[$key])->first();
                $purchase_unit_id = $lims_purchase_unit_data->id;
                if ($lims_purchase_unit_data->operator == '*')
                    $quantity = $qty[$key] * $lims_purchase_unit_data->operation_value;
                elseif ($lims_purchase_unit_data->operator == '/')
                    $quantity = $qty[$key] / $lims_purchase_unit_data->operation_value;

                if ($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($pro_id, $product_code[$key])->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])
                        ->first();
                    // return $product_code[$key];
                    $variant_data = Variant::find($lims_product_variant_data->variant_id);

                    $product_return['variant_id'] = $lims_product_variant_data->variant_id;
                    $lims_product_variant_data->qty -= $quantity;
                    $lims_product_variant_data->save();
                } elseif ($product_batch_id[$key]) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $pro_id],
                        ['product_batch_id', $product_batch_id[$key]],
                        ['warehouse_id', $data['warehouse_id']]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_batch_id[$key]);
                    $product_batch_data->qty -= $quantity;
                    $product_batch_data->save();
                } else {
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])
                        ->first();
                }
                //deduct imei number if available
                if ($imei_number[$key]) {
                    $imei_numbers = explode(",", $imei_number[$key]);
                    $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                    foreach ($imei_numbers as $number) {
                        if (($j = array_search($number, $all_imei_numbers)) !== false) {
                            unset($all_imei_numbers[$j]);
                        }
                    }
                    $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                }

                $lims_product_data->qty -= $quantity;
                $lims_product_warehouse_data->qty -= $quantity;

                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }

            if ($lims_product_data->is_variant)
                $mail_data['products'][$key] = $lims_product_data->name . ' [' . $variant_data->name . ']';
            else
                $mail_data['products'][$key] = $lims_product_data->name;

            if ($purchase_unit_id)
                $mail_data['unit'][$key] = $lims_purchase_unit_data->unit_code;
            else
                $mail_data['unit'][$key] = '';

            $mail_data['qty'][$key] = $qty[$key];
            $mail_data['total'][$key] = $total[$key];

            $product_return['return_id'] = $id;
            $product_return['product_id'] = $pro_id;
            $product_return['imei_number'] = $imei_number[$key];
            $product_return['product_batch_id'] = $product_batch_id[$key];
            $product_return['qty'] = $qty[$key];
            $product_return['purchase_unit_id'] = $purchase_unit_id;
            $product_return['net_unit_cost'] = $net_unit_cost[$key];
            $product_return['discount'] = $discount[$key];
            $product_return['tax_rate'] = $tax_rate[$key];
            $product_return['tax'] = $tax[$key];
            $product_return['total'] = $total[$key];

            if ($product_return['variant_id'] && in_array($product_variant_id[$key], $old_product_variant_id)) {
                PurchaseProductReturn::where([
                    ['product_id', $pro_id],
                    ['variant_id', $product_return['variant_id']],
                    ['return_id', $id]
                ])->update($product_return);
            } elseif ($product_return['variant_id'] === null && (in_array($pro_id, $old_product_id))) {
                PurchaseProductReturn::where([
                    ['return_id', $id],
                    ['product_id', $pro_id]
                ])->update($product_return);
            } else
                PurchaseProductReturn::create($product_return);
        }
        $lims_return_data->update($data);
        $message = 'Return updated successfully';
        if ($data['supplier_id']) {
            $lims_supplier_data = Supplier::find($data['supplier_id']);
            //collecting male data
            $mail_data['email'] = $lims_supplier_data->email;
            $mail_data['reference_no'] = $lims_return_data->reference_no;
            $mail_data['total_qty'] = $lims_return_data->total_qty;
            $mail_data['total_price'] = $lims_return_data->total_cost;
            $mail_data['order_tax'] = $lims_return_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
            $mail_data['grand_total'] = $lims_return_data->grand_total;

            try {
                Mail::send('mail.return_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Return Details');
                });
            } catch (\Exception $e) {
                $message = 'Return updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }

        return redirect('superAdmin/return-purchase')->with('message', $message);
    }

    public function returnPurchaseGetproduct($id)
    {
        //retrieve data of product without variant
        $lims_product_warehouse_data = DB::table('products')

            ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->select('products.product_code', 'products.product_name', 'products.product_type', 'product_warehouses.qty')
            ->where([
                ['product_warehouses.warehouse_id', $id],
                ['products.is_active', true]
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNull('product_warehouses.product_batch_id')
            ->get();

        config()->set('database.connections.mysql.strict', false);
        \DB::reconnect(); //important as the existing connection if any would be in strict mode




        //retrieve data of product with batch
        $lims_product_with_batch_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNotNull('product_warehouses.product_batch_id')
            ->select('product_warehouses.*')
            ->groupBy('product_warehouses.product_id')
            ->get();

        //now changing back the strict ON
        config()->set('database.connections.mysql.strict', true);
        \DB::reconnect();

        //retrieve data of product with variant
        $lims_product_with_variant_warehouse_data = DB::table('products')
            ->join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->select('products.id', 'products.product_code', 'products.product_name', 'products.product_type', 'product_warehouses.qty', 'product_warehouses.variant_id')
            ->where([
                ['product_warehouses.warehouse_id', $id],
                ['products.is_active', true]
            ])
            ->whereNotNull('product_warehouses.variant_id')
            ->get();

        $product_code = [];
        $product_name = [];
        $product_qty = [];
        $is_batch = [];
        $product_data = [];
        foreach ($lims_product_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $product_code[] = $product_warehouse->product_code;
            $product_name[] = $product_warehouse->product_name;
            $product_type[] = $product_warehouse->product_type;
            $is_batch[] = null;
        }
        //product with batches
        foreach ($lims_product_with_batch_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::select('product_code', 'product_name', 'product_type', 'is_batch')->find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $product_batch_data = ProductBatch::select('id', 'batch_no')->find($product_warehouse->product_batch_id);
            $is_batch[] = $lims_product_data->is_batch;
        }

        foreach ($lims_product_with_variant_warehouse_data as $product_warehouse) {
            $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_warehouse->id, $product_warehouse->variant_id)->first();
            $product_qty[] = $product_warehouse->qty;
            $product_code[] = $lims_product_variant_data->item_code;
            $product_name[] = $product_warehouse->product_name;
            $product_type[] = $product_warehouse->product_type;
            $is_batch[] = null;
        }

        $product_data = [$product_code, $product_name, $product_qty, $product_type, $is_batch];
        return $product_data;
    }

    public function returnPurchaseCheckBatchAvailability($product_id, $batch_no, $warehouse_id)
    {
        $product_batch_data = ProductBatch::where([
            ['product_id', $product_id],
            ['batch_no', $batch_no]
        ])->first();
        if ($product_batch_data) {
            $product_warehouse_data = ProductWarehouse::select('qty')
                ->where([
                    ['product_batch_id', $product_batch_data->id],
                    ['warehouse_id', $warehouse_id]
                ])->first();
            if ($product_warehouse_data) {
                $data['qty'] = $product_warehouse_data->qty;
                $data['product_batch_id'] = $product_batch_data->id;
                $data['expired_date'] = date(config('date_format'), strtotime($product_batch_data->expired_date));
                $data['message'] = 'ok';
            } else {
                $data['qty'] = 0;
                $data['message'] = 'This Batch does not exist in the selected warehouse!';
            }
        } else {
            $data['message'] = 'Wrong Batch Number!';
        }
        return $data;
    }

    public function returnPurchaseProductSearch($request)
    {
        $product_code = explode("(", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $lims_product_data = Product::where('product_code', $product_code[0])->first();
        $product_variant_id = null;
        if (!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.id as product_variant_id', 'product_variants.item_code', 'product_variants.additional_cost')
                ->where('product_variants.item_code', $product_code[0])
                ->first();
            $lims_product_data->product_code = $lims_product_data->item_code;
            $lims_product_data->product_cost += $lims_product_data->additional_cost;
            $product_variant_id = $lims_product_data->product_variant_id;
        }

        $product[] = $lims_product_data->product_name;
        $product[] = $lims_product_data->product_code;
        $product[] = $lims_product_data->product_cost;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;

        $units = Unit::where("base_unit", $lims_product_data->unit_id)
            ->orWhere('id', $lims_product_data->unit_id)
            ->get();

        $unit_code = array();
        $unit_operator = array();
        $unit_operation_value = array();
        foreach ($units as $unit) {
            if ($lims_product_data->purchase_unit_id == $unit->id) {
                array_unshift($unit_code, $unit->unit_code);
                array_unshift($unit_operator, $unit->operator);
                array_unshift($unit_operation_value, $unit->operation_value);
            } else {
                $unit_code[] = $unit->unit_code;
                $unit_operator[] = $unit->operator;
                $unit_operation_value[] = $unit->operation_value;
            }
        }

        $product[] = implode(",", $unit_code) . ',';
        $product[] = implode(",", $unit_operator) . ',';
        $product[] = implode(",", $unit_operation_value) . ',';
        $product[] = $lims_product_data->id;
        $product[] = $product_variant_id;
        $product[] = $lims_product_data->is_imei;
        return $product;
    }
    public function returnPurchaseProductReturn($id)
    {
        $lims_product_return_data = PurchaseProductReturn::where('return_id', $id)->get();
        foreach ($lims_product_return_data as $key => $product_return_data) {
            $product = Product::find($product_return_data->product_id);
            if ($product_return_data->purchase_unit_id != 0) {
                $unit_data = Unit::find($product_return_data->purchase_unit_id);
                $unit = $unit_data->unit_code;
            } else
                $unit = '';

            if ($product_return_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                $product->code = $lims_product_variant_data->item_code;
            }
            if ($product_return_data->product_batch_id) {
                $product_batch_data = ProductBatch::select('batch_no')->find($product_return_data->product_batch_id);
                $product_return[7][$key] = $product_batch_data->batch_no;
            } else
                $product_return[7][$key] = 'N/A';
            $product_return[0][$key] = $product->product_name . ' [' . $product->product_code . ']';
            if ($product_return_data->imei_number)
                $product_return[0][$key] .= '<br>IMEI or Serial Number: ' . $product_return_data->imei_number;
            $product_return[1][$key] = $product_return_data->qty;
            $product_return[2][$key] = $unit;
            $product_return[3][$key] = $product_return_data->tax;
            $product_return[4][$key] = $product_return_data->tax_rate;
            $product_return[5][$key] = $product_return_data->discount;
            $product_return[6][$key] = $product_return_data->total;
        }
        return $product_return;
    }
    public function returnpurchasedestroy($id)
    {
        $lims_return_data = ReturnPurchase::find($id);
        $lims_product_return_data = PurchaseProductReturn::where('return_id', $id)->get();

        foreach ($lims_product_return_data as $key => $product_return_data) {
            $lims_product_data = Product::find($product_return_data->product_id);

            if ($product_return_data->purchase_unit_id != 0) {
                $lims_purchase_unit_data = Unit::find($product_return_data->purchase_unit_id);

                if ($lims_purchase_unit_data->operator == '*')
                    $quantity = $product_return_data->qty * $lims_purchase_unit_data->operation_value;
                elseif ($lims_purchase_unit_data->operator == '/')
                    $quantity = $product_return_data->qty / $lims_purchase_unit_data->operation_value;

                if ($product_return_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_return_data->product_id, $product_return_data->variant_id, $lims_return_data->warehouse_id)->first();
                    $lims_product_variant_data->qty += $quantity;
                    $lims_product_variant_data->save();
                } elseif ($product_return_data->product_batch_id) {
                    $lims_product_batch_data = ProductBatch::find($product_return_data->product_batch_id);
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_return_data->product_batch_id],
                        ['warehouse_id', $lims_return_data->warehouse_id]
                    ])->first();

                    $lims_product_batch_data->qty += $product_return_data->qty;
                    $lims_product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_return_data->product_id, $lims_return_data->warehouse_id)->first();

                if ($product_return_data->imei_number) {
                    if ($lims_product_warehouse_data->imei_number)
                        $lims_product_warehouse_data->imei_number .= ',' . $product_return_data->imei_number;
                    else
                        $lims_product_warehouse_data->imei_number = $product_return_data->imei_number;
                }

                $lims_product_data->qty += $quantity;
                $lims_product_warehouse_data->qty += $quantity;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
                $product_return_data->delete();
            }
        }
        $lims_return_data->delete();
        return redirect('superAdmin/return-purchase')->with('not_permitted', 'Data deleted successfully');
        ;
    }
    public function productWithoutVariant()
    {
        return Product::ActiveStandard()->select('id', 'product_name', 'product_code')
            ->whereNull('is_variant')->get();
    }

    public function productWithVariant()
    {
        return Product::join('product_variants', 'products.id', 'product_variants.product_id')
            ->ActiveStandard()
            ->whereNotNull('is_variant')
            ->select('products.id', 'products.product_name', 'product_variants.item_code')
            ->orderBy('position')->get();
    }
}
