@extends('layouts.deshboard')
@section('content')
    @if (session()->has('message'))
        <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}
        </div>
    @endif
    @if (session()->has('not_permitted'))
        <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert"
                aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}
        </div>
    @endif

    <section>
        <div class="container-fluid">
            <div class="card">
                <div class="card-header mt-2">
                    <h3 class="text-center">{{ trans('Sale List') }}</h3>
                </div>
                {!! Form::open(['route' => 'superAdmin.sale', 'method' => 'get']) !!}
                {{-- <div class="row ml-1 mt-2">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label><strong>{{ trans('Date') }}</strong></label>
                            <input type="text" class="daterangepicker-field form-control"
                                value="{{ $starting_date }} To {{ $ending_date }}" required />
                            <input type="hidden" name="starting_date" value="{{ $starting_date }}" />
                            <input type="hidden" name="ending_date" value="{{ $ending_date }}" />
                        </div>
                    </div>
                    <div class="col-md-3 @if (\Auth::user()->role_id > 2) {{ 'd-none' }} @endif">
                        <div class="form-group">
                            <label><strong>{{ trans('Warehouse') }}</strong></label>
                            <select id="warehouse_id" name="warehouse_id" class="selectpicker form-control"
                                data-live-search="true" data-live-search-style="begins">
                                <option value="0">{{ trans('All Warehouse') }}</option>
                                @foreach ($lims_warehouse_list as $warehouse)
                                    <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label><strong>{{ trans('Sale Status') }}</strong></label>
                            <select id="sale-status" class="form-control" name="sale_status">
                                <option value="0">{{ trans('All') }}</option>
                                <option value="1">{{ trans('Completed') }}</option>
                                <option value="2">{{ trans('Pending') }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <label><strong>{{ trans('Payment Status') }}</strong></label>
                            <select id="payment-status" class="form-control" name="payment_status">
                                <option value="0">{{ trans('All') }}</option>
                                <option value="1">{{ trans('Pending') }}</option>
                                <option value="2">{{ trans('Due') }}</option>
                                <option value="3">{{ trans('Partial') }}</option>
                                <option value="4">{{ trans('Paid') }}</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2 mt-3">
                        <div class="form-group">
                            <button class="btn btn-primary" id="filter-btn"
                                type="submit">{{ trans('submit') }}</button>
                        </div>
                    </div>
                </div> --}}
                {!! Form::close() !!}
            </div>

            <a href="{{ route('superAdmin.sale.create') }}" class="btn btn-info"><i class="dripicons-plus"></i>
                {{ trans('Add Sale') }}</a>&nbsp;
            <a href="{{ url('sales/sale_by_csv') }}" class="btn btn-primary"><i class="dripicons-copy"></i>
                {{ trans('Import Sale') }}</a>

        </div>
        <div class="table-responsive">


            {{-- <table id="sale-table" class="table sale-list" style="width: 100%"> --}}
            <table id="tableLoad" class="table data-table table-bordered table-striped sale-list tbody" style="width:100%;">


                <thead>
                    <tr>
                        <th class="not-exported">Image</th>
                        <th>{{ trans('Date') }}</th>
                        <th>{{ trans('reference') }}</th>
                        <th>{{ trans('Biller') }}</th>
                        <th>{{ trans('customer') }}</th>
                        <th>{{ trans('Sale Status') }}</th>
                        <th>{{ trans('Payment Status') }}</th>
                        <th>{{ trans('Delivery Status') }}</th>
                        <th>{{ trans('grand total') }}</th>
                        <th>{{ trans('Returned Amount') }}</th>
                        <th>{{ trans('Paid') }}</th>
                        <th>{{ trans('Due') }}</th>
                        <th class="not-exported">{{ trans('action') }}</th>
                    </tr>
                </thead>

                <tfoot class="tfoot active">
                    <th></th>
                    <th>{{ trans('Total') }}</th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tfoot>
            </table>
        </div>
    </section>

    <div id="sale-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="container mt-3 pb-2 border-bottom">
                    <div class="row">
                        <div class="col-md-6 d-print-none">
                            <button id="print-btn" type="button" class="btn btn-default btn-sm"><i
                                    class="dripicons-print"></i> {{ trans('Print') }}</button>

                            {{ Form::open(['route' => 'superAdmin.sale.sendmail', 'method' => 'post', 'class' => 'sendmail-form']) }}
                            <input type="hidden" name="sale_id">
                            <button class="btn btn-default btn-sm d-print-none"><i class="dripicons-mail"></i>
                                {{ trans('Email') }}</button>
                            {{ Form::close() }}
                        </div>
                        <div class="col-md-6 d-print-none">
                            <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close"
                                class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                        </div>
                        <div class="col-md-12">
                            <h3 id="exampleModalLabel" class="modal-title text-center container-fluid">
                                {{-- {{ $general_setting->site_title }} --}}
                                site title
                            </h3>
                        </div>
                        <div class="col-md-12 text-center">
                            <i style="font-size: 15px;">{{ trans('Sale Details') }}</i>
                        </div>
                    </div>
                </div>
                <div id="sale-content" class="modal-body">
                </div>
                <br>

                <table class="table table-bordered product-sale-list">
                    <thead>
                        <th>#</th>
                        <th>{{ trans('product') }}</th>
                        <th>{{ trans('Batch No') }}</th>
                        <th>{{ trans('Qty') }}</th>
                        <th>{{ trans('Unit') }}</th>
                        <th>{{ trans('Unit Price') }}</th>
                        <th>{{ trans('Tax') }}</th>
                        <th>{{ trans('Discount') }}</th>
                        <th>{{ trans('Subtotal') }}</th>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div id="sale-footer" class="modal-body"></div>
            </div>
        </div>
    </div>

    <div id="view-payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('All') }} {{ trans('Payment') }}
                    </h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <table class="table table-hover payment-list">
                        <thead>
                            <tr>
                                <th>{{ trans('date') }}</th>
                                <th>{{ trans('reference') }}</th>
                                <th>{{ trans('Account') }}</th>
                                <th>{{ trans('Amount') }}</th>
                                <th>{{ trans('Paid By') }}</th>
                                <th>{{ trans('action') }}</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    {{-- Add payment --}}
    <div id="add-payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('Add Payment') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    {!! Form::open([
                        'route' => 'superAdmin.sale.add-payment',
                        'method' => 'post',
                        'files' => true,
                        'class' => 'payment-form',
                    ]) !!}
                    <div class="row">
                        <input type="hidden" name="balance">
                        <div class="col-md-6">
                            <label>{{ trans('Recieved Amount') }} *</label>
                            <input type="text" name="paying_amount" class="form-control numkey" step="any"
                                required>
                        </div>
                        <div class="col-md-6">
                            <label>{{ trans('Paying Amount') }} *</label>
                            <input type="text" id="amount" name="amount" class="form-control" step="any"
                                required>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label>{{ trans('Change') }} : </label>
                            <p class="change ml-2">0.00</p>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label>{{ trans('Paid By') }}</label>
                            <select name="paid_by_id" class="form-control">
                                <option value="1">Cash</option>
                                <option value="2">Gift Card</option>
                                <option value="3">Credit Card</option>
                                <option value="4">Cheque</option>
                                <option value="5">Paypal</option>
                                <option value="6">Deposit</option>
                                @if ($lims_reward_point_setting_data->is_active)
                                    <option value="7">Points</option>
                                @endif
                            </select>
                        </div>
                    </div>
                    <div class="gift-card form-group">
                        <label> {{ trans('Gift Card') }} *</label>
                        <select id="gift_card_id" name="gift_card_id" class="selectpicker form-control"
                            data-live-search="true" data-live-search-style="begins" title="Select Gift Card...">
                            @php
                                $balance = [];
                                $expired_date = [];
                            @endphp
                            @foreach ($lims_gift_card_list as $gift_card)
                                @php
                                    $balance[$gift_card->id] = $gift_card->amount - $gift_card->expense;
                                    $expired_date[$gift_card->id] = $gift_card->expired_date;
                                @endphp
                                <option value="{{ $gift_card->id }}">{{ $gift_card->card_no }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group mt-2">
                        <div class="card-element" class="form-control">
                        </div>
                        <div class="card-errors" role="alert"></div>
                    </div>
                    <div id="cheque">
                        <div class="form-group">
                            <label>{{ trans('Cheque Number') }} *</label>
                            <input type="text" name="cheque_no" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label> {{ trans('Account') }}</label>
                        <select class="form-control selectpicker" name="account_id">
                            @foreach ($lims_account_list as $account)
                                @if ($account->is_default)
                                    <option selected value="{{ $account->id }}">{{ $account->name }}
                                        [{{ $account->account_no }}]</option>
                                @else
                                    <option value="{{ $account->id }}">{{ $account->name }}
                                        [{{ $account->account_no }}]</option>
                                @endif
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>{{ trans('Payment Note') }}</label>
                        <textarea rows="3" class="form-control" name="payment_note"></textarea>
                    </div>

                    <input type="hidden" name="sale_id">

                    <button type="submit" class="btn btn-primary">{{ trans('submit') }}</button>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
    {{-- Update Payment --}}
    <div id="edit-payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('Update Payment') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    {!! Form::open(['route' => 'superAdmin.sale.update-payment', 'method' => 'post', 'class' => 'payment-form']) !!}
                    <div class="row">
                        <div class="col-md-6">
                            <label>{{ trans('Recieved Amount') }} *</label>
                            <input type="text" name="edit_paying_amount" class="form-control numkey" step="any"
                                required>
                        </div>
                        <div class="col-md-6">
                            <label>{{ trans('Paying Amount') }} *</label>
                            <input type="text" name="edit_amount" class="form-control" step="any" required>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label>{{ trans('Change') }} : </label>
                            <p class="change ml-2">0.00</p>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label>{{ trans('Paid By') }}</label>
                            <select name="edit_paid_by_id" class="form-control selectpicker">
                                <option value="1">Cash</option>
                                <option value="2">Gift Card</option>
                                <option value="3">Credit Card</option>
                                <option value="4">Cheque</option>
                                <option value="5">Paypal</option>
                                <option value="6">Deposit</option>
                                @if ($lims_reward_point_setting_data->is_active)
                                    <option value="7">Points</option>
                                @endif
                            </select>
                        </div>
                    </div>
                    <div class="gift-card form-group">
                        <label> {{ trans('Gift Card') }} *</label>
                        <select id="gift_card_id" name="gift_card_id" class="selectpicker form-control"
                            data-live-search="true" data-live-search-style="begins" title="Select Gift Card...">
                            @foreach ($lims_gift_card_list as $gift_card)
                                <option value="{{ $gift_card->id }}">{{ $gift_card->card_no }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group mt-2">
                        <div class="card-element" class="form-control">
                        </div>
                        <div class="card-errors" role="alert"></div>
                    </div>
                    <div id="edit-cheque">
                        <div class="form-group">
                            <label>{{ trans('Cheque Number') }} *</label>
                            <input type="text" name="edit_cheque_no" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label> {{ trans('Account') }}</label>
                        <select class="form-control selectpicker" name="account_id">
                            @foreach ($lims_account_list as $account)
                                <option value="{{ $account->id }}">{{ $account->name }} [{{ $account->account_no }}]
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>{{ trans('Payment Note') }}</label>
                        <textarea rows="3" class="form-control" name="edit_payment_note"></textarea>
                    </div>

                    <input type="text" name="payment_id" class="payment_id">

                    <button type="submit" class="btn btn-primary">{{ trans('update') }}</button>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>

    <div id="add-delivery" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('Add Delivery') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    {!! Form::open(['route' => 'superAdmin.sale.delivery', 'method' => 'post', 'files' => true]) !!}
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>{{ trans('Delivery Reference') }}</label>
                            <p id="dr"></p>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ trans('Sale Reference') }}</label>
                            <p id="sr"></p>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>{{ trans('Status') }} *</label>
                            <select name="status" required class="form-control selectpicker">
                                <option value="1">{{ trans('Packing') }}</option>
                                <option value="2">{{ trans('Delivering') }}</option>
                                <option value="3">{{ trans('Delivered') }}</option>
                            </select>
                        </div>
                        <div class="col-md-6 mt-2 form-group">
                            <label>{{ trans('Delivered By') }}</label>
                            <input type="text" name="delivered_by" class="form-control">
                        </div>
                        <div class="col-md-6 mt-2 form-group">
                            <label>{{ trans('Recieved By') }} </label>
                            <input type="text" name="recieved_by" class="form-control">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ trans('customer') }} *</label>
                            <p id="customer"></p>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ trans('Attach File') }}</label>
                            <input type="file" name="file" class="form-control">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ trans('Address') }} *</label>
                            <textarea rows="3" name="address" class="form-control" required></textarea>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ trans('Note') }}</label>
                            <textarea rows="3" name="note" class="form-control"></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="reference_no">
                    <input type="hidden" name="sale_id">
                    <button type="submit" class="btn btn-primary">{{ trans('submit') }}</button>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
