@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>{{trans('Update Sale')}}</h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
                        {!! Form::open(['route' => ['superAdmin.sale.update', $limssaledata->id], 'method' => 'put', 'files' => true, 'id' => 'payment-form']) !!}
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>{{trans('Date')}}</label>
                                            <input type="text" name="created_at" class="form-control date" value="{{date($general_setting->date_format, strtotime($limssaledata->created_at->toDateString()))}}" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>{{trans('reference')}}</label>
                                            <p><strong>{{ $limssaledata->reference_no }}</strong></p>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>{{trans('customer')}} *</label>
                                            <input type="hidden" name="customer_id_hidden" value="{{ $limssaledata->customer_id }}" />
                                            <select required name="customer_id" class=" form-control" data-live-search="true" id="customer_id" title="Select customer...">
                                                @foreach($limscustomerlist as $customer)
                                                <option value="{{$customer->id}}">{{$customer->name . ' (' . $customer->phone_number . ')'}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>{{trans('Warehouse')}} *</label>
                                            <input type="hidden" name="warehouse_id_hidden" value="{{$limssaledata->warehouse_id}}" />
                                            <select required id="warehouse_id" name="warehouse_id" class=" form-control" data-live-search="true" data-live-search-style="begins" title="Select warehouse...">
                                                @foreach($limswarehouselist as $warehouse)
                                                <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>{{trans('Biller')}} *</label>
                                            <input type="hidden" name="biller_id_hidden" value="{{$limssaledata->biller_id}}" />
                                            <select required name="biller_id" class=" form-control" data-live-search="true" data-live-search-style="begins" title="Select Biller...">
                                                @foreach($limsbillerlist as $biller)
                                                <option value="{{$biller->id}}">{{$biller->name . ' (' . $biller->company_name . ')'}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-12">
                                        <label>{{trans('Select Product')}}</label>
                                        <div class="search-box input-group">
                                            <button type="button" class="btn btn-secondary btn-lg"><i class="fa fa-barcode"></i></button>
                                            <input type="text" name="product_code_name" id="lims_productcodeSearch" placeholder="Please type product code and select..." class="form-control" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-5">
                                    <div class="col-md-12">
                                        <h5>{{trans('Order Table')}} *</h5>
                                        <div class="table-responsive mt-3">
                                            <table id="myTable" class="table table-hover order-list">
                                                <thead>
                                                    <tr>
                                                        <th>{{trans('name')}}</th>
                                                        <th>{{trans('Code')}}</th>
                                                        <th>{{trans('Quantity')}}</th>
                                                        <th>{{trans('Batch No')}}</th>
                                                        <th>{{trans('Expired Date')}}</th>
                                                        <th>{{trans('Net Unit Price')}}</th>
                                                        <th>{{trans('Discount')}}</th>
                                                        <th>{{trans('Tax')}}</th>
                                                        <th>{{trans('Subtotal')}}</th>
                                                        <th><i class="dripicons-trash"></i></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @php
                                                    $product_id = [];
                                                    $temp_unit_code = [];
                                                    $temp_unit_operator = [];
                                                    $temp_unit_operation_value = [];

                                                    @endphp
                                                    @foreach($limsproductsaledata as $product_sale)
                                                    <tr>
                                                    @php
                                                        $product_data = DB::table('products')->find($product_sale->product_id);
                                                        if($product_sale->variant_id){
                                                            $product_variant_data = \App\Models\ProductVariant::select('id', 'item_code')->FindExactProduct($product_data->id, $product_sale->variant_id)->first();
                                                            $product_variant_id = $product_variant_data->id;
                                                            $product_data->product_code = $product_variant_data->item_code;
                                                        }
                                                        else{
                                                            $product_variant_id = null;
                                                        }
                                                        // print_r($product_variant_data)."null";
                                                        if($product_data->tax_method == 1){
                                                            $product_price = $product_sale->net_unit_price + ($product_sale->discount / $product_sale->qty);
                                                        }
                                                        elseif ($product_data->tax_method == 2) {
                                                            $product_price =($product_sale->total / $product_sale->qty) + ($product_sale->discount / $product_sale->qty);
                                                        }
                                                        $tax = DB::table('taxes')->where('rate',$product_sale->tax_rate)->first();
                                                        $unit_code = array();
                                                        $unit_operator = array();
                                                        $unit_operation_value = array();
                                                        if($product_data->product_type == 'standard'){
                                                            $units = DB::table('units')->where('id', $product_data->unit_id)->get();

                                                            foreach($units as $unit) {
                                                                if($product_sale->sale_unit_id == $unit->id) {
                                                                    array_unshift($unit_code, $unit->unit_code);
                                                                    array_unshift($unit_operator, $unit->operator);
                                                                    array_unshift($unit_operation_value, $unit->operation_value);
                                                                }
                                                                else {
                                                                    $unit_code[]  = $unit->unit_code;
                                                                    $unit_operator[] = $unit->operator;
                                                                    $unit_operation_value[] = $unit->operation_value;
                                                                }
                                                            }
                                                            if($unit_operator[0] == '*'){
                                                                $product_price = $product_price / $unit_operation_value[0];
                                                            }
                                                            elseif($unit_operator[0] == '/'){
                                                                $product_price = $product_price * $unit_operation_value[0];
                                                            }
                                                        }
                                                        else {
                                                            $unit_code[] = 'n/a'. ',';
                                                            $unit_operator[] = 'n/a'. ',';
                                                            $unit_operation_value[] = 'n/a'. ',';
                                                        }
                                                        $temp_unit_code = $unit_code = implode(",",$unit_code) . ',';

                                                        $temp_unit_operator = $unit_operator = implode(",",$unit_operator) .',';

                                                        $temp_unit_operation_value = $unit_operation_value =  implode(",",$unit_operation_value) . ',';

                                                        $product_batch_data = \App\Models\ProductBatch::select('batch_no', 'expired_date')->find($product_sale->product_batch_id);


                                                    @endphp
                                                        <td>{{$product_data->product_name}} <button type="button" class="edit-product btn btn-link" data-toggle="modal" data-target="#editModal"> <i class="dripicons-document-edit"></i></button>
                                                            <input type="hidden" class="product-type" value="{{$product_data->product_type}}" />
                                                        </td>
                                                        <td>
                                                            {{$product_data->product_code }}
                                                            {{-- {{$product_data->product_code}} --}}
                                                        </td>
                                                        <td><input type="number" class="form-control qty" name="qty[]" value="{{$product_sale->qty}}" step="any" required/></td>
                                                        @if($product_batch_data)
                                                        <td>
                                                            <input type="hidden" class="product-batch-id" name="product_batch_id[]" value="{{$product_sale->product_batch_id}}">
                                                            <input type="text" class="form-control batch-no" name="batch_no[]" value="{{$product_batch_data->batch_no}}" required/>
                                                        </td>
                                                        <td>{{date($general_setting->date_format, strtotime($product_batch_data->expired_date))}}</td>
                                                        @else
                                                        <td>
                                                            <input type="hidden" class="product-batch-id" name="product_batch_id[]" value="">
                                                            <input type="text" class="form-control batch-no" name="batch_no[]" value="" disabled />
                                                        </td>
                                                        <td>N/A</td>
                                                        @endif
                                                        <td class="net_unit_price">{{ number_format((float)$product_sale->net_unit_price, 2, '.', '')}} </td>
                                                        <td class="discount">{{ number_format((float)$product_sale->discount, 2, '.', '')}}</td>
                                                        <td class="tax">{{ number_format((float)$product_sale->tax, 2, '.', '')}}</td>
                                                        <td class="sub-total">{{ number_format((float)$product_sale->total, 2, '.', '')}}</td>
                                                        <td>
                                                            <button type="button" class="ibtnDel btn btn-md btn-danger">{{trans("delete")}}</button>
                                                        </td>
                                                        <input type="hidden" class="product-code" name="product_code[]" value="{{$product_data->product_code}}"/>
                                                        <input type="hidden" class="product-id" name="product_id[]" value="{{$product_data->id}}"/>
                                                        <input type="hidden" name="product_variant_id[]" value="{{$product_variant_id}}"/>
                                                        <input type="hidden" class="product-price" name="product_price[]" value="{{$product_price}}"/>
                                                        <input type="hidden" class="sale-unit" name="sale_unit[]" value="{{$unit_code}}"/>
                                                        <input type="hidden" class="sale-unit-operator" value="{{$unit_operator}}"/>
                                                        <input type="hidden" class="sale-unit-operation-value" value="{{$unit_operation_value}}"/>
                                                        <input type="hidden" class="net_unit_price" name="net_unit_price[]" value="{{$product_sale->net_unit_price}}" />
                                                        <input type="hidden" class="discount-value" name="discount[]" value="{{$product_sale->discount}}" />
                                                        <input type="hidden" class="tax-rate" name="tax_rate[]" value="{{$product_sale->tax_rate}}"/>
                                                        @if($tax)
                                                        <input type="hidden" class="tax-name" value="{{$tax->name}}" />
                                                        @else
                                                        <input type="hidden" class="tax-name" value="No Tax" />
                                                        @endif
                                                        <input type="hidden" class="tax-method" value="{{$product_data->tax_method}}"/>
                                                        <input type="hidden" class="tax-value" name="tax[]" value="{{$product_sale->tax}}" />
                                                        <input type="hidden" class="subtotal-value" name="subtotal[]" value="{{$product_sale->total}}" />
                                                        <input type="hidden" class="imei-number" name="imei_number[]"  value="{{$product_sale->imei_number}}" />
                                                    </tr>
                                                    @endforeach
                                                </tbody>
                                                <tfoot class="tfoot active">
                                                    <th colspan="2">{{trans('Total')}}</th>
                                                    <th id="total-qty">{{$limssaledata->total_qty}}</th>
                                                    <th></th>
                                                    <th></th>
                                                    <th></th>
                                                    <th id="total-discount">{{ number_format((float)$limssaledata->total_discount, 2, '.', '')}}</th>
                                                    <th id="total-tax">{{ number_format((float)$limssaledata->total_tax, 2, '.', '')}}</th>
                                                    <th id="total">{{ number_format((float)$limssaledata->total_price, 2, '.', '')}}</th>
                                                    <th><i class="dripicons-trash"></i></th>
                                                </tfoot>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="total_qty" value="{{$limssaledata->total_qty}}" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="total_discount" value="{{$limssaledata->total_discount}}" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="total_tax" value="{{$limssaledata->total_tax}}" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="total_price" value="{{$limssaledata->total_price}}" />
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <input type="hidden" name="item" value="{{$limssaledata->item}}" />
                                            <input type="hidden" name="order_tax" value="{{$limssaledata->order_tax}}"/>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        @if($limssaledata->coupon_id)
                                            @php
                                                $coupon_data = DB::table('coupons')->find($limssaledata->coupon_id);
                                            @endphp
                                            <input type="hidden" name="coupon_active" value="1" />
                                            <input type="hidden" name="coupon_type" value="{{$coupon_data->type}}" />
                                            <input type="hidden" name="coupon_amount" value="{{$coupon_data->amount}}" />
                                            <input type="hidden" name="coupon_minimum_amount" value="{{$coupon_data->minimum_amount}}" />
                                            <input type="hidden" name="coupon_discount" value="{{$limssaledata->coupon_discount}}">

                                        @else
                                            <input type="hidden" name="coupon_active" value="0" />
                                        @endif
                                        <div class="form-group">
                                            <input type="hidden" name="grand_total" value="{{$limssaledata->grand_total}}" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <input type="hidden" name="order_tax_rate_hidden" value="{{$limssaledata->order_tax_rate}}">
                                            <label>{{trans('Order Tax')}}</label>
                                            <select class="form-control" name="order_tax_rate">
                                                <option value="0">No Tax</option>
                                                @foreach($limstaxlist as $tax)
                                                <option value="{{$tax->rate}}">{{$tax->name}}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>{{trans('Order Discount Type')}}</label>
                                            <select class="form-control" name="order_discount_type">
                                                @if($limssaledata->order_discount_type == 'Percentage')
                                                <option value="Percentage">Percentage</option>
                                                <option value="Flat">Flat</option>
                                                @else
                                                <option value="Flat">Flat</option>
                                                <option value="Percentage">Percentage</option>
                                                @endif
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>
                                                {{trans('Order Discount Value')}}
                                            </label>
                                            <input type="number" name="order_discount_value" class="form-control" value="@if($limssaledata->order_discount_value){{$limssaledata->order_discount_value}}@else{{$limssaledata->order_discount}}@endif" step="any" />
                                            <input type="hidden" name="order_discount" value="{{$limssaledata->order_discount}}" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>
                                                {{trans('Shipping Cost')}}
                                            </label>
                                            <input type="number" name="shipping_cost" class="form-control" value="{{$limssaledata->shipping_cost}}" step="any" />
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>{{trans('Attach Document')}}</label> <i class="dripicons-question" data-toggle="tooltip" title="Only jpg, jpeg, png, gif, pdf, csv, docx, xlsx and txt file is supported"></i>
                                            <input type="file" name="document" class="form-control" />
                                            @if($errors->has('extension'))
                                                <span>
                                                   <strong>{{ $errors->first('extension') }}</strong>
                                                </span>
                                            @endif
                                        </div>
                                    </div>
                                    @foreach($customfields as $field)
                                        @php $field_name = str_replace(' ', '_', strtolower($field->name)); @endphp
                                        @if(!$field->is_admin || \Auth::user()->role_id == 1)
                                            <div class="{{'col-md-'.$field->grid_value}}">
                                                <div class="form-group">
                                                    <label>{{$field->name}}</label>
                                                    @if($field->type == 'text')
                                                        <input type="text" name="{{$field_name}}" value="{{$limssaledata->$field_name}}" class="form-control" @if($field->is_required){{'required'}}@endif>
                                                    @elseif($field->type == 'number')
                                                        <input type="number" name="{{$field_name}}" value="{{$limssaledata->$field_name}}" class="form-control" @if($field->is_required){{'required'}}@endif>
                                                    @elseif($field->type == 'textarea')
                                                        <textarea rows="5" name="{{$field_name}}" value="{{$limssaledata->$field_name}}" class="form-control" @if($field->is_required){{'required'}}@endif></textarea>
                                                    @elseif($field->type == 'checkbox')
                                                        <br>
                                                        @php
                                                        $option_values = explode(",", $field->option_value);
                                                        $field_values =  explode(",", $limssaledata->$field_name);
                                                        @endphp
                                                        @foreach($option_values as $value)
                                                            <label>
                                                                <input type="checkbox" name="{{$field_name}}[]" value="{{$value}}" @if(in_array($value, $field_values)) checked @endif @if($field->is_required){{'required'}}@endif> {{$value}}
                                                            </label>
                                                            &nbsp;
                                                        @endforeach
                                                    @elseif($field->type == 'radio_button')
                                                        <br>
                                                        @php
                                                        $option_values = explode(",", $field->option_value);
                                                        @endphp
                                                        @foreach($option_values as $value)
                                                            <label class="radio-inline">
                                                                <input type="radio" name="{{$field_name}}" value="{{$value}}" @if($value == $limssaledata->$field_name){{'checked'}}@endif @if($field->is_required){{'required'}}@endif> {{$value}}
                                                            </label>
                                                            &nbsp;
                                                        @endforeach
                                                    @elseif($field->type == 'select')
                                                        @php $option_values = explode(",", $field->option_value); @endphp
                                                        <select class="form-control" name="{{$field_name}}" @if($field->is_required){{'required'}}@endif>
                                                            @foreach($option_values as $value)
                                                                <option value="{{$value}}" @if($value == $limssaledata->$field_name){{'selected'}}@endif>{{$value}}</option>
                                                            @endforeach
                                                        </select>
                                                    @elseif($field->type == 'multi_select')
                                                        @php
                                                        $option_values = explode(",", $field->option_value);
                                                        $field_values =  explode(",", $limssaledata->$field_name);
                                                        @endphp
                                                        <select class="form-control" name="{{$field_name}}[]" @if($field->is_required){{'required'}}@endif multiple>
                                                            @foreach($option_values as $value)
                                                                <option value="{{$value}}" @if(in_array($value, $field_values)) selected @endif>{{$value}}</option>
                                                            @endforeach
                                                        </select>
                                                    @elseif($field->type == 'date_picker')
                                                        <input type="text" name="{{$field_name}}" value="{{$limssaledata->$field_name}}" class="form-control date" @if($field->is_required){{'required'}}@endif>
                                                    @endif
                                                </div>
                                            </div>
                                        @endif
                                    @endforeach
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>{{trans('Sale Status')}} *</label>
                                            <input type="hidden" name="sale_status_hidden" value="{{$limssaledata->sale_status}}" />
                                            <select name="sale_status" class="form-control">
                                                <option value="1">{{trans('Completed')}}</option>
                                                <option value="2">{{trans('Pending')}}</option>
                                            </select>
                                        </div>
                                    </div>
                                    @if($limssaledata->coupon_id)
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>
                                                <strong>{{trans('Coupon Discount')}}</strong>
                                            </label>
                                            <p class="mt-2 pl-2"><strong id="coupon-text">{{ number_format((float)$limssaledata->coupon_discount, 2, '.', '')}}</strong></p>
                                        </div>
                                    </div>
                                    @endif
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>{{trans('Sale Note')}}</label>
                                            <textarea rows="5" class="form-control" name="sale_note" >{{ $limssaledata->sale_note }}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>{{trans('Staff Note')}}</label>
                                            <textarea rows="5" class="form-control" name="staff_note">{{ $limssaledata->staff_note }}</textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <input type="hidden" name="payment_status" value="{{$limssaledata->payment_status}}" />
                                            <input type="hidden" name="paid_amount" value="{{$limssaledata->paid_amount}}" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="{{trans('submit')}}" class="btn btn-primary" id="submit-button">
                                </div>
                            </div>
                        </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <table class="table table-bordered table-condensed totals">
            <td><strong>{{trans('Items')}}</strong>
                <span class="pull-right" id="item">{{number_format(0, 2, '.', '')}}</span>
            </td>
            <td><strong>{{trans('Total')}}</strong>
                <span class="pull-right" id="subtotal">{{number_format(0, 2, '.', '')}}</span>
            </td>
            <td><strong>{{trans('Order Tax')}}</strong>
                <span class="pull-right" id="order_tax">{{number_format(0, 2, '.', '')}}</span>
            </td>
            <td><strong>{{trans('Order Discount')}}</strong>
                <span class="pull-right" id="order_discount">{{number_format(0, 2, '.', '')}}</span>
            </td>
            <td><strong>{{trans('Shipping Cost')}}</strong>
                <span class="pull-right" id="shipping_cost">{{number_format(0, 2, '.', '')}}</span>
            </td>
            <td><strong>{{trans('grand total')}}</strong>
                <span class="pull-right" id="grand_total">{{number_format(0, 2, '.', '')}}</span>
            </td>
        </table>
    </div>
    <div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="modal_header" class="modal-title"></h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row modal-element">
                            <div class="col-md-4 form-group">
                                <label>{{trans('Quantity')}}</label>
                                <input type="number" step="any" name="edit_qty" class="form-control">
                            </div>
                            <div class="col-md-4 form-group">
                                <label>{{trans('Unit Discount')}}</label>
                                <input type="number" name="edit_discount" class="form-control">
                            </div>
                            <div class="col-md-4 form-group">
                                <label>{{trans('Unit Price')}}</label>
                                <input type="number" name="edit_unit_price" class="form-control" step="any">
                            </div>
                            @php
                                $tax_name_all[] = 'No Tax';
                                $tax_rate_all[] = 0;
                                foreach($limstaxlist as $tax) {
                                    $tax_name_all[] = $tax->name;
                                    $tax_rate_all[] = $tax->rate;
                                }
                            @endphp
                            <div class="col-md-4 form-group">
                                <label>{{trans('Tax Rate')}}</label>
                                <select name="edit_tax_rate" class="form-control ">
                                    @foreach($tax_name_all as $key => $name)
                                    <option value="{{$key}}">{{$name}}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div id="edit_unit" class="col-md-4 form-group">
                                <label>{{trans('Product Unit')}}</label>
                                <select name="edit_unit" class="form-control ">
                                </select>
                            </div>
                        </div>
                        <button type="button" name="update_btn" class="btn btn-primary">{{trans('update')}}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- add cash register modal -->
    <div id="cash-register-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
        <div role="document" class="modal-dialog">
          <div class="modal-content">
            {!! Form::open(['route' => 'superAdmin.cashRegister.store', 'method' => 'post']) !!}
            <div class="modal-header">
              <h5 id="exampleModalLabel" class="modal-title">{{trans('Add Cash Register')}}</h5>
              <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
                <div class="row">
                  <div class="col-md-6 form-group warehouse-section">
                      <label>{{trans('Warehouse')}} *</strong> </label>
                      <select required name="warehouse_id" class=" form-control" data-live-search="true" data-live-search-style="begins" title="Select warehouse...">
                          @foreach($limswarehouselist as $warehouse)
                          <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                          @endforeach
                      </select>
                  </div>
                  <div class="col-md-6 form-group">
                      <label>{{trans('Cash in Hand')}} *</strong> </label>
                      <input type="number" name="cash_in_hand" required class="form-control">
                  </div>
                  <div class="col-md-12 form-group">
                      <button type="submit" class="btn btn-primary">{{trans('submit')}}</button>
                  </div>
                </div>
            </div>
            {{ Form::close() }}
          </div>
        </div>
    </div>
</section>


@push('custom_scripts')
<script type="text/javascript">
$("#card-element").hide();
    $("#cheque").hide();

    // array data depend on warehouse
    var lims_product_array = [];
    var product_code = [];
    var product_name = [];
    var product_qty = [];
    var product_type = [];
    var product_id = [];
    var product_list = [];
    var qty_list = [];

    // array data with selection
    var product_price = [];
    var product_discount = [];
    var tax_rate = [];
    var tax_name = [];
    var tax_method = [];
    var unit_code = [];
    var unit_operator = [];
    var unit_operation_value = [];
    var is_imei = [];
    var is_variant = [];

    // temporary array
    var temp_unit_name = [];
    var temp_unit_operator = [];
    var temp_unit_operation_value = [];

    var exist_type = [];
    var exist_code = [];
    var exist_qty = [];
    var rowindex;
    var customer_group_rate;
    var row_product_price;


    var rownumber = $('table.order-list tbody tr:last').index();

    for(rowindex  =0; rowindex <= rownumber; rowindex++){
        product_price.push(parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-price').val()));
        exist_code.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text());
        exist_type.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-type').val());
        var total_discount = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.discount').text());
        var quantity = parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val());
        exist_qty.push(quantity);
        product_discount.push((total_discount / quantity).toFixed(2));
        tax_rate.push(parseFloat($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-rate').val()));
        tax_name.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-name').val());
        tax_method.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-method').val());
        temp_unit_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sale-unit').val().split(',');
        unit_code.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sale-unit').val());
        unit_operator.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sale-unit-operator').val());
        unit_operation_value.push($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sale-unit-operation-value').val());
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sale-unit').val(temp_unit_code[0]);
    }

    // $('.selectpicker').selectpicker({
    //     style: 'btn-link',
    // });

    $('[data-toggle="tooltip"]').tooltip();

    //assigning value
    $('select[name="customer_id"]').val($('input[name="customer_id_hidden"]').val());
    $('select[name="warehouse_id"]').val($('input[name="warehouse_id_hidden"]').val());
    $('select[name="biller_id"]').val($('input[name="biller_id_hidden"]').val());
    $('select[name="sale_status"]').val($('input[name="sale_status_hidden"]').val());
    $('select[name="order_tax_rate"]').val($('input[name="order_tax_rate_hidden"]').val());
    $('.selectpicker').selectpicker('refresh');

    $('#item').text($('input[name="item"]').val() + '(' + $('input[name="total_qty"]').val() + ')');
    $('#subtotal').text(parseFloat($('input[name="total_price"]').val()).toFixed(2));
    $('#order_tax').text(parseFloat($('input[name="order_tax"]').val()).toFixed(2));
    if(!$('input[name="order_discount"]').val())
        $('input[name="order_discount"]').val('0.00');
    $('#order_discount').text(parseFloat($('input[name="order_discount"]').val()).toFixed(2));
    if(!$('input[name="shipping_cost"]').val())
        $('input[name="shipping_cost"]').val('0.00');
    $('#shipping_cost').text(parseFloat($('input[name="shipping_cost"]').val()).toFixed(2));
    $('#grand_total').text(parseFloat($('input[name="grand_total"]').val()).toFixed(2));

    var id = $('select[name="customer_id"]').val();
    var url = "{{ route('superAdmin.sale.getcustomergroup', ':id') }}";
    var coustormelistUrl = url.replace(':id', id);
    $.get(coustormelistUrl, function(data) {
        customer_group_rate = (data / 100);
    });

    var id = $('select[name="warehouse_id"]').val();
    var url = "{{ route('superAdmin.sale.getProduct', ':id') }}";
    var getlistUrl = url.replace(':id', id);
    $.get(getlistUrl, function(data) {
        lims_product_array = [];
        product_code = data[0];
        product_name = data[1];
        product_qty = data[2];
        product_type = data[3];
        product_id = data[4];
        product_list = data[5];
        qty_list = data[6];
        product_warehouse_price = data[7];
        batch_no = data[8];
        product_batch_id = data[9];
        expired_date = data[10];
        is_embeded = data[11];
        $.each(product_code, function(index) {
            if(exist_code.includes(product_code[index])) {
                pos = exist_code.indexOf(product_code[index]);
                product_qty[index] = product_qty[index] + exist_qty[pos];
                exist_code.splice(pos, 1);
                exist_qty.splice(pos, 1);
            }
            if(is_embeded[index])
                lims_product_array.push(product_code[index] + ' (' + product_name[index] + ')|' + is_embeded[index]);
            else
                lims_product_array.push(product_code[index] + ' (' + product_name[index] + ')');
        });
        $.each(exist_code, function(index) {
            product_type.push(exist_type[index]);
            product_code.push(exist_code[index]);
            product_qty.push(exist_qty[index]);
        });
    });

    isCashRegisterAvailable(id);

    $('select[name="customer_id"]').on('change', function() {
        var id = $(this).val();
        var url = "{{ route('superAdmin.sale.getcustomergroup', ':id') }}";
        var coustormelistUrl = url.replace(':id', id);
        $.get(coustormelistUrl, function(data) {
            customer_group_rate = (data / 100);
        });
    });

    $('select[name="warehouse_id"]').on('change', function() {
        var id = $(this).val();
        var id = $('select[name="warehouse_id"]').val();
        var url = "{{ route('superAdmin.sale.getProduct', ':id') }}";
        var getlistUrl = url.replace(':id', id);
        $.get(getlistUrl, function(data) {
            lims_product_array = [];
            product_code = data[0];
            product_name = data[1];
            product_qty = data[2];
            product_type = data[3];
            product_id = data[4];
            product_list = data[5];
            qty_list = data[6];
            product_warehouse_price = data[7];
            batch_no = data[8];
            product_batch_id = data[9];
            expired_date = data[10];
            $.each(product_code, function(index) {
                lims_product_array.push(product_code[index] + ' (' + product_name[index] + ')');
            });
        });
        isCashRegisterAvailable(id);
    });

    var lims_productcodeSearch = $('#lims_productcodeSearch');
    lims_productcodeSearch.autocomplete({
        source: function(request, response) {
            var matcher = new RegExp(".?" + $.ui.autocomplete.escapeRegex(request.term), "i");
            response($.grep(lims_product_array, function(item) {
                return matcher.test(item);
            }));
        },
        response: function(event, ui) {
            if (ui.content.length == 1) {
                var data = ui.content[0].value;
                $(this).autocomplete( "close" );
                productSearch(data);
            }
            else if(ui.content.length == 0 && $('#lims_productcodeSearch').val().length == 13) {
                productSearch($('#lims_productcodeSearch').val()+'|'+1);
            }
        },
        select: function(event, ui) {
            var data = ui.item.value;
            productSearch(data);
        }
    });

    $("#myTable").on('input', '.qty', function() {
        rowindex = $(this).closest('tr').index();
        if($(this).val() < 0 && $(this).val() != '') {
          $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(1);
          alert("Quantity can't be less than 0");
        }
        if(is_variant[rowindex])
            checkQuantity($(this).val(), true);
        else
            checkDiscount($(this).val(), true);
    });

    //Delete product
    $("table.order-list tbody").on("click", ".ibtnDel", function(event) {
        rowindex = $(this).closest('tr').index();
        product_price.splice(rowindex, 1);
        product_discount.splice(rowindex, 1);
        tax_rate.splice(rowindex, 1);
        tax_name.splice(rowindex, 1);
        tax_method.splice(rowindex, 1);
        unit_code.splice(rowindex, 1);
        unit_operator.splice(rowindex, 1);
        unit_operation_value.splice(rowindex, 1);
        $(this).closest("tr").remove();
        calculateTotal();
    });

    //Edit product
    $("table.order-list").on("click", ".edit-product", function() {
        rowindex = $(this).closest('tr').index();
        edit();
    });

    //Update product
    $('button[name="update_btn"]').on("click", function() {
        if(is_imei[rowindex]) {
            var imeiNumbers = $("#editModal input[name=imei_numbers]").val();
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.imei-number').val(imeiNumbers);
        }

        var edit_discount = $('input[name="edit_discount"]').val();
        var edit_qty = $('input[name="edit_qty"]').val();
        var edit_unit_price = $('input[name="edit_unit_price"]').val();

        if (parseFloat(edit_discount) > parseFloat(edit_unit_price)) {
            alert('Invalid Discount Input!');
            return;
        }

        if(edit_qty < 1) {
            $('input[name="edit_qty"]').val(1);
            edit_qty = 1;
            alert("Quantity can't be less than 1");
        }

        var tax_rate_all = @php echo json_encode($tax_rate_all) @endphp;
        tax_rate[rowindex] = parseFloat(tax_rate_all[$('select[name="edit_tax_rate"]').val()]);
        tax_name[rowindex] = $('select[name="edit_tax_rate"] option:selected').text();
        if(product_type[pos] == 'standard'){
            var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
            var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[rowindex].indexOf(","));
            if (row_unit_operator == '*') {
                product_price[rowindex] = $('input[name="edit_unit_price"]').val() / row_unit_operation_value;
            } else {
                product_price[rowindex] = $('input[name="edit_unit_price"]').val() * row_unit_operation_value;
            }
            var position = $('select[name="edit_unit"]').val();
            var temp_operator = temp_unit_operator[position];
            var temp_operation_value = temp_unit_operation_value[position];
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sale-unit').val(temp_unit_code[position]);
            temp_unit_code.splice(position, 1);
            temp_unit_operator.splice(position, 1);
            temp_unit_operation_value.splice(position, 1);

            temp_unit_code.unshift($('select[name="edit_unit"] option:selected').text());
            temp_unit_operator.unshift(temp_operator);
            temp_unit_operation_value.unshift(temp_operation_value);

            unit_code[rowindex] = temp_unit_code.toString() + ',';
            unit_operator[rowindex] = temp_unit_operator.toString() + ',';
            unit_operation_value[rowindex] = temp_unit_operation_value.toString() + ',';
        }
        else {
            product_price[rowindex] = $('input[name="edit_unit_price"]').val();
        }
        product_discount[rowindex] = $('input[name="edit_discount"]').val();
        checkDiscount(edit_qty, false);
        //checkQuantity(edit_qty, false);
    });

    $("#myTable").on("change", ".batch-no", function () {
        rowindex = $(this).closest('tr').index();
        var product_id = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-id').val();
        var warehouse_id = $('select[name="warehouse_id"]').val();

        var id = product_id;
        var url = "{{ route('superAdmin.sale.checkAvailability', ':id') }}";
        var getUrl = url.replace(':id', id) + '/' + $(this).val() + '/' + warehouse_id ;

        $.get(getUrl, function(data) {
            if(data['message'] != 'ok') {
                alert(data['message']);
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.batch-no').val('');
            }
            else {
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-batch-id').val(data['product_batch_id']);
                code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-code').val();
                console.log(code);
                pos = product_code.indexOf(code);
                product_qty[pos] = data['qty'];
            }
        });
    });

    function isCashRegisterAvailable(warehouse_id) {
        var id = warehouse_id;
        var url = "{{ route('superAdmin.sale.checkAvailability', ':id') }}";
        var getUrl = url.replace(':id', id);
        $.ajax({
            url: getUrl,
            type: "GET",
            success:function(data) {
                if(data == 'false') {
                    $('#cash-register-modal select[name=warehouse_id]').val(warehouse_id);
                    $('.selectpicker').selectpicker('refresh');
                    if(role_id <= 2){
                        $("#cash-register-modal .warehouse-section").removeClass('d-none');
                    }
                    else {
                        $("#cash-register-modal .warehouse-section").addClass('d-none');
                    }
                    $("#cash-register-modal").modal('show');
                }
            }
        });
    }

    function productSearch(data) {
            var product_info = data.split(" ");
            var code = product_info[0];
            var pre_qty = 0;
            $(".product-code").each(function(i) {
                if ($(this).val() == code) {
                    rowindex = i;
                    pre_qty = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val();
                }
            });
            data += '?' + $('#customer_id').val() + '?' + (parseFloat(pre_qty) + 1);
            alert(data);
            $.ajax({
                type: 'GET',
                url: "{{ route('superAdmin.sale.productSearch') }}",
                // url: 'lims_product_search',
                data: {
                    data: data
                },
                success: function(data) {

                    console.log(data);
                    var flag = 1;
                    if (pre_qty > 0) {
                        var qty = data[15];
                        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(qty);
                        pos = product_code.indexOf(data[1]);
                        if (!data[11] && product_warehouse_price[pos]) {
                            product_price[rowindex] = parseFloat(product_warehouse_price[pos] [
                                'exchange_rate']) + parseFloat(product_warehouse_price[pos] [
                                'exchange_rate'] * customer_group_rate);
                        } else {
                            product_price[rowindex] = parseFloat(data[2] ) +
                                parseFloat(data[2]  * customer_group_rate);
                        }
                        flag = 0;
                        checkQuantity(String(qty), true);
                        flag = 0;
                    }
                    $("input[name='product_code_name']").val('');
                    if (flag) {
                        var newRow = $("<tr>");
                        var cols = '';
                        pos = product_code.indexOf(data[1]);
                        temp_unit_code = (data[6]).split(',');
                        cols += '<td>' + data[0] +
                            '<button type="button" class="edit-product btn btn-link" data-toggle="modal" data-target="#editModal"> <i class="fas fa-edit"></i></i></button></td>';
                        cols += '<td>' + data[1] + '</td>';
                        cols += '<td><input type="number" class="form-control qty" name="qty[]" value="' + data[
                            15] + '" step="any" required/></td>';
                        if(data[12]) {
                            cols += '<td><input type="text" class="form-control batch-no" value="'+batch_no[pos]+'" required/> <input type="hidden" class="product-batch-id" name="product_batch_id[]" value="'+product_batch_id[pos]+'"/> </td>';
                            cols += '<td class="expired-date">'+expired_date[pos]+'</td>';
                        }
                        else {
                            cols += '<td><input type="text" class="form-control batch-no" disabled/> <input type="hidden" class="product-batch-id" name="product_batch_id[]"/> </td>';
                            cols += '<td class="expired-date">N/A</td>';
                        }

                        cols += '<td class="net_unit_price"></td>';
                        cols += '<td class="discount">0.00</td>';
                        cols += '<td class="tax"></td>';
                        cols += '<td class="sub-total"></td>';
                        cols +=
                            '<td><button type="button" class="ibtnDel btn btn-md btn-danger">{{ trans('delete') }}</button></td>';
                        cols += '<input type="hidden" class="product-code" name="product_code[]" value="' +
                            data[1] + '"/>';
                        cols += '<input type="hidden" class="product-id" name="product_id[]" value="' + data[
                            9] + '"/>';
                        cols += '<input type="hidden" class="sale-unit" name="sale_unit[]" value="' +
                            temp_unit_code[0] + '"/>';
                        cols += '<input type="hidden" class="net_unit_price" name="net_unit_price[]" />';
                        cols += '<input type="hidden" class="discount-value" name="discount[]" />';
                        cols += '<input type="hidden" class="tax-rate" name="tax_rate[]" value="' + data[3] +
                            '"/>';
                        cols += '<input type="hidden" class="tax-value" name="tax[]" />';
                        cols += '<input type="hidden" class="subtotal-value" name="subtotal[]" />';
                        cols += '<input type="hidden" class="imei-number" name="imei_number[]" />';

                        newRow.append(cols);
                        $("table.order-list tbody").prepend(newRow);
                        rowindex = newRow.index();

                        if (!data[11] && product_warehouse_price[pos]) {
                            product_price.splice(rowindex, 0, parseFloat(product_warehouse_price[pos] ) + parseFloat(product_warehouse_price[pos]  * customer_group_rate));
                        } else {
                            product_price.splice(rowindex, 0, parseFloat(data[2]) +
                                parseFloat(data[2] * customer_group_rate));
                        }
                        product_discount.splice(rowindex, 0, '0.00');
                        tax_rate.splice(rowindex, 0, parseFloat(data[3]));
                        tax_name.splice(rowindex, 0, data[4]);
                        tax_method.splice(rowindex, 0, data[5]);
                        unit_code.splice(rowindex, 0, data[6]);
                        unit_operator.splice(rowindex, 0, data[7]);
                        unit_operation_value.splice(rowindex, 0, data[8]);
                        is_imei.splice(rowindex, 0, data[13]);
                        is_variant.splice(rowindex, 0, data[14]);
                        checkQuantity(data[15], true);
                        if (data[13]) {
                            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find(
                                '.edit-product').click();
                        }
                    }
                }
            });
        }

    function edit()
    {
        $(".imei-section").remove();
        if(is_imei[rowindex]) {
            var imeiNumbers = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.imei-number').val();

            htmlText = '<div class="col-md-12 form-group imei-section"><label>IMEI or Serial Numbers</label><input type="text" name="imei_numbers" value="'+imeiNumbers+'" class="form-control imei_number" placeholder="Type imei or serial numbers and separate them by comma. Example:1001,2001" step="any"></div>';
            $("#editModal .modal-element").append(htmlText);
        }

        var row_product_name = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(1)').text();
        var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text();
        $('#modal_header').text(row_product_name + '(' + row_product_code + ')');

        var qty = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val();
        $('input[name="edit_qty"]').val(qty);

        $('input[name="edit_discount"]').val(parseFloat(product_discount[rowindex]).toFixed(2));

        var tax_name_all = @php echo json_encode($tax_name_all) @endphp;
        pos = tax_name_all.indexOf(tax_name[rowindex]);
        $('select[name="edit_tax_rate"]').val(pos);

        pos = product_code.indexOf(row_product_code);
        if(product_type[pos] == 'standard'){
            unitConversion();
            temp_unit_code = (unit_code[rowindex]).split(',');
            temp_unit_code.pop();
            temp_unit_operator = (unit_operator[rowindex]).split(',');
            temp_unit_operator.pop();
            temp_unit_operation_value = (unit_operation_value[rowindex]).split(',');
            temp_unit_operation_value.pop();
            $('select[name="edit_unit"]').empty();
            $.each(temp_unit_code, function(key, value) {
                $('select[name="edit_unit"]').append('<option value="' + key + '">' + value + '</option>');
            });
            $("#edit_unit").show();
        }
        else{
            row_product_price = product_price[rowindex];
            $("#edit_unit").hide();
        }
        $('input[name="edit_unit_price"]').val(row_product_price.toFixed(2));
        $('.selectpicker').selectpicker('refresh');
    }

    function checkDiscount(qty, flag) {
        var customer_id = $('#customer_id').val();
        var product_id = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .product-id').val();

        if(flag) {
            $.ajax({
                type: 'GET',
                async: false,
                url: "{{route('superAdmin.sale.check_discount')}}" + '?qty=' + qty + '&customer_id='+customer_id+'&product_id='+ product_id,
                // url: '../check-discount?qty='+qty+'&customer_id='+customer_id+'&product_id='+product_id,
                success: function(data) {
                    console.log(data);
                    pos = product_code.indexOf($('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .product-code').val());
                    product_price[rowindex] = parseFloat(data[0] ) + parseFloat(data[0]  * customer_group_rate);
                }
            });
        }
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(qty);
        checkQuantity(String(qty), flag);
        localStorage.setItem("tbody-id", $("table.order-list tbody").html());
    }

    function checkQuantity(sale_qty, flag) {
        var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)').text();
        pos = product_code.indexOf(row_product_code);
        if(product_type[pos] == 'standard'){
            var operator = unit_operator[rowindex].split(',');
            var operation_value = unit_operation_value[rowindex].split(',');
            if(operator[0] == '*')
                total_qty = sale_qty * operation_value[0];
            else if(operator[0] == '/')
                total_qty = sale_qty / operation_value[0];
            if (total_qty > parseFloat(product_qty[pos])) {
                alert('Quantity exceeds stock quantity!');
                if (flag) {
                    sale_qty = sale_qty.substring(0, sale_qty.length - 1);
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(sale_qty);
                }
                else {
                    edit();
                    return;
                }
            }
        }
        else if(product_type[pos] == 'combo'){
            child_id = product_list[pos].split(',');
            child_qty = qty_list[pos].split(',');
            $(child_id).each(function(index) {
                var position = product_id.indexOf(parseInt(child_id[index]));
                if( parseFloat(sale_qty * child_qty[index]) > product_qty[position] ) {
                    alert('Quantity exceeds stock quantity!');
                    if (flag) {
                        sale_qty = sale_qty.substring(0, sale_qty.length - 1);
                        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(sale_qty);
                    }
                    else {
                        edit();
                        flag = true;
                        return false;
                    }
                }
            });
        }
        if(!flag){
            $('#editModal').modal('hide');
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(sale_qty);
        }
        calculateRowProductData(sale_qty);
        }

    function calculateRowProductData(quantity) {
        if(product_type[pos] == 'standard')
            unitConversion();
        else
            row_product_price = product_price[rowindex];

        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.discount').text((product_discount[rowindex] * quantity).toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.discount-value').val((product_discount[rowindex] * quantity).toFixed(2));
        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-rate').val(tax_rate[rowindex].toFixed(2));

        if (tax_method[rowindex] == 1) {
            var net_unit_price = row_product_price - product_discount[rowindex];
            var tax = net_unit_price * quantity * (tax_rate[rowindex] / 100);
            var sub_total = (net_unit_price * quantity) + tax;

            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_price').text(net_unit_price.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_price').val(net_unit_price.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax').text(tax.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sub-total').text(sub_total.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total.toFixed(2));
        } else {
            var sub_total_unit = row_product_price - product_discount[rowindex];
            var net_unit_price = (100 / (100 + tax_rate[rowindex])) * sub_total_unit;
            var tax = (sub_total_unit - net_unit_price) * quantity;
            var sub_total = sub_total_unit * quantity;

            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_price').text(net_unit_price.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_price').val(net_unit_price.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax').text(tax.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sub-total').text(sub_total.toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total.toFixed(2));
        }

        calculateTotal();
    }

    function unitConversion() {
        var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
        var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[rowindex].indexOf(","));

        if (row_unit_operator == '*') {
            row_product_price = product_price[rowindex] * row_unit_operation_value;
        } else {
            row_product_price = product_price[rowindex] / row_unit_operation_value;
        }
    }

    function calculateTotal() {
        //Sum of quantity
        var total_qty = 0;
        $(".qty").each(function() {

            if ($(this).val() == '') {
                total_qty += 0;
            } else {
                total_qty += parseFloat($(this).val());
            }
        });
        $("#total-qty").text(total_qty);
        $('input[name="total_qty"]').val(total_qty);

        //Sum of discount
        var total_discount = 0;
        $(".discount").each(function() {
            total_discount += parseFloat($(this).text());
        });
        $("#total-discount").text(total_discount.toFixed(2));
        $('input[name="total_discount"]').val(total_discount.toFixed(2));

        //Sum of tax
        var total_tax = 0;
        $(".tax").each(function() {
            total_tax += parseFloat($(this).text());
        });
        $("#total-tax").text(total_tax.toFixed(2));
        $('input[name="total_tax"]').val(total_tax.toFixed(2));

        //Sum of subtotal
        var total = 0;
        $(".sub-total").each(function() {
            total += parseFloat($(this).text());
        });
        $("#total").text(total.toFixed(2));
        $('input[name="total_price"]').val(total.toFixed(2));

        calculateGrandTotal();
    }

    function calculateGrandTotal() {

        var item = $('table.order-list tbody tr:last').index();

        var total_qty = parseFloat($('#total-qty').text());
        var subtotal = parseFloat($('#total').text());
        var order_tax = parseFloat($('select[name="order_tax_rate"]').val());
        var shipping_cost = parseFloat($('input[name="shipping_cost"]').val());
        var order_discount_type = $('select[name="order_discount_type"]').val();
        var order_discount_value = parseFloat($('input[name="order_discount_value"]').val());

        if (!order_discount_value)
            order_discount_value = 0.00;

        if(order_discount_type == 'Flat')
            var order_discount = parseFloat(order_discount_value);
        else
            var order_discount = parseFloat(subtotal * (order_discount_value / 100));

        $('input[name="order_discount"]').val(order_discount);

        if (!shipping_cost)
            shipping_cost = 0.00;

        item = ++item + '(' + total_qty + ')';
        order_tax = (subtotal - order_discount) * (order_tax / 100);
        var grand_total = (subtotal + order_tax + shipping_cost) - order_discount;
        $('input[name="grand_total"]').val(grand_total.toFixed(2));
        if($('input[name="coupon_active"]').val()) {
            couponDiscount();
            var coupon_discount = parseFloat($('input[name="coupon_discount"]').val());
            if (!coupon_discount)
                coupon_discount = 0.00;
            grand_total -= coupon_discount;
        }

        $('#item').text(item);
        $('input[name="item"]').val($('table.order-list tbody tr:last').index() + 1);
        $('#subtotal').text(subtotal.toFixed(2));
        $('#order_tax').text(order_tax.toFixed(2));
        $('input[name="order_tax"]').val(order_tax.toFixed(2));
        $('#order_discount').text(order_discount.toFixed(2));
        $('#shipping_cost').text(shipping_cost.toFixed(2));
        $('#grand_total').text(grand_total.toFixed(2));
        $('input[name="grand_total"]').val(grand_total.toFixed(2));
    }

    function couponDiscount() {
        var rownumber = $('table.order-list tbody tr:last').index();
        if (rownumber < 0) {
            alert("Please insert product to order table!")
        }
        else{
            if($('input[name="coupon_type"]').val() == 'fixed'){
                if( $('input[name="grand_total"]').val() >= $('input[name="coupon_minimum_amount"]').val() ) {
                    $('input[name="grand_total"]').val( $('input[name="grand_total"]').val() - $('input[name="coupon_amount"]').val() );
                }
                else
                    alert('Grand Total is not sufficient for discount! Required '+ currency['code'] + ' ' +$('input[name="coupon_minimum_amount"]').val());
            }
            else{
                var grand_total = $('input[name="grand_total"]').val();
                var coupon_discount = grand_total * (parseFloat($('input[name="coupon_amount"]').val()) / 100);
                grand_total = grand_total - coupon_discount;
                $('input[name="grand_total"]').val(grand_total);
                $('input[name="coupon_discount"]').val(coupon_discount);
                $('#coupon-text').text(parseFloat(coupon_discount).toFixed(2));
            }
        }
    }

    $('select[name="order_discount_type"]').on("change", function() {
        calculateGrandTotal();
    });

    $('input[name="order_discount_value"]').on("input", function() {
        calculateGrandTotal();
    });

    $('input[name="shipping_cost"]').on("input", function() {
        calculateGrandTotal();
    });

    $('select[name="order_tax_rate"]').on("change", function() {
        calculateGrandTotal();
    });

    $(window).keydown(function(e){
        if (e.which == 13) {
            var $targ = $(e.target);
            if (!$targ.is("textarea") && !$targ.is(":button,:submit")) {
                var focusNext = false;
                $(this).find(":input:visible:not([disabled],[readonly]), a").each(function(){
                    if (this === e.target) {
                        focusNext = true;
                    }
                    else if (focusNext){
                        $(this).focus();
                        return false;
                    }
                });
                return false;
            }
        }
    });

    $('#payment-form').on('submit',function(e){
        var rownumber = $('table.order-list tbody tr:last').index();
        if (rownumber < 0) {
            alert("Please insert product to order table!")
            e.preventDefault();
        }
        else {
            $("#submit-button").prop('disabled', true);
            $(".batch-no").prop('disabled', false);
        }
    });

    $('.date').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true
        });
    </script>
@endpush
