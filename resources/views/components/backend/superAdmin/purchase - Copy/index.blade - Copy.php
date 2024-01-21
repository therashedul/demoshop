@extends('layouts.deshboard')
@section('content')
    <div class="container">

        <div class="custom-daterange " style="display: none">
            <div class="form-group col-md-4 ">
                <h5>Start Date <span class="text-danger"></span></h5>
                <div class="controls">
                    <input type="date" name="start_date" id="start_date" class="form-control datepicker-autoclose"
                        placeholder="Please select start date">
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="form-group col-md-4">
                <h5>End Date <span class="text-danger"></span></h5>
                <div class="controls">
                    <input type="date" name="end_date" id="end_date" class="form-control datepicker-autoclose btnchange"
                        placeholder="Please select end date">
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="form-group col-md-4">
                <h5> Search</h5>
                <input type="text" name="purchase_name" class="form-control searchEmail" placeholder="Search ...">
                {{-- <div class="text-left" style=" margin-left: 15px;">
                    <button type="text" id="btnFiterSubmitSearch" class="btn btn-info">Submit</button>
                </div> --}}
            </div>
        </div>
    </div>

    <div class="container px-4 ">
        <div class="row justify-content-center align-items-center g-2">
            <a class="btn btn-primary float-right pull-right" href="{{ route('superAdmin.purchase.create') }}"
                id="createNewpurchase"> Add New purchase</a> &NonBreakingSpace; &nbsp;
            <button type="button" class="btn btn-info searchBtn"><i class="fas fa-search-plus"></i> Search</button>
        </div>
        <script type="text/javascript">
            // $('.custom-daterange').css('padding-top', '2%');
            $('.searchBtn').click(function(e) {
                e.preventDefault();
                $(".custom-daterange").animate({
                    height: 'toggle'
                });
                // $(".custom-daterange").slideToggle("slow");
            })
        </script>

        <table id="tableLoad" class="table table-bordered data-table purchase-list">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{ trans('Date') }}</th>
                    <th>{{ trans('reference') }}</th>
                    <th>{{ trans('Supplier') }}</th>
                    <th>{{ trans('Purchase Status') }}</th>
                    <th>{{ trans('grand total') }}</th>
                    <th>{{ trans('Returned Amount') }}</th>
                    <th>{{ trans('Paid') }}</th>
                    <th>{{ trans('Due') }}</th>
                    <th>{{ trans('Payment Status') }}</th>
                    <th class="not-exported">{{ trans('action') }}</th>




                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <!-- Modal for purchase Add -->
    {{-- <div id="purchase-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="container mt-3 pb-2 border-bottom">
                    <div class="row">
                        <div class="col-md-6 d-print-none">
                            <button id="print-btn" type="button" class="btn btn-default btn-sm"><i
                                    class="dripicons-print"></i> {{ trans('Print') }}</button>
                        </div>
                        <div class="col-md-6 d-print-none">
                            <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close"
                                class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                        </div>
                        <div class="col-md-12">
                            <h3 id="exampleModalLabel" class="modal-title text-center container-fluid">
                                {{ $general_setting->site_title }}</h3>
                        </div>
                        <div class="col-md-12 text-center">
                            <i style="font-size: 15px;">{{ trans('Purchase Details') }}</i>
                        </div>
                    </div>
                </div>
                <div id="purchase-content" class="modal-body"></div>
                <br>
                <table class="table table-bordered product-purchase-list">
                    <thead>
                        <th>#</th>
                        <th>{{ trans('product') }}</th>
                        <th>{{ trans('Batch No') }}</th>
                        <th>Qty</th>
                        <th>{{ trans('Unit Cost') }}</th>
                        <th>{{ trans('Tax') }}</th>
                        <th>{{ trans('Discount') }}</th>
                        <th>{{ trans('Subtotal') }}</th>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div id="purchase-footer" class="modal-body"></div>
            </div>
        </div>
    </div> --}}

    <div id="view-payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('All Payment') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <table class="table table-hover payment-list">
                        <thead>
                            <tr>
                                <th>{{ trans('date') }}</th>
                                <th>{{ trans('Reference No') }}</th>
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


    {{-- add-payment --}}
    <div id="addPayment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">

        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('Add Payment') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    {!! Form::open(['route' => 'superAdmin.purchase.add-payment', 'method' => 'post', 'class' => 'payment-form']) !!}
                    <div class="row">
                        <input type="hidden" name="balance">
                        <div class="col-md-6">
                            <label>{{ trans('Recieved Amount') }} *</label>
                            <input type="text" name="paying_amount" class="form-control numkey" step="any" required>
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
                            <select name="paid_by_id" class="form-control paidBy" id="paidBy">
                                <option value="1">Cash</option>
                                <option value="3">Credit Card</option>
                                <option value="4">Cheque</option>
                            </select>
                        </div>
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

                    <input type="hidden" name="purchase_id">

                    <button type="submit" class="btn btn-primary">{{ trans('submit') }}</button>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>

    {{-- =============================================== --}}
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
                    {!! Form::open(['route' => 'superAdmin.purchase.add-payment', 'method' => 'post', 'class' => 'payment-form']) !!}
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
                                <option value="3">Credit Card</option>
                                <option value="4">Cheque</option>
                            </select>
                        </div>
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

                    <input type="hidden" name="purchase_id">

                    <button type="submit" class="btn btn-primary">{{ trans('submit') }}</button>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>
    {{-- =============================================== --}}

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
                    {!! Form::open(['route' => 'superAdmin.purchase.update-payment', 'method' => 'post', 'class' => 'payment-form']) !!}
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
                                <option value="3">Credit Card</option>
                                <option value="4">Cheque</option>
                            </select>
                        </div>
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

                    <input type="hidden" name="payment_id">

                    <button type="submit" class="btn btn-primary">{{ trans('update') }}</button>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>

    {{-- // publish  // unpublish --}}
    <script type="text/javascript">
        // publish
        $(document).on('click', '.publish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');

            var url = "{{ route('superAdmin.purchase.publish', ':id') }}";
            var pubUrl = url.replace(':id', id);

            let dataPub = {
                'id': id,
            };

            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: "GET",
                url: pubUrl,
                data: dataPub,
                dataType: "json",
                success: function(res) {
                    if (res.status == 'success') {
                        $('#tableLoad').DataTable().ajax.reload();
                    }
                }
            });
        })
        // unpublish
        $(document).on('click', '.unpublish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');
            let url = "{{ route('superAdmin.purchase.unpublish', ':id') }}";
            let unUrl = url.replace(':id', id);

            let dataUn = {
                'id': id,
            };

            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: "GET",
                url: unUrl,
                data: dataUn,
                dataType: "json",
                success: function(res) {
                    if (res.status == 'success') {
                        $('#tableLoad').DataTable().ajax.reload();
                    }
                }
            });
        })
    </script>
    {{-- Datatables --}}
    <script type="text/javascript">
        $(function() {

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            // DataTable

            var table = $('.data-table').DataTable({


                columnDefs: [{
                        orderable: true,
                        searchable: true,
                        // className: "left",
                        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                    },
                    {
                        data: 'DT_RowIndex',
                        targets: [0],
                    },
                    {
                        data: 'created_at',
                        targets: [1],
                    },
                    {
                        data: 'reference_no',
                        targets: [2],
                    },
                    {
                        data: 'supplier_id',
                        targets: [3],
                    },
                    {
                        data: 'id',
                        targets: [4],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.purchase_status;
                            }
                            return data;
                        }
                    },

                    {
                        data: 'grand_total',
                        targets: [5],
                    },
                    {
                        data: 'due_amount',
                        targets: [6],
                    },
                    {
                        data: 'paid_amount',
                        targets: [7],
                    },
                    {
                        data: 'id',
                        targets: [8],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.due_amount;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'payment_status',
                        targets: [9],
                    },
                    {
                        data: 'action',
                        targets: [10],
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
                    url: "{{ route('superAdmin.purchase') }}",
                    data: function(d) {
                        d.purchase_name = $('.searchEmail').val();
                        d.search = $('input[type="search"]').val();

                        d.from_date = $('#start_date').val();
                        d.to_date = $('#end_date').val();


                    }
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
                // alert(id);
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
                            $('#postForm').trigger("reset");
                            $('#ajaxModelexa').modal('hide');
                            table.draw();
                        }
                    });
                }
            });
        });
    </script>

    <script type="text/javascript">
        // $(".daterangepicker-field").daterangepicker({
        //     callback: function(startDate, endDate, period) {
        //         var starting_date = startDate.format('YYYY-MM-DD');
        //         var ending_date = endDate.format('YYYY-MM-DD');
        //         var title = starting_date + ' To ' + ending_date;
        //         $(this).val(title);
        //         $('input[name="starting_date"]').val(starting_date);
        //         $('input[name="ending_date"]').val(ending_date);
        //     }
        // });

        $("ul#purchase").siblings('a').attr('aria-expanded', 'true');
        $("ul#purchase").addClass("show");
        $("ul#purchase #purchase-list-menu").addClass("active");

        var purchase_id = [];
        var user_verified = @php echo json_encode(env('USER_VERIFIED')); @endphp;
        var starting_date = @php echo json_encode($starting_date); @endphp;
        var ending_date = @php echo json_encode($ending_date); @endphp;
        var warehouse_id = @php echo json_encode($warehouse_id); @endphp;
        var purchase_status = @php echo json_encode($purchase_status); @endphp;
        var payment_status = @php echo json_encode($payment_status); @endphp;

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $("#warehouse_id").val(warehouse_id);
        $("#purchase-status").val(purchase_status);
        $("#payment-status").val(payment_status);

        // $('.selectpicker').selectpicker('refresh');



        function confirmDelete() {
            if (confirm("Are you sure want to delete?")) {
                return true;
            }
            return false;
        }

        function confirmDeletePayment() {
            if (confirm("Are you sure want to delete? If you delete this money will be refunded")) {
                return true;
            }
            return false;
        }

        $(document).on("click", "tr.purchase-link td:not(:first-child, :last-child)", function() {
            var purchase = $(this).parent().data('purchase');
            purchaseDetails(purchase);
        });

        $(document).on("click", ".view", function() {
            var purchase = $(this).parent().parent().parent().parent().parent().data('purchase');
            purchaseDetails(purchase);
        });

        $("#print-btn").on("click", function() {
            var divContents = document.getElementById("purchase-details").innerHTML;
            var a = window.open('');
            a.document.write('<html>');
            a.document.write(
                '<body><style>body{font-family: sans-serif;line-height: 1.15;-webkit-text-size-adjust: 100%;}.d-print-none{display:none}.text-center{text-align:center}.row{width:100%;margin-right: -15px;margin-left: -15px;}.col-md-12{width:100%;display:block;padding: 5px 15px;}.col-md-6{width: 50%;float:left;padding: 5px 15px;}table{width:100%;margin-top:30px;}th{text-aligh:left;}td{padding:10px}table, th, td{border: 1px solid black; border-collapse: collapse;}</style><style>@media print {.modal-dialog { max-width: 1000px;} }</style>'
            );
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            setTimeout(function() {
                a.close();
            }, 10);
            a.print();
        });

        $('body').on('click', 'table.purchase-list tbody .addPayment', function() {
            $('#addPayment').modal('show');
            $("#cheque").hide();
            $(".card-element").hide();
            $('select[name="paid_by_id"]').val(1);
            rowindex = $(this).closest('tr').index();
            var purchase_id = $(this).data('id').toString();
            var balance = $(this).data('grand_total').toString();
            var balance = parseFloat(balance.replace(/,/g, ''));
            // var balance = $('table.purchase-list tbody tr:nth-child(' + (rowindex + 1) + ')').find(
            //     'td:nth-child(9)').text();
            $('input[name="amount"]').val(balance);
            $('input[name="balance"]').val(balance);
            $('input[name="paying_amount"]').val(balance);
            $('input[name="purchase_id"]').val(purchase_id);

        });

        $(document).on("click", "table.purchase-list tbody .add-payment", function(event) {
            $("#cheque").hide();
            $(".card-element").hide();
            $('select[name="paid_by_id"]').val(1);
            rowindex = $(this).closest('tr').index();
            var purchase_id = $(this).data('id').toString();
            var balance = $('table.purchase-list tbody tr:nth-child(' + (rowindex + 1) + ')').find(
                'td:nth-child(10)').text();
            balance = parseFloat(balance.replace(/,/g, ''));
            $('input[name="amount"]').val(balance);
            $('input[name="balance"]').val(balance);
            $('input[name="paying_amount"]').val(balance);
            $('input[name="purchase_id"]').val(purchase_id);
        });

        $(document).on("click", "table.purchase-list tbody .get-payment", function(event) {
            var id = $(this).data('id').toString();
            $.get('purchases/getpayment/' + id, function(data) {
                $(".payment-list tbody").remove();
                var newBody = $("<tbody>");
                payment_date = data[0];
                payment_reference = data[1];
                paid_amount = data[2];
                paying_method = data[3];
                payment_id = data[4];
                payment_note = data[5];
                cheque_no = data[6];
                change = data[7];
                paying_amount = data[8];
                account_name = data[9];
                account_id = data[10];

                $.each(payment_date, function(index) {
                    var newRow = $("<tr>");
                    var cols = '';

                    cols += '<td>' + payment_date[index] + '</td>';
                    cols += '<td>' + payment_reference[index] + '</td>';
                    cols += '<td>' + account_name[index] + '</td>';
                    cols += '<td>' + paid_amount[index] + '</td>';
                    cols += '<td>' + paying_method[index] + '</td>';
                    cols +=
                        '<td><div class="btn-group"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action<span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button><ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">';
                    if (all_permission.indexOf("purchase-payment-edit") != -1)
                        cols +=
                        '<li><button type="button" class="btn btn-link edit-btn" data-id="' +
                        payment_id[index] +
                        '" data-clicked=false data-toggle="modal" data-target="#edit-payment"><i class="dripicons-document-edit"></i> Edit</button></li><li class="divider"></li>';
                    if (all_permission.indexOf("purchase-payment-delete") != -1)
                        cols +=
                        '<li><input type="hidden" name="id" value="' +
                        payment_id[index] +
                        '" /> <button type="submit" class="btn btn-link" onclick="return confirmDeletePayment()"><i class="dripicons-trash"></i> Delete</button></li>{{ Form::close() }}';
                    cols += '</ul></div></td>';
                    newRow.append(cols);
                    newBody.append(newRow);
                    $("table.payment-list").append(newBody);
                });
                $('#view-payment').modal('show');
            });
        });

        $(document).on("click", "table.payment-list .edit-btn", function(event) {
            $(".edit-btn").attr('data-clicked', true);
            $(".card-element").hide();
            $("#edit-cheque").hide();
            $('#edit-payment select[name="edit_paid_by_id"]').prop('disabled', false);
            var id = $(this).data('id').toString();
            $.each(payment_id, function(index) {
                if (payment_id[index] == parseFloat(id)) {
                    $('input[name="payment_id"]').val(payment_id[index]);
                    $('#edit-payment select[name="account_id"]').val(account_id[index]);
                    if (paying_method[index] == 'Cash')
                        $('select[name="edit_paid_by_id"]').val(1);
                    else if (paying_method[index] == "Credit Card") {
                        $('select[name="edit_paid_by_id"]').val(3);
                        $.getScript("public/vendor/stripe/checkout.js");
                        $(".card-element").show();
                        $("#edit-cheque").hide();
                        $('#edit-payment select[name="edit_paid_by_id"]').prop('disabled', true);
                    } else {
                        $('select[name="edit_paid_by_id"]').val(4);
                        $("#edit-cheque").show();
                        $('input[name="edit_cheque_no"]').val(cheque_no[index]);
                        $('input[name="edit_cheque_no"]').attr('required', true);
                    }
                    $('input[name="edit_date"]').val(payment_date[index]);
                    $("#payment_reference").html(payment_reference[index]);
                    $('input[name="edit_amount"]').val(paid_amount[index]);
                    $('input[name="edit_paying_amount"]').val(paying_amount[index]);
                    $('.change').text(change[index]);
                    $('textarea[name="edit_payment_note"]').val(payment_note[index]);
                    return false;
                }
            });
            $('.selectpicker').selectpicker('refresh');
            $('#view-payment').modal('hide');
        });

        $('select[name="paid_by_id"]').on("change", function() {
            var id = $('select[name="paid_by_id"]').val();

            $('input[name="cheque_no"]').attr('required', false);
            $(".payment-form").off("submit");
            if (id == 3) {
                alert("install Stripe account");
                // $.getScript("public/vendor/stripe/checkout.js");
                $(".card-element").show();
                $("#cheque").hide();
            } else if (id == 4) {
                $("#cheque").show();
                $(".card-element").hide();
                $('input[name="cheque_no"]').attr('required', true);
            } else {
                $(".card-element").hide();
                $("#cheque").hide();
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
        });

        $('select[name="edit_paid_by_id"]').on("change", function() {
            var id = $('select[name="edit_paid_by_id"]').val();
            $('input[name="edit_cheque_no"]').attr('required', false);
            $(".payment-form").off("submit");
            if (id == 3) {
                $(".edit-btn").attr('data-clicked', true);
                $.getScript("public/vendor/stripe/checkout.js");
                $(".card-element").show();
                $("#edit-cheque").hide();
            } else if (id == 4) {
                $("#edit-cheque").show();
                $(".card-element").hide();
                $('input[name="edit_cheque_no"]').attr('required', true);
            } else {
                $(".card-element").hide();
                $("#edit-cheque").hide();
            }
        });

        $('input[name="edit_amount"]').on("input", function() {
            if ($(this).val() > parseFloat($('input[name="edit_paying_amount"]').val())) {
                alert('Paying amount cannot be bigger than recieved amount');
                $(this).val('');
            }
            $(".change").text(parseFloat($('input[name="edit_paying_amount"]').val() - $(this).val()).toFixed(2));
        });

        $('input[name="edit_paying_amount"]').on("input", function() {
            $(".change").text(parseFloat($(this).val() - $('input[name="edit_amount"]').val()).toFixed(2));
        });

        $('#purchase-table').DataTable({
            "processing": true,
            "serverSide": true,
            "ajax": {
                url: "purchases/purchase-data",
                data: {
                    all_permission: all_permission,
                    starting_date: starting_date,
                    ending_date: ending_date,
                    warehouse_id: warehouse_id,
                    purchase_status: purchase_status,
                    payment_status: payment_status
                },
                dataType: "json",
                type: "post",
                /*success:function(data){
                    console.log(data);
                }*/
            },
            "createdRow": function(row, data, dataIndex) {
                $(row).addClass('purchase-link');
                $(row).attr('data-purchase', data['purchase']);
            },
            "columns": [{
                    "data": "key"
                },
                {
                    "data": "date"
                },
                {
                    "data": "reference_no"
                },
                {
                    "data": "supplier"
                },
                {
                    "data": "purchase_status"
                },
                {
                    "data": "grand_total"
                },
                {
                    "data": "returned_amount"
                },
                {
                    "data": "paid_amount"
                },
                {
                    "data": "due"
                },
                {
                    "data": "payment_status"
                },
                {
                    "data": "options"
                },
            ],
            'language': {
                /*'searchPlaceholder': "{{ trans('Type date or purchase reference...') }}",*/
                'lengthMenu': '_MENU_ {{ trans('records per page') }}',
                "info": '<small>{{ trans('Showing') }} _START_ - _END_ (_TOTAL_)</small>',
                "search": '{{ trans('Search') }}',
                'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
                }
            },
            order: [
                ['1', 'desc']
            ],
            'columnDefs': [{
                    "orderable": false,
                    'targets': [0, 3, 4, 7, 8, 9, 10]
                },
                {
                    'render': function(data, type, row, meta) {
                        if (type === 'display') {
                            data =
                                '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
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
            'select': {
                style: 'multi',
                selector: 'td:first-child'
            },
            'lengthMenu': [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
            ],
            dom: '<"row"lfB>rtip',
            buttons: [{
                    extend: 'pdf',
                    text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                    exportOptions: {
                        columns: ':visible:Not(.not-exported)',
                        rows: ':visible'
                    },
                    action: function(e, dt, button, config) {
                        datatable_sum(dt, true);
                        $.fn.dataTable.ext.buttons.pdfHtml5.action.call(this, e, dt, button, config);
                        datatable_sum(dt, false);
                    },
                    footer: true
                },
                {
                    extend: 'excel',
                    text: '<i title="export to excel" class="dripicons-document-new"></i>',
                    exportOptions: {
                        columns: ':visible:not(.not-exported)',
                        rows: ':visible'
                    },
                    action: function(e, dt, button, config) {
                        datatable_sum(dt, true);
                        $.fn.dataTable.ext.buttons.excelHtml5.action.call(this, e, dt, button, config);
                        datatable_sum(dt, false);
                    },
                    footer: true
                },
                {
                    extend: 'csv',
                    text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                    exportOptions: {
                        columns: ':visible:not(.not-exported)',
                        rows: ':visible'
                    },
                    action: function(e, dt, button, config) {
                        datatable_sum(dt, true);
                        $.fn.dataTable.ext.buttons.csvHtml5.action.call(this, e, dt, button, config);
                        datatable_sum(dt, false);
                    },
                    footer: true
                },
                {
                    extend: 'print',
                    text: '<i title="print" class="fa fa-print"></i>',
                    exportOptions: {
                        columns: ':visible:not(.not-exported)',
                        rows: ':visible'
                    },
                    action: function(e, dt, button, config) {
                        datatable_sum(dt, true);
                        $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                        datatable_sum(dt, false);
                    },
                    footer: true
                },
                {
                    text: '<i title="delete" class="dripicons-cross"></i>',
                    className: 'buttons-delete',
                    action: function(e, dt, node, config) {
                        if (user_verified == '1') {
                            purchase_id.length = 0;
                            $(':checkbox:checked').each(function(i) {
                                if (i) {
                                    var purchase = $(this).closest('tr').data('purchase');
                                    purchase_id[i - 1] = purchase[3];
                                }
                            });
                            if (purchase_id.length && confirm("Are you sure want to delete?")) {
                                $.ajax({
                                    type: 'POST',
                                    url: 'purchases/deletebyselection',
                                    data: {
                                        purchaseIdArray: purchase_id
                                    },
                                    success: function(data) {
                                        alert(data);
                                        //dt.rows({ page: 'current', selected: true }).deselect();
                                        dt.rows({
                                            page: 'current',
                                            selected: true
                                        }).remove().draw(false);
                                    }
                                });
                            } else if (!purchase_id.length)
                                alert('Nothing is selected!');
                        } else
                            alert('This feature is disable for demo!');
                    }
                },
                {
                    extend: 'colvis',
                    text: '<i title="column visibility" class="fa fa-eye"></i>',
                    columns: ':gt(0)'
                },
            ],
            drawCallback: function() {
                var api = this.api();
                datatable_sum(api, false);
            }
        });

        function datatable_sum(dt_selector, is_calling_first) {
            if (dt_selector.rows('.selected').any() && is_calling_first) {
                var rows = dt_selector.rows('.selected').indexes();

                $(dt_selector.column(5).footer()).html(dt_selector.cells(rows, 5, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(6).footer()).html(dt_selector.cells(rows, 6, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(7).footer()).html(dt_selector.cells(rows, 7, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(8).footer()).html(dt_selector.cells(rows, 8, {
                    page: 'current'
                }).data().sum().toFixed(2));
            } else {
                $(dt_selector.column(5).footer()).html(dt_selector.column(5, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(6).footer()).html(dt_selector.column(6, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(7).footer()).html(dt_selector.column(7, {
                    page: 'current'
                }).data().sum().toFixed(2));
                $(dt_selector.column(8).footer()).html(dt_selector.column(8, {
                    page: 'current'
                }).data().sum().toFixed(2));
            }
        }

        function purchaseDetails(purchase) {
            var htmltext = '<strong>{{ trans('Date') }}: </strong>' + purchase[0] +
                '<br><strong>{{ trans('reference') }}: </strong>' + purchase[1] +
                '<br><strong>{{ trans('Purchase Status') }}: </strong>' + purchase[2] +
                '<br><br><div class="row"><div class="col-md-6"><strong>{{ trans('From') }}:</strong><br>' + purchase[
                    4] + '<br>' + purchase[5] + '<br>' + purchase[6] +
                '</div><div class="col-md-6"><div class="float-right"><strong>{{ trans('To') }}:</strong><br>' +
                purchase[7] + '<br>' + purchase[8] + '<br>' + purchase[9] + '<br>' + purchase[10] + '<br>' + purchase[11] +
                '<br>' + purchase[12] + '</div></div></div>';
            $(".product-purchase-list tbody").remove();
            $.get('purchases/product_purchase/' + purchase[3], function(data) {
                if (data == 'Something is wrong!') {
                    var newBody = $("<tbody>");
                    var newRow = $("<tr>");
                    cols = '<td colspan="8">Something is wrong!</td>';
                    newRow.append(cols);
                    newBody.append(newRow);
                } else {
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
                        cols += '<td>' + qty[index] + ' ' + unit_code[index] + '</td>';
                        cols += '<td>' + (subtotal[index] / qty[index]) + '</td>';
                        cols += '<td>' + tax[index] + '(' + tax_rate[index] + '%)' + '</td>';
                        cols += '<td>' + discount[index] + '</td>';
                        cols += '<td>' + subtotal[index] + '</td>';
                        newRow.append(cols);
                        newBody.append(newRow);
                    });

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=5><strong>{{ trans('Total') }}:</strong></td>';
                    cols += '<td>' + purchase[13] + '</td>';
                    cols += '<td>' + purchase[14] + '</td>';
                    cols += '<td>' + purchase[15] + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong>{{ trans('Order Tax') }}:</strong></td>';
                    cols += '<td>' + purchase[16] + '(' + purchase[17] + '%)' + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong>{{ trans('Order Discount') }}:</strong></td>';
                    cols += '<td>' + purchase[18] + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong>{{ trans('Shipping Cost') }}:</strong></td>';
                    cols += '<td>' + purchase[19] + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong>{{ trans('grand total') }}:</strong></td>';
                    cols += '<td>' + purchase[20] + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong>{{ trans('Paid Amount') }}:</strong></td>';
                    cols += '<td>' + purchase[21] + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong>{{ trans('Due') }}:</strong></td>';
                    cols += '<td>' + (purchase[20] - purchase[21]) + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    $("table.product-purchase-list").append(newBody);
                }
            });

            var htmlfooter = '<p><strong>{{ trans('Note') }}:</strong> ' + purchase[22] +
                '</p><strong>{{ trans('Created By') }}:</strong><br>' + purchase[23] + '<br>' + purchase[24];

            $('#purchase-content').html(htmltext);
            $('#purchase-footer').html(htmlfooter);
            $('#purchase-details').modal('show');
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

        if (all_permission.indexOf("purchases-delete") == -1)
            $('.buttons-delete').addClass('d-none');
    </script>
@endsection
{{-- <x-backend.superAdmin.purchase.catindex :categories="$categories" /> --}}