@endsection

@push('custom_scripts')
    <script type="text/javascript">
        $("ul#sale").siblings('a').attr('aria-expanded', 'true');
        $("ul#sale").addClass("show");
        $("ul#sale #sale-list-menu").addClass("active");
        var public_key = @php echo json_encode($lims_pos_setting_data->stripe_public_key) @endphp;

        var reward_point_setting = @php echo json_encode($lims_reward_point_setting_data) @endphp;
        var sale_id = [];
        var user_verified = @php echo json_encode(env('USER_VERIFIED')) @endphp;
        var starting_date = @php echo json_encode($starting_date); @endphp;
        var ending_date = @php echo json_encode($ending_date); @endphp;
        var warehouse_id = @php echo json_encode($warehouse_id); @endphp;
        var sale_status = @php echo json_encode($sale_status); @endphp;
        var payment_status = @php echo json_encode($payment_status); @endphp;
        var balance = @php echo json_encode($balance) @endphp;
        var expired_date = @php echo json_encode($expired_date) @endphp;
        var current_date = @php echo json_encode(date("Y-m-d")) @endphp;
        var payment_date = [];
        var payment_reference = [];
        var paid_amount = [];
        var paying_method = [];
        var payment_id = [];
        var payment_note = [];
        var account = [];
        var deposit;

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $("#warehouse_id").val(warehouse_id);
        $("#sale-status").val(sale_status);
        $("#payment-status").val(payment_status);

        $(".daterangepicker-field").daterangepicker({
            callback: function(startDate, endDate, period) {
                var starting_date = startDate.format('YYYY-MM-DD');
                var ending_date = endDate.format('YYYY-MM-DD');
                var title = starting_date + ' To ' + ending_date;
                $(this).val(title);
                $('input[name="starting_date"]').val(starting_date);
                $('input[name="ending_date"]').val(ending_date);
            }
        });

        $(".gift-card").hide();
        $(".card-element").hide();
        $("#cheque").hide();
        $('#view-payment').modal('hide');

        $('.selectpicker').selectpicker('refresh');

        $(document).on("click", "tr.sale-link td:not(:first-child, :last-child)", function() {
            var sale = $(this).parent().data('sale');
            saleDetails(sale);
        });

        $(document).on("click", ".view", function() {
            var sale = $(this).parent().parent().parent().parent().parent().data('sale');
            saleDetails(sale);
        });

        $(document).on("click", "#print-btn", function() {
            var divContents = document.getElementById("sale-details").innerHTML;
            var a = window.open('');
            a.document.write('<html>');
            a.document.write('<body>');
            a.document.write(
                '<style>body{font-family: sans-serif;line-height: 1.15;-webkit-text-size-adjust: 100%;}.d-print-none{display:none}.text-center{text-align:center}.row{width:100%;margin-right: -15px;margin-left: -15px;}.col-md-12{width:100%;display:block;padding: 5px 15px;}.col-md-6{width: 50%;float:left;padding: 5px 15px;}table{width:100%;margin-top:30px;}th{text-aligh:left}td{padding:10px}table,th,td{border: 1px solid black; border-collapse: collapse;}</style><style>@media print {.modal-dialog { max-width: 1000px;} }</style>'
            );
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            setTimeout(function() {
                a.close();
            }, 10);
            a.print();
        });

        $(document).on("click", "table.sale-list tbody .add-payment", function() {

            $("#cheque").hide();
            $(".gift-card").hide();
            $(".card-element").hide();
            $('select[name="paid_by_id"]').val(1);
            $('.selectpicker').selectpicker('refresh');
            rowindex = $(this).closest('tr').index();
            deposit = $('table.sale-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.deposit').val();
            var sale_id = $(this).data('id').toString();
            var balance = $('table.sale-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(12)')
                .text();
            balance = parseFloat(balance.replace(/,/g, ''));
            $('input[name="paying_amount"]').val(balance);
            $('#add-payment input[name="balance"]').val(balance);
            $('input[name="amount"]').val(balance);
            $('input[name="sale_id"]').val(sale_id);
        });

        $(document).on("click", "table.sale-list tbody .get-payment", function(event) {
            rowindex = $(this).closest('tr').index();
            deposit = $('table.sale-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.deposit').val();
            var id = $(this).data('id').toString();

            var url = "{{ route('superAdmin.sale.getpayment', ':id') }}";
            var getUrl = url.replace(':id', id);



            $.get(getUrl, function(data) {
                $(".payment-list tbody").remove();
                var newBody = $("<tbody>");

                payment_date = data[0];
                payment_reference = data[1];
                paid_amount = data[2];
                paying_method = data[3];
                payment_id = data[4];
                payment_note = data[5];
                cheque_no = data[6];
                gift_card_id = data[7];
                change = data[8];
                paying_amount = data[9];
                account_name = data[10];
                account_id = data[11];

                $.each(payment_date, function(index) {
                    var newRow = $("<tr>");
                    var cols = '';

                    cols += '<td>' + payment_date[index] + '</td>';
                    cols += '<td>' + payment_reference[index] + '</td>';
                    cols += '<td>' + account_name[index] + '</td>';
                    cols += '<td>' + paid_amount[index] + '</td>';
                    cols += '<td>' + paying_method[index] + '</td>';
                    cols +=
                        '<td><div class="btn-group"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ trans('action') }}<span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button><ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">';
                    cols +=
                        '<li><button type="button" class="btn btn-link edit-btn" data-id="' +
                        payment_id[index] +
                        '" data-clicked=false data-toggle="modal" data-target="#edit-payment"><i class="dripicons-document-edit"></i> {{ trans('edit') }}</button></li> ';
                    cols +=
                        '{{ Form::open(['route' => 'superAdmin.sale.delete-payment', 'method' => 'post']) }}<li><input type="hidden" name="id" value="' +
                        payment_id[index] +
                        '" /> <button type="submit" class="btn btn-link" onclick="return confirmPaymentDelete()"><i class="dripicons-trash"></i> {{ trans('delete') }}</button></li>{{ Form::close() }}';

                    cols += '</ul></div></td>';
                    newRow.append(cols);
                    newBody.append(newRow);
                    $("table.payment-list").append(newBody);
                });
                $('#view-payment').modal('show');
            });
        });

        $("table.payment-list").on("click", ".edit-btn", function(event) {
            $(".edit-btn").attr('data-clicked', true);
            $(".card-element").hide();
            $("#edit-cheque").hide();
            $('.gift-card').hide();
            $('#edit-payment select[name="edit_paid_by_id"]').prop('disabled', false);
            var id = $(this).data('id').toString();

            $.each(payment_id, function(index) {
                if (parseFloat(id) == parseFloat(id)) {
                    var pid = $('input[name="payment_id"]').val(payment_id[index]);
                    $('#edit-payment select[name="account_id"]').val(account_id[index]);
                    if (paying_method[index] == 'Cash')
                        $('select[name="edit_paid_by_id"]').val(1);
                    else if (paying_method[index] == 'Gift Card') {
                        $('select[name="edit_paid_by_id"]').val(2);
                        $('#edit-payment select[name="gift_card_id"]').val(gift_card_id[index]);
                        $('.gift-card').show();
                        $('#edit-payment select[name="edit_paid_by_id"]').prop('disabled', true);
                    } else if (paying_method[index] == 'Credit Card') {
                        $('select[name="edit_paid_by_id"]').val(3);
                        $.getScript("public/vendor/stripe/checkout.js");
                        $(".card-element").show();
                        $('#edit-payment select[name="edit_paid_by_id"]').prop('disabled', true);
                    } else if (paying_method[index] == 'Cheque') {
                        $('select[name="edit_paid_by_id"]').val(4);
                        $("#edit-cheque").show();
                        $('input[name="edit_cheque_no"]').val(cheque_no[index]);
                        $('input[name="edit_cheque_no"]').attr('required', true);
                    } else if (paying_method[index] == 'Deposit')
                        $('select[name="edit_paid_by_id"]').val(6);
                    else if (paying_method[index] == 'Points') {
                        $('select[name="edit_paid_by_id"]').val(7);
                    }


                    $("#payment_reference").html(payment_reference[index]);
                    $('input[name="edit_paying_amount"]').val(paying_amount[index]);
                    $('#edit-payment .change').text(change[index]);
                    $('input[name="edit_amount"]').val(paid_amount[index]);
                    $('textarea[name="edit_payment_note"]').val(payment_note[index]);
                    return false;
                }
            });
            $('#view-payment').modal('hide');
        });

        $('select[name="paid_by_id"]').on("change", function() {
            var id = $(this).val();
            $('input[name="cheque_no"]').attr('required', false);
            $('#add-payment select[name="gift_card_id"]').attr('required', false);
            $(".payment-form").off("submit");
            if (id == 2) {
                $(".gift-card").show();
                $(".card-element").hide();
                $("#cheque").hide();
                $('#add-payment select[name="gift_card_id"]').attr('required', true);
            } else if (id == 3) {
                $.getScript("public/vendor/stripe/checkout.js");
                $(".card-element").show();
                $(".gift-card").hide();
                $("#cheque").hide();
            } else if (id == 4) {
                $("#cheque").show();
                $(".gift-card").hide();
                $(".card-element").hide();
                $('input[name="cheque_no"]').attr('required', true);
            } else if (id == 5) {
                $(".card-element").hide();
                $(".gift-card").hide();
                $("#cheque").hide();
            } else {
                $(".card-element").hide();
                $(".gift-card").hide();
                $("#cheque").hide();
                if (id == 6) {
                    if ($('#add-payment input[name="amount"]').val() > parseFloat(deposit))
                        alert('Amount exceeds customer deposit! Customer deposit : ' + deposit);
                } else if (id == 7) {
                    pointCalculation($('#add-payment input[name="amount"]').val());
                }
            }
        });

        $('#add-payment select[name="gift_card_id"]').on("change", function() {
            var id = $(this).val();
            if (expired_date[id] < current_date)
                alert('This card is expired!');
            else if ($('#add-payment input[name="amount"]').val() > balance[id]) {
                alert('Amount exceeds card balance! Gift Card balance: ' + balance[id]);
            }
        });

        $('input[name="paying_amount"]').on("input", function() {
            $(".change").text(parseFloat($(this).val() - $('input[name="amount"]').val()).toFixed(2));
        });

        $('input[name="amount"]').on("input", function() {
            if ($(this).val() > parseFloat($('input[name="paying_amount"]').val())) {
                alert('Paying amount cannot be bigger than recieved amount');
                $(this).val('');
            } else if ($(this).val() > parseFloat($('input[name="balance"]').val())) {
                alert('Paying amount cannot be bigger than due amount');
                $(this).val('');
            }
            $(".change").text(parseFloat($('input[name="paying_amount"]').val() - $(this).val()).toFixed(2));
            var id = $('#add-payment select[name="paid_by_id"]').val();
            var amount = $(this).val();
            if (id == 2) {
                id = $('#add-payment select[name="gift_card_id"]').val();
                if (amount > balance[id])
                    alert('Amount exceeds card balance! Gift Card balance: ' + balance[id]);
            } else if (id == 6) {
                if (amount > parseFloat(deposit))
                    alert('Amount exceeds customer deposit! Customer deposit : ' + deposit);
            } else if (id == 7) {
                pointCalculation(amount);
            }
        });

        $('select[name="edit_paid_by_id"]').on("change", function() {
            var id = $(this).val();
            $('input[name="edit_cheque_no"]').attr('required', false);
            $('#edit-payment select[name="gift_card_id"]').attr('required', false);
            $(".payment-form").off("submit");
            if (id == 2) {
                $(".card-element").hide();
                $("#edit-cheque").hide();
                $('.gift-card').show();
                $('#edit-payment select[name="gift_card_id"]').attr('required', true);
            } else if (id == 3) {
                $(".edit-btn").attr('data-clicked', true);
                $.getScript("public/vendor/stripe/checkout.js");
                $(".card-element").show();
                $("#edit-cheque").hide();
                $('.gift-card').hide();
            } else if (id == 4) {
                $("#edit-cheque").show();
                $(".card-element").hide();
                $('.gift-card').hide();
                $('input[name="edit_cheque_no"]').attr('required', true);
            } else {
                $(".card-element").hide();
                $("#edit-cheque").hide();
                $('.gift-card').hide();
                if (id == 6) {
                    if ($('input[name="edit_amount"]').val() > parseFloat(deposit))
                        alert('Amount exceeds customer deposit! Customer deposit : ' + deposit);
                } else if (id == 7) {
                    pointCalculation($('input[name="edit_amount"]').val());
                }
            }
        });

        $('#edit-payment select[name="gift_card_id"]').on("change", function() {
            var id = $(this).val();
            if (expired_date[id] < current_date)
                alert('This card is expired!');
            else if ($('#edit-payment input[name="edit_amount"]').val() > balance[id])
                alert('Amount exceeds card balance! Gift Card balance: ' + balance[id]);
        });

        $('input[name="edit_paying_amount"]').on("input", function() {
            $(".change").text(parseFloat($(this).val() - $('input[name="edit_amount"]').val()).toFixed(2));
        });

        $('input[name="edit_amount"]').on("input", function() {
            if ($(this).val() > parseFloat($('input[name="edit_paying_amount"]').val())) {
                alert('Paying amount cannot be bigger than recieved amount');
                $(this).val('');
            }
            $(".change").text(parseFloat($('input[name="edit_paying_amount"]').val() - $(this).val()).toFixed(2));
            var amount = $(this).val();
            var id = $('#edit-payment select[name="gift_card_id"]').val();
            if (amount > balance[id]) {
                alert('Amount exceeds card balance! Gift Card balance: ' + balance[id]);
            }
            var id = $('#edit-payment select[name="edit_paid_by_id"]').val();
            if (id == 6) {
                if (amount > parseFloat(deposit))
                    alert('Amount exceeds customer deposit! Customer deposit : ' + deposit);
            } else if (id == 7) {
                pointCalculation(amount);
            }
        });

        $(document).on("click", "table.sale-list tbody .add-delivery", function(event) {
            var id = $(this).data('id').toString();
            var url = "{{ route('superAdmin.sale.delivery.create', ':id') }}";
            var getUrl = url.replace(':id', id);

            $.get(getUrl, function(data) {
                $('#dr').text(data[0]);
                $('#sr').text(data[1]);

                $('select[name="status"]').val(data[2]);
                $('.selectpicker').selectpicker('refresh');
                $('input[name="delivered_by"]').val(data[3]);
                $('input[name="recieved_by"]').val(data[4]);
                $('#customer').text(data[5]);
                $('textarea[name="address"]').val(data[6]);
                $('textarea[name="note"]').val(data[7]);
                $('input[name="reference_no"]').val(data[0]);
                $('input[name="sale_id"]').val(id);
                $('#add-delivery').modal('show');
            });
        });

        function pointCalculation(amount) {
            availablePoints = $('table.sale-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.points').val();
            required_point = Math.ceil(amount / reward_point_setting['per_point_amount']);
            if (required_point > availablePoints) {
                alert('Customer does not have sufficient points. Available points: ' + availablePoints +
                    '. Required points: ' + required_point);
            }
        }

        // DataTable

        var table = $('.data-table').DataTable({
            columnDefs: [{
                    orderable: true,
                    searchable: true,
                    // className: "left",
                    targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                },
                {
                    data: 'id',
                    targets: [0],
                },
                {
                    data: 'date',
                    targets: [1],
                },
                {
                    data: 'reference_no',
                    targets: [2],
                },
                {
                    data: 'biller',
                    targets: [3],
                },
                {
                    data: 'coustomer',
                    targets: [4],
                },
                {
                    data: 'sale_status',
                    targets: [5],
                },
                {
                    data: 'payment_status',
                    targets: [6],
                },
                {
                    data: 'delevery',
                    targets: [7],
                },
                {
                    data: 'grand_total',
                    targets: [8],
                },
                {
                    data: 'returned_amount',
                    targets: [9],
                },
                {
                    data: 'paid_amount',
                    targets: [10],
                },
                {
                    data: 'due',
                    targets: [11],
                },
                {
                    data: 'action',
                    targets: [12],
                },
            ],

            rowCallback: function(row, data, index) {
                $("td:eq(1)", row).css('width', 'auto')
            },
            order: [
                [0, 'desc']
            ],
            lengthMenu: [
                [10, 25, 50, 100, 200],
                [10, 25, 50, 100, 200]
            ],
            searching: false,
            processing: true,
            serverSide: true,
            stateSave: true,
            autoWidth: false,
            pageLength: 10,
            paging: true,
            info: true,
            buttons: true,
            scrollX: true,
            ordering: false,
            deferRender: true,
            scrollCollapse: true,
            scroller: true,
            responsive: true,

            ajax: {
                url: "{{ route('superAdmin.sale') }}",
                data: function(d) {
                    d.purchase_name = $('.searchEmail').val();
                    d.from_date = $('#start_date').val();
                    d.to_date = $('#end_date').val();

                    d.warehouse_id = $("#warehouse_id").val();
                    d.purchase_status = $("#purchase_status").val();
                    d.payment_status = $("#payment_status").val();

                    d.search = $('input[type="search"]').val();
                }
            },
            createdRow: function(row, data, dataIndex) {
                $(row).addClass('purchase-link');
                $(row).attr('data-purchase', data['purchase']);
            },

            dom: 'lBfrtip<"actions">',
            buttons: [{
                    extend: 'copy',
                    text: window.copyButtonTrans,
                    title: 'Datatables example: Customisation of the print view window',
                    exportOptions: {
                        columns: ':visible'
                        // columns: [1, 2, 3] // Column index which needs to export
                    },
                },
                {
                    extend: 'csv',
                    text: window.csvButtonTrans,
                    exportOptions: {
                        columns: ':visible'
                        // columns: [1, 2, 3] // Column index which needs to export
                    },
                },
                {
                    extend: 'excel',
                    text: window.excelButtonTrans,
                    exportOptions: {
                        columns: ':visible'
                        // columns: [1, 2, 3] // Column index which needs to export
                    },
                },
                {
                    extend: 'pdf',
                    text: window.pdfButtonTrans,
                    title: 'Datatables example: Customisation of the print view window',

                    exportOptions: {
                        // columns: ':visible'
                        columns: [1, 2, 3] // Column index which needs to export
                    },

                    // customize: function(doc) {

                    //     $(doc.document.body).find('h1').css('text-align', 'center');
                    //     $(doc.document.body).css('font-size', '9px');
                    //     $(doc.document.body).find('table').addClass('compact').css('font-size',
                    //         'inherit');

                    //     $(doc.document.body).addClass('stylecss');
                    //     $(doc.document.body).css('color', 'red');
                    //     // doc.defaultStyle.fontSize = 19;
                    //     // doc.defaultStyle.fontFamily = 'Arial';
                    // }
                },
                {
                    extend: 'print',
                    text: window.printButtonTrans,
                    className: 'btn btn-danger box-shadow--4dp btn-sm-menu',
                    title: 'Datatables example: Customisation of the print view window',
                    messageTop: 'User Report',
                    messageBottom: 'The information in this table is copyright to Sirius Cybernetics Corp.',
                    exportOptions: {
                        // columns: ':visible'
                        columns: [2, 3] // Column index which needs to export
                    },
                    // customize: function(win) {
                    //     $(win.document.body)
                    //         .css('font-size', '10pt')
                    //         .prepend(
                    //             '<div><img src="http://datatables.net/media/images/logo-fade.png" style="position:absolute; top:0; left:0;"  alt="logo"/></div>'
                    //         );

                    //     $(win.document.body).find('table')
                    //         .addClass('compact')
                    //         .css('font-size', 'inherit');
                    // },
                },
                {
                    extend: 'colvis',
                    text: window.colvisButtonTrans,
                    exportOptions: {
                        columns: ':visible'
                    }
                },
            ],

            language: {
                decimal: "",
                lengthMenu: "Display _MENU_ records per page",
                zeroRecords: "Nothing found - sorry",
                info: "Showing page _PAGE_ of _PAGES_",
                infoEmpty: "No records available",
                paginate: {
                    first: "First",
                    last: "Last",
                    next: '&#8594;', // or '→'
                    previous: '&#8592;' // or '←' 
                },
                processing: '<span>Processing...</span>',

                aria: {
                    sortAscending: ": activate to sort column ascending",
                    sortDescending: ": activate to sort column descending"
                }
            },

        });
        $(".searchEmail").keyup(function() {
            table.draw(true);
        });
        $(".warehouse_id").change(function() {
            table.draw(true);
        });
        $(".purchase_status").change(function() {
            table.draw(true);
        });
        $(".payment_status").change(function() {
            table.draw(true);
        });

        $('.btnchange').change(function() {
            $('#tableLoad').DataTable().draw(true);

            // table.draw(true);
            // $('#tableLoad').DataTable().destroy();

        });

        // Delete
        $('body').on('click', '.deletepurchase', function(e) {
            e.preventDefault();

            var id = $(this).attr("data-id");
            var url = "{{ route('superAdmin.purchase.deleted', ':id') }}";
            var catUrl = url.replace(':id', id);

            let dataDelete = {
                'id': id,
            };
            if (confirm("Are you sure you want to remove this purchase?") == true) {
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: "POST",
                    url: catUrl,
                    data: dataDelete,
                    dataType: "json",
                    success: function(res) {
                        $('#tableLoad').trigger("reset");
                        table.draw();
                    }
                });
            }
        });

        function datatable_sum(dt_selector, is_calling_first) {
            if (dt_selector.rows('.selected').any() && is_calling_first) {
                var rows = dt_selector.rows('.selected').indexes();

                $(dt_selector.column(8).footer()).html(dt_selector.cells(rows, 8, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(9).footer()).html(dt_selector.cells(rows, 9, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(10).footer()).html(dt_selector.cells(rows, 10, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(11).footer()).html(dt_selector.cells(rows, 11, {
                    page: 'current'
                }).data().sum().toFixed(2));
            } else {
                $(dt_selector.column(8).footer()).html(dt_selector.cells(rows, 8, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(9).footer()).html(dt_selector.cells(rows, 9, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(10).footer()).html(dt_selector.cells(rows, 10, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(11).footer()).html(dt_selector.cells(rows, 11, {
                    page: 'current'
                }).data().sum().toFixed(2));
            }
        }

        function saleDetails(sale) {
            $("#sale-details input[name='sale_id']").val(sale[13]);

            var htmltext = '<strong>{{ trans('Date') }}: </strong>' + sale[0] +
                '<br><strong>{{ trans('Reference') }}: </strong>' + sale[1] +
                '<br><strong>{{ trans('Warehouse') }}: </strong>' + sale[27] +
                '<br><strong>{{ trans('Sale Status') }}: </strong>' + sale[2] +
                '<br><br><div class="row"><div class="col-md-6"><strong>{{ trans('From') }}:</strong><br>' + sale[
                    3] + '<br>' + sale[4] + '<br>' + sale[5] + '<br>' + sale[6] + '<br>' + sale[7] + '<br>' + sale[8] +
                '</div><div class="col-md-6"><div class="float-right"><strong>{{ trans('To') }}:</strong><br>' +
                sale[9] + '<br>' + sale[10] + '<br>' + sale[11] + '<br>' + sale[12] + '</div></div></div>';
            var id = sale[13]

            var url = "{{ route('superAdmin.sale.product_sale', ':id') }}";
            var getUrl = url.replace(':id', id);

            $.get(getUrl, function(data) {
                $(".product-sale-list tbody").remove();
                var name_code = data[0];
                var qty = data[1];
                var unit_code = data[2];
                var tax = data[3];
                var tax_rate = data[4];
                var discount = data[5];
                var subtotal = data[6];
                var batch_no = data[7];
                var newBody = $("<tbody>");
                $.each(name_code, function(index) {
                    var newRow = $("<tr>");
                    var cols = '';
                    cols += '<td><strong>' + (index + 1) + '</strong></td>';
                    cols += '<td>' + name_code[index] + '</td>';
                    cols += '<td>' + batch_no[index] + '</td>';
                    cols += '<td>' + qty[index] + '</td>';
                    cols += '<td>' + unit_code[index] + '</td>';
                    cols += '<td>' + parseFloat(subtotal[index] / qty[index]).toFixed(2) + '</td>';
                    cols += '<td>' + tax[index] + '(' + tax_rate[index] + '%)' + '</td>';
                    cols += '<td>' + discount[index] + '</td>';
                    cols += '<td>' + subtotal[index] + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);
                });

                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=6><strong>{{ trans('Total') }}:</strong></td>';
                cols += '<td>' + sale[14] + '</td>';
                cols += '<td>' + sale[15] + '</td>';
                cols += '<td>' + sale[16] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong>{{ trans('Order Tax') }}:</strong></td>';
                cols += '<td>' + sale[17] + '(' + sale[18] + '%)' + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong>{{ trans('Order Discount') }}:</strong></td>';
                cols += '<td>' + sale[19] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);
                if (sale[28]) {
                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=8><strong>{{ trans('Coupon Discount') }} [' + sale[28] +
                        ']:</strong></td>';
                    cols += '<td>' + sale[29] + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);
                }
                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong>{{ trans('Shipping Cost') }}:</strong></td>';
                cols += '<td>' + sale[20] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);
                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong>{{ trans('grand total') }}:</strong></td>';
                cols += '<td>' + sale[21] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong>{{ trans('Paid Amount') }}:</strong></td>';
                cols += '<td>' + sale[22] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong>{{ trans('Due') }}:</strong></td>';
                cols += '<td>' + parseFloat(sale[21] - sale[22]).toFixed(2) + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                $("table.product-sale-list").append(newBody);
            });
            var htmlfooter = '<p><strong>{{ trans('Sale Note') }}:</strong> ' + sale[23] +
                '</p><p><strong>{{ trans('Staff Note') }}:</strong> ' + sale[24] +
                '</p><strong>{{ trans('Created By') }}:</strong><br>' + sale[25] + '<br>' + sale[26];
            $('#sale-content').html(htmltext);
            $('#sale-footer').html(htmlfooter);
            $('#sale-details').modal('show');
        }

        $(document).on('submit', '.payment-form', function(e) {
            if ($('input[name="paying_amount"]').val() < parseFloat($('#amount').val())) {
                alert('Paying amount cannot be bigger than recieved amount');
                $('input[name="amount"]').val('');
                $(".change").text(parseFloat($('input[name="paying_amount"]').val() - $('#amount').val()).toFixed(
                    2));
                e.preventDefault();
            } else if ($('input[name="edit_paying_amount"]').val() < parseFloat($('input[name="edit_amount"]')
                    .val())) {
                alert('Paying amount cannot be bigger than recieved amount');
                $('input[name="edit_amount"]').val('');
                $(".change").text(parseFloat($('input[name="edit_paying_amount"]').val() - $(
                    'input[name="edit_amount"]').val()).toFixed(2));
                e.preventDefault();
            }

            $('#edit-payment select[name="edit_paid_by_id"]').prop('disabled', false);
        });

        $('.buttons-delete').addClass('d-none');
        // if (all_permission.indexOf("sales-delete") == -1){

        // }

        function confirmDelete() {
            if (confirm("Are you sure want to delete?")) {
                return true;
            }
            return false;
        }

        function confirmPaymentDelete() {
            if (confirm("Are you sure want to delete? If you delete this money will be refunded.")) {
                return true;
            }
            return false;
        }
    </script>
    <script type="text/javascript" src="https://js.stripe.com/v3/"></script>
@endpush
