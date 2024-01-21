<?php

namespace App\Http\Servicecruds;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\{
    Unit,
    Tax,
    Warehouse,
    Product,
    ProductWarehouse,    
    ProductVariant,
    ProductBatch,
    Transfer,
    ProductTransfer
};
use Yajra\DataTables\Facades\DataTables;

class Transfercrud
{
    
    // ========================Transfer===================   
    public function transfersIndex($request)
    {
        // return dd($request->all());
        $transfer = Transfer::latest()->get();

        if ($request->ajax()) {
            $transfer = Transfer::latest()->get();

            if ($request->filled('starting_date') && $request->filled('ending_date')) {
                $transfer = $transfer->whereBetween('created_at', [$request->starting_date, $request->ending_date]);
            }

            // Transfers field search
            $customTransfer = Transfer::select('*');
            if ($request->filled('from_warehouse_id')) {
                $transfer = $customTransfer->where('from_warehouse_id', $request->from_warehouse_id);
            }
            if ($request->filled('to_warehouse_id')) {
                $transfer = $customTransfer->where('to_warehouse_id', $request->to_warehouse_id);
            }

            return Datatables::of($transfer)
                ->addIndexColumn()

                ->addColumn('date', function ($row) {
                    $date = date('d-M-Y', strtotime($row->created_at));
                    return $date;
                })
                ->addColumn('from_warehouse', function ($row) {
                    $from_warehouse = $row->fromWarehouse->name;
                    return $from_warehouse;
                })
                ->addColumn('to_warehouse', function ($row) {
                    $to_warehouse = $row->toWarehouse->name;
                    return $to_warehouse;
                })

                ->addColumn('total_cost', function ($row) {
                    $total_cost = number_format($row->total_cost, 2);
                    return $total_cost;
                })
                ->addColumn('total_tax', function ($row) {
                    $total_tax = number_format($row->total_tax, 2);
                    return $total_tax;
                })
                ->addColumn('grand_total', function ($row) {
                    $grand_total = number_format($row->grand_total, 2);
                    return $grand_total;
                })

                ->addColumn('status', function ($row) {
                    if ($row->status == 1) {
                        $status = '<div class="badge badge-danger">' . trans('Completed') . '</div>';
                        return $status;
                    } elseif ($row->status == 2) {
                        $status = '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                        return $status;
                    } elseif ($row->status == 3) {
                        $status = '<div class="badge badge-warning">' . trans('Sent') . '</div>';
                        return $status;
                    }
                })


                ->addColumn('action', function ($row) {
                    if ($row->user_id) {
                        $user = new User();
                    }
                    if ($row->status == 1) {
                        $status = "<strong>" . trans('Completed') . "</strong>";
                    } elseif ($row->status == 2) {
                        $status = '<div class="badge badge-danger">' . trans('Pending') . '</div>';
                    } elseif ($row->status == 3) {
                        $status = '<div class="badge badge-warning">' . trans('Sent') . '</div>';

                    }

                    // Update Button
                    $viewButton = '<a href="javascript:void(0)" style="box-shadow:none;" class="btn btn-link view" 
                                        data-id = "' . $row->id . '"
                                        data-date = "' . date('d-m-Y', strtotime($row->created_at)) . '"
                                        data-reference_no = "' . $row->reference_no . '"
                                        data-from_warehousename = "' . $row->fromWarehouse->name . '"
                                        data-from_warehousephone = "' . $row->fromWarehouse->phone . '"
                                        data-from_warehouseaddress = "' . $row->fromWarehouse->address . '"
                                        data-to_warehousename = "' . $row->toWarehouse->name . '"
                                        data-to_warehousephone = "' . $row->toWarehouse->phone . '"
                                        data-to_warehouseaddress = "' . $row->toWarehouse->address . '"
                                        data-item = "' . $row->item . '"
                                        data-total_qty = "' . $row->total_qty . '"
                                        data-total_tax = "' . $row->total_tax . '"
                                        data-total_cost = "' . $row->total_cost . '"
                                        data-shipping_cost = "' . $row->shipping_cost . '"
                                        data-grand_total = "' . $row->grand_total . '"

                                        data-user_name = "' . $row->user->name . '"
                                        data-user_email = "' . $row->user->email . '"

                                        data-status = "' . $status . '"

                                        data-note = "' . preg_replace('/\s+/S', " ", $row->note) . '"

                                        ><i class="fa fa-eye"></i> ' . trans('View') . '</a>';

                    $updateButton = '<a href="' . route('superAdmin.transfers.edit', $row->id) . '" class="btn btn-link"><i class="fas fa-edit"></i> ' . trans('Edit') . '</a>';
                    // Delete Button
                    $deleteButton = '<a href="javascript:void(0)" data-toggle="tooltip"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-link  deleteTransfer"><i class="fa fa-trash"></i> ' . trans('Delete') . '</a>';

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
        $lims_warehouse_list = Warehouse::select('name', 'id')->where('is_active', true)->get();
        return view('superadmin.transfer.index', compact('lims_warehouse_list'));
    }

    public function transfersCreate()
    {
        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        return view('superadmin.transfer.create', compact('lims_warehouse_list'));
    }

    public function transfersGetProduct($id)
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
            ->get();

        config()->set('database.connections.mysql.strict', false);
        \DB::reconnect(); //important as the existing connection if any would be in strict mode

        $lims_product_with_batch_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
                ['product_warehouses.qty', '>', 0]
            ])
            ->whereNull('product_warehouses.variant_id')
            ->whereNotNull('product_warehouses.product_batch_id')
            ->select('product_warehouses.*')
            ->groupBy('product_warehouses.product_id')
            ->get();

        //now changing back the strict ON
        config()->set('database.connections.mysql.strict', true);
        \DB::reconnect();

        $lims_product_with_variant_warehouse_data = Product::join('product_warehouses', 'products.id', '=', 'product_warehouses.product_id')
            ->where([
                ['products.is_active', true],
                ['product_warehouses.warehouse_id', $id],
                ['product_warehouses.qty', '>', 0]
            ])->whereNotNull('product_warehouses.variant_id')->select('product_warehouses.*')->get();

        $product_code = [];
        $product_name = [];
        $product_qty = [];
        $product_data = [];
        //product without variant
        foreach ($lims_product_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::select('product_name', 'product_code')->find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = $lims_product_data->product_name;
        }
        //product without batch
        foreach ($lims_product_with_batch_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::select('product_name', 'product_code')->find($product_warehouse->product_id);
            $product_code[] = $lims_product_data->product_code;
            $product_name[] = $lims_product_data->product_name;
        }
        //product with variant
        foreach ($lims_product_with_variant_warehouse_data as $product_warehouse) {
            $product_qty[] = $product_warehouse->qty;
            $lims_product_data = Product::select('product_name', 'product_code')->find($product_warehouse->product_id);
            $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_warehouse->product_id, $product_warehouse->variant_id)->first();
            $product_code[] = $lims_product_variant_data->item_code;
            $product_name[] = $lims_product_data->product_name;
        }
        $product_data = [$product_code, $product_name, $product_qty];
        return $product_data;
    }

    public function transfersLimsProductSearch($request)
    {
        $product_code = explode("(", $request['data']);
        $product_code[0] = rtrim($product_code[0], " ");
        $product_variant_id = null;
        $lims_product_data = Product::where([
            ['product_code', $product_code[0]],
            ['is_active', true]
        ])->first();
        if (!$lims_product_data) {
            $lims_product_data = Product::join('product_variants', 'products.id', 'product_variants.product_id')
                ->select('products.*', 'product_variants.id as product_variant_id', 'product_variants.item_code', 'product_variants.additional_cost')
                ->where('product_variants.item_code', $product_code[0])
                ->first();
            $product_variant_id = $lims_product_data->product_variant_id;
            $lims_product_data->code = $lims_product_data->item_code;
            $lims_product_data->cost += $lims_product_data->additional_cost;
        }
        $product[] = $lims_product_data->product_name;
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
        $product[] = $product_variant_id;
        $product[] = $lims_product_data->is_batch;
        $product[] = $lims_product_data->is_imei;
        return $product;
    }

    public function transfersStore( $request)
    {
        $data = $request->except('document');
        // return dd($data);
        $data['user_id'] = Auth::id();
        $data['reference_no'] = 'tr-' . date("Ymd") . '-' . date("his");
        if (isset($data['created_at']))
            $data['created_at'] = date("Y-m-d H:i:s", strtotime($data['created_at']));
        else
            $data['created_at'] = date("Y-m-d H:i:s");
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
        //     $document->move('public/documents/transfer', $documentName);
        //     $data['document'] = $documentName;
        // }
        $lims_transfer_data = Transfer::create($data);

        $product_id = $data['product_id'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_code = $data['product_code'];
        $qty = $data['qty'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $product_transfer = [];

        foreach ($product_id as $i => $id) {
            $lims_purchase_unit_data = Unit::where('unit_code', $purchase_unit[$i])->first();
            $product_transfer['variant_id'] = null;
            $product_transfer['product_batch_id'] = null;

            //get product data
            $lims_product_data = Product::select('is_variant')->find($id);
            if ($lims_product_data->is_variant) {
                $lims_product_variant_data = ProductVariant::select('variant_id')->FindExactProductWithCode($id, $product_code[$i])->first();
                $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($id, $lims_product_variant_data->variant_id, $data['from_warehouse_id'])->first();
                $product_transfer['variant_id'] = $lims_product_variant_data->variant_id;
            } elseif ($product_batch_id[$i]) {
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_batch_id', $product_batch_id[$i]],
                    ['warehouse_id', $data['from_warehouse_id']]
                ])->first();
                $product_transfer['product_batch_id'] = $product_batch_id[$i];
            } else {
                $lims_product_warehouse_data = ProductWarehouse::where([
                    ['product_id', $id],
                    ['warehouse_id', $data['from_warehouse_id']],
                ])->first();
            }

            if ($data['status'] != 2) {
                if ($lims_purchase_unit_data->operator == '*')
                    $quantity = $qty[$i] * $lims_purchase_unit_data->operation_value;
                else
                    $quantity = $qty[$i] / $lims_purchase_unit_data->operation_value;
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
                }
            } else
                $quantity = 0;
            //deduct quantity from sending warehouse
            $lims_product_warehouse_data->qty -= $quantity;
            $lims_product_warehouse_data->save();

            if ($data['status'] == 1) {
                if ($lims_product_data->is_variant) {
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($id, $lims_product_variant_data->variant_id, $data['to_warehouse_id'])->first();
                } elseif ($product_batch_id[$i]) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_batch_id[$i]],
                        ['warehouse_id', $data['to_warehouse_id']]
                    ])->first();
                } else {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_id', $id],
                        ['warehouse_id', $data['to_warehouse_id']],
                    ])->first();
                }
                //add quantity to destination warehouse
                if ($lims_product_warehouse_data)
                    $lims_product_warehouse_data->qty += $quantity;
                else {
                    $lims_product_warehouse_data = new ProductWarehouse();
                    $lims_product_warehouse_data->product_id = $id;
                    $lims_product_warehouse_data->product_batch_id = $product_transfer['product_batch_id'];
                    $lims_product_warehouse_data->variant_id = $product_transfer['variant_id'];
                    $lims_product_warehouse_data->warehouse_id = $data['to_warehouse_id'];
                    $lims_product_warehouse_data->qty = $quantity;
                }
                //add imei number if available
                if ($imei_number[$i]) {
                    if ($lims_product_warehouse_data->imei_number)
                        $lims_product_warehouse_data->imei_number .= ',' . $imei_number[$i];
                    else
                        $lims_product_warehouse_data->imei_number = $imei_number[$i];
                }

                $lims_product_warehouse_data->save();
            }

            $product_transfer['transfer_id'] = $lims_transfer_data->id;
            $product_transfer['product_id'] = $id;
            $product_transfer['imei_number'] = $imei_number[$i];
            $product_transfer['qty'] = $qty[$i];
            $product_transfer['purchase_unit_id'] = $lims_purchase_unit_data->id;
            $product_transfer['net_unit_cost'] = $net_unit_cost[$i];
            $product_transfer['tax_rate'] = $tax_rate[$i];
            $product_transfer['tax'] = $tax[$i];
            $product_transfer['total'] = $total[$i];
            ProductTransfer::create($product_transfer);
        }

        return redirect('superAdmin\transfers')->with('message', 'Transfer created successfully');
    }

    public function transfersProductTransferData($id)
    {
        $lims_product_transfer_data = ProductTransfer::where('transfer_id', $id)->get();
        foreach ($lims_product_transfer_data as $key => $product_transfer_data) {
            $product = Product::find($product_transfer_data->product_id);
            $unit = Unit::find($product_transfer_data->purchase_unit_id);
            if ($product_transfer_data->variant_id) {
                $lims_product_variant_data = ProductVariant::select('item_code')->FindExactProduct($product_transfer_data->product_id, $product_transfer_data->variant_id)->first();
                $product->code = $lims_product_variant_data->item_code;
            }
            $product_transfer[0][$key] = $product->product_name . ' [' . $product->code . ']';
            if ($product_transfer_data->imei_number)
                $product_transfer[0][$key] .= '<br>IMEI or Serial Number: ' . $product_transfer_data->imei_number;
            $product_transfer[1][$key] = $product_transfer_data->qty;
            $product_transfer[2][$key] = $unit->unit_code;
            $product_transfer[3][$key] = $product_transfer_data->tax;
            $product_transfer[4][$key] = $product_transfer_data->tax_rate;
            $product_transfer[5][$key] = $product_transfer_data->total;
            if ($product_transfer_data->product_batch_id) {
                $product_batch_data = ProductBatch::select('batch_no')->find($product_transfer_data->product_batch_id);
                $product_transfer[6][$key] = $product_batch_data->batch_no;
            } else
                $product_transfer[6][$key] = 'N/A';
        }
        return $product_transfer;
    }

    public function transferByCsv()
    {
        $role = Role::find(Auth::user()->role_id);
        if ($role->hasPermissionTo('transfers-add')) {
            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
            return view('backend.transfer.import', compact('lims_warehouse_list'));
        } else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function importTransfer( $request)
    {
        //get the file
        $upload = $request->file('file');
        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        //checking if this is a CSV file
        if ($ext != 'csv')
            return redirect()->back()->with('message', 'Please upload a CSV file');

        $filePath = $upload->getRealPath();
        $file_handle = fopen($filePath, 'r');
        $i = 0;
        //validate the file
        while (!feof($file_handle)) {
            $current_line = fgetcsv($file_handle);
            if ($current_line && $i > 0) {
                $product_data[] = Product::where('code', $current_line[0])->first();
                if (!$product_data[$i - 1])
                    return redirect()->back()->with('message', 'Product does not exist!');
                $unit[] = Unit::where('unit_code', $current_line[2])->first();
                if (!$unit[$i - 1])
                    return redirect()->back()->with('message', 'Purchase unit does not exist!');
                if (strtolower($current_line[4]) != "no tax") {
                    $tax[] = Tax::where('name', $current_line[4])->first();
                    if (!$tax[$i - 1])
                        return redirect()->back()->with('message', 'Tax name does not exist!');
                } else
                    $tax[$i - 1]['rate'] = 0;

                $qty[] = $current_line[1];
                $cost[] = $current_line[3];
            }
            $i++;
        }

        $data = $request->except('file');
        $data['reference_no'] = 'tr-' . date("Ymd") . '-' . date("his");
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

        //     $ext = pathinfo($document->getClientOriginalName(), PATHINFO_EXTENSION);
        //     $documentName = $data['reference_no'] . '.' . $ext;
        //     $document->move('public/documents/transfer', $documentName);
        //     $data['document'] = $documentName;
        // }
        $item = 0;
        $grand_total = $data['shipping_cost'];
        $data['user_id'] = Auth::id();
        Transfer::create($data);
        $lims_transfer_data = Transfer::latest()->first();

        foreach ($product_data as $key => $product) {
            if ($product['tax_method'] == 1) {
                $net_unit_cost = $cost[$key];
                $product_tax = $net_unit_cost * ($tax[$key]['rate'] / 100) * $qty[$key];
                $total = ($net_unit_cost * $qty[$key]) + $product_tax;
            } elseif ($product['tax_method'] == 2) {
                $net_unit_cost = (100 / (100 + $tax[$key]['rate'])) * $cost[$key];
                $product_tax = ($cost[$key] - $net_unit_cost) * $qty[$key];
                $total = $cost[$key] * $qty[$key];
            }
            if ($data['status'] == 1) {
                if ($unit[$key]['operator'] == '*')
                    $quantity = $qty[$key] * $unit[$key]['operation_value'];
                elseif ($unit[$key]['operator'] == '/')
                    $quantity = $qty[$key] / $unit[$key]['operation_value'];
                $product_warehouse = ProductWarehouse::where([
                    ['product_id', $product['id']],
                    ['warehouse_id', $data['from_warehouse_id']]
                ])->first();
                $product_warehouse->qty -= $quantity;
                $product_warehouse->save();
                $product_warehouse = ProductWarehouse::where([
                    ['product_id', $product['id']],
                    ['warehouse_id', $data['to_warehouse_id']]
                ])->first();
                if ($product_warehouse) {
                    $product_warehouse->qty += $quantity;
                    $product_warehouse->save();
                } else {
                    $product_warehouse = new ProductWarehouse();
                    $product_warehouse->product_id = $product['id'];
                    $product_warehouse->warehouse_id = $data['to_warehouse_id'];
                    $product_warehouse->qty = $quantity;
                    $product_warehouse->save();
                }
            } elseif ($data['status'] == 3) {
                if ($unit[$key]['operator'] == '*')
                    $quantity = $qty[$key] * $unit[$key]['operation_value'];
                elseif ($unit[$key]['operator'] == '/')
                    $quantity = $qty[$key] / $unit[$key]['operation_value'];
                $product_warehouse = ProductWarehouse::where([
                    ['product_id', $product['id']],
                    ['warehouse_id', $data['from_warehouse_id']]
                ])->first();
                $product_warehouse->qty -= $quantity;
                $product_warehouse->save();
            }

            $product_transfer = new ProductTransfer();
            $product_transfer->transfer_id = $lims_transfer_data->id;
            $product_transfer->product_id = $product['id'];
            $product_transfer->qty = $qty[$key];
            $product_transfer->purchase_unit_id = $unit[$key]['id'];
            $product_transfer->net_unit_cost = number_format((float) $net_unit_cost, 2, '.', '');
            $product_transfer->tax_rate = $tax[$key]['rate'];
            $product_transfer->tax = number_format((float) $product_tax, 2, '.', '');
            $product_transfer->total = number_format((float) $total, 2, '.', '');
            $product_transfer->save();
            $lims_transfer_data->total_qty += $qty[$key];
            $lims_transfer_data->total_tax += number_format((float) $product_tax, 2, '.', '');
            $lims_transfer_data->total_cost += number_format((float) $total, 2, '.', '');
        }
        $lims_transfer_data->item = $key + 1;
        $lims_transfer_data->grand_total = $lims_transfer_data->total_cost + $lims_transfer_data->shipping_cost;
        $lims_transfer_data->save();
        return redirect('superAdmin\transfers')->with('message', 'Transfer imported successfully');
    }

    public function transfersEdit($id)
    {

        $lims_warehouse_list = Warehouse::where('is_active', true)->get();
        $lims_transfer_data = Transfer::find($id);
        $lims_product_transfer_data = ProductTransfer::where('transfer_id', $id)->get();
        return view('superadmin.transfer.edit', compact('lims_warehouse_list', 'lims_transfer_data', 'lims_product_transfer_data'));

    }

    public function transfersUpdate($request, $id)
    {
        $data = $request->except('document');
        //return dd($data);
        $document = $request->document;
        $data['created_at'] = date("Y-m-d", strtotime(str_replace("/", "-", $data['created_at'])));
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
        //     $document->move('public/documents/transfer', $documentName);
        //     $data['document'] = $documentName;
        // }

        $lims_transfer_data = Transfer::find($id);
        $lims_product_transfer_data = ProductTransfer::where('transfer_id', $id)->get();
        $product_id = $data['product_id'];
        $imei_number = $data['imei_number'];
        $product_batch_id = $data['product_batch_id'];
        $product_variant_id = $data['product_variant_id'];
        $qty = $data['qty'];
        $purchase_unit = $data['purchase_unit'];
        $net_unit_cost = $data['net_unit_cost'];
        $tax_rate = $data['tax_rate'];
        $tax = $data['tax'];
        $total = $data['subtotal'];
        $product_transfer = [];
        foreach ($lims_product_transfer_data as $key => $product_transfer_data) {
            $old_product_id[] = $product_transfer_data->product_id;
            $old_product_variant_id[] = null;
            $lims_transfer_unit_data = Unit::find($product_transfer_data->purchase_unit_id);
            if ($lims_transfer_unit_data->operator == '*') {
                $quantity = $product_transfer_data->qty * $lims_transfer_unit_data->operation_value;
            } else {
                $quantity = $product_transfer_data->qty / $lims_transfer_unit_data->operation_value;
            }

            if ($lims_transfer_data->status == 1) {
                if ($product_transfer_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id')->FindExactProduct($product_transfer_data->product_id, $product_transfer_data->variant_id)->first();
                    $lims_product_from_warehouse_data = ProductWarehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->from_warehouse_id)->first();
                    $lims_product_to_warehouse_data = ProductWarehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->to_warehouse_id)->first();
                    $old_product_variant_id[$key] = $lims_product_variant_data->id;
                } elseif ($product_transfer_data->product_batch_id) {
                    $lims_product_from_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_transfer_data->product_batch_id],
                        ['warehouse_id', $lims_transfer_data->from_warehouse_id]
                    ])->first();

                    $lims_product_to_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_transfer_data->product_batch_id],
                        ['warehouse_id', $lims_transfer_data->to_warehouse_id]
                    ])->first();
                } else {
                    $lims_product_from_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->from_warehouse_id)->first();
                    $lims_product_to_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->to_warehouse_id)->first();
                }

                if ($product_transfer_data->imei_number) {
                    //add imei number to from warehouse
                    if ($lims_product_from_warehouse_data->imei_number)
                        $lims_product_from_warehouse_data->imei_number .= ',' . $product_transfer_data->imei_number;
                    else
                        $lims_product_from_warehouse_data->imei_number = $product_transfer_data->imei_number;
                    //deduct imei number from to warehouse
                    $imei_numbers = explode(",", $product_transfer_data->imei_number);
                    $all_imei_numbers = explode(",", $lims_product_to_warehouse_data->imei_number);
                    foreach ($imei_numbers as $number) {
                        if (($j = array_search($number, $all_imei_numbers)) !== false) {
                            unset($all_imei_numbers[$j]);
                        }
                    }
                    $lims_product_to_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                }

                $lims_product_from_warehouse_data->qty += $quantity;
                $lims_product_from_warehouse_data->save();

                $lims_product_to_warehouse_data->qty -= $quantity;
                $lims_product_to_warehouse_data->save();
            } elseif ($lims_transfer_data->status == 3) {
                if ($product_transfer_data->variant_id) {
                    $lims_product_variant_data = ProductVariant::select('id')->FindExactProduct($product_transfer_data->product_id, $product_transfer_data->variant_id)->first();
                    $lims_product_from_warehouse_data = ProductWarehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->from_warehouse_id)->first();
                    $old_product_variant_id[$key] = $lims_product_variant_data->id;
                } elseif ($product_transfer_data->product_batch_id) {
                    $lims_product_from_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_transfer_data->product_batch_id],
                        ['warehouse_id', $lims_transfer_data->from_warehouse_id]
                    ])->first();
                } else {
                    $lims_product_from_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->from_warehouse_id)->first();
                }
                if ($product_transfer_data->imei_number) {
                    //add imei number to from warehouse
                    if ($lims_product_from_warehouse_data->imei_number)
                        $lims_product_from_warehouse_data->imei_number .= ',' . $product_transfer_data->imei_number;
                    else
                        $lims_product_from_warehouse_data->imei_number = $product_transfer_data->imei_number;
                }
                $lims_product_from_warehouse_data->qty += $quantity;
                $lims_product_from_warehouse_data->save();
            }

            if ($product_transfer_data->variant_id && !(in_array($old_product_variant_id[$key], $product_variant_id))) {
                $product_transfer_data->delete();
            } elseif (!(in_array($old_product_id[$key], $product_id))) {
                $product_transfer_data->delete();
            }
        }

        foreach ($product_id as $key => $pro_id) {
            $lims_product_data = Product::select('is_variant')->find($pro_id);
            $lims_transfer_unit_data = Unit::where('unit_code', $purchase_unit[$key])->first();
            $variant_id = null;
            $product_transfer['product_batch_id'] = null;
            //unit conversion
            if ($lims_transfer_unit_data->operator == '*') {
                $quantity = $qty[$key] * $lims_transfer_unit_data->operation_value;
            } else {
                $quantity = $qty[$key] / $lims_transfer_unit_data->operation_value;
            }

            if ($data['status'] == 1) {
                if ($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::select('variant_id')->find($product_variant_id[$key]);
                    $lims_product_from_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['from_warehouse_id'])->first();
                    $lims_product_to_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['to_warehouse_id'])->first();
                    $variant_id = $lims_product_variant_data->variant_id;
                } elseif ($product_batch_id[$key]) {
                    $lims_product_from_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_batch_id[$key]],
                        ['warehouse_id', $data['from_warehouse_id']]
                    ])->first();

                    $lims_product_to_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_batch_id[$key]],
                        ['warehouse_id', $data['to_warehouse_id']]
                    ])->first();
                    $product_transfer['product_batch_id'] = $product_batch_id[$key];
                } else {
                    $lims_product_from_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['from_warehouse_id'])->first();
                    $lims_product_to_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['to_warehouse_id'])->first();
                }
                //deduct imei number if available
                if ($imei_number[$key]) {
                    $imei_numbers = explode(",", $imei_number[$key]);
                    $all_imei_numbers = explode(",", $lims_product_from_warehouse_data->imei_number);
                    foreach ($imei_numbers as $number) {
                        if (($j = array_search($number, $all_imei_numbers)) !== false) {
                            unset($all_imei_numbers[$j]);
                        }
                    }
                    $lims_product_from_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                }

                $lims_product_from_warehouse_data->qty -= $quantity;
                $lims_product_from_warehouse_data->save();

                if ($lims_product_to_warehouse_data) {
                    $lims_product_to_warehouse_data->qty += $quantity;
                } else {
                    $lims_product_to_warehouse_data = new ProductWarehouse();
                    $lims_product_to_warehouse_data->product_id = $pro_id;
                    $lims_product_to_warehouse_data->variant_id = $variant_id;
                    $lims_product_to_warehouse_data->product_batch_id = $product_transfer['product_batch_id'];
                    $lims_product_to_warehouse_data->warehouse_id = $data['to_warehouse_id'];
                    $lims_product_to_warehouse_data->qty = $quantity;
                }
                //add imei number if available
                if ($imei_number[$key]) {
                    if ($lims_product_to_warehouse_data->imei_number)
                        $lims_product_to_warehouse_data->imei_number .= ',' . $imei_number[$key];
                    else
                        $lims_product_to_warehouse_data->imei_number = $imei_number[$key];
                }
                $lims_product_to_warehouse_data->save();
            } elseif ($data['status'] == 3) {
                if ($lims_product_data->is_variant) {
                    $lims_product_variant_data = ProductVariant::select('variant_id')->find($product_variant_id[$key]);
                    $lims_product_from_warehouse_data = ProductWarehouse::FindProductWithVariant($pro_id, $lims_product_variant_data->variant_id, $data['from_warehouse_id'])->first();
                    $variant_id = $lims_product_variant_data->variant_id;
                } elseif ($product_batch_id[$key]) {
                    $lims_product_from_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_batch_id[$key]],
                        ['warehouse_id', $data['from_warehouse_id']]
                    ])->first();
                    $product_transfer['product_batch_id'] = $product_batch_id[$key];
                } else {
                    $lims_product_from_warehouse_data = ProductWarehouse::FindProductWithoutVariant($pro_id, $data['from_warehouse_id'])->first();
                }
                //deduct imei number if available
                if ($imei_number[$key]) {
                    $imei_numbers = explode(",", $imei_number[$key]);
                    $all_imei_numbers = explode(",", $lims_product_from_warehouse_data->imei_number);
                    foreach ($imei_numbers as $number) {
                        if (($j = array_search($number, $all_imei_numbers)) !== false) {
                            unset($all_imei_numbers[$j]);
                        }
                    }
                    $lims_product_from_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                }

                $lims_product_from_warehouse_data->qty -= $quantity;
                $lims_product_from_warehouse_data->save();
            }

            $product_transfer['product_id'] = $pro_id;
            $product_transfer['variant_id'] = $variant_id;
            $product_transfer['imei_number'] = $imei_number[$key];
            $product_transfer['transfer_id'] = $id;
            $product_transfer['qty'] = $qty[$key];
            $product_transfer['purchase_unit_id'] = $lims_transfer_unit_data->id;
            $product_transfer['net_unit_cost'] = $net_unit_cost[$key];
            $product_transfer['tax_rate'] = $tax_rate[$key];
            $product_transfer['tax'] = $tax[$key];
            $product_transfer['total'] = $total[$key];

            if ($lims_product_data->is_variant && in_array($product_variant_id[$key], $old_product_variant_id)) {
                ProductTransfer::where([
                    ['transfer_id', $id],
                    ['product_id', $pro_id],
                    ['variant_id', $variant_id]
                ])->update($product_transfer);
            } elseif ($variant_id == null && in_array($pro_id, $old_product_id)) {
                ProductTransfer::where([
                    ['transfer_id', $id],
                    ['product_id', $pro_id]
                ])->update($product_transfer);
            } else
                ProductTransfer::create($product_transfer);
        }

        $lims_transfer_data->update($data);
        return redirect('superAdmin\transfers')->with('message', 'Transfer updated successfully');
    }

    public function transfersDeleteBySelection( $request)
    {
        $transfer_id = $request['transferIdArray'];
        foreach ($transfer_id as $id) {
            $lims_transfer_data = Transfer::find($id);
            $lims_product_transfer_data = ProductTransfer::where('transfer_id', $id)->get();
            foreach ($lims_product_transfer_data as $product_transfer_data) {
                $lims_transfer_unit_data = Unit::find($product_transfer_data->purchase_unit_id);
                if ($lims_transfer_unit_data->operator == '*') {
                    $quantity = $product_transfer_data->qty * $lims_transfer_unit_data->operation_value;
                } else {
                    $quantity = $product_transfer_data / $lims_transfer_unit_data->operation_value;
                }

                if ($lims_transfer_data->status == 1) {
                    //add quantity for from warehouse
                    if ($product_transfer_data->variant_id)
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->from_warehouse_id)->first();
                    else
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->from_warehouse_id)->first();
                    $lims_product_warehouse_data->qty += $quantity;
                    $lims_product_warehouse_data->save();
                    //deduct quantity for to warehouse
                    if ($product_transfer_data->variant_id)
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->to_warehouse_id)->first();
                    else
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->to_warehouse_id)->first();

                    $lims_product_warehouse_data->qty -= $quantity;
                    $lims_product_warehouse_data->save();
                } elseif ($lims_transfer_data->status == 3) {
                    //add quantity for from warehouse
                    if ($product_transfer_data->variant_id)
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->from_warehouse_id)->first();
                    else
                        $lims_product_warehouse_data = Product_Warehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->from_warehouse_id)->first();

                    $lims_product_warehouse_data->qty += $quantity;
                    $lims_product_warehouse_data->save();
                }
                $product_transfer_data->delete();
            }
            $lims_transfer_data->delete();
        }
        return 'Transfer deleted successfully!';
    }

    public function transfersDestroy($id)
    {
        $lims_transfer_data = Transfer::find($id);

        $lims_product_transfer_data = ProductTransfer::where('transfer_id', $id)->get();
        foreach ($lims_product_transfer_data as $product_transfer_data) {
            $lims_transfer_unit_data = Unit::find($product_transfer_data->purchase_unit_id);
            // dd((int) $lims_transfer_unit_data->operation_value);
            if ($lims_transfer_unit_data->operator == '*') {
                $quantity = $product_transfer_data->qty * (int) $lims_transfer_unit_data->operation_value;
            } else {
                $quantity = $product_transfer_data->qty / (int) $lims_transfer_unit_data->operation_value;
            }
            if ($lims_transfer_data->status == 1) {
                //add quantity for from warehouse
                if ($product_transfer_data->variant_id)
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->from_warehouse_id)->first();
                elseif ($product_transfer_data->product_batch_id) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_transfer_data->product_batch_id],
                        ['warehouse_id', $lims_transfer_data->from_warehouse_id]
                    ])->first();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->from_warehouse_id)->first();
                //add imei number to from warehouse
                if ($product_transfer_data->imei_number) {
                    if ($lims_product_warehouse_data->imei_number)
                        $lims_product_warehouse_data->imei_number .= ',' . $product_transfer_data->imei_number;
                    else
                        $lims_product_warehouse_data->imei_number = $product_transfer_data->imei_number;
                }

                $lims_product_warehouse_data->qty += $quantity;
                $lims_product_warehouse_data->save();
                //deduct quantity for to warehouse
                if ($product_transfer_data->variant_id)
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->to_warehouse_id)->first();
                elseif ($product_transfer_data->product_batch_id) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_transfer_data->product_batch_id],
                        ['warehouse_id', $lims_transfer_data->to_warehouse_id]
                    ])->first();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->to_warehouse_id)->first();
                //deduct imei number if available
                if ($product_transfer_data->imei_number) {
                    $imei_numbers = explode(",", $product_transfer_data->imei_number);
                    $all_imei_numbers = explode(",", $lims_product_warehouse_data->imei_number);
                    foreach ($imei_numbers as $number) {
                        if (($j = array_search($number, $all_imei_numbers)) !== false) {
                            unset($all_imei_numbers[$j]);
                        }
                    }
                    $lims_product_warehouse_data->imei_number = implode(",", $all_imei_numbers);
                }

                $lims_product_warehouse_data->qty -= $quantity;
                $lims_product_warehouse_data->save();
            } elseif ($lims_transfer_data->status == 3) {
                //add quantity for from warehouse
                if ($product_transfer_data->variant_id)
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithVariant($product_transfer_data->product_id, $product_transfer_data->variant_id, $lims_transfer_data->from_warehouse_id)->first();
                elseif ($product_transfer_data->product_batch_id) {
                    $lims_product_warehouse_data = ProductWarehouse::where([
                        ['product_batch_id', $product_transfer_data->product_batch_id],
                        ['warehouse_id', $lims_transfer_data->from_warehouse_id]
                    ])->first();
                } else
                    $lims_product_warehouse_data = ProductWarehouse::FindProductWithoutVariant($product_transfer_data->product_id, $lims_transfer_data->from_warehouse_id)->first();
                //add imei number to from warehouse
                if ($product_transfer_data->imei_number) {
                    if ($lims_product_warehouse_data->imei_number)
                        $lims_product_warehouse_data->imei_number .= ',' . $lims_product_warehouse_data->imei_number;
                    else
                        $lims_product_warehouse_data->imei_number = $lims_product_warehouse_data->imei_number;
                }

                $lims_product_warehouse_data->qty += $quantity;
                $lims_product_warehouse_data->save();
            }
            $product_transfer_data->delete();
        }
        $lims_transfer_data->delete();
        return response()->json(['status' => "success"]);
        // return redirect('superAdmin\transfers')->with('not_permitted', 'Transfer deleted successfully');
    }

}