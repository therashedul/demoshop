@extends('layouts.deshboard')  @section('content')
<section class="forms">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header mt-2">
                <h3 class="text-center">{{trans('Warehouse Report')}}</h3>
            </div>
            {!! Form::open(['route' => 'superAdmin.report.warehouse', 'method' => 'post']) !!}
            <div class="row mb-3">
                <div class="col-md-5 offset-md-1 mt-3">
                    <div class="form-group row">
                        <label class="d-tc mt-2"><strong>{{trans('Choose Your Date')}}</strong> &nbsp;</label>
                        <div class="d-tc">
                            <div class="input-group">
                                <input type="text" class="daterangepicker-field form-control" value="{{$start_date}} To {{$end_date}}" required />
                                <input type="hidden" name="start_date" value="{{$start_date}}" />
                                <input type="hidden" name="end_date" value="{{$end_date}}" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-3">
                    <div class="form-group row">
                        <label class="d-tc mt-2"><strong>{{trans('Choose Warehouse')}}</strong> &nbsp;</label>
                        <div class="d-tc">
                            <input type="hidden" name="warehouse_id_hidden" value="{{$warehouse_id}}" />
                            <select id="warehouse_id" name="warehouse_id" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins">
                                @foreach($lims_warehouse_list as $warehouse)
                                <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 mt-3">
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit">{{trans('submit')}}</button>
                    </div>
                </div>
            </div>
            <input type="hidden" name="warehouse_id_hidden" value="{{$warehouse_id}}" />
            {!! Form::close() !!}


        </div>
    </div>
    <ul class="nav nav-tabs ml-4 mt-3" role="tablist">
      <li class="nav-item">
        <a class="nav-link active" href="#warehouse-sale" role="tab" data-toggle="tab">{{trans('Sale')}}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#warehouse-purchase" role="tab" data-toggle="tab">{{trans('Purchase')}}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#warehouse-quotation" role="tab" data-toggle="tab">{{trans('Quotation')}}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#warehouse-return" role="tab" data-toggle="tab">{{trans('return')}}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#warehouse-expense" role="tab" data-toggle="tab">{{trans('Expense')}}</a>
      </li>
    </ul>

    <div class="tab-content">
        <div role="tabpanel" class="tab-pane fade show active" id="warehouse-sale">
            <div class="table-responsive mb-4">
                <table id="sale-table" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="not-exported-sale"></th>
                            <th>{{trans('Date')}}</th>
                            <th>{{trans('reference')}} No</th>
                            <th>{{trans('customer')}}</th>
                            <th>{{trans('product')}} ({{trans('qty')}})</th>
                            <th>{{trans('grand total')}}</th>
                            <th>{{trans('Paid')}}</th>
                            <th>{{trans('Due')}}</th>
                            <th>{{trans('Status')}}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($lims_sale_data as $key=>$sale)
                        <tr>
                            <td>{{$key}}</td>
                            <td>{{date($general_setting->date_format, strtotime($sale->created_at->toDateString())) . ' '. $sale->created_at->toTimeString()}}</td>
                            <td>{{$sale->reference_no}}</td>
                            <td>{{$sale->customer->name}}</td>
                            <td>
                                @foreach($lims_product_sale_data[$key] as $product_sale_data)
                                <?php
                                    $product = App\Models\Product::select('product_name')->find($product_sale_data->product_id);
                                    if($product_sale_data->variant_id) {
                                        $variant = App\Models\Variant::find($product_sale_data->variant_id);
                                        $product->product_name .= ' ['.optional($variant)->variant_name.']';
                                    }
                                    $unit = App\Models\Unit::find($product_sale_data->sale_unit_id);
                                ?>
                                @if($unit)
                                    {{$product->product_name.' ('.$product_sale_data->qty.' '.$unit->unit_code.')'}}
                                @else
                                    {{$product->product_name.' ('.$product_sale_data->qty.')'}}
                                @endif
                                <br>
                                @endforeach
                            </td>
                            <td>{{$sale->grand_total}}</td>
                            <td>{{$sale->paid_amount}}</td>
                            <td>{{number_format((float)($sale->grand_total - $sale->paid_amount), 2, '.', '')}}</td>
                            @if($sale->sale_status == 1)
                            <td><div class="badge badge-success">{{trans('Completed')}}</div></td>
                            @else
                            <td><div class="badge badge-danger">{{trans('Pending')}}</div></td>
                            @endif
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="tfoot active">
                        <tr>
                            <th></th>
                            <th>Total:</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>0.00</th>
                            <th>0.00</th>
                            <th>0.00</th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane fade" id="warehouse-purchase">
            <div class="table-responsive mb-4">
                <table id="purchase-table" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="not-exported-purchase"></th>
                            <th>{{trans('Date')}}</th>
                            <th>{{trans('reference')}} No</th>
                            <th>{{trans('Supplier')}}</th>
                            <th>{{trans('product')}} ({{trans('qty')}})</th>
                            <th>{{trans('grand total')}}</th>
                            <th>{{trans('Paid')}}</th>
                            <th>{{trans('Due')}}</th>
                            <th>{{trans('Status')}}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($lims_purchase_data as $key=>$purchase)
                        <tr>
                            <td>{{$key}}</td>
                            <?php
                                $supplier = DB::table('suppliers')->find($purchase->supplier_id);
                            ?>
                            <td>{{date($general_setting->date_format, strtotime($purchase->created_at->toDateString())) . ' '. $purchase->created_at->toTimeString()}}</td>
                            <td>{{$purchase->reference_no}}</td>
                            @if($supplier)
                            <td>{{$supplier->name}}</td>
                            @else
                            <td>N/A</td>
                            @endif
                            <td>
                                @foreach($lims_product_purchase_data[$key] as $product_purchase_data)
                                <?php
                                    $product = App\Models\Product::select('product_name')->find($product_purchase_data->product_id);
                                    if($product_purchase_data->variant_id) {
                                        $variant = App\Models\Variant::find($product_purchase_data->variant_id);
                                        $product->product_name .= ' ['.optional($variant)->variant_name.' ]';
                                    }
                                    $unit = App\Models\Unit::find($product_purchase_data->purchase_unit_id);
                                ?>
                                @if($unit)
                                    {{$product->product_name.' ('.$product_purchase_data->qty.' '.$unit->unit_code.')'}}
                                @else
                                    {{$product->product_name.' ('.$product_purchase_data->qty.')'}}
                                @endif
                                <br>
                                @endforeach
                            </td>
                            <td>{{$purchase->grand_total}}</td>
                            <td>{{$purchase->paid_amount}}</td>
                            <td>{{number_format((float)($purchase->grand_total - $purchase->paid_amount), 2, '.', '')}}</td>
                            @if($purchase->status == 1)
                            <td><div class="badge badge-success">{{trans('Completed')}}</div></td>
                            @elseif($purchase->status == 2)
                            <td><div class="badge badge-success">{{trans('Partial')}}</div></td>
                            @elseif($purchase->status == 3)
                            <td><div class="badge badge-success">{{trans('Pending')}}</div></td>
                            @else
                            <td><div class="badge badge-danger">{{trans('Ordered')}}</div></td>
                            @endif
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="tfoot active">
                        <tr>
                            <th></th>
                            <th>Total:</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>0.00</th>
                            <th>0.00</th>
                            <th>0.00</th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane fade" id="warehouse-quotation">
            <div class="table-responsive mb-4">
                <table id="quotation-table" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="not-exported-quotation"></th>
                            <th>{{trans('Date')}}</th>
                            <th>{{trans('reference')}}</th>
                            <th>{{trans('customer')}}</th>
                            <th>{{trans('Supplier')}}</th>
                            <th>{{trans('product')}} ({{trans('qty')}})</th>
                            <th>{{trans('grand total')}}</th>
                            <th>{{trans('Status')}}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($lims_quotation_data as $key=>$quotation)
                        <tr>
                            <td>{{$key}}</td>
                            <?php
                                $supplier = DB::table('suppliers')->find($quotation->supplier_id);
                            ?>
                            <td>{{ date($general_setting->date_format, strtotime($quotation->created_at->toDateString())) }}<br>{{$quotation->created_at->toTimeString()}}</td>
                            <td>{{$quotation->reference_no}}</td>
                            <td>{{$quotation->customer->name}}</td>
                            @if($supplier)
                                <td>{{$supplier->name}}</td>
                            @else
                                <td>N/A</td>
                            @endif
                            <td>
                                @foreach($lims_product_quotation_data[$key] as $product_quotation_data)
                                <?php
                                    $product = App\Models\Product::select('product_name')->find($product_quotation_data->product_id);
                                    if($product_quotation_data->variant_id) {
                                        $variant = App\Models\Variant::find($product_quotation_data->variant_id);
                                        $product->product_name .= ' ['.optional($variant)->variant_name.']';
                                    }
                                    $unit = App\Models\Unit::find($product_quotation_data->sale_unit_id);
                                ?>
                                @if($unit)
                                    {{$product->product_name.' ('.$product_quotation_data->qty.' '.$unit->unit_code.')'}}
                                @else
                                    {{$product->product_name.' ('.$product_quotation_data->qty.')'}}
                                @endif
                                <br>
                                @endforeach
                            </td>
                            <td>{{$quotation->grand_total}}</td>
                            @if($quotation->quotation_status == 1)
                            <td><div class="badge badge-danger">{{trans('Pending')}}</div></td>
                            @elseif($quotation->quotation_status == 2)
                            <td><div class="badge badge-success">{{trans('Sent')}}</div></td>
                            @endif
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="tfoot active">
                        <tr>
                            <th></th>
                            <th>Total:</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>0.00</th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane fade" id="warehouse-return">
            <div class="table-responsive mb-4">
                <table id="return-table" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="not-exported-return"></th>
                            <th>{{trans('Date')}}</th>
                            <th>{{trans('reference')}}</th>
                            <th>{{trans('customer')}}</th>
                            <th>{{trans('Biller')}}</th>
                            <th>{{trans('product')}} ({{trans('qty')}})</th>
                            <th>{{trans('grand total')}}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($lims_return_data as $key=>$return)
                        <tr>
                            <td>{{$key}}</td>
                            <td>{{ date($general_setting->date_format, strtotime($return->created_at->toDateString())) }}<br>{{ $return->created_at->toTimeString()}}</td>
                            <td>{{$return->reference_no}}</td>
                            <td>{{$return->customer->name}}</td>
                            <td>{{$return->biller->name}}</td>
                            <td>
                                @foreach($lims_product_return_data[$key] as $product_return_data)
                                <?php
                                    $product = App\Models\Product::find($product_return_data->product_id);
                                    if($product_return_data->variant_id) {
                                        $variant = App\Models\Variant::find($product_return_data->variant_id);
                                        $product->product_name .= ' ['.optional($variant)->variant_name.']';
                                    }
                                    $unit = App\Models\Unit::find($product_return_data->sale_unit_id);
                                ?>
                                @if($unit)
                                    {{$product->product_name.' ('.$product_return_data->qty.' '.$unit->unit_code.')'}}
                                @else
                                    {{$product->product_name.' ('.$product_return_data->qty.')'}}
                                @endif
                                <br>
                                @endforeach
                            </td>
                            <td>{{number_format((float)($return->grand_total), 2, '.', '')}}</td>
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="tfoot active">
                        <tr>
                            <th></th>
                            <th>Total:</th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th>0.00</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div role="tabpanel" class="tab-pane fade" id="warehouse-expense">
            <div class="table-responsive mb-4">
                <table id="expense-table" class="table table-hover">
                    <thead>
                        <tr>
                            <th class="not-exported-expense"></th>
                            <th>{{trans('Date')}}</th>
                            <th>{{trans('reference')}}</th>
                            <th>{{trans('category')}}</th>
                            <th>{{trans('Amount')}}</th>
                            <th>{{trans('Note')}}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($lims_expense_data as $key=>$expense)
                        <tr>
                            <td>{{$key}}</td>
                            <td>{{ date($general_setting->date_format, strtotime($expense->created_at->toDateString())) }}<br>{{ $expense->created_at->toTimeString() }}</td>
                            <td>{{$expense->reference_no}}</td>
                            <td>{{$expense->expenseCategory->name}}</td>
                            <td>{{$expense->amount}}</td>
                            <td>{{$expense->note}}</td>
                        </tr>
                        @endforeach
                    </tbody>
                    <tfoot class="tfoot active">
                        <tr>
                            <th></th>
                            <th>Total:</th>
                            <th></th>
                            <th></th>
                            <th>0.00</th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</section>


