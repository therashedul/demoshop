<?php
namespace App\Http\Servicecruds;

use Keygen;
// Event
use Arr;
// language
// try  catch
use Carbon\Carbon;
use App\Models\Account;
use \App\Mail\SendMail;

use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Mail;
use \Illuminate\Support\Facades\Redirect;
use \NumberToWords\NumberToWords;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use \Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;
use \Symfony\Component\HttpFoundation\Session\Session;

use Stripe\Stripe;
use App\Models\{
    Category,
    Brand,
    Unit,
    Tax,
    Warehouse,
    Product,
    ProductWarehouse,
    Variant,
    ProductVariant,
    Purchase,
    ProductPurchase,
    ProductBatch,
    Sale,
    Customer,
    CustomerGroup,
    ProductSale,
    Biller,
    PosSetting,
    RewardPointSetting,
    Returns,
    Delivery,
    CashRegister,
    Coupon,
    GiftCard,
    Payment,
    PaymentWithCheque,
    PaymentWithCreditCard,
    PaymentWithGiftCard,
    Courier,
    Expense
};


class Salecrud
{
    public function saleindex($request)
    {
        $sales = Sale::latest()->get();
        if ($request->ajax()) {
            $sales = Sale::latest()->get();
            if ($request->filled('from_date') && $request->filled('to_date')) {
                $sales = $sales->whereBetween('created_at', [$request->from_date, $request->to_date]);
            }

            // sales field search
            $customsales = Sale::select('*');
            if ($request->filled('sale_status')) {
                $sales = $customsales->where('sale_status', $request->sale_status);
            }
            if ($request->filled('payment_status')) {
                $sales = $customsales->where('payment_status', $request->payment_status);
            }
            if ($request->filled('reference_no')) {
                $sales = $customsales->where('reference_no', 'like', '%' . $request->reference_no . '%');
            }

            return Datatables::of($sales)
                ->addIndexColumn()

                ->addColumn('date', function ($row) {
                    $date = date('d-M-Y', strtotime($row->created_at));
                    return $date;
                })
                ->addColumn('image', function ($row) {
                    if (!isset($row->image)) {
                        return '<img src="' . asset('img\profile\blank-img.jpg' . $row->image) .
                            '" alt="' . $row->name . '" style="height: 40px;" >';
                    }
                    return '<img src="' . asset('images/' . $row->image) .
                        '" alt="' . $row->name . '" style="height: 40px;" >';
                })
                ->addColumn('product', function ($row) {

                    $products = DB::table('products')
                        ->join('product_sales', 'product_sales.product_id', '=', 'products.id')
                        ->join('sales', 'product_sales.sale_id', '=', 'sales.id')
                        ->select('products.product_name')
                        ->where('sales.id', $row->id)
                        ->get();
                    foreach ($products as $product) {
                        return optional($product)->product_name;
                    }

                })
                ->addColumn('biller', function ($row) {
                    $biller = $row->biller->name;
                    return $biller;
                })
                ->addColumn('coustomer', function ($row) {
                    $coustomer = $row->customer->name . '<br>' . $row->customer->phone_number . '<input type="hidden" class="deposit" value="' . ($row->customer->deposit - $row->customer->expense) . '" />' . '<input type="hidden" class="points" value="' . $row->customer->points . '" />';
                    return $coustomer;
                })
                ->addColumn('sale_status', function ($row) {
                    if ($row->sale_status == 1) {
                        $completed = '<div class="badge badge-success">' . trans('Completed') . '</div>';
                        return $completed;
                    } elseif ($row->sale_status == 2) {
                        $pending = '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                        return $pending;
                    } else {
                        $draft = '<div class="badge badge-warning">' . trans('Draft') . '</div>';
                        return $draft;
                    }
                })
                ->addColumn('payment_status', function ($row) {
                    if ($row->payment_status == 1) {
                        $pending = '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                        return $pending;
                    } elseif ($row->payment_status == 2) {
                        $due = '<div class="badge badge-danger">' . trans('Due') . '</div>';
                        return $due;
                    } elseif ($row->payment_status == 3) {
                        $draft = '<div class="badge badge-warning">' . trans('Partial') . '</div>';
                        return $draft;
                    } else {
                        $paid = '<div class="badge badge-success">' . trans('Paid') . '</div>';
                        return $paid;
                    }
                })

                ->addColumn('delevery', function ($row) {
                    $delivery_data = DB::table('deliveries')->select('status')->where('sale_id', $row->id)->first();
                    if ($delivery_data) {
                        if ($delivery_data->status == 1) {
                            $packing = '<div class="badge badge-info">' . trans('Packing') . '</div>';
                            return $packing;
                        } elseif ($delivery_data->status == 2) {
                            $delivering = '<div class="badge badge-info">' . trans('Delivering') . '</div>';
                            return $delivering;
                        } elseif ($delivery_data->status == 3) {
                            $delivered = '<div class="badge badge-info">' . trans('Delivered') . '</div>';
                            return $delivered;
                        }
                    } else {
                        $value = 'N/A';
                        return $value;
                    }
                })
                ->addColumn('grand_total', function ($row) {
                    $grandTotal = number_format($row->grand_total, 2);
                    return $grandTotal;
                })

                ->addColumn('returned_amount', function ($row) {
                    $returned_amount = DB::table('returns')->where('sale_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    return $returned_amount;
                })

                ->addColumn('paid_amount', function ($row) {
                    $paidAmount = number_format($row->paid_amount, 2);
                    return $paidAmount;
                })
                ->addColumn('due', function ($row) {
                    $returned_amount = DB::table('returns')->where('sale_id', $row->id)->sum('grand_total');
                    $returned_amount = number_format($returned_amount, 2);
                    $dueamount = number_format($row->grand_total - $returned_amount - $row->paid_amount, 2);
                    return $dueamount;
                })

                ->addColumn('action', function ($row) {
                    if ($row->sale_status != 3) {
                        $updateButton = ' <a href="' . route('superAdmin.sale.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i>' . trans('edit') . '</a>';
                    } else {
                        $updateButton = '<a href="' . url('superAdmin/sale/' . $row->id . '/create') . '" class="btn btn-link"><i class="fas fa-edit"></i>' . trans('edit') . '</a>';
                    }
                    // $updateButton = ($row->sale_status != 3) ? '<a href="' . route('superAdmin.sale.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i> ' . trans('Edit') . '</a>' : '<a href="' . route('superAdmin.sale/' . $row->id . '/create') . '" class="btn btn-link"><i class="dripicons-document-edit"></i> ' . trans('edit') . '</a>';

                    // Generate Invoice
                    $generateInvoice = '<a href="' . route('superAdmin.sale.invoice', $row->id) . '" class="btn btn-link"><i class="fa fa-copy"></i> ' . trans('Generate Invoice') . '</a>';

                    // View payment
                    $viewpayment = '<a href="javascript:void(0)" class="get-payment btn btn-link" data-id = "' . $row->id . '"><i class="fas fa-money-bill-wave-alt"></i> ' . trans('View Payment') . '</a>';

                    // Add payment
                    $addpayment = '<button type="button" class="add-payment btn btn-link" data-id = "' . $row->id . '" data-toggle="modal" data-target="#add-payment"><i class="fas fa-shopping-basket"></i> ' . trans('Add Payment') . '</button>';

                    // Add Delivery
                    $addDelevery = ' <button type="button" class="add-delivery btn btn-link" data-id = "' . $row->id . '"><i class="fa fa-truck"></i> ' . trans('Add Delivery') . '</button>';

                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-link  deletesale"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';


                    $nasted = '<div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                    <span class="caret"></span>
                    <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default menuScrolling" user="menu">
                        <li>' . $updateButton . '</li>

                        <li>' . $viewpayment . '</li>

                        <li>' . $generateInvoice . '</li>

                        <li>' . $addpayment . '</li>

                        <li>' . $addDelevery . '</li>

                        <li>' . $deleteButton . '</li>
                    </ul>
                </div>';

                    return $nasted;




                    // return $updateButton . " " . $deleteButton . "" . $viewpayment . "" . $addpayment . "" . $generateInvoice . "" . $addDelevery;
                })
                ->escapeColumns([])
                // ->rawColumns(['action','status'])
                ->make(true);
        }

        if ($request->input('warehouse_id'))
            $warehouse_id = $request->input('warehouse_id');
        else
            $warehouse_id = 0;

        if ($request->input('sale_status'))
            $sale_status = $request->input('sale_status');
        else
            $sale_status = 0;

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

        $lims_gift_card_list = GiftCard::where("is_active", true)->get();
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_account_list = Account::where('is_active', true)->get();
        $lims_deliveres_list = Courier::latest()->get();


        return view('superadmin.sale.index', compact('starting_date', 'ending_date', 'warehouse_id', 'sale_status', 'payment_status', 'lims_gift_card_list', 'lims_pos_setting_data', 'lims_reward_point_setting_data', 'lims_account_list', 'lims_warehouse_list', 'lims_deliveres_list', 'sales'));



    }
    #salecreate
    public function salecreate()
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        if (Auth::user()->role_id > 2) {
            $lims_warehouse_list = Warehouse::where([
                ['is_active', true],
                ['id', Auth::user()->warehouse_id]
            ])->get();
            $lims_biller_list = Biller::where([
                ['is_active', true],
                ['id', Auth::user()->biller_id]
            ])->get();
        } else {
            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
            $lims_biller_list = Biller::where('is_active', true)->get();
        }

        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_reward_point_setting_data = RewardPointSetting::latest()->first();

        return view('superadmin.sale.create', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_pos_setting_data', 'lims_tax_list', 'lims_reward_point_setting_data'));


    }

    public function salestore($request)
    {
        $data = $request->all();
        if (isset($request->reference_no)) {
            $this->validate($request, [
                'reference_no' => [
                    'max:191', 'required', 'unique:sales'
                ],
            ]);
        }

        $data['user_id'] = Auth::id();
        $cash_register_data = CashRegister::where([
            ['user_id', $data['user_id']],
            ['warehouse_id', $data['warehouse_id']],
            ['status', true]
        ])->first();

        if ($cash_register_data)
            $data['cash_register_id'] = $cash_register_data->id;

        if (isset($data['created_at']))
            $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
        else
            $data['created_at'] = date("Y-m-d H:i:s");
        //return dd($data);
        if ($data['pos']) {
            if (!isset($data['reference_no']))
                $data['reference_no'] = 'posr-' . date("Ymd") . '-' . date("his");

            $balance = $data['grand_total'] - $data['paid_amount'];
            if ($balance > 0 || $balance < 0)
                $data['payment_status'] = 2;
            else
                $data['payment_status'] = 4;

            if ($data['draft']) {
                $lims_sale_data = Sale::find($data['sale_id']);
                $lims_product_sale_data = ProductSale::where('sale_id', $data['sale_id'])->get();
                foreach ($lims_product_sale_data as $product_sale_data) {
                    $product_sale_data->delete();
                }
                $lims_sale_data->delete();
            }
        } else {
            if (!isset($data['reference_no']))
                $data['reference_no'] = 'sr-' . date("Ymd") . '-' . date("his");
        }

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

        //     $documentName = $document->getClientOriginalName();
        //     $document->move('public/sale/documents', $documentName);
        //     $data['document'] = $documentName;
        // }
        if ($data['coupon_active']) {
            $lims_coupon_data = Coupon::find($data['coupon_id']);
            $lims_coupon_data->used += 1;
            $lims_coupon_data->save();
        }

        $lims_sale_data = Sale::create($data);
        $lims_customer_data = Customer::find($data['customer_id']);
        $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
        //checking if customer gets some points or not
        if ($lims_reward_point_setting_data->is_active && $data['grand_total'] >= $lims_reward_point_setting_data->minimum_amount) {
            $point = (int) ($data['grand_total'] / $lims_reward_point_setting_data->per_point_amount);
            $lims_customer_data->points += $point;
            $lims_customer_data->save();
        }

        //collecting male data
        $mail_data['email'] = $lims_customer_data->email;
        $mail_data['reference_no'] = $lims_sale_data->reference_no;
        $mail_data['sale_status'] = $lims_sale_data->sale_status;
        $mail_data['payment_status'] = $lims_sale_data->payment_status;
        $mail_data['total_qty'] = $lims_sale_data->total_qty;
        $mail_data['total_price'] = $lims_sale_data->total_price;
        $mail_data['order_tax'] = $lims_sale_data->order_tax;
        $mail_data['order_tax_rate'] = $lims_sale_data->order_tax_rate;
        $mail_data['order_discount'] = $lims_sale_data->order_discount;
        $mail_data['shipping_cost'] = $lims_sale_data->shipping_cost;
        $mail_data['grand_total'] = $lims_sale_data->grand_total;
        $mail_data['paid_amount'] = $lims_sale_data->paid_amount;

        $product_id = $data['product_id'];
        $product_batch_id = $data['product_batch_id'];
        $imei_number = $data['imei_number'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $sale_unit = $data['sale_unit'];
        $net_unit_price = $data['net_unit_price'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $product_sale = [];

        foreach ($product_id as $i => $id) {
            $lims_product_data = Product::where('id', $id)->first();
            $product_sale['variant_id'] = null;
            $product_sale['product_batch_id'] = null;
            if ($lims_product_data->product_type == 'combo' && $data['sale_status'] == 1) {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                if ($lims_product_data->variant_list)
                    $variant_list = explode(",", $lims_product_data->variant_list);
                else
                    $variant_list = [];
                $qty_list = explode(",", $lims_product_data->qty_list);
                $price_list = explode(",", $lims_product_data->price_list);

                foreach ($product_list as $key => $child_id) {
                    $child_data = Product::find($child_id);
                    if (count($variant_list) && $variant_list[$key]) {
                        $child_product_variant_data = ProductVariant::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$key]]
                        ])->first();

                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$key]],
                            ['warehouse_id', $data['warehouse_id']],
                        ])->first();

                        $child_product_variant_data->qty -= $qty[$i] * $qty_list[$key];
                        $child_product_variant_data->save();
                    } else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $data['warehouse_id']],
                        ])->first();
                    }

                    $child_data->qty -= $qty[$i] * $qty_list[$key];
                    $child_warehouse_data->qty -= $qty[$i] * $qty_list[$key];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            }

            if ($sale_unit[$i] != 'n/a') {
                $lims_sale_unit_data = Unit::where('unit_code', $sale_unit[$i])->first();
                $sale_unit_id = $lims_sale_unit_data->id;
                if ($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($id, $product_code[$i])->first();
                    $product_sale['variant_id'] = $lims_product_variant_data->variant_id;
                }
                if ($lims_product_data->is_batch && $product_batch_id[$i]) {
                    $product_sale['product_batch_id'] = $product_batch_id[$i];
                }

                if ($data['sale_status'] == 1) {
                    if ($lims_sale_unit_data->operator == '*')
                        $quantity = $qty[$i] * $lims_sale_unit_data->operation_value;
                    elseif ($lims_sale_unit_data->operator == '/')
                        $quantity = $qty[$i] / $lims_sale_unit_data->operation_value;
                    //deduct quantity
                    $lims_product_data->qty = $lims_product_data->qty - $quantity;
                    $lims_product_data->save();
                    //deduct product variant quantity if exist
                    if ($lims_product_data->is_variant) {
                        $lims_product_variant_data->qty -= $quantity;
                        $lims_product_variant_data->save();
                        $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($id, $lims_product_variant_data->variant_id, $data['warehouse_id'])->first();
                    } elseif ($product_batch_id[$i]) {
                        $lims_product_warehouse_data = ProductWarehouse::where([
                            ['product_batch_id', $product_batch_id[$i]],
                            ['warehouse_id', $data['warehouse_id']]
                        ])->first();
                        $lims_product_batch_data = ProductBatch::find($product_batch_id[$i]);
                        //deduct product batch quantity
                        $lims_product_batch_data->qty -= $quantity;
                        $lims_product_batch_data->save();
                    } else {
                        $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($id, $data['warehouse_id'])->first();
                    }
                    //deduct quantity from warehouse
                    $lims_product_warehouse_data->qty -= $quantity;
                    $lims_product_warehouse_data->save();
                }
            } else
                $sale_unit_id = 0;

            if ($product_sale['variant_id']) {
                $variant_data = Variant::select('variant_name')->find($product_sale['variant_id']);
                $mail_data['products'][$i] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
            } else
                $mail_data['products'][$i] = $lims_product_data->product_name;
            //deduct imei number if available
            if ($imei_number[$i]) {
                $imei_numbers = explode(",", $imei_number[$i]);
                $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                foreach ($imei_numbers as $number) {
                    if (($j = array_search($number, $all_imei_numbers)) !== false) {
                        unset($all_imei_numbers[$j]);
                    }
                }
                $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                $lims_product_warehouse_data->save();
            }
            if ($lims_product_data->product_type == 'digital')
                $mail_data['file'][$i] = asset('/product/files') . '/' . $lims_product_data->file;
            else
                $mail_data['file'][$i] = '';
            if ($sale_unit_id)
                $mail_data['unit'][$i] = $lims_sale_unit_data->unit_code;
            else
                $mail_data['unit'][$i] = '';

            $product_sale['sale_id'] = $lims_sale_data->id;
            $product_sale['product_id'] = $id;
            $product_sale['imei_number'] = $imei_number[$i];
            $product_sale['qty'] = $mail_data['qty'][$i] = $qty[$i];
            $product_sale['sale_unit_id'] = $sale_unit_id;
            $product_sale['net_unit_price'] = $net_unit_price[$i];
            $product_sale['discount'] = $discount[$i];
            $product_sale['tax_rate'] = $tax_rate[$i];
            $product_sale['tax'] = $tax[$i];
            $product_sale['total'] = $mail_data['total'][$i] = $total[$i];
            ProductSale::create($product_sale);
        }
        if ($data['sale_status'] == 3) {

            $message = 'Sale successfully added to draft';
        } else {

            $message = ' Sale created successfully';
        }
        if ($mail_data['email'] && $data['sale_status'] == 1) {
            try {
                Mail::send('mail.sale_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Sale Details');
                });
            } catch (\Exception $e) {
                $message = ' Sale created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }

        if ($data['payment_status'] == 3 || $data['payment_status'] == 4 || ($data['payment_status'] == 2 && $data['pos'] && $data['paid_amount'] > 0)) {

            $lims_payment_data = new Payment();
            $lims_payment_data->user_id = Auth::id();

            if ($data['paid_by_id'] == 1)
                $paying_method = 'Cash';
            elseif ($data['paid_by_id'] == 2) {
                $paying_method = 'Gift Card';
            } elseif ($data['paid_by_id'] == 3)
                $paying_method = 'Credit Card';
            elseif ($data['paid_by_id'] == 4)
                $paying_method = 'Cheque';
            elseif ($data['paid_by_id'] == 5)
                $paying_method = 'Paypal';
            elseif ($data['paid_by_id'] == 6)
                $paying_method = 'Deposit';
            elseif ($data['paid_by_id'] == 7) {
                $paying_method = 'Points';
                $lims_payment_data->used_points = $data['used_points'];
            }

            if ($cash_register_data)
                $lims_payment_data->cash_register_id = $cash_register_data->id;
            $lims_account_data = Account::where('is_default', true)->first();
            $lims_payment_data->account_id = $lims_account_data->id;
            $lims_payment_data->sale_id = $lims_sale_data->id;
            $data['payment_reference'] = 'spr-' . date("Ymd") . '-' . date("his");
            $lims_payment_data->payment_reference = $data['payment_reference'];
            $lims_payment_data->amount = $data['paid_amount'];
            $lims_payment_data->change = $data['paying_amount'] - $data['paid_amount'];
            $lims_payment_data->paying_method = $paying_method;
            $lims_payment_data->payment_note = $data['payment_note'];
            $lims_payment_data->save();

            $lims_payment_data = Payment::latest()->first();
            $data['payment_id'] = $lims_payment_data->id;
            if ($paying_method == 'Credit Card') {
                $lims_pos_setting_data = PosSetting::latest()->first();
                Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
                $token = $data['stripeToken'];
                $grand_total = $data['grand_total'];

                $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('customer_id', $data['customer_id'])->first();

                if (!$lims_payment_with_credit_card_data) {
                    // Create a Customer:
                    $customer = \Stripe\Customer::create([
                        'source' => $token
                    ]);

                    // Charge the Customer instead of the card:
                    $charge = \Stripe\Charge::create([
                        'amount' => $grand_total * 100,
                        'currency' => 'usd',
                        'customer' => $customer->id
                    ]);
                    $data['customer_stripe_id'] = $customer->id;
                } else {
                    $customer_id =
                        $lims_payment_with_credit_card_data->customer_stripe_id;

                    $charge = \Stripe\Charge::create([
                        'amount' => $grand_total * 100,
                        'currency' => 'usd',
                        'customer' => $customer_id, // Previously stored, then retrieved
                    ]);
                    $data['customer_stripe_id'] = $customer_id;
                }
                $data['charge_id'] = $charge->id;
                PaymentWithCreditCard::create($data);
            } elseif ($paying_method == 'Gift Card') {
                $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
                $lims_gift_card_data->expense += $data['paid_amount'];
                $lims_gift_card_data->save();
                PaymentWithGiftCard::create($data);
            } elseif ($paying_method == 'Cheque') {
                PaymentWithCheque::create($data);
            }
            // elseif ($paying_method == 'Paypal') {
            //     $provider = new ExpressCheckout;
            //     $paypal_data = [];
            //     $paypal_data['items'] = [];
            //     foreach ($data['product_id'] as $key => $product_id) {
            //         $lims_product_data = Product::find($product_id);
            //         $paypal_data['items'][] = [
            //             'name' => $lims_product_data->name,
            //             'price' => ($data['subtotal'][$key]/$data['qty'][$key]),
            //             'qty' => $data['qty'][$key]
            //         ];
            //     }
            //     $paypal_data['items'][] = [
            //         'name' => 'Order Tax',
            //         'price' => $data['order_tax'],
            //         'qty' => 1
            //     ];
            //     $paypal_data['items'][] = [
            //         'name' => 'Order Discount',
            //         'price' => $data['order_discount'] * (-1),
            //         'qty' => 1
            //     ];
            //     $paypal_data['items'][] = [
            //         'name' => 'Shipping Cost',
            //         'price' => $data['shipping_cost'],
            //         'qty' => 1
            //     ];
            //     if($data['grand_total'] != $data['paid_amount']){
            //         $paypal_data['items'][] = [
            //             'name' => 'Due',
            //             'price' => ($data['grand_total'] - $data['paid_amount']) * (-1),
            //             'qty' => 1
            //         ];
            //     }
            //     //return $paypal_data;
            //     $paypal_data['invoice_id'] = $lims_sale_data->reference_no;
            //     $paypal_data['invoice_description'] = "Reference # {$paypal_data['invoice_id']} Invoice";
            //     $paypal_data['return_url'] = url('/sale/paypalSuccess');
            //     $paypal_data['cancel_url'] = url('/sale/create');

            //     $total = 0;
            //     foreach($paypal_data['items'] as $item) {
            //         $total += $item['price']*$item['qty'];
            //     }

            //     $paypal_data['total'] = $total;
            //     $response = $provider->setExpressCheckout($paypal_data);
            //      // This will redirect user to PayPal
            //     return redirect($response['paypal_link']);
            // }
            elseif ($paying_method == 'Deposit') {
                $lims_customer_data->expense += $data['paid_amount'];
                $lims_customer_data->save();
            } elseif ($paying_method == 'Points') {
                $lims_customer_data->points -= $data['used_points'];
                $lims_customer_data->save();
            }
        }
        if ($lims_sale_data->sale_status == '1') {
            return Redirect::to('superAdmin/sale.invoice' . '/' . $lims_sale_data->id)->with('message', $message);
        } elseif ($data['pos']) {
            return redirect('superAdmin/sale.pos')->with('message', $message);
            // return Redirect::to('superAdmin/pos')->with('message', $message);
        } else {
            return redirect('superAdmin/sale')->with('message', $message);
            // return Redirect::to('superAdmin/sale')->with('message', $message);
        }
    }
    // {
    //     $data = $request->all();
    //     $qty = $data['qty'];
    //     $product_id = $data['product_id'];
    //     // $variant_id = $data['variant_id'];
    //     $variant = productPurchase::where('product_id', $product_id[0])->get();
    //     if ($variant[0]->variant_id) {
    //         $productwarehouse = ProductWarehouse::where(
    //             'product_id','=', $product_id['0'],
    //         )->where('variant_id', '=', $variant['0']->variant_id)->first();
    //     } else {
    //         $productwarehouse = ProductWarehouse::where(
    //             'product_id', '=', $product_id['0'],
    //         )->first();
    //     }
    //     // if($productwarehouse->qty <= $qty[0]){
    //     //     echo "No";
    //     // }else{
    //     //     print_r($productwarehouse->qty);
    //     // }

    //     // print_r($variant[0]->variant_id);
    //     // print_r($qty[0]);
    //     // die();


    //     // if(isset($request->reference_no)) {
    //     //     $this->validate($request, [
    //     //         'reference_no' => [
    //     //             'max:191', 'required', 'unique:sales'
    //     //         ],
    //     //     ]);
    //     // }
    //     if ($productwarehouse->qty < $qty[0]) {
    //         $message = "Your quantity overloaded from stock product quantity";
    //         return Redirect::to('superAdmin/sale')->with('message', $message);
    //     } else {

    //         $data['user_id'] = Auth::id();
    //         $cash_register_data = CashRegister::where([
    //             ['user_id', $data['user_id']],
    //             ['warehouse_id', $data['warehouse_id']],
    //             ['status', true]
    //         ])->first();

    //         if ($cash_register_data)
    //             $data['cash_register_id'] = $cash_register_data->id;

    //         if (isset($data['created_at']))
    //             $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
    //         else
    //             $data['created_at'] = date("Y-m-d H:i:s");
    //         //return dd($data);
    //         if ($data['pos']) {
    //             if (!isset($data['reference_no']))
    //                 $data['reference_no'] = 'posr-' . date("Ymd") . '-' . date("his");

    //             $balance = $data['grand_total'] - $data['paid_amount'];
    //             if ($balance > 0 || $balance < 0)
    //                 $data['payment_status'] = 2;
    //             else
    //                 $data['payment_status'] = 4;

    //             if ($data['draft']) {
    //                 $lims_sale_data = Sale::find($data['sale_id']);
    //                 $lims_product_sale_data = ProductSale::where('sale_id', $data['sale_id'])->get();
    //                 foreach ($lims_product_sale_data as $product_sale_data) {
    //                     $product_sale_data->delete();
    //                 }
    //                 $lims_sale_data->delete();
    //             }
    //         } else {
    //             if (!isset($data['reference_no']))
    //                 $data['reference_no'] = 'sr-' . date("Ymd") . '-' . date("his");
    //         }

    //         // $document = $request->document;
    //         // if ($document) {
    //         //     $v = Validator::make(
    //         //         [
    //         //             'extension' => strtolower($request->document->getClientOriginalExtension()),
    //         //         ],
    //         //         [
    //         //             'extension' => 'in:jpg,jpeg,png,gif,pdf,csv,docx,xlsx,txt',
    //         //         ]
    //         //     );
    //         //     if ($v->fails())
    //         //         return redirect()->back()->withErrors($v->errors());

    //         //     $documentName = $document->getClientOriginalName();
    //         //     $document->move('public/sale/documents', $documentName);
    //         //     $data['document'] = $documentName;
    //         // }
    //         if ($data['coupon_active']) {
    //             $lims_coupon_data = Coupon::find($data['coupon_id']);
    //             $lims_coupon_data->used += 1;
    //             $lims_coupon_data->save();
    //         }


    //         $lims_sale_data = Sale::create($data);
    //         $lims_customer_data = Customer::find($data['customer_id']);
    //         $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
    //         //checking if customer gets some points or not
    //         if ($lims_reward_point_setting_data->is_active && $data['grand_total'] >= $lims_reward_point_setting_data->minimum_amount) {
    //             $point = (int) ($data['grand_total'] / $lims_reward_point_setting_data->per_point_amount);
    //             $lims_customer_data->points += $point;
    //             $lims_customer_data->save();
    //         }

    //         //collecting male data
    //         $mail_data['email'] = $lims_customer_data->email;
    //         $mail_data['reference_no'] = $lims_sale_data->reference_no;
    //         $mail_data['sale_status'] = $lims_sale_data->sale_status;
    //         $mail_data['payment_status'] = $lims_sale_data->payment_status;
    //         $mail_data['total_qty'] = $lims_sale_data->total_qty;
    //         $mail_data['total_price'] = $lims_sale_data->total_price;
    //         $mail_data['order_tax'] = $lims_sale_data->order_tax;
    //         $mail_data['order_tax_rate'] = $lims_sale_data->order_tax_rate;
    //         $mail_data['order_discount'] = $lims_sale_data->order_discount;
    //         $mail_data['shipping_cost'] = $lims_sale_data->shipping_cost;
    //         $mail_data['grand_total'] = $lims_sale_data->grand_total;
    //         $mail_data['paid_amount'] = $lims_sale_data->paid_amount;

    //         $product_id = $data['product_id'];
    //         $product_batch_id = $data['product_batch_id'];
    //         $imei_number = $data['imei_number'];
    //         $product_code = $data['product_code'];
    //         $qty = $data['qty'];
    //         $sale_unit = $data['sale_unit'];
    //         $net_unit_price = $data['net_unit_price'];
    //         $discount = $data['discount'];
    //         $tax_rate = $data['tax_rate'];
    //         $tax = $data['tax'];
    //         $total = $data['subtotal'];
    //         $product_sale = [];


    //         foreach ($product_id as $i => $id) {
    //             $lims_product_data = Product::where('id', $id)->first();
    //             $product_sale['variant_id'] = null;
    //             $product_sale['product_batch_id'] = null;
    //             if ($lims_product_data->type == 'combo' && $data['sale_status'] == 1) {
    //                 $product_list = explode(",", $lims_product_data->product_list);
    //                 $variant_list = explode(",", $lims_product_data->variant_list);
    //                 if ($lims_product_data->variant_list)
    //                     $variant_list = explode(",", $lims_product_data->variant_list);
    //                 else
    //                     $variant_list = [];
    //                 $qty_list = explode(",", $lims_product_data->qty_list);
    //                 $price_list = explode(",", $lims_product_data->price_list);

    //                 foreach ($product_list as $key => $child_id) {
    //                     $child_data = Product::find($child_id);
    //                     if (count($variant_list) && $variant_list[$key]) {
    //                         $child_product_variant_data = ProductVariant::where([
    //                             ['product_id', $child_id],
    //                             ['variant_id', $variant_list[$key]]
    //                         ])->first();

    //                         $child_warehouse_data = ProductWarehouse::where([
    //                             ['product_id', $child_id],
    //                             ['variant_id', $variant_list[$key]],
    //                             ['warehouse_id', $data['warehouse_id']],
    //                         ])->first();

    //                         $child_product_variant_data->qty -= $qty[$i] * $qty_list[$key];
    //                         $child_product_variant_data->save();
    //                     } else {
    //                         $child_warehouse_data = ProductWarehouse::where([
    //                             ['product_id', $child_id],
    //                             ['warehouse_id', $data['warehouse_id']],
    //                         ])->first();
    //                     }

    //                     $child_data->qty -= $qty[$i] * $qty_list[$key];
    //                     $child_warehouse_data->qty -= $qty[$i] * $qty_list[$key];

    //                     $child_data->save();
    //                     $child_warehouse_data->save();
    //                 }
    //             }

    //             if ($sale_unit[$i] != 'n/a') {
    //                 $lims_sale_unit_data = Unit::where('unit_code', $sale_unit[$i])->first();
    //                 $sale_unit_id = $lims_sale_unit_data->id;
    //                 if ($lims_product_data->is_variant) {
    //                     $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($id, $product_code[$i])->first();
    //                     $product_sale['variant_id'] = optional($lims_product_variant_data)->variant_id;
    //                 }
    //                 if ($lims_product_data->is_batch && $product_batch_id[$i]) {
    //                     $product_sale['product_batch_id'] = $product_batch_id[$i];
    //                 }

    //                 if ($data['sale_status'] == 1) {
    //                     if ($lims_sale_unit_data->operator == '*')
    //                         $quantity = $qty[$i] * $lims_sale_unit_data->operation_value;
    //                     elseif ($lims_sale_unit_data->operator == '/')
    //                         $quantity = $qty[$i] / $lims_sale_unit_data->operation_value;
    //                     //deduct quantity
    //                     $lims_product_data->qty = $lims_product_data->qty - $quantity;
    //                     $lims_product_data->save();
    //                     //deduct product variant quantity if exist
    //                     if ($lims_product_data->is_variant) {
    //                         $lims_product_variant_data->qty -= $quantity;
    //                         $lims_product_variant_data->save();
    //                         $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($id, $lims_product_variant_data->variant_id, $data['warehouse_id'])->first();
    //                     } elseif ($product_batch_id[$i]) {
    //                         $lims_product_warehouse_data = ProductWarehouse::where([
    //                             ['product_batch_id', $product_batch_id[$i]],
    //                             ['warehouse_id', $data['warehouse_id']]
    //                         ])->first();
    //                         $lims_product_batch_data = ProductBatch::find($product_batch_id[$i]);
    //                         //deduct product batch quantity
    //                         $lims_product_batch_data->qty -= $quantity;
    //                         $lims_product_batch_data->save();
    //                     } else {
    //                         $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($id, $data['warehouse_id'])->first();
    //                     }
    //                     //deduct quantity from warehouse
    //                     $lims_product_warehouse_data->qty -= $quantity;
    //                     $lims_product_warehouse_data->save();
    //                 }
    //             } else
    //                 $sale_unit_id = 0;

    //             if ($product_sale['variant_id']) {
    //                 $variant_data = Variant::select('variant_name')->find($product_sale['variant_id']);
    //                 $mail_data['products'][$i] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
    //             } else
    //                 $mail_data['products'][$i] = $lims_product_data->product_name;
    //             //deduct imei number if available
    //             if ($imei_number[$i]) {
    //                 $imei_numbers = explode(",", $imei_number[$i]);
    //                 $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
    //                 foreach ($imei_numbers as $number) {
    //                     if (($j = array_search($number, $all_imei_numbers)) !== false) {
    //                         unset($all_imei_numbers[$j]);
    //                     }
    //                 }
    //                 $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
    //                 $lims_product_warehouse_data->save();
    //             }
    //             if ($lims_product_data->type == 'digital')
    //                 $mail_data['file'][$i] = url('/public/product/files') . '/' . $lims_product_data->file;
    //             else
    //                 $mail_data['file'][$i] = '';
    //             if ($sale_unit_id)
    //                 $mail_data['unit'][$i] = $lims_sale_unit_data->unit_code;
    //             else
    //                 $mail_data['unit'][$i] = '';

    //             $product_sale['sale_id'] = $lims_sale_data->id;
    //             $product_sale['product_id'] = $id;
    //             $product_sale['imei_number'] = $imei_number[$i];
    //             $product_sale['qty'] = $mail_data['qty'][$i] = $qty[$i];
    //             $product_sale['sale_unit_id'] = $sale_unit_id;
    //             $product_sale['net_unit_price'] = $net_unit_price[$i];
    //             $product_sale['discount'] = $discount[$i];
    //             $product_sale['tax_rate'] = $tax_rate[$i];
    //             $product_sale['tax'] = $tax[$i];
    //             $product_sale['total'] = $mail_data['total'][$i] = $total[$i];
    //             ProductSale::create($product_sale);
    //         }


    //         // print_r($productwarehouse->qty);

    //         if ($data['sale_status'] == 3){

    //             $message = 'Sale successfully added to draft';
    //         }
    //         else{

    //             $message = ' Sale created successfully';
    //         }
    //         if ($mail_data['email'] && $data['sale_status'] == 1) {
    //             try {
    //                 Mail::send('mail.sale_details', $mail_data, function ($message) use ($mail_data) {
    //                     $message->to($mail_data['email'])->subject('Sale Details');
    //                 });
    //             } catch (\Exception $e) {
    //                 $message = 'Sale created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
    //             }


    //             if ($data['payment_status'] == 3 || $data['payment_status'] == 4 || ($data['payment_status'] == 2 && $data['pos'] && $data['paid_amount'] > 0)) {

    //                 $lims_payment_data = new Payment();
    //                 $lims_payment_data->user_id = Auth::id();

    //                 if ($data['paid_by_id'] == 1)
    //                     $paying_method = 'Cash';
    //                 elseif ($data['paid_by_id'] == 2) {
    //                     $paying_method = 'Gift Card';
    //                 } elseif ($data['paid_by_id'] == 3)
    //                     $paying_method = 'Credit Card';
    //                 elseif ($data['paid_by_id'] == 4)
    //                     $paying_method = 'Cheque';
    //                 elseif ($data['paid_by_id'] == 5)
    //                     $paying_method = 'Paypal';
    //                 elseif ($data['paid_by_id'] == 6)
    //                     $paying_method = 'Deposit';
    //                 elseif ($data['paid_by_id'] == 7) {
    //                     $paying_method = 'Points';
    //                     $lims_payment_data->used_points = $data['used_points'];
    //                 }

    //                 if ($cash_register_data)
    //                     $lims_payment_data->cash_register_id = $cash_register_data->id;
    //                 $lims_account_data = Account::where('is_default', true)->first();
    //                 $lims_payment_data->account_id = $lims_account_data->id;
    //                 $lims_payment_data->sale_id = $lims_sale_data->id;
    //                 $data['payment_reference'] = 'spr-' . date("Ymd") . '-' . date("his");
    //                 $lims_payment_data->payment_reference = $data['payment_reference'];
    //                 $lims_payment_data->amount = $data['paid_amount'];
    //                 $lims_payment_data->change = $data['paying_amount'] - $data['paid_amount'];
    //                 $lims_payment_data->paying_method = $paying_method;
    //                 $lims_payment_data->payment_note = $data['payment_note'];
    //                 $lims_payment_data->save();

    //                 $lims_payment_data = Payment::latest()->first();
    //                 $data['payment_id'] = $lims_payment_data->id;

    //                 if($paying_method == 'Credit Card'){
    //                     $lims_pos_setting_data = PosSetting::latest()->first();
    //                     Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
    //                     $token = $data['stripeToken'];
    //                     $grand_total = $data['grand_total'];

    //                     $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('customer_id', $data['customer_id'])->first();

    //                     if(!$lims_payment_with_credit_card_data) {
    //                         // Create a Customer:
    //                         $customer = \Stripe\Customer::create([
    //                             'source' => $token
    //                         ]);

    //                         // Charge the Customer instead of the card:
    //                         $charge = \Stripe\Charge::create([
    //                             'amount' => $grand_total * 100,
    //                             'currency' => 'usd',
    //                             'customer' => $customer->id
    //                         ]);
    //                         $data['customer_stripe_id'] = $customer->id;
    //                     }
    //                     else {
    //                         $customer_id =
    //                         $lims_payment_with_credit_card_data->customer_stripe_id;

    //                         $charge = \Stripe\Charge::create([
    //                             'amount' => $grand_total * 100,
    //                             'currency' => 'usd',
    //                             'customer' => $customer_id, // Previously stored, then retrieved
    //                         ]);
    //                         $data['customer_stripe_id'] = $customer_id;
    //                     }
    //                     $data['charge_id'] = $charge->id;
    //                     PaymentWithCreditCard::create($data);
    //                 }
    //                 if ($paying_method == 'Gift Card') {
    //                     $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
    //                     $lims_gift_card_data->expense += $data['paid_amount'];
    //                     $lims_gift_card_data->save();
    //                     PaymentWithGiftCard::create($data);
    //                 } elseif ($paying_method == 'Cheque') {
    //                     PaymentWithCheque::create($data);
    //                 }
    //                 // elseif ($paying_method == 'Paypal') {
    //                 //     $provider = new ExpressCheckout;
    //                 //     $paypal_data = [];
    //                 //     $paypal_data['items'] = [];
    //                 //     foreach ($data['product_id'] as $key => $product_id) {
    //                 //         $lims_product_data = Product::find($product_id);
    //                 //         $paypal_data['items'][] = [
    //                 //             'name' => $lims_product_data->name,
    //                 //             'price' => ($data['subtotal'][$key]/$data['qty'][$key]),
    //                 //             'qty' => $data['qty'][$key]
    //                 //         ];
    //                 //     }
    //                 //     $paypal_data['items'][] = [
    //                 //         'name' => 'Order Tax',
    //                 //         'price' => $data['order_tax'],
    //                 //         'qty' => 1
    //                 //     ];
    //                 //     $paypal_data['items'][] = [
    //                 //         'name' => 'Order Discount',
    //                 //         'price' => $data['order_discount'] * (-1),
    //                 //         'qty' => 1
    //                 //     ];
    //                 //     $paypal_data['items'][] = [
    //                 //         'name' => 'Shipping Cost',
    //                 //         'price' => $data['shipping_cost'],
    //                 //         'qty' => 1
    //                 //     ];
    //                 //     if($data['grand_total'] != $data['paid_amount']){
    //                 //         $paypal_data['items'][] = [
    //                 //             'name' => 'Due',
    //                 //             'price' => ($data['grand_total'] - $data['paid_amount']) * (-1),
    //                 //             'qty' => 1
    //                 //         ];
    //                 //     }
    //                 //     //return $paypal_data;
    //                 //     $paypal_data['invoice_id'] = $lims_sale_data->reference_no;
    //                 //     $paypal_data['invoice_description'] = "Reference # {$paypal_data['invoice_id']} Invoice";
    //                 //     $paypal_data['return_url'] = url('/sale/paypalSuccess');
    //                 //     $paypal_data['cancel_url'] = url('/sale/create');

    //                 //     $total = 0;
    //                 //     foreach($paypal_data['items'] as $item) {
    //                 //         $total += $item['price']*$item['qty'];
    //                 //     }

    //                 //     $paypal_data['total'] = $total;
    //                 //     $response = $provider->setExpressCheckout($paypal_data);
    //                 //      // This will redirect user to PayPal
    //                 //     return redirect($response['paypal_link']);
    //                 // }
    //                 elseif ($paying_method == 'Deposit') {
    //                     $lims_customer_data->expense += $data['paid_amount'];
    //                     $lims_customer_data->save();
    //                 } elseif ($paying_method == 'Points') {
    //                     $lims_customer_data->points -= $data['used_points'];
    //                     $lims_customer_data->save();
    //                 }
    //             }
    //         }
    //     }
    //     if ($lims_sale_data->sale_status == '1') {
    //         return Redirect::to('superAdmin/sale.invoice' . '/' . $lims_sale_data->id)->with('message', $message);
    //     } elseif ($data['pos']) {
    //             return redirect('superAdmin/sale.pos')->with('message', $message);
    //             // return Redirect::to('superAdmin/pos')->with('message', $message);
    //     } else {
    //             return redirect('superAdmin/sale')->with('message', $message);
    //             // return Redirect::to('superAdmin/sale')->with('message', $message);
    //     }
    // }
    public function showDetails($warehouse_id)
    {
        $cash_register_data = CashRegister::where([
            ['user_id', Auth::id()],
            ['warehouse_id', $warehouse_id],
            ['status', true]
        ])->first();

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
        $data['id'] = $cash_register_data->id;
        return $data;
    }

    public function saleSendMail($request)
    {
        $data = $request->all();
        $lims_sale_data = Sale::find($data['sale_id']);
        $lims_product_sale_data = ProductSale::where('sale_id', $data['sale_id'])->get();
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        if ($lims_customer_data->email) {
            //collecting male data
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['reference_no'] = $lims_sale_data->reference_no;
            $mail_data['sale_status'] = $lims_sale_data->sale_status;
            $mail_data['payment_status'] = $lims_sale_data->payment_status;
            $mail_data['total_qty'] = $lims_sale_data->total_qty;
            $mail_data['total_price'] = $lims_sale_data->total_price;
            $mail_data['order_tax'] = $lims_sale_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_sale_data->order_tax_rate;
            $mail_data['order_discount'] = $lims_sale_data->order_discount;
            $mail_data['shipping_cost'] = $lims_sale_data->shipping_cost;
            $mail_data['grand_total'] = $lims_sale_data->grand_total;
            $mail_data['paid_amount'] = $lims_sale_data->paid_amount;

            foreach ($lims_product_sale_data as $key => $product_sale_data) {
                $lims_product_data = Product::find($product_sale_data->product_id);
                if ($product_sale_data->variant_id) {
                    $variant_data = Variant::select('variant_name')->find($product_sale_data->variant_id);
                    $mail_data['products'][$key] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
                } else
                    $mail_data['products'][$key] = $lims_product_data->product_name;
                if ($lims_product_data->type == 'digital')
                    $mail_data['file'][$key] = url('/public/product/files') . '/' . $lims_product_data->file;
                else
                    $mail_data['file'][$key] = '';
                if ($product_sale_data->sale_unit_id) {
                    $lims_unit_data = Unit::find($product_sale_data->sale_unit_id);
                    $mail_data['unit'][$key] = $lims_unit_data->unit_code;
                } else
                    $mail_data['unit'][$key] = '';

                $mail_data['qty'][$key] = $product_sale_data->qty;
                $mail_data['total'][$key] = $product_sale_data->qty;
            }

            try {
                Mail::send('mail.sale_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Sale Details');
                });
                $message = 'Mail sent successfully';
            } catch (\Exception $e) {
                $message = 'Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        } else
            $message = 'Customer doesnt have email!';

        return redirect()->back()->with('message', $message);
    }
    public function createSale($id)
    {

        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', $id)->get();
        $lims_product_list = Product::where([
            ['featured', 1],
            ['is_active', true]
        ])->get();
        foreach ($lims_product_list as $key => $product) {
            $images = explode(",", $product->image);
            $product->base_image = $images[0];
        }
        $product_number = count($lims_product_list);
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_brand_list = Brand::where('status', true)->get();
        $lims_category_list = Category::where('status', true)->get();
        $lims_coupon_list = Coupon::where('is_active', true)->get();

        return view('superadmin.sale.create_sale', compact('lims_biller_list', 'lims_customer_list', 'lims_warehouse_list', 'lims_tax_list', 'lims_sale_data', 'lims_product_sale_data', 'lims_pos_setting_data', 'lims_brand_list', 'lims_category_list', 'lims_coupon_list', 'lims_product_list', 'product_number', 'lims_customer_group_all'));

    }
    public function todaySale()
    {
        $data['total_sale_amount'] = Sale::whereDate('created_at', date("Y-m-d"))->sum('grand_total');
        $data['total_payment'] = Payment::whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['cash_payment'] = Payment::where([
            ['paying_method', 'Cash']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['credit_card_payment'] = Payment::where([
            ['paying_method', 'Credit Card']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['gift_card_payment'] = Payment::where([
            ['paying_method', 'Gift Card']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['deposit_payment'] = Payment::where([
            ['paying_method', 'Deposit']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['cheque_payment'] = Payment::where([
            ['paying_method', 'Cheque']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['paypal_payment'] = Payment::where([
            ['paying_method', 'Paypal']
        ])->whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['total_sale_return'] = Returns::whereDate('created_at', date("Y-m-d"))->sum('grand_total');
        $data['total_expense'] = Expense::whereDate('created_at', date("Y-m-d"))->sum('amount');
        $data['total_cash'] = $data['total_payment'] - ($data['total_sale_return'] + $data['total_expense']);
        return $data;
    }
    public function todayProfit($warehouse_id)
    {
        if ($warehouse_id == 0)
            $product_sale_data = ProductSale::select(DB::raw('product_id, product_batch_id, sum(qty) as sold_qty, sum(total) as sold_amount'))->whereDate('created_at', date("Y-m-d"))->groupBy('product_id', 'product_batch_id')->get();
        else
            $product_sale_data = Sale::join('product_sales', 'sales.id', '=', 'product_sales.sale_id')
                ->select(DB::raw('product_sales.product_id, product_sales.product_batch_id, sum(product_sales.qty) as sold_qty, sum(product_sales.total) as sold_amount'))
                ->where('sales.warehouse_id', $warehouse_id)->whereDate('sales.created_at', date("Y-m-d"))
                ->groupBy('product_sales.product_id', 'product_sales.product_batch_id')->get();

        $product_revenue = 0;
        $product_cost = 0;
        $profit = 0;
        foreach ($product_sale_data as $key => $product_sale) {
            if ($warehouse_id == 0) {
                if ($product_sale->product_batch_id)
                    $product_purchase_data = ProductPurchase::where([
                        ['product_id', $product_sale->product_id],
                        ['product_batch_id', $product_sale->product_batch_id]
                    ])->get();
                else
                    $product_purchase_data = ProductPurchase::where('product_id', $product_sale->product_id)->get();
            } else {
                if ($product_sale->product_batch_id) {
                    $product_purchase_data = Purchase::join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')
                        ->where([
                            ['product_purchases.product_id', $product_sale->product_id],
                            ['product_purchases.product_batch_id', $product_sale->product_batch_id],
                            ['purchases.warehouse_id', $warehouse_id]
                        ])->select('product_purchases.*')->get();
                } else
                    $product_purchase_data = Purchase::join('product_purchases', 'purchases.id', '=', 'product_purchases.purchase_id')
                        ->where([
                            ['product_purchases.product_id', $product_sale->product_id],
                            ['purchases.warehouse_id', $warehouse_id]
                        ])->select('product_purchases.*')->get();
            }

            $purchased_qty = 0;
            $purchased_amount = 0;
            $sold_qty = $product_sale->sold_qty;
            $product_revenue += $product_sale->sold_amount;
            foreach ($product_purchase_data as $key => $product_purchase) {
                $purchased_qty += $product_purchase->qty;
                $purchased_amount += $product_purchase->total;
                if ($purchased_qty >= $sold_qty) {
                    $qty_diff = $purchased_qty - $sold_qty;
                    $unit_cost = $product_purchase->total / $product_purchase->qty;
                    $purchased_amount -= ($qty_diff * $unit_cost);
                    break;
                }
            }

            $product_cost += $purchased_amount;
            $profit += $product_sale->sold_amount - $purchased_amount;
        }

        $data['product_revenue'] = $product_revenue;
        $data['product_cost'] = $product_cost;
        if ($warehouse_id == 0)
            $data['expense_amount'] = Expense::whereDate('created_at', date("Y-m-d"))->sum('amount');
        else
            $data['expense_amount'] = Expense::where('warehouse_id', $warehouse_id)->whereDate('created_at', date("Y-m-d"))->sum('amount');

        $data['profit'] = $profit - $data['expense_amount'];
        return $data;
    }
    public function salePrintLastReciept()
    {
        $sale = Sale::where('sale_status', 1)->latest()->first();
        return redirect()->route('superAdmin.sale.invoice', $sale->id);
    }
    public function sellGetProduct($id)
    {
        $lims_product_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
                ['product_warehouses.qty', '>', 0]
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNull('product_warehouses.product_batch_id')
            ->select('product_warehouses.*')
            // ->select('product_warehouses.*',  'products.is_embeded')
            ->get();

        config()->set('database.connections.mysql.strict', false);
        DB::reconnect(); //important as the existing connection if any would be in strict mode

        $lims_product_with_batch_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
                ['product_warehouses.qty', '>', 0]
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNotNull('product_warehouses.product_batch_id')
            ->select('product_warehouses.*')
            // ->select('product_warehouses.*', 'products.is_embeded')
            ->groupBy('product_warehouses.product_id')
            ->get();

        //now changing back the strict ON
        config()->set('database.connections.mysql.strict', true);
        DB::reconnect();

        $lims_product_with_variant_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
                ['product_warehouses.qty', '>', 0]
            ])
            ->whereNotNull('product_warehouses.variant_id')
            ->select('product_warehouses.*')
            // ->select('product_warehouses.*', 'products.is_embeded')
            ->get();

        $product_code = [];
        $product_name = [];
        $product_qty = [];
        $product_type = [];
        $product_id = [];
        $product_list = [];
        $qty_list = [];
        $product_price = [];
        $batch_no = [];
        $product_batch_id = [];
        $expired_date = [];
        $is_embeded = [];
        //product without variant
        foreach ($lims_product_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $product_price[] = $product_warehouse->product_price;
            $lims_product_data = Product::find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $product_id[] = $lims_product_data->id;
            $product_list[] = $lims_product_data->product_list;
            $qty_list[] = $lims_product_data->qty_list;
            $batch_no[] = null;
            $product_batch_id[] = null;
            $expired_date[] = null;
            if ($product_warehouse->is_embeded)
                $is_embeded[] = $product_warehouse->is_embeded;
            else
                $is_embeded[] = 0;
        }
        //product with batches
        foreach ($lims_product_with_batch_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $product_price[] = $product_warehouse->product_price;
            $lims_product_data = Product::find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $product_id[] = $lims_product_data->id;
            $product_list[] = $lims_product_data->product_list;
            $qty_list[] = $lims_product_data->qty_list;
            $product_batch_data = ProductBatch::select('id', 'batch_no', 'expired_date')->find($product_warehouse->product_batch_id);
            $batch_no[] = $product_batch_data->batch_no;
            $product_batch_id[] = $product_batch_data->id;
            $expired_date[] = date(config('date_format'), strtotime($product_batch_data->expired_date));
            if ($product_warehouse->is_embeded)
                $is_embeded[] = $product_warehouse->is_embeded;
            else
                $is_embeded[] = 0;
        }
        //product with variant
        foreach ($lims_product_with_variant_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::find($product_warehouse->product_id);
            $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_warehouse->product_id, $product_warehouse->variant_id)->first();
            $product_code[] = $lims_product_variant_data->item_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $product_id[] = $lims_product_data->id;
            $product_list[] = $lims_product_data->product_list;
            $qty_list[] = $lims_product_data->qty_list;
            $batch_no[] = null;
            $product_batch_id[] = null;
            $expired_date[] = null;
            if ($product_warehouse->is_embeded)
                $is_embeded[] = $product_warehouse->is_embeded;
            else
                $is_embeded[] = 0;
        }
        //retrieve product with type of digital, combo and service
        $lims_product_data = Product::whereNotIn('product_type', ['standard'])->where('is_active', true)->get();
        foreach ($lims_product_data as $product) {
            $product_qty[] = $product->qty;
            $product_code[] = $product->product_code;
            $product_name[] = $product->product_name;
            $product_type[] = $product->product_type;
            $product_id[] = $product->id;
            $product_list[] = $product->product_list;
            $qty_list[] = $product->qty_list;
            $batch_no[] = null;
            $product_batch_id[] = null;
            $expired_date[] = null;
            $is_embeded[] = 0;
        }
        $product_data = [$product_code, $product_name, $product_qty, $product_type, $product_id, $product_list, $qty_list, $product_price, $batch_no, $product_batch_id, $expired_date, $is_embeded];
        return $product_data;
    }

    public function saleGetcustomergroup($id)
    {
        $lims_customer_data = Customer::find($id);
        $lims_customer_group_data = CustomerGroup::find($lims_customer_data->customer_group_id);
        return $lims_customer_group_data->percentage;
    }
    public function saleDeliveryStore($request)
    {
        $data = $request->except('file');
        $delivery = Delivery::firstOrNew(['reference_no' => $data['reference_no']]);
        $document = $request->file;
        // if ($document) {
        //     $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
        //     $documentName = $data['reference_no'] . '.' . $ext;
        //     $document->move('public/documents/delivery', $documentName);
        //     $delivery->file = $documentName;
        // }
        $delivery->sale_id = $data['sale_id'];
        $delivery->user_id = Auth::id();
        $delivery->courier_id = $data['courier_id'];
        $delivery->address = $data['address'];
        $delivery->delivered_by = $data['delivered_by'];
        $delivery->recieved_by = $data['recieved_by'];
        $delivery->status = $data['status'];
        $delivery->note = $data['note'];
        $delivery->save();
        $lims_sale_data = Sale::find($data['sale_id']);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $message = 'Delivery created successfully';
        if ($lims_customer_data->email && $data['status'] != 1) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['customer'] = $lims_customer_data->name;
            $mail_data['sale_reference'] = $lims_sale_data->reference_no;
            $mail_data['delivery_reference'] = $delivery->reference_no;
            $mail_data['status'] = $data['status'];
            $mail_data['address'] = $data['address'];
            $mail_data['delivered_by'] = $data['delivered_by'];
            //return $mail_data;
            try {
                Mail::send('mail.delivery_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Delivery Details');
                });
            } catch (\Exception $e) {
                $message = 'Delivery created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/delivery')->with('message', $message);
    }

    public function saleCashRegister( $request)
    {
        $data = $request->all();
        $data['status'] = true;
        $data['user_id'] = Auth::id();
        CashRegister::create($data);
        return redirect()->back()->with('message', 'Cash register created successfully');
    }

    public function salecheckAvailability($warehouse_id)
    {
        $open_register_number = CashRegister::where([
            ['user_id', Auth::id()],
            ['warehouse_id', $warehouse_id],
            ['status', true]
        ])->count();
        if ($open_register_number)
            return 'true';
        else
            return 'false';
    }
    public function getFeatured()
    {
        $data = [];
        $lims_product_list = Product::where([
            ['is_active', true],
            ['featured', true]
        ])->select('products.id', 'products.product_name', 'products.product_code', 'products.product_image', 'products.is_variant')->get();

        $index = 0;
        foreach ($lims_product_list as $product) {
            if ($product->is_variant) {
                $lims_product_data = Product::select('id')->find($product->id);
                $lims_product_variant_data = $lims_product_data->variant()->orderBy('position')->get();
                foreach ($lims_product_variant_data as $key => $variant) {
                    $data['product_name'][$index] = $product->product_name . ' [' . $variant->variant_name . ']';
                    $data['product_code'][$index] = $variant->pivot['item_code'];
                    $images = explode(",", $product->product_image);
                    $data['product_image'][$index] = $images[0];
                    $index++;
                }
            } else {
                $data['product_name'][$index] = $product->product_name;
                $data['product_code'][$index] = $product->product_code;
                $images = explode(",", $product->product_image);
                $data['product_image'][$index] = $images[0];
                $index++;
            }
        }
        return $data;
    }
    public function saleGetGiftCard()
    {
        $gift_card = GiftCard::where("is_active", true)->whereDate('expired_date', '>=', date("Y-m-d"))->get(['id', 'card_no', 'amount', 'expense']);
        return json_encode($gift_card);
    }
    public function saleGenInvoice($id)
    {
        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', $id)->get();
        $lims_biller_data = Biller::find($lims_sale_data->biller_id);
        $lims_warehouse_data = Warehouse::find($lims_sale_data->warehouse_id);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $lims_payment_data = Payment::where('sale_id', $id)->get();

        // $grand_total = $grandtotal = number_format((float)$lims_sale_data->grand_total, 0, '.', '') + number_format((float)$lims_sale_data->order_tax, 2, '.', '')+number_format((float)$lims_sale_data->shipping_cost, 0, '.', '') - number_format((float)$lims_sale_data->coupon_discount, 2, '.', '') - number_format((float)$lims_sale_data->coupon_discount, 2, '.', '')- number_format((float)$lims_sale_data->order_discount, 2, '.', '');

        $numberToWords = new NumberToWords();

        if (App::getLocale() == 'ar' || App::getLocale() == 'hi' || App::getLocale() == 'vi' || App::getLocale() == 'en-gb')
            $numberTransformer = $numberToWords->getNumberTransformer('en');
        else
            $numberTransformer = $numberToWords->getNumberTransformer(App::getLocale());
        $numberInWords = $numberTransformer->toWords(round($lims_sale_data->grand_total));

        return view('superadmin.sale.invoice', compact('lims_sale_data', 'lims_product_sale_data', 'lims_biller_data', 'lims_warehouse_data', 'lims_customer_data', 'lims_payment_data', 'numberInWords'));
    }

    public function saleAddPayment($request)
    {
        $data = $request->all();
        if (!$data['amount'])
            $data['amount'] = 0.00;

        $lims_sale_data = Sale::find($data['sale_id']);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        $lims_sale_data->paid_amount += $data['amount'];
        $balance = $lims_sale_data->grand_total - $lims_sale_data->paid_amount;
        if ($balance > 0 || $balance < 0) {

            $lims_sale_data->payment_status = 2;
        } elseif ($balance == 0) {

            $lims_sale_data->payment_status = 4;
        }

        if ($data['paid_by_id'] == 1) {

            $paying_method = 'Cash';
        } elseif ($data['paid_by_id'] == 2) {

            $paying_method = 'Gift Card';
        } elseif ($data['paid_by_id'] == 3) {

            $paying_method = 'Credit Card';
        } elseif ($data['paid_by_id'] == 4) {

            $paying_method = 'Cheque';
        } elseif ($data['paid_by_id'] == 5) {

            $paying_method = 'Paypal';
        } elseif ($data['paid_by_id'] == 6) {

            $paying_method = 'Deposit';
        } elseif ($data['paid_by_id'] == 7) {

            $paying_method = 'Points';
        }


        $cash_register_data = CashRegister::where([
            ['user_id', Auth::id()],
            ['warehouse_id', $lims_sale_data->warehouse_id],
            ['status', true]
        ])->first();

        $lims_payment_data = new Payment();
        $lims_payment_data->user_id = Auth::id();
        $lims_payment_data->sale_id = $lims_sale_data->id;
        if ($cash_register_data) {
            $lims_payment_data->cash_register_id = $cash_register_data->id;
        }
        $lims_payment_data->account_id = $data['account_id'];
        $data['payment_reference'] = 'spr-' . date("Ymd") . '-' . date("his");
        $lims_payment_data->payment_reference = $data['payment_reference'];
        $lims_payment_data->amount = $data['amount'];
        $lims_payment_data->change = $data['paying_amount'] - $data['amount'];
        $lims_payment_data->paying_method = $paying_method;
        $lims_payment_data->payment_note = $data['payment_note'];
        $lims_payment_data->save();
        $lims_sale_data->save();

        $lims_payment_data = Payment::latest()->first();
        $data['payment_id'] = $lims_payment_data->id;

        if ($paying_method == 'Gift Card') {
            $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
            $lims_gift_card_data->expense += $data['amount'];
            $lims_gift_card_data->save();
            PaymentWithGiftCard::create($data);
        } elseif ($paying_method == 'Credit Card') {
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            $token = $data['stripeToken'];
            $amount = $data['amount'];

            $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('customer_id', $lims_sale_data->customer_id)->first();

            if (!$lims_payment_with_credit_card_data) {
                // Create a Customer:
                $customer = \Stripe\Customer::create([
                    'source' => $token
                ]);

                // Charge the Customer instead of the card:
                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'customer' => $customer->id,
                ]);
                $data['customer_stripe_id'] = $customer->id;
            } else {
                $customer_id =
                    $lims_payment_with_credit_card_data->customer_stripe_id;

                $charge = \Stripe\Charge::create([
                    'amount' => $amount * 100,
                    'currency' => 'usd',
                    'customer' => $customer_id, // Previously stored, then retrieved
                ]);
                $data['customer_stripe_id'] = $customer_id;
            }
            $data['customer_id'] = $lims_sale_data->customer_id;
            $data['charge_id'] = $charge->id;
            PaymentWithCreditCard::create($data);
        } elseif ($paying_method == 'Cheque') {
            PaymentWithCheque::create($data);
        }
        // elseif ($paying_method == 'Paypal') {
        //     $provider = new ExpressCheckout;
        //     $paypal_data['items'] = [];
        //     $paypal_data['items'][] = [
        //         'name' => 'Paid Amount',
        //         'price' => $data['amount'],
        //         'qty' => 1
        //     ];
        //     $paypal_data['invoice_id'] = $lims_payment_data->payment_reference;
        //     $paypal_data['invoice_description'] = "Reference: {$paypal_data['invoice_id']}";
        //     $paypal_data['return_url'] = url('/sale/paypalPaymentSuccess/'.$lims_payment_data->id);
        //     $paypal_data['cancel_url'] = url('/sale');

        //     $total = 0;
        //     foreach($paypal_data['items'] as $item) {
        //         $total += $item['price']*$item['qty'];
        //     }

        //     $paypal_data['total'] = $total;
        //     $response = $provider->setExpressCheckout($paypal_data);
        //     return redirect($response['paypal_link']);
        // }
        elseif ($paying_method == 'Deposit') {
            $lims_customer_data->expense += $data['amount'];
            $lims_customer_data->save();
        } elseif ($paying_method == 'Points') {
            $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
            $used_points = ceil($data['amount'] / $lims_reward_point_setting_data->per_point_amount);

            $lims_payment_data->used_points = $used_points;
            $lims_payment_data->save();

            $lims_customer_data->points -= $used_points;
            $lims_customer_data->save();
        }
        $message = 'Payment created successfully';
        if ($lims_customer_data->email) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['sale_reference'] = $lims_sale_data->reference_no;
            $mail_data['payment_reference'] = $lims_payment_data->payment_reference;
            $mail_data['payment_method'] = $lims_payment_data->paying_method;
            $mail_data['grand_total'] = $lims_sale_data->grand_total;
            $mail_data['paid_amount'] = $lims_payment_data->amount;
            try {
                Mail::send('mail.payment_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Payment Details');
                });
            } catch (\Exception $e) {
                $message = 'Payment created successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }

        }
        return redirect('superAdmin/sale')->with('message', $message);

    }
    public function saleDeliveryCreate($id)
    {
        $lims_delivery_data = Delivery::where('sale_id', $id)->first();
        if ($lims_delivery_data) {
            $customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $id)->select('sales.reference_no', 'customers.name')->get();
            $delivery_data[] = $lims_delivery_data->reference_no;
            $delivery_data[] = $customer_sale[0]->reference_no;
            $delivery_data[] = $lims_delivery_data->status;
            $delivery_data[] = $lims_delivery_data->delivered_by;
            $delivery_data[] = $lims_delivery_data->recieved_by;
            $delivery_data[] = $customer_sale[0]->name;
            $delivery_data[] = $lims_delivery_data->address;
            $delivery_data[] = $lims_delivery_data->note;
        } else {
            $customer_sale = DB::table('sales')->join('customers', 'sales.customer_id', '=', 'customers.id')->where('sales.id', $id)->select('sales.reference_no', 'customers.name', 'customers.address', 'customers.city', 'customers.country')->get();

            $delivery_data[] = 'dr-' . date("Ymd") . '-' . date("his");
            $delivery_data[] = $customer_sale[0]->reference_no;
            $delivery_data[] = '';
            $delivery_data[] = '';
            $delivery_data[] = '';
            $delivery_data[] = $customer_sale[0]->name;
            $delivery_data[] = $customer_sale[0]->address . ' ' . $customer_sale[0]->city . ' ' . $customer_sale[0]->country;
            $delivery_data[] = '';
        }
        return $delivery_data;
    }

    public function saleUpdatePayment($request)
    {
        $data = $request->all();
        //return $data;
        $lims_payment_data = Payment::find($data['payment_id']);
        $lims_sale_data = Sale::find($lims_payment_data->sale_id);
        $lims_customer_data = Customer::find($lims_sale_data->customer_id);
        //updating sale table
        $amount_dif = $lims_payment_data->amount - $data['edit_amount'];
        $lims_sale_data->paid_amount = $lims_sale_data->paid_amount - $amount_dif;
        $balance = $lims_sale_data->grand_total - $lims_sale_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_sale_data->payment_status = 2;
        elseif ($balance == 0)
            $lims_sale_data->payment_status = 4;
        $lims_sale_data->save();

        if ($lims_payment_data->paying_method == 'Deposit') {
            $lims_customer_data->expense -= $lims_payment_data->amount;
            $lims_customer_data->save();
        } elseif ($lims_payment_data->paying_method == 'Points') {
            $lims_customer_data->points += $lims_payment_data->used_points;
            $lims_customer_data->save();
            $lims_payment_data->used_points = 0;
        }
        if ($data['edit_paid_by_id'] == 1) {

            $lims_payment_data->paying_method = 'Cash';
        } elseif ($data['edit_paid_by_id'] == 2) {
            if ($lims_payment_data->paying_method == 'Gift Card') {
                $lims_payment_gift_card_data = PaymentWithGiftCard::where('payment_id', $data['payment_id'])->first();

                $lims_gift_card_data = GiftCard::find($lims_payment_gift_card_data->gift_card_id);
                $lims_gift_card_data->expense -= $lims_payment_data->amount;
                $lims_gift_card_data->save();

                $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
                $lims_gift_card_data->expense += $data['edit_amount'];
                $lims_gift_card_data->save();

                $lims_payment_gift_card_data->gift_card_id = $data['gift_card_id'];
                $lims_payment_gift_card_data->save();
            } else {
                $lims_payment_data->paying_method = 'Gift Card';
                $lims_gift_card_data = GiftCard::find($data['gift_card_id']);
                $lims_gift_card_data->expense += $data['edit_amount'];
                $lims_gift_card_data->save();
                PaymentWithGiftCard::create($data);
            }
        } elseif ($data['edit_paid_by_id'] == 3) {
            $lims_pos_setting_data = PosSetting::latest()->first();
            \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
            if ($lims_payment_data->paying_method == 'Credit Card') {
                $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $lims_payment_data->id)->first();

                \Stripe\Refund::create(array(
                    "charge" => $lims_payment_with_credit_card_data->charge_id,
                ));

                $customer_id =
                    $lims_payment_with_credit_card_data->customer_stripe_id;

                $charge = \Stripe\Charge::create([
                    'amount' => $data['edit_amount'] * 100,
                    'currency' => 'usd',
                    'customer' => $customer_id
                ]);
                $lims_payment_with_credit_card_data->charge_id = $charge->id;
                $lims_payment_with_credit_card_data->save();
            } else {
                $token = $data['stripeToken'];
                $amount = $data['edit_amount'];
                $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('customer_id', $lims_sale_data->customer_id)->first();

                if (!$lims_payment_with_credit_card_data) {
                    $customer = \Stripe\Customer::create([
                        'source' => $token
                    ]);

                    $charge = \Stripe\Charge::create([
                        'amount' => $amount * 100,
                        'currency' => 'usd',
                        'customer' => $customer->id,
                    ]);
                    $data['customer_stripe_id'] = $customer->id;
                } else {
                    $customer_id =
                        $lims_payment_with_credit_card_data->customer_stripe_id;

                    $charge = \Stripe\Charge::create([
                        'amount' => $amount * 100,
                        'currency' => 'usd',
                        'customer' => $customer_id
                    ]);
                    $data['customer_stripe_id'] = $customer_id;
                }
                $data['customer_id'] = $lims_sale_data->customer_id;
                $data['charge_id'] = $charge->id;
                PaymentWithCreditCard::create($data);
            }
            $lims_payment_data->paying_method = 'Credit Card';
        } elseif ($data['edit_paid_by_id'] == 4) {
            if ($lims_payment_data->paying_method == 'Cheque') {
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $data['payment_id'])->first();
                $lims_payment_cheque_data->cheque_no = $data['edit_cheque_no'];
                $lims_payment_cheque_data->save();
            } else {
                $lims_payment_data->paying_method = 'Cheque';
                $data['cheque_no'] = $data['edit_cheque_no'];
                PaymentWithCheque::create($data);
            }
        }
        // elseif($data['edit_paid_by_id'] == 5){
        //     //updating payment data
        //     $lims_payment_data->amount = $data['edit_amount'];
        //     $lims_payment_data->paying_method = 'Paypal';
        //     $lims_payment_data->payment_note = $data['edit_payment_note'];
        //     $lims_payment_data->save();

        //     $provider = new ExpressCheckout;
        //     $paypal_data['items'] = [];
        //     $paypal_data['items'][] = [
        //         'name' => 'Paid Amount',
        //         'price' => $data['edit_amount'],
        //         'qty' => 1
        //     ];
        //     $paypal_data['invoice_id'] = $lims_payment_data->payment_reference;
        //     $paypal_data['invoice_description'] = "Reference: {$paypal_data['invoice_id']}";
        //     $paypal_data['return_url'] = url('/sale/paypalPaymentSuccess/'.$lims_payment_data->id);
        //     $paypal_data['cancel_url'] = url('/sale');

        //     $total = 0;
        //     foreach($paypal_data['items'] as $item) {
        //         $total += $item['price']*$item['qty'];
        //     }

        //     $paypal_data['total'] = $total;
        //     $response = $provider->setExpressCheckout($paypal_data);
        //     return redirect($response['paypal_link']);
        // }
        elseif ($data['edit_paid_by_id'] == 6) {
            $lims_payment_data->paying_method = 'Deposit';
            $lims_customer_data->expense += $data['edit_amount'];
            $lims_customer_data->save();
        } elseif ($data['edit_paid_by_id'] == 7) {
            $lims_payment_data->paying_method = 'Points';
            $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
            $used_points = ceil($data['edit_amount'] / $lims_reward_point_setting_data->per_point_amount);
            $lims_payment_data->used_points = $used_points;
            $lims_customer_data->points -= $used_points;
            $lims_customer_data->save();
        }
        //updating payment data
        $lims_payment_data->account_id = $data['account_id'];
        $lims_payment_data->amount = $data['edit_amount'];
        $lims_payment_data->change = $data['edit_paying_amount'] - $data['edit_amount'];
        $lims_payment_data->payment_note = $data['edit_payment_note'];
        $lims_payment_data->save();
        $message = 'Payment updated successfully';
        //collecting male data
        if ($lims_customer_data->email) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['sale_reference'] = $lims_sale_data->reference_no;
            $mail_data['payment_reference'] = $lims_payment_data->payment_reference;
            $mail_data['payment_method'] = $lims_payment_data->paying_method;
            $mail_data['grand_total'] = $lims_sale_data->grand_total;
            $mail_data['paid_amount'] = $lims_payment_data->amount;
            try {
                Mail::send('mail.payment_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Payment Details');
                });
            } catch (\Exception $e) {
                $message = 'Payment updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/sale')->with('message', $message);
    }

    public function salesProductSale($id)
    {
        try {
            $lims_product_sale_data = ProductPurchase::where('sale_id', $id)->get();
            foreach ($lims_product_sale_data as $key => $product_sale_data) {
                $product = Product::find($product_sale_data->product_id);
                $unit = Unit::find($product_sale_data->sale_unit_id);
                if ($product_sale_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::FindExactProduct($product->id, $product_sale_data->variant_id)->select('item_code')->first();
                    $product->code = $lims_product_variant_data->item_code;
                }
                if ($product_sale_data->product_batch_id) {
                    $product_batch_data = ProductBatch::select('batch_no')->find($product_sale_data->product_batch_id);
                    $product_sale[7][$key] = $product_batch_data->batch_no;
                } else
                    $product_sale[7][$key] = 'N/A';
                $product_sale[0][$key] = $product->name . ' [' . $product->code . ']';
                if ($product_sale_data->imei_number) {
                    $product_sale[0][$key] .= '<br>IMEI or Serial Number: ' . $product_sale_data->imei_number;
                }
                $product_sale[1][$key] = $product_sale_data->qty;
                $product_sale[2][$key] = $unit->unit_code;
                $product_sale[3][$key] = $product_sale_data->tax;
                $product_sale[4][$key] = $product_sale_data->tax_rate;
                $product_sale[5][$key] = $product_sale_data->discount;
                $product_sale[6][$key] = $product_sale_data->total;
            }
            return $product_sale;
        } catch (\Exception $e) {
            /*return response()->json('errors' => [$e->getMessage());*/
            //return response()->json(['errors' => [$e->getMessage()]], 422);
            return 'Something is wrong!';
        }

    }
    public function saleedit($id)
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', '=', $id)->get();
        // return dd($lims_product_sale_data);
        return view('superadmin.sale.edit', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_tax_list', 'lims_sale_data', 'lims_product_sale_data'));

    }
    public function saleupdate($request, $id)
    {
        $data = $request->all();
        $sale_id = $request->sale_id;
        //    return dd($data);
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
        //     $document->move('public/sale/documents', $documentName);
        //     $data['document'] = $documentName;
        // }
        $balance = $data['grand_total'] - $data['paid_amount'];
        if ($balance < 0 || $balance > 0)
            $data['payment_status'] = 2;
        else
            $data['payment_status'] = 4;
        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', $id)->get();
        $data['created_at'] = date("Y-m-d", strtotime(str_replace("/", "-", $data['created_at'])));
        $product_id = $data['product_id'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $product_variant_id = $data['product_variant_id'] ?? '';
        $qty = $data['qty'];
        $sale_unit = $data['sale_unit'];
        $net_unit_price = $data['net_unit_price'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $old_product_id = [];
        $product_sale = [];
        foreach ($lims_product_sale_data as $key => $product_sale_data) {
            $old_product_id[] = $product_sale_data->product_id;
            $old_product_variant_id[] = null;
            $lims_product_data = Product::find($product_sale_data->product_id);
            if (($lims_sale_data->sale_status == 1) && ($lims_product_data->product_type == 'combo')) {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                if ($lims_product_data->variant_list)
                    $variant_list = explode(",", $lims_product_data->variant_list);
                else
                    $variant_list = [];
                $qty_list = explode(",", $lims_product_data->qty_list);
                foreach ($product_list as $index => $child_id) {
                    $child_data = Product::find($child_id);
                    if (count($variant_list) && $variant_list[$index]) {
                        $child_product_variant_data = ProductVariant::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]]
                        ])->first();

                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                            ['warehouse_id', $lims_sale_data->warehouse_id],
                        ])->first();

                        $child_product_variant_data->qty += $product_sale_data->qty * $qty_list[$index];
                        $child_product_variant_data->save();
                    } else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $lims_sale_data->warehouse_id],
                        ])->first();
                    }

                    $child_data->qty += $product_sale_data->qty * $qty_list[$index];
                    $child_warehouse_data->qty += $product_sale_data->qty * $qty_list[$index];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            } elseif (($lims_sale_data->sale_status == 1) && ($product_sale_data->sale_unit_id != 0)) {
                $old_product_qty = $product_sale_data->qty;
                $lims_sale_unit_data = Unit::find($product_sale_data->sale_unit_id);
                if ($lims_sale_unit_data->operator == '*')
                    $old_product_qty = $old_product_qty * $lims_sale_unit_data->operation_value;
                else
                    $old_product_qty = $old_product_qty / $lims_sale_unit_data->operation_value;
                if ($product_sale_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_sale_data->product_id, $product_sale_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_sale_data->product_id, $product_sale_data->variant_id, $lims_sale_data->warehouse_id)
                        ->first();
                    $old_product_variant_id[$key] = $lims_product_variant_data->id;
                    $lims_product_variant_data->qty += $old_product_qty;
                    $lims_product_variant_data->save();
                } elseif ($product_sale_data->product_batch_id) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $product_sale_data->product_id],
                        ['product_batch_id', $product_sale_data->product_batch_id],
                        ['warehouse_id', $lims_sale_data->warehouse_id]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_sale_data->product_batch_id);
                    $product_batch_data->qty += $old_product_qty;
                    $product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_sale_data->product_id, $lims_sale_data->warehouse_id)
                        ->first();
                $lims_product_data->qty += $old_product_qty;
                $lims_product_warehouse_data->qty += $old_product_qty;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }

            if ($product_sale_data->imei_number) {
                if ($lims_product_warehouse_data->imei_number)
                    $lims_product_warehouse_data->imei_number .= ',' . $product_sale_data->imei_number;
                else
                    $lims_product_warehouse_data->imei_number = $product_sale_data->imei_number;
                $lims_product_warehouse_data->save();
            }

            if ($product_sale_data->variant_id && !(in_array($old_product_variant_id[$key], $product_variant_id))) {
                $product_sale_data->delete();
            } elseif (!(in_array($old_product_id[$key], $product_id))) {
                $product_sale_data->delete();
            }
        }
        foreach ($product_id as $key => $pro_id) {
            $lims_product_data = Product::find($pro_id);
            $product_sale['variant_id'] = null;
            if ($lims_product_data->product_type == 'combo' && $data['sale_status'] == 1) {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                if ($lims_product_data->variant_list)
                    $variant_list = explode(",", $lims_product_data->variant_list);
                else
                    $variant_list = [];
                $qty_list = explode(",", $lims_product_data->qty_list);

                foreach ($product_list as $index => $child_id) {
                    $child_data = Product::find($child_id);
                    if (count($variant_list) && $variant_list[$index]) {
                        $child_product_variant_data = ProductVariant::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                        ])->first();

                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                            ['warehouse_id', $data['warehouse_id']],
                        ])->first();

                        $child_product_variant_data->qty -= $qty[$key] * $qty_list[$index];
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
            if ($sale_unit[$key] != 'n/a') {
                $lims_sale_unit_data = Unit::where('unit_code', $sale_unit[$key])->first();
                $sale_unit_id = $lims_sale_unit_data->id;
                if ($data['sale_status'] == 1) {
                    $new_product_qty = $qty[$key];
                    if ($lims_sale_unit_data->operator == '*') {
                        $new_product_qty = $new_product_qty * $lims_sale_unit_data->operation_value;
                    } else {
                        $new_product_qty = $new_product_qty / $lims_sale_unit_data->operation_value;
                    }
                    if ($lims_product_data->is_variant) {
                        $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($pro_id, $product_code[$key])->first();
                        $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])
                            ->first();

                        $product_sale['variant_id'] = $lims_product_variant_data->variant_id;
                        $lims_product_variant_data->qty -= $new_product_qty;
                        $lims_product_variant_data->save();
                    } elseif ($product_batch_id[$key]) {
                        $lims_product_warehouse_data = ProductWarehouse::where([
                            ['product_id', $pro_id],
                            ['product_batch_id', $product_batch_id[$key]],
                            ['warehouse_id', $data['warehouse_id']]
                        ])->first();

                        $product_batch_data = ProductBatch::find($product_batch_id[$key]);
                        $product_batch_data->qty -= $new_product_qty;
                        $product_batch_data->save();
                    } else {
                        $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])
                            ->first();
                    }
                    $lims_product_data->qty -= $new_product_qty;
                    $lims_product_warehouse_data->qty -= $new_product_qty;
                    $lims_product_data->save();
                    $lims_product_warehouse_data->save();
                }
            } else
                $sale_unit_id = 0;

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
                $lims_product_warehouse_data->save();
            }
            //collecting mail data
            if ($product_sale['variant_id']) {
                $variant_data = Variant::select('variant_name')->find($product_sale['variant_id']);
                $mail_data['products'][$key] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
            } else {
                $mail_data['products'][$key] = $lims_product_data->product_name;
            }
            if ($lims_product_data->product_type == 'digital') {
                $mail_data['file'][$key] = asset('/product/files') . '/' . $lims_product_data->file;
            } else {
                $mail_data['file'][$key] = '';
            }
            if ($sale_unit_id) {
                $mail_data['unit'][$key] = $lims_sale_unit_data->unit_code;
            } else {
                $mail_data['unit'][$key] = '';
            }
            $product_sale['sale_id'] = $sale_id;
            // return dd($product_sale['sale_id']);
            $product_sale['product_id'] = $pro_id;
            $product_sale['imei_number'] = $imei_number[$key];
            $product_sale['product_batch_id'] = $product_batch_id[$key];
            $product_sale['qty'] = $mail_data['qty'][$key] = $qty[$key];
            $product_sale['sale_unit_id'] = $sale_unit_id;
            $product_sale['net_unit_price'] = $net_unit_price[$key];
            $product_sale['discount'] = $discount[$key];
            $product_sale['tax_rate'] = $tax_rate[$key];
            $product_sale['tax'] = $tax[$key];
            $product_sale['total'] = $mail_data['total'][$key] = $total[$key];

            if ($product_sale['variant_id'] && (in_array($product_variant_id[$key], $old_product_variant_id))) {
                ProductSale::where([
                    ['product_id', $pro_id],
                    ['variant_id', $product_sale['variant_id']],
                    ['sale_id', $id]
                ])->updateOrCreate($product_sale);
            } elseif ($product_sale['variant_id'] == '' && (in_array($pro_id, $old_product_id))) {
                ProductSale::where([
                    ['sale_id', $id],
                    ['product_id', $pro_id]
                ])->updateOrCreate($product_sale);
            } else {
                ProductSale::create($product_sale);
            }
        }
        $lims_sale_data->update($data);
        $lims_customer_data = Customer::find($data['customer_id']);
        $message = 'Sale updated successfully';
        //collecting mail data
        if ($lims_customer_data->email) {
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['reference_no'] = $lims_sale_data->reference_no;
            $mail_data['sale_status'] = $lims_sale_data->sale_status;
            $mail_data['payment_status'] = $lims_sale_data->payment_status;
            $mail_data['total_qty'] = $lims_sale_data->total_qty;
            $mail_data['total_price'] = $lims_sale_data->total_price;
            $mail_data['order_tax'] = $lims_sale_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_sale_data->order_tax_rate;
            $mail_data['order_discount'] = $lims_sale_data->order_discount;
            $mail_data['shipping_cost'] = $lims_sale_data->shipping_cost;
            $mail_data['grand_total'] = $lims_sale_data->grand_total;
            $mail_data['paid_amount'] = $lims_sale_data->paid_amount;
            if ($mail_data['email']) {
                try {
                    Mail::send('mail.sale_details', $mail_data, function ($message) use ($mail_data) {
                        $message->to($mail_data['email'])->subject('Sale Details');
                    });
                } catch (\Exception $e) {
                    $message = 'Sale updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
                }
            }
        }
        return redirect('superAdmin/sale')->with('message', $message);
    }
    public function saleProductSearch( $request)
    {
        $todayDate = date('Y-m-d');
        $product_code = explode("(", $request['data']);
        $product_info = explode("?", $request['data']);
        $customer_id = $product_info[1];
        if (strpos($request['data'], '|')) {
            $product_info = explode("|", $request['data']);
            $embeded_code = $product_code[0];
            $product_code[0] = substr($embeded_code, 0, 7);
            $qty = substr($embeded_code, 7, 5) / 1000;
        } else {
            $product_code[0] = rtrim($product_code[0], " ");
            $qty = $product_info[2];
        }
        $product_variant_id = null;
        $all_discount = DB::table('discount_plan_customers')
            ->join('discount_plans', 'discount_plans.id', '=', 'discount_plan_customers.discount_plan_id')
            ->join('discount_plan_discounts', 'discount_plans.id', '=', 'discount_plan_discounts.discount_plan_id')
            ->join('discounts', 'discounts.id', '=', 'discount_plan_discounts.discount_id')
            ->where([
                ['discount_plans.is_active', true],
                ['discounts.is_active', true],
                ['discount_plan_customers.customer_id', $customer_id]
            ])
            ->select('discounts.*')
            ->get();
        $lims_product_data = Product::where([
            ['product_code', $product_code[0]],
            ['is_active', true]
        ])->first();
        if (!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.id as product_variant_id', 'product_variants.item_code', 'product_variants.additional_price')
                ->where([
                    ['product_variants.item_code', $product_code[0]],
                    ['products.is_active', true]
                ])->first();
            $product_variant_id = $lims_product_data->product_variant_id;
        }

        $product[] = $lims_product_data->product_name;
        if ($lims_product_data->is_variant) {
            $product[] = $lims_product_data->item_code;
            // $product[] = $lims_product_data->product_code;
            $lims_product_data->product_price += $lims_product_data->additional_price;
        } else {
            $product[] = $lims_product_data->product_code;
        }

        $no_discount = 1;
        foreach ($all_discount as $key => $discount) {
            $product_list = explode(",", $discount->product_list);
            $days = explode(",", $discount->days);

            if (($discount->applicable_for == 'All' || in_array($lims_product_data->id, $product_list)) && ($todayDate >= $discount->valid_from && $todayDate <= $discount->valid_till && in_array(date('D'), $days) && $qty >= $discount->minimum_qty && $qty <= $discount->maximum_qty)) {
                if ($discount->type == 'flat') {
                    $product[] = $lims_product_data->product_price - $discount->value;
                } elseif ($discount->type == 'percentage') {
                    $product[] = $lims_product_data->product_price - ($lims_product_data->product_price * ($discount->value / 100));
                }
                $no_discount = 0;
                break;
            } else {
                continue;
            }
        }

        if ($lims_product_data->promotion && $todayDate <= $lims_product_data->last_date && $no_discount) {
            $product[] = $lims_product_data->promotion_price;
        } elseif ($no_discount)
            $product[] = $lims_product_data->product_price;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;
        if ($lims_product_data->product_type == 'standard') {
            $units = Unit::where("base_unit", $lims_product_data->unit_id)
                ->orWhere('id', $lims_product_data->unit_id)
                ->get();
            $unit_code = array();
            $unit_operator = array();
            $unit_operation_value = array();
            foreach ($units as $unit) {
                if ($lims_product_data->sale_unit_id == $unit->id) {
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
        } else {
            $product[] = 'n/a' . ',';
            $product[] = 'n/a' . ',';
            $product[] = 'n/a' . ',';
        }
        $product[] = $lims_product_data->id;
        $product[] = $product_variant_id;
        $product[] = $lims_product_data->promotion;
        $product[] = $lims_product_data->is_batch;
        $product[] = $lims_product_data->is_imei;
        $product[] = $lims_product_data->is_variant;
        $product[] = $qty;
        return $product;

    }
    public function getProductByFilter($category_id, $brand_id)
    {
        $data = [];
        if (($category_id != 0) && ($brand_id != 0)) {
            $lims_product_list = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->where([
                    ['products.is_active', true],
                    ['products.category_id', $category_id],
                    ['brand_id', $brand_id]
                ])->orWhere([
                        ['categories.parent_id', $category_id],
                        ['products.is_active', true],
                        ['brand_id', $brand_id]
                    ])->select('products.product_name', 'products.product_code', 'products.product_image')->get();
        } elseif (($category_id != 0) && ($brand_id == 0)) {
            $lims_product_list = DB::table('products')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->where([
                    ['products.is_active', true],
                    ['products.category_id', $category_id],
                ])->orWhere([
                        ['categories.parent_id', $category_id],
                        ['products.is_active', true]
                    ])->select('products.id', 'products.product_name', 'products.product_code', 'products.product_image', 'products.is_variant')->get();
        } elseif (($category_id == 0) && ($brand_id != 0)) {
            $lims_product_list = Product::where([
                ['brand_id', $brand_id],
                ['is_active', true]
            ])
                ->select('products.id', 'products.product_name', 'products.product_code', 'products.product_image', 'products.is_variant')
                ->get();
        } else
            $lims_product_list = Product::where('is_active', true)->get();

        $index = 0;
        foreach ($lims_product_list as $product) {
            if ($product->is_variant) {
                $lims_product_data = Product::select('id')->find($product->id);
                $lims_product_variant_data = $lims_product_data->variant()->orderBy('position')->get();
                foreach ($lims_product_variant_data as $key => $variant) {
                    $data['product_name'][$index] = $product->product_name . ' [' . $variant->variant_name . ']';
                    $data['product_code'][$index] = $variant->pivot['item_code'];
                    $images = explode(",", $product->product_image);
                    $data['product_image'][$index] = $images[0];
                    $index++;
                }
            } else {
                $data['product_name'][$index] = $product->product_name;
                $data['product_code'][$index] = $product->product_code;
                $images = explode(",", $product->product_image);
                $data['product_image'][$index] = $images[0];
                $index++;
            }
        }
        return $data;
    }

    public function saleCheckBatchAvailability($product_id, $batch_no, $warehouse_id)
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
    public function saleCheckDiscount($request)
    {
        $qty = $request->input('qty');
        $customer_id = $request->input('customer_id');
        $lims_product_data = Product::select('id', 'price', 'promotion', 'promotion_price', 'last_date')->find($request->input('product_id'));
        $todayDate = date('Y-m-d');
        $all_discount = DB::table('discount_plan_customers')
            ->join('discount_plans', 'discount_plans.id', '=', 'discount_plan_customers.discount_plan_id')
            ->join('discount_plan_discounts', 'discount_plans.id', '=', 'discount_plan_discounts.discount_plan_id')
            ->join('discounts', 'discounts.id', '=', 'discount_plan_discounts.discount_id')
            ->where([
                ['discount_plans.is_active', true],
                ['discounts.is_active', true],
                ['discount_plan_customers.customer_id', $customer_id]
            ])
            ->select('discounts.*')
            ->get();
        $no_discount = 1;
        foreach ($all_discount as $key => $discount) {
            $product_list = explode(",", $discount->product_list);
            $days = explode(",", $discount->days);

            if (($discount->applicable_for == 'All' || in_array($lims_product_data->id, $product_list)) && ($todayDate >= $discount->valid_from && $todayDate <= $discount->valid_till && in_array(date('D'), $days) && $qty >= $discount->minimum_qty && $qty <= $discount->maximum_qty)) {
                if ($discount->type == 'flat') {
                    $price = $lims_product_data->price - $discount->value;
                } elseif ($discount->type == 'percentage') {
                    $price = $lims_product_data->price - ($lims_product_data->price * ($discount->value / 100));
                }
                $no_discount = 0;
                break;
            } else {
                continue;
            }
        }

        if ($lims_product_data->promotion && $todayDate <= $lims_product_data->last_date && $no_discount) {
            $price = $lims_product_data->promotion_price;
        } elseif ($no_discount)
            $price = $lims_product_data->price;

        $data = [$price, $lims_product_data->promotion];
        return $data;
    }
    public function saleGetPayment($id)
    {
        $lims_payment_list = Payment::where('sale_id', $id)->get();
        $date = [];
        $payment_reference = [];
        $paid_amount = [];
        $paying_method = [];
        $payment_id = [];
        $payment_note = [];
        $gift_card_id = [];
        $cheque_no = [];
        $change = [];
        $paying_amount = [];
        $account_name = [];
        $account_id = [];

        foreach ($lims_payment_list as $payment) {
            $date[] = date(config('date_format'), strtotime($payment->created_at->toDateString())) . ' ' . $payment->created_at->toTimeString();
            $payment_reference[] = $payment->payment_reference;
            $paid_amount[] = $payment->amount;
            $change[] = $payment->change;
            $paying_method[] = $payment->paying_method;
            $paying_amount[] = $payment->amount + $payment->change;
            if ($payment->paying_method == 'Gift Card') {
                $lims_payment_gift_card_data = PaymentWithGiftCard::where('payment_id', $payment->id)->first();
                $gift_card_id[] = $lims_payment_gift_card_data->gift_card_id;
            } elseif ($payment->paying_method == 'Cheque') {
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $payment->id)->first();
                $cheque_no[] = $lims_payment_cheque_data->cheque_no;
            } else {
                $cheque_no[] = $gift_card_id[] = null;
            }
            $payment_id[] = $payment->id;
            $payment_note[] = $payment->payment_note;
            $lims_account_data = Account::find($payment->account_id);
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
        $payments[] = $gift_card_id;
        $payments[] = $change;
        $payments[] = $paying_amount;
        $payments[] = $account_name;
        $payments[] = $account_id;
        return $payments;
    }

    public function saleDeletePayment($request)
    {
        $lims_payment_data = Payment::find($request['id']);
        $lims_sale_data = Sale::where('id', $lims_payment_data->sale_id)->first();
        $lims_sale_data->paid_amount -= $lims_payment_data->amount;
        $balance = $lims_sale_data->grand_total - $lims_sale_data->paid_amount;
        if ($balance > 0 || $balance < 0)
            $lims_sale_data->payment_status = 1;
        elseif ($balance == 0)
            $lims_sale_data->payment_status = 2;
        $lims_sale_data->save();

        // if($lims_payment_data->paying_method == 'Credit Card'){
        //     $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $request['id'])->first();
        //     $lims_pos_setting_data = PosSetting::latest()->first();
        //     \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
        //     \Stripe\Refund::create(array(
        //       "charge" => $lims_payment_with_credit_card_data->charge_id,
        //     ));

        //     $lims_payment_with_credit_card_data->delete();
        // }
        // elseif ($lims_payment_data->paying_method == 'Cheque') {
        //     $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $request['id'])->first();
        //     $lims_payment_cheque_data->delete();
        // }
        $lims_payment_data->delete();
        return redirect('superAdmin/sale')->with('not_permitted', 'Payment deleted successfully');
    }

    // public function saleDeletePayment(Request $request)
    // {
    //     $lims_payment_data = Payment::find($request['id']);
    //     $lims_sale_data = Sale::where('id', $lims_payment_data->sale_id)->first();
    //     $lims_sale_data->paid_amount -= $lims_payment_data->amount;
    //     $balance = $lims_sale_data->grand_total - $lims_sale_data->paid_amount;
    //     if($balance > 0 || $balance < 0)
    //         $lims_sale_data->payment_status = 1;
    //     elseif ($balance == 0)
    //         $lims_sale_data->payment_status = 2;
    //     $lims_sale_data->save();

    //     // if($lims_payment_data->paying_method == 'Credit Card'){
    //     //     $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $request['id'])->first();
    //     //     $lims_pos_setting_data = PosSetting::latest()->first();
    //     //     \Stripe\Stripe::setApiKey($lims_pos_setting_data->stripe_secret_key);
    //     //     \Stripe\Refund::create(array(
    //     //       "charge" => $lims_payment_with_credit_card_data->charge_id,
    //     //     ));

    //     //     $lims_payment_with_credit_card_data->delete();
    //     // }
    //     // elseif ($lims_payment_data->paying_method == 'Cheque') {
    //     //     $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $request['id'])->first();
    //     //     $lims_payment_cheque_data->delete();
    //     // }
    //     $lims_payment_data->delete();
    //     return redirect('superAdmin/sale')->with('not_permitted', 'Payment deleted successfully');
    // }

    public function salePos()
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_customer_group_all = CustomerGroup::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_reward_point_setting_data = RewardPointSetting::latest()->first();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_product_list = Product::select('id', 'product_name', 'product_code', 'product_image')->ActiveFeatured()->whereNull('is_variant')->get();
        foreach ($lims_product_list as $key => $product) {
            $images = explode(",", $product->image);
            $product->base_image = $images[0];
        }
        $lims_product_list_with_variant = Product::select('id', 'product_name', 'product_code', 'product_image')->ActiveFeatured()->whereNotNull('is_variant')->get();

        foreach ($lims_product_list_with_variant as $product) {
            $images = explode(",", $product->image);
            $product->base_image = $images[0];
            $lims_product_variant_data = $product->variant()->orderBy('position')->get();
            $main_name = $product->name;
            $temp_arr = [];
            foreach ($lims_product_variant_data as $key => $variant) {
                $product->name = $main_name . ' [' . $variant->name . ']';
                $product->code = $variant->pivot['item_code'];
                $lims_product_list[] = clone ($product);
            }
        }

        $product_number = count($lims_product_list);
        $lims_pos_setting_data = PosSetting::latest()->first();
        $lims_brand_list = Brand::where('status', true)->get();
        $lims_category_list = Category::where('status', true)->get();

        if (Auth::user()->role_id > 2 && config('staff_access') == 'own') {
            $recent_sale = Sale::where([
                ['sale_status', 1],
                ['user_id', Auth::id()]
            ])->orderBy('id', 'desc')->take(10)->get();
            $recent_draft = Sale::where([
                ['sale_status', 3],
                ['user_id', Auth::id()]
            ])->orderBy('id', 'desc')->take(10)->get();
        } else {
            $recent_sale = Sale::where('sale_status', 1)->orderBy('id', 'desc')->take(10)->get();
            $recent_draft = Sale::where('sale_status', 3)->orderBy('id', 'desc')->take(10)->get();
        }
        $lims_coupon_list = Coupon::where('is_active', true)->get();
        $flag = 0;

        return view('superadmin.sale.pos', compact('lims_customer_list', 'lims_customer_group_all', 'lims_warehouse_list', 'lims_reward_point_setting_data', 'lims_product_list', 'product_number', 'lims_tax_list', 'lims_biller_list', 'lims_pos_setting_data', 'lims_brand_list', 'lims_category_list', 'recent_sale', 'recent_draft', 'lims_coupon_list', 'flag'));

    }

    public function saledestroy($id)
    {
        $url = url()->previous();
        $lims_sale_data = Sale::find($id);
        $lims_product_sale_data = ProductSale::where('sale_id', $id)->get();
        $lims_delivery_data = Delivery::where('sale_id', $id)->first();
        if ($lims_sale_data->sale_status == 3)
            $message = 'Draft deleted successfully';
        else
            $message = 'Sale deleted successfully';

        foreach ($lims_product_sale_data as $product_sale) {
            $lims_product_data = Product::find($product_sale->product_id);
            //adjust product quantity
            if (($lims_sale_data->sale_status == 1) && ($lims_product_data->type == 'combo')) {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                $qty_list = explode(",", $lims_product_data->qty_list);
                if ($lims_product_data->variant_list)
                    $variant_list = explode(",", $lims_product_data->variant_list);
                else
                    $variant_list = [];
                foreach ($product_list as $index => $child_id) {
                    $child_data = Product::find($child_id);
                    if (count($variant_list) && $variant_list[$index]) {
                        $child_product_variant_data = ProductVariant::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]]
                        ])->first();

                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['variant_id', $variant_list[$index]],
                            ['warehouse_id', $lims_sale_data->warehouse_id],
                        ])->first();

                        $child_product_variant_data->qty += $product_sale->qty * $qty_list[$index];
                        $child_product_variant_data->save();
                    } else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $lims_sale_data->warehouse_id],
                        ])->first();
                    }

                    $child_data->qty += $product_sale->qty * $qty_list[$index];
                    $child_warehouse_data->qty += $product_sale->qty * $qty_list[$index];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            } elseif (($lims_sale_data->sale_status == 1) && ($product_sale->sale_unit_id != 0)) {
                $lims_sale_unit_data = Unit::find($product_sale->sale_unit_id);
                if ($lims_sale_unit_data->operator == '*')
                    $product_sale->qty = $product_sale->qty * $lims_sale_unit_data->operation_value;
                else
                    $product_sale->qty = $product_sale->qty / $lims_sale_unit_data->operation_value;
                if ($product_sale->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($lims_product_data->id, $product_sale->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($lims_product_data->id, $product_sale->variant_id, $lims_sale_data->warehouse_id)->first();
                    $lims_product_variant_data->qty += $product_sale->qty;
                    $lims_product_variant_data->save();
                } elseif ($product_sale->product_batch_id) {
                    $lims_product_batch_data = ProductBatch::find($product_sale->product_batch_id);
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_sale->product_batch_id],
                        ['warehouse_id', $lims_sale_data->warehouse_id]
                    ])->first();

                    $lims_product_batch_data->qty -= $product_sale->qty;
                    $lims_product_batch_data->save();
                } else {
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($lims_product_data->id, $lims_sale_data->warehouse_id)->first();
                }

                $lims_product_data->qty += $product_sale->qty;
                $lims_product_warehouse_data->qty += $product_sale->qty;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            if ($product_sale->imei_number) {
                if ($lims_product_warehouse_data->imei_number)
                    $lims_product_warehouse_data->imei_number .= ',' . $product_sale->imei_number;
                else
                    $lims_product_warehouse_data->imei_number = $product_sale->imei_number;
                $lims_product_warehouse_data->save();
            }
            $product_sale->delete();
        }

        $lims_payment_data = Payment::where('sale_id', $id)->get();
        foreach ($lims_payment_data as $payment) {
            if ($payment->paying_method == 'Gift Card') {
                $lims_payment_with_gift_card_data = PaymentWithGiftCard::where('payment_id', $payment->id)->first();
                $lims_gift_card_data = GiftCard::find($lims_payment_with_gift_card_data->gift_card_id);
                $lims_gift_card_data->expense -= $payment->amount;
                $lims_gift_card_data->save();
                $lims_payment_with_gift_card_data->delete();
            } elseif ($payment->paying_method == 'Cheque') {
                $lims_payment_cheque_data = PaymentWithCheque::where('payment_id', $payment->id)->first();
                $lims_payment_cheque_data->delete();
            }
            // elseif($payment->paying_method == 'Credit Card'){
            //     $lims_payment_with_credit_card_data = PaymentWithCreditCard::where('payment_id', $payment->id)->first();
            //     $lims_payment_with_credit_card_data->delete();
            // }
            // elseif($payment->paying_method == 'Paypal'){
            //     $lims_payment_paypal_data = PaymentWithPaypal::where('payment_id', $payment->id)->first();
            //     if($lims_payment_paypal_data)
            //         $lims_payment_paypal_data->delete();
            // }
            elseif ($payment->paying_method == 'Deposit') {
                $lims_customer_data = Customer::find($lims_sale_data->customer_id);
                $lims_customer_data->expense -= $payment->amount;
                $lims_customer_data->save();
            }
            $payment->delete();
        }
        if ($lims_delivery_data)
            $lims_delivery_data->delete();
        if ($lims_sale_data->coupon_id) {
            $lims_coupon_data = Coupon::find($lims_sale_data->coupon_id);
            $lims_coupon_data->used -= 1;
            $lims_coupon_data->save();
        }
        $lims_sale_data->delete();
        return response()->json(['status' => "success"]);
    }

    // ==========================Pos ==================
    public function posSetting()
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_pos_setting_data = PosSetting::latest()->first();
        return view('superadmin.setting.pos_setting', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_pos_setting_data'));
    }

    public function posSettingStore($request)
    {
        $data = $request->all();

        // if(!env('USER_VERIFIED'))
        //     return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');

        // //writting paypal info in .env file
        // $path = '.env';
        // $searchArray = array('PAYPAL_LIVE_API_USERNAME='.env('PAYPAL_LIVE_API_USERNAME'), 'PAYPAL_LIVE_API_PASSWORD='.env('PAYPAL_LIVE_API_PASSWORD'), 'PAYPAL_LIVE_API_SECRET='.env('PAYPAL_LIVE_API_SECRET') );

        // $replaceArray = array('PAYPAL_LIVE_API_USERNAME='.$data['paypal_username'], 'PAYPAL_LIVE_API_PASSWORD='.$data['paypal_password'], 'PAYPAL_LIVE_API_SECRET='.$data['paypal_signature'] );

        // file_put_contents($path, str_replace($searchArray, $replaceArray, file_get_contents($path)));

        $pos_setting = PosSetting::firstOrNew(['id' => 1]);
        $pos_setting->id = 1;
        $pos_setting->customer_id = $data['customer_id'];
        $pos_setting->warehouse_id = $data['warehouse_id'];
        $pos_setting->biller_id = $data['biller_id'];
        $pos_setting->product_number = $data['product_number'];
        $pos_setting->stripe_public_key = $data['stripe_public_key'];
        $pos_setting->stripe_secret_key = $data['stripe_secret_key'];
        // $pos_setting->options= implode(",", $data['options']);
        $arrayData = implode(",", $data['options']);

        $jsonData = json_encode($arrayData);
        $pos_setting->options = $jsonData;

        // if (isset($data['options'])) {
        //         $options = implode(",", $data['options']);
        //         $pos_setting->options = array($options);        // array data insert into options like:  ["cash,card,cheque,gift_card,deposit,paypal"];
        //         // $pos_setting->options = $data['options'];    // array data insert into options like:  ["cash","card","cheque","gift_card","deposit","paypal"];
        // }
        // $arrayData = $data['options'];

        // https://techsolutionstuff.com/post/how-to-convert-php-array-to-json-object
        // $keyArrayData = ['city'=>'Dhaka', 'place'=>'Mirpur-12'];
        // $jsonData = json_encode($keyArrayData) ; // array data to jeson data like: "{"city":"Delhi","place":"Red Fort"}"
        // $jsonData = json_encode($arrayData) ; // array data to jeson data like: "["cash","card","cheque","gift_card","deposit","paypal"]"    add "   "

        // https://stackoverflow.com/questions/3281354/how-to-create-a-json-object
        // $jsonData = json_encode($arrayData,  JSON_FORCE_OBJECT) ;  // create jeson object like:   "{"0":"cash","1":"card","2":"cheque","3":"gift_card","4":"deposit","5":"paypal"}"
        // return dd($jsonData);

        // for($i = 0; $i < count($data['options']); $i++) {
        //     $pos_setting->options  = $data['options'][$i];
        // }

        // $pos_setting[] = $data['options'];
        if (!isset($data['keybord_active']))
            $pos_setting->keybord_active = false;
        else
            $pos_setting->keybord_active = true;
        $pos_setting->save();
        return redirect()->back()->with('message', 'POS setting updated successfully');
    }
    // ========================= Return Sale ==============

    public function returnSaleIndex($request)
    {
        if ($request->ajax()) {
            $salesReturns = Returns::latest()->get();

            $salesReturns = Returns::latest()->get();
            if ($request->filled('from_date') && $request->filled('to_date')) {
                $salesReturns = $salesReturns->whereBetween('created_at', [$request->from_date, $request->to_date]);
            }
            // custom field search
            $customSalesReturns = Returns::select('*');
            if ($request->filled('warehouse_id')) {
                $salesReturns = $customSalesReturns->where('warehouse_id', $request->warehouse_id);
            }
            if ($request->filled('reference_no')) {
                $salesReturns = $customSalesReturns->where('reference_no', 'like', '%' . $request->reference_no . '%');
            }

            return Datatables::of($salesReturns)
                ->addIndexColumn()
                ->addColumn('date', function ($row) {
                    $date = date("Y-m-d", strtotime($row->created_at));
                    return $date;
                })
                ->addColumn('sl_reference', function ($row) {
                    if ($row->sale_id) {
                        $sale_data = Sale::select('reference_no')->find($row->sale_id);
                        $sl_reference = $sale_data->reference_no;
                        return $sl_reference;
                    } else {
                        return 'N/A';
                    }
                })
                ->addColumn('warehouse', function ($row) {
                    $warehouse = $row->warehouse->name;
                    return $warehouse;
                })
                ->addColumn('biller', function ($row) {
                    $biller = $row->biller->name;
                    return $biller;
                })
                ->addColumn('coustomer', function ($row) {
                    $coustomer = $row->customer->name;
                    return $coustomer;
                })

                ->addColumn('groundTotal', function ($row) {
                    $ground = number_format($row->grand_total, 2);
                    return ($ground);
                })

                ->addColumn('action', function ($row) {

                    if ($row->sale_id) {
                        $sale_data = Sale::select('reference_no')->find($row->sale_id);
                        $sl_reference = $sale_data->reference_no;
                    } else {
                        $sl_reference = 'N/A';
                    }
                    $user = new User();

                    // View Button
                    $viewButton =
                        '<a href="javascript:void(0)" style="box-shadow:none;" class="btn btn-link view"
                            data-id = "' . $row->id . '"
                            data-date = "' . date('d-m-Y', strtotime($row->created_at)) . '"
                            data-reference_no = "' . $row->reference_no . '"
                            data-sale_reference = "' . $sl_reference . '"

                            data-coustomername = "' . $row->customer->name . '"
                            data-coustomerphone = "' . $row->customer->phone_number . '"
                            data-coustomeremail = "' . $row->customer->email . '"
                            data-coustomeraddress = "' . $row->customer->address . '"

                            data-billername = "' . $row->biller->name . '"
                            data-billerphone = "' . $row->biller->phone_number . '"
                            data-billeremail = "' . $row->biller->email . '"
                            data-billeraddress = "' . $row->biller->address . '"


                            data-warehouse_name = "' . $row->warehouse->name . '"
                            data-warehouse_phone = "' . $row->warehouse->phone . '"
                            data-warehouse_address = "' . $row->warehouse->address . '"

                            data-total_discount = "' . $row->total_discount . '"
                            data-order_tax = "' . $row->order_tax . '"
                            data-total_cost = "' . $row->total_price . '"
                            data-total_tax = "' . $row->total_tax . '"
                            data-grand_total = "' . $row->grand_total . '"

                            data-return_note = "' . $row->return_note . '"
                            data-staff_note = "' . $row->staff_note . '"

                            data-user_name = "' . $row->user->name . '"
                            data-user_email = "' . $row->user->email . '"

                            ><i class="fa fa-eye"></i> ' . trans('View') . '</a>';
                    $updateButton = '<a href="' . route('superAdmin.return-sale.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i> ' . trans('Edit') . '</a>';

                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-link  deletereturnpurchase"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';

                    $nasted = '<div class="btn-group">
                                    <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action
                                    <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default menuScrolling" user="menu">
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

        if ($request->input('warehouse_id')) {
            $warehouse_id = $request->input('warehouse_id');
        } else {
            $warehouse_id = 0;
        }

        if ($request->input('starting_date')) {
            $starting_date = $request->input('starting_date');
            $ending_date = $request->input('ending_date');
        } else {
            $starting_date = date("Y-m-d", strtotime(date('Y-m-d', strtotime('-1 year', strtotime(date('Y-m-d'))))));
            $ending_date = date("Y-m-d");
        }

        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.return.index', compact('starting_date', 'ending_date', 'warehouse_id', 'lims_warehouse_list'));
    }
    public function returnSaleCreate($request)
    {

        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_sale_data = Sale::select('id')->where('reference_no', $request->input('reference_no'))->first();
        $lims_product_sale_data = ProductSale::where('sale_id', $lims_sale_data->id)->get();

        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.return.create', compact('lims_tax_list', 'lims_sale_data', 'lims_product_sale_data', 'lims_warehouse_list'));

    }

    public function returnGetCustomerGroup($id)
    {
        $lims_customer_data = Customer::find($id);
        $lims_customer_group_data = CustomerGroup::find($lims_customer_data->customer_group_id);
        return $lims_customer_group_data->percentage;
    }
    public function returnGetProduct($id)
    {

        //retrieve data of product without variant
        $lims_product_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNull('product_warehouses.product_batch_id')
            ->select('product_warehouses.*')
            ->get();

        config()->set('database.connections.mysql.strict', false);
        \DB::reconnect(); //important as the existing connection if any would be in strict mode

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
        $lims_product_with_variant_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
            ])->whereNotNull('product_warehouses.variant_id')->select('product_warehouses.*')->get();

        $product_code = [];
        $product_name = [];
        $product_qty = [];
        $product_price = [];
        $product_type = [];
        $is_batch = [];
        $product_data = [];
        foreach ($lims_product_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $product_price[] = $product_warehouse->price;
            $lims_product_data = Product::select('product_code', 'product_name', 'product_type', 'is_batch')->find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $is_batch[] = null;
        }
        //product with batches
        foreach ($lims_product_with_batch_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $product_price[] = $product_warehouse->price;
            $lims_product_data = Product::select('product_code', 'product_name', 'product_type', 'is_batch')->find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->type;
            $product_batch_data = ProductBatch::select('id', 'batch_no')->find($product_warehouse->product_batch_id);
            $is_batch[] = $lims_product_data->is_batch;
        }
        foreach ($lims_product_with_variant_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::select('product_name', 'product_type')->find($product_warehouse->product_id);
            $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_warehouse->product_id, $product_warehouse->variant_id)->first();
            $product_code[] = $lims_product_variant_data->item_code;
            $product_name[] = htmlspecialchars($lims_product_data->product_name);
            $product_type[] = $lims_product_data->product_type;
            $is_batch[] = null;
        }
        $lims_product_data = Product::select('product_code', 'product_name', 'product_type')->where('is_active', true)->whereNotIn('product_type', ['standard'])->get();
        foreach ($lims_product_data as $product) {
            $product_qty[] = $product->qty;
            $product_code[] = $product->product_code;
            $product_name[] = htmlspecialchars($product->product_name);
            $product_type[] = $product->product_type;
            $is_batch[] = null;
        }
        $product_data[] = $product_code;
        $product_data[] = $product_name;
        $product_data[] = $product_qty;
        $product_data[] = $product_type;
        $product_data[] = $product_price;
        $product_data[] = $is_batch;
        return $product_data;
    }
    public function returnLimsProductSearch( $request)
    {
        $todayDate = date('Y-m-d');
        $product_code = explode("(", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $lims_product_data = Product::where('product_code', $product_code[0])->first();
        $product_variant_id = null;
        if (!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.id as product_variant_id', 'product_variants.item_code', 'product_variants.additional_price')
                ->where('product_variants.item_code', $product_code[0])
                ->first();
            $lims_product_data->product_code = $lims_product_data->item_code;
            $lims_product_data->product_price += $lims_product_data->additional_price;
            $product_variant_id = $lims_product_data->product_variant_id;
        }
        $product[] = $lims_product_data->product_name;
        $product[] = $lims_product_data->product_code;
        if ($lims_product_data->promotion && $todayDate <= $lims_product_data->last_date) {
            $product[] = $lims_product_data->promotion_price;
        } else
            $product[] = $lims_product_data->product_price;

        if ($lims_product_data->tax_id) {
            $lims_tax_data = Tax::find($lims_product_data->tax_id);
            $product[] = $lims_tax_data->rate;
            $product[] = $lims_tax_data->name;
        } else {
            $product[] = 0;
            $product[] = 'No Tax';
        }
        $product[] = $lims_product_data->tax_method;
        if ($lims_product_data->product_type == 'standard') {
            $units = Unit::where("id", $lims_product_data->unit_id)
                ->orWhere('id', $lims_product_data->unit_id)
                ->get();
            $unit_code = array();
            $unit_operator = array();
            $unit_operation_value = array();
            foreach ($units as $unit) {
                if ($lims_product_data->sale_unit_id == $unit->id) {
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
        } else {
            $product[] = 'n/a' . ',';
            $product[] = 'n/a' . ',';
            $product[] = 'n/a' . ',';
        }
        $product[] = $lims_product_data->id;
        $product[] = $product_variant_id;
        $product[] = $lims_product_data->promotion;
        $product[] = $lims_product_data->is_imei;
        return $product;
    }
    public function productReturnData($id)
    {
        $lims_product_return_data = ProductReturn::where('return_id', $id)->get();
        foreach ($lims_product_return_data as $key => $product_return_data) {
            $product = Product::find($product_return_data->product_id);
            if ($product_return_data->sale_unit_id != 0) {
                $unit_data = Unit::find($product_return_data->sale_unit_id);
                $unit = $unit_data->unit_code;
            } else
                $unit = '';
            if ($product_return_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                $product->product_code = $lims_product_variant_data->item_code;
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
    public function returnSendMail( $request)
    {
        $data = $request->all();
        $lims_return_data = Returns::find($data['return_id']);
        $lims_product_return_data = ProductReturn::where('return_id', $data['return_id'])->get();
        $lims_customer_data = Customer::find($lims_return_data->customer_id);
        if ($lims_customer_data->email) {
            //collecting male data
            $mail_data['email'] = $lims_customer_data->email;
            $mail_data['reference_no'] = $lims_return_data->reference_no;
            $mail_data['total_qty'] = $lims_return_data->total_qty;
            $mail_data['total_price'] = $lims_return_data->total_price;
            $mail_data['order_tax'] = $lims_return_data->order_tax;
            $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
            $mail_data['grand_total'] = $lims_return_data->grand_total;

            foreach ($lims_product_return_data as $key => $product_return_data) {
                $lims_product_data = Product::find($product_return_data->product_id);
                if ($product_return_data->variant_id) {
                    $variant_data = Variant::find($product_return_data->variant_id);
                    $mail_data['products'][$key] = $lims_product_data->product_name . ' [' . $variant_data->variant_name . ']';
                } else
                    $mail_data['products'][$key] = $lims_product_data->product_name;

                if ($product_return_data->sale_unit_id) {
                    $lims_unit_data = Unit::find($product_return_data->sale_unit_id);
                    $mail_data['unit'][$key] = $lims_unit_data->unit_code;
                } else
                    $mail_data['unit'][$key] = '';

                $mail_data['qty'][$key] = $product_return_data->qty;
                $mail_data['total'][$key] = $product_return_data->qty;
            }

            try {
                Mail::send('mail.return_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Return Details');
                });
                $message = 'Mail sent successfully';
            } catch (\Exception $e) {
                $message = 'Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        } else
            $message = 'Customer doesnt have email!';

        return redirect()->back()->with('message', $message);
    }
    public function returnSaleStore( $request)
    {
        $data = $request->all();
        // return dd($data);
        $data['reference_no'] = 'rr-' . date("Ymd") . '-' . date("his");
        $lims_sale_data = Sale::select('warehouse_id', 'customer_id', 'biller_id')->find($data['sale_id']);
        $data['user_id'] = Auth::id();
        $data['customer_id'] = $lims_sale_data->customer_id;
        $data['warehouse_id'] = $lims_sale_data->warehouse_id;
        $data['biller_id'] = $lims_sale_data->biller_id;
        $cash_register_data = CashRegister::where([
            ['user_id', $data['user_id']],
            ['warehouse_id', $data['warehouse_id']],
            ['status', true]
        ])->first();
        if ($cash_register_data)
            $data['cash_register_id'] = $cash_register_data->id;
        $lims_account_data = Account::where('is_default', true)->first();
        $data['account_id'] = $lims_account_data->id;

        // $lims_return_data =  Returns::insert($data);
        $lims_return_data = Returns::create($data);

        $lims_customer_data = Customer::find($data['customer_id']);
        //collecting male data
        $mail_data['email'] = $lims_customer_data->email;
        $mail_data['reference_no'] = $lims_return_data->reference_no;
        $mail_data['total_qty'] = $lims_return_data->total_qty;
        $mail_data['total_price'] = $lims_return_data->total_price;
        $mail_data['order_tax'] = $lims_return_data->order_tax;
        $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
        $mail_data['grand_total'] = $lims_return_data->grand_total;

        $product_id = $data['is_return'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'] ?? '';
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $sale_unit = $data['sale_unit'];
        $net_unit_price = $data['net_unit_price'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];

        foreach ($product_id as $pro_id) {
            $key = array_search($pro_id, $data['product_id']);

            $lims_product_data = Product::find($pro_id);
            $variant_id = null;
            if ($sale_unit[$key] != 'n/a') {
                $lims_sale_unit_data = Unit::where('unit_code', $sale_unit[$key])->first();
                $sale_unit_id = $lims_sale_unit_data->id;
                if ($lims_sale_unit_data->operator == '*')
                    $quantity = $qty[$key] * $lims_sale_unit_data->operation_value;
                elseif ($lims_sale_unit_data->operator == '/')
                    $quantity = $qty[$key] / $lims_sale_unit_data->operation_value;

                if ($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::
                        select('id', 'variant_id', 'qty')
                        ->FindExactProductWithCode($pro_id, $product_code[$key])
                        ->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])->first();
                    $lims_product_variant_data->qty += $quantity;
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
                    $lims_product_batch_data->qty += $quantity;
                    $lims_product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])->first();

                $lims_product_data->qty += $quantity;
                $lims_product_warehouse_data->qty += $quantity;

                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            } else {
                if ($lims_product_data->product_type == 'combo') {
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

                        $child_data->qty += $qty[$key] * $qty_list[$index];
                        $child_warehouse_data->qty += $qty[$key] * $qty_list[$index];

                        $child_data->save();
                        $child_warehouse_data->save();
                    }
                }
                $sale_unit_id = 0;
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

            if ($sale_unit_id)
                $mail_data['unit'][$key] = $lims_sale_unit_data->unit_code;
            else
                $mail_data['unit'][$key] = '';

            $mail_data['qty'][$key] = $qty[$key];
            $mail_data['total'][$key] = $total[$key];


            ProductReturn::insert(
                ['return_id' => $lims_return_data->id, 'product_id' => $pro_id, 'product_batch_id' => $product_batch_id[$key], 'variant_id' => $variant_id, 'imei_number' => $imei_number[$key], 'qty' => $qty[$key], 'sale_unit_id' => $sale_unit_id, 'net_unit_price' => $net_unit_price[$key], 'discount' => $discount[$key], 'tax_rate' => $tax_rate[$key], 'tax' => $tax[$key], 'total' => $total[$key], 'created_at' => \Carbon\Carbon::now(), 'updated_at' => \Carbon\Carbon::now()]
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
        return redirect('superAdmin/return-sale')->with('message', $message);
    }
    public function returnSaleEdit($id)
    {
        $lims_customer_list = Customer::where('is_active', true)->get();
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_biller_list = Biller::where('is_active', true)->get();
        $lims_tax_list = Tax::where('is_active', true)->get();
        $lims_return_data = Returns::find($id);
        $lims_product_return_data = ProductReturn::where('return_id', $id)->get();
        return view('superadmin.return.edit', compact('lims_customer_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_tax_list', 'lims_return_data', 'lims_product_return_data'));

    }
    public function returnSaleUpdate($request, $id)
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

        $lims_return_data = Returns::find($id);
        $lims_product_return_data = ProductReturn::where('return_id', $id)->get();

        $product_id = $data['product_id'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $product_variant_id = $data['product_variant_id'];
        $qty = $data['qty'];
        $sale_unit = $data['sale_unit'];
        $net_unit_price = $data['net_unit_price'];
        $discount = $data['discount'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];

        foreach ($lims_product_return_data as $key => $product_return_data) {
            $old_product_id[] = $product_return_data->product_id;
            $old_product_variant_id[] = null;
            $lims_product_data = Product::find($product_return_data->product_id);
            if ($lims_product_data->type == 'combo') {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                $qty_list = explode(",", $lims_product_data->qty_list);

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
                            ['warehouse_id', $lims_return_data->warehouse_id],
                        ])->first();

                        $child_product_variant_data->qty -= $qty[$key] * $qty_list[$index];
                        $child_product_variant_data->save();
                    } else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $lims_return_data->warehouse_id],
                        ])->first();
                    }

                    $child_data->qty -= $product_return_data->qty * $qty_list[$index];
                    $child_warehouse_data->qty -= $product_return_data->qty * $qty_list[$index];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            } elseif ($product_return_data->sale_unit_id != 0) {
                $lims_sale_unit_data = Unit::find($product_return_data->sale_unit_id);
                if ($lims_sale_unit_data->operator == '*')
                    $quantity = $product_return_data->qty * $lims_sale_unit_data->operation_value;
                elseif ($lims_sale_unit_data->operator == '/')
                    $quantity = $product_return_data->qty / $lims_sale_unit_data->operation_value;

                if ($product_return_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_return_data->product_id, $product_return_data->variant_id, $lims_return_data->warehouse_id)
                        ->first();
                    $old_product_variant_id[$key] = $lims_product_variant_data->id;
                    $lims_product_variant_data->qty -= $quantity;
                    $lims_product_variant_data->save();
                } elseif ($product_return_data->product_batch_id) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $product_return_data->product_id],
                        ['product_batch_id', $product_return_data->product_batch_id],
                        ['warehouse_id', $lims_return_data->warehouse_id]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_return_data->product_batch_id);
                    $product_batch_data->qty -= $quantity;
                    $product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_return_data->product_id, $lims_return_data->warehouse_id)
                        ->first();

                $lims_product_data->qty -= $quantity;
                $lims_product_warehouse_data->qty -= $quantity;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            //deduct imei number if available
            if ($product_return_data->imei_number) {
                $imei_numbers = explode(",", $product_return_data->imei_number);
                $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                foreach ($imei_numbers as $number) {
                    if (($j = array_search($number, $all_imei_numbers)) !== false) {
                        unset($all_imei_numbers[$j]);
                    }
                }
                $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
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
            if ($sale_unit[$key] != 'n/a') {
                $lims_sale_unit_data = Unit::where('unit_code', $sale_unit[$key])->first();
                $sale_unit_id = $lims_sale_unit_data->id;
                if ($lims_sale_unit_data->operator == '*')
                    $quantity = $qty[$key] * $lims_sale_unit_data->operation_value;
                elseif ($lims_sale_unit_data->operator == '/')
                    $quantity = $qty[$key] / $lims_sale_unit_data->operation_value;

                if ($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::select('id', 'variant_id', 'qty')->FindExactProductWithCode($pro_id, $product_code[$key])->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['warehouse_id'])
                        ->first();
                    $variant_data = Variant::find($lims_product_variant_data->variant_id);

                    $product_return['variant_id'] = $lims_product_variant_data->variant_id;
                    $lims_product_variant_data->qty += $quantity;
                    $lims_product_variant_data->save();
                } elseif ($product_batch_id[$key]) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $pro_id],
                        ['product_batch_id', $product_batch_id[$key]],
                        ['warehouse_id', $data['warehouse_id']]
                    ])->first();

                    $product_batch_data = ProductBatch::find($product_batch_id[$key]);
                    $product_batch_data->qty += $quantity;
                    $product_batch_data->save();
                } else {
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['warehouse_id'])
                        ->first();
                }

                $lims_product_data->qty += $quantity;
                $lims_product_warehouse_data->qty += $quantity;

                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            } else {
                if ($lims_product_data->product_type == 'combo') {
                    $product_list = explode(",", $lims_product_data->product_list);
                    $variant_list = explode(",", $lims_product_data->variant_list);
                    $qty_list = explode(",", $lims_product_data->qty_list);

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

                        $child_data->qty += $qty[$key] * $qty_list[$index];
                        $child_warehouse_data->qty += $qty[$key] * $qty_list[$index];

                        $child_data->save();
                        $child_warehouse_data->save();
                    }
                }
                $sale_unit_id = 0;
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

            if ($sale_unit_id)
                $mail_data['unit'][$key] = $lims_sale_unit_data->unit_code;
            else
                $mail_data['unit'][$key] = '';

            $mail_data['qty'][$key] = $qty[$key];
            $mail_data['total'][$key] = $total[$key];

            $product_return['return_id'] = $id;
            $product_return['product_id'] = $pro_id;
            $product_return['imei_number'] = $imei_number[$key];
            $product_return['product_batch_id'] = $product_batch_id[$key];
            $product_return['qty'] = $qty[$key];
            $product_return['sale_unit_id'] = $sale_unit_id;
            $product_return['net_unit_price'] = $net_unit_price[$key];
            $product_return['discount'] = $discount[$key];
            $product_return['tax_rate'] = $tax_rate[$key];
            $product_return['tax'] = $tax[$key];
            $product_return['total'] = $total[$key];

            if ($product_return['variant_id'] && in_array($product_variant_id[$key], $old_product_variant_id)) {
                ProductReturn::where([
                    ['product_id', $pro_id],
                    ['variant_id', $product_return['variant_id']],
                    ['return_id', $id]
                ])->update($product_return);
            } elseif ($product_return['variant_id'] === null && (in_array($pro_id, $old_product_id))) {
                ProductReturn::where([
                    ['return_id', $id],
                    ['product_id', $pro_id]
                ])->update($product_return);
            } else
                ProductReturn::create($product_return);
        }
        $lims_return_data->update($data);
        $lims_customer_data = Customer::find($data['customer_id']);
        //collecting male data
        $mail_data['email'] = $lims_customer_data->email;
        $mail_data['reference_no'] = $lims_return_data->reference_no;
        $mail_data['total_qty'] = $lims_return_data->total_qty;
        $mail_data['total_price'] = $lims_return_data->total_price;
        $mail_data['order_tax'] = $lims_return_data->order_tax;
        $mail_data['order_tax_rate'] = $lims_return_data->order_tax_rate;
        $mail_data['grand_total'] = $lims_return_data->grand_total;
        $message = 'Return updated successfully';
        if ($mail_data['email']) {
            try {
                Mail::send('mail.return_details', $mail_data, function ($message) use ($mail_data) {
                    $message->to($mail_data['email'])->subject('Return Details');
                });
            } catch (\Exception $e) {
                $message = 'Return updated successfully. Please setup your <a href="setting/mail_setting">mail setting</a> to send mail.';
            }
        }
        return redirect('superAdmin/return-sale')->with('message', $message);
    }
    public function returnsaledestroy($id)
    {
        $lims_return_data = Returns::find($id);
        $lims_product_return_data = ProductReturn::where('return_id', $id)->get();

        foreach ($lims_product_return_data as $key => $product_return_data) {
            $lims_product_data = Product::find($product_return_data->product_id);
            if ($lims_product_data->type == 'combo') {
                $product_list = explode(",", $lims_product_data->product_list);
                $variant_list = explode(",", $lims_product_data->variant_list);
                $qty_list = explode(",", $lims_product_data->qty_list);

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
                            ['warehouse_id', $lims_return_data->warehouse_id],
                        ])->first();

                        $child_product_variant_data->qty -= $product_return_data->qty * $qty_list[$index];
                        $child_product_variant_data->save();
                    } else {
                        $child_warehouse_data = ProductWarehouse::where([
                            ['product_id', $child_id],
                            ['warehouse_id', $lims_return_data->warehouse_id],
                        ])->first();
                    }

                    $child_data->qty -= $product_return_data->qty * $qty_list[$index];
                    $child_warehouse_data->qty -= $product_return_data->qty * $qty_list[$index];

                    $child_data->save();
                    $child_warehouse_data->save();
                }
            } elseif ($product_return_data->sale_unit_id != 0) {
                $lims_sale_unit_data = Unit::find($product_return_data->sale_unit_id);

                if ($lims_sale_unit_data->operator == '*')
                    $quantity = $product_return_data->qty * $lims_sale_unit_data->operation_value;
                elseif ($lims_sale_unit_data->operator == '/')
                    $quantity = $product_return_data->qty / $lims_sale_unit_data->operation_value;

                if ($product_return_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id', 'qty')->FindExactProduct($product_return_data->product_id, $product_return_data->variant_id)->first();
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_return_data->product_id, $product_return_data->variant_id, $lims_return_data->warehouse_id)->first();
                    $lims_product_variant_data->qty -= $quantity;
                    $lims_product_variant_data->save();
                } elseif ($product_return_data->product_batch_id) {
                    $lims_product_batch_data = ProductBatch::find($product_return_data->product_batch_id);
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_return_data->product_batch_id],
                        ['warehouse_id', $lims_return_data->warehouse_id]
                    ])->first();

                    $lims_product_batch_data->qty -= $product_return_data->qty;
                    $lims_product_batch_data->save();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_return_data->product_id, $lims_return_data->warehouse_id)->first();

                $lims_product_data->qty -= $quantity;
                $lims_product_warehouse_data->qty -= $quantity;
                $lims_product_data->save();
                $lims_product_warehouse_data->save();
            }
            //deduct imei number if available
            if ($product_return_data->imei_number) {
                $imei_numbers = explode(",", $product_return_data->imei_number);
                $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                foreach ($imei_numbers as $number) {
                    if (($j = array_search($number, $all_imei_numbers)) !== false) {
                        unset($all_imei_numbers[$j]);
                    }
                }
                $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                $lims_product_warehouse_data->save();
            }
            $product_return_data->delete();
        }
        $lims_return_data->delete();
        return redirect('superAdmin/return-sale')->with('not_permitted', 'Data deleted successfully');
        ;
    }
}