@endsection

@push('custom_scripts')
<script type="text/javascript">
    $("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report #warehouse-report-menu").addClass("active");

    $('#warehouse_id').val($('input[name="warehouse_id_hidden"]').val());

    $(".daterangepicker-field").daterangepicker({
  callback: function(startDate, endDate, period){
    var start_date = startDate.format('YYYY-MM-DD');
    var end_date = endDate.format('YYYY-MM-DD');
    var title = start_date + ' To ' + end_date;
    $(this).val(title);
    $('input[name="start_date"]').val(start_date);
    $('input[name="end_date"]').val(end_date);
  }
});

    $('#sale-table').DataTable( {
        "order": [],
        'columnDefs': [
            {
                "orderable": false,
                'targets': 0
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-sale)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_sale(dt, true);
                    $.fn.dataTable.ext.buttons.pdfHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_sale(dt, false);
                },
                footer:true
            },
            {
                extend: 'excel',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-sale)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_sale(dt, true);
                    $.fn.dataTable.ext.buttons.excelHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_sale(dt, false);
                },
                footer:true
            },
            {
                extend: 'csv',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-sale)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_sale(dt, true);
                    $.fn.dataTable.ext.buttons.csvHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_sale(dt, false);
                },
                footer:true
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-sale)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_sale(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum_sale(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum_sale(api, false);
        }
    } );

    function datatable_sum_sale(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 5 ).footer() ).html(dt_selector.cells( rows, 5, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 7 ).footer() ).html(dt_selector.cells( rows, 7, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 5 ).footer() ).html(dt_selector.column( 5, {page:'current'} ).data().sum().toFixed(2));
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.column( 6, {page:'current'} ).data().sum().toFixed(2));
            $( dt_selector.column( 7 ).footer() ).html(dt_selector.cells( rows, 7, { page: 'current' } ).data().sum().toFixed(2));
        }
    }

    $('#purchase-table').DataTable( {
        "order": [],
        'columnDefs': [
            {
                "orderable": false,
                'targets': 0
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-purchase)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_purchase(dt, true);
                    $.fn.dataTable.ext.buttons.pdfHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_purchase(dt, false);
                },
                footer:true
            },
            {
                extend: 'excel',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-purchase)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_purchase(dt, true);
                    $.fn.dataTable.ext.buttons.excelHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_purchase(dt, false);
                },
                footer:true
            },
            {
                extend: 'csv',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-purchase)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_purchase(dt, true);
                    $.fn.dataTable.ext.buttons.csvHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_purchase(dt, false);
                },
                footer:true
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-purchase)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_purchase(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum_purchase(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum_purchase(api, false);
        }
    } );

    function datatable_sum_purchase(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 5 ).footer() ).html(dt_selector.cells( rows, 5, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
            $( dt_selector.column( 7 ).footer() ).html(dt_selector.cells( rows, 7, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 5 ).footer() ).html(dt_selector.column( 5, {page:'current'} ).data().sum().toFixed(2));
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.column( 6, {page:'current'} ).data().sum().toFixed(2));
            $( dt_selector.column( 7 ).footer() ).html(dt_selector.cells( rows, 7, { page: 'current' } ).data().sum().toFixed(2));
        }
    }

    $('#quotation-table').DataTable( {
        "order": [],
        'columnDefs': [
            {
                "orderable": false,
                'targets': 0
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-quotation)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_quotation(dt, true);
                    $.fn.dataTable.ext.buttons.pdfHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_quotation(dt, false);
                },
                footer:true
            },
            {
                extend: 'excel',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_quotation(dt, true);
                    $.fn.dataTable.ext.buttons.excelHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_quotation(dt, false);
                },
                footer:true
            },
            {
                extend: 'csv',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_quotation(dt, true);
                    $.fn.dataTable.ext.buttons.csvHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_quotation(dt, false);
                },
                footer:true
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_quotation(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum_quotation(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum_quotation(api, false);
        }
    } );

    function datatable_sum_quotation(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.column( 6, {page:'current'} ).data().sum().toFixed(2));
        }
    }

    $('#return-table').DataTable( {
        "order": [],
        'columnDefs': [
            {
                "orderable": false,
                'targets': 0
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-return)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_return(dt, true);
                    $.fn.dataTable.ext.buttons.pdfHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_return(dt, false);
                },
                footer:true
            },
            {
                extend: 'excel',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_return(dt, true);
                    $.fn.dataTable.ext.buttons.excelHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_return(dt, false);
                },
                footer:true
            },
            {
                extend: 'csv',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_return(dt, true);
                    $.fn.dataTable.ext.buttons.csvHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_return(dt, false);
                },
                footer:true
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_return(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum_return(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum_return(api, false);
        }
    } );

    function datatable_sum_return(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.column( 6, {page:'current'} ).data().sum().toFixed(2));
        }
    }

    $('#expense-table').DataTable( {
        "order": [],
        'columnDefs': [
            {
                "orderable": false,
                'targets': 0
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                exportOptions: {
                    columns: ':visible:Not(.not-exported-expense)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_expense(dt, true);
                    $.fn.dataTable.ext.buttons.pdfHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_expense(dt, false);
                },
                footer:true
            },
            {
                extend: 'excel',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_expense(dt, true);
                    $.fn.dataTable.ext.buttons.excelHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_expense(dt, false);
                },
                footer:true
            },
            {
                extend: 'csv',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_expense(dt, true);
                    $.fn.dataTable.ext.buttons.csvHtml5.action.call(this, e, dt, button, config);
                    datatable_sum_expense(dt, false);
                },
                footer:true
            },
            {
                extend: 'print',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum_expense(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum_expense(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                columns: ':gt(0)'
            }
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum_expense(api, false);
        }
    } );

    function datatable_sum_expense(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 4 ).footer() ).html(dt_selector.cells( rows, 4, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 4 ).footer() ).html(dt_selector.column( 4, {page:'current'} ).data().sum().toFixed(2));
        }
    }


</script>
@endpush
