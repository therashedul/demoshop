    @if (session()->has('message'))
        <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
    @endif
    @if (session()->has('not_permitted'))
        <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert"
                aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}
        </div>
    @endif

    <section>
        <div class="table-responsive">
            <table id="cash-register-table" class="table">
                <thead>
                    <tr>
                        <th class="not-exported"></th>
                        <th>{{ trans('User') }}</th>
                        <th>{{ trans('Warehouse') }}</th>
                        <th>{{ trans('Cash in Hand') }}</th>
                        <th>{{ trans('Opened at') }}</th>
                        <th>{{ trans('Closed at') }}</th>
                        <th>{{ trans('Status') }}</th>
                        <th class="not-exported">{{ trans('action') }}</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($limscashregisterall as $key => $cash_register)
                        <tr data-id="{{ $cash_register->id }}">
                            <td>{{ $key }}</td>
                            <td>{{ $cash_register->user->name }}</td>
                            <td>{{ optional($cash_register->warehouse)->name }}</td>
                            <td>{{ $cash_register->cash_in_hand }}</td>
                            <td>
                                {{ date('date' . ' h:i:s', strtotime($cash_register->created_at)) }}
                            </td>
                            @if ($cash_register->status)
                                <td>N/A</td>
                                <td>
                                    <div class="badge badge-success">{{ trans('Active') }}</div>
                                </td>
                            @else
                                <td>{{ date('date' . ' h:i:s', strtotime($cash_register->updated_at)) }}
                                </td>
                                <td>
                                    <div class="badge badge-danger">{{ trans('Closed') }}</div>
                                </td>
                            @endif
                            <td>
                                <div class="btn-group">
                                    <button type="button" data-id="{{ $cash_register->id }}"
                                        class="register-details-btn btn btn-sm btn-info" data-toggle="modal"
                                        data-target="#register-details-modal" title="{{ trans('View') }}"> View </button>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <!-- cash register details modal -->
        <div id="register-details-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true" class="modal fade text-left">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="exampleModalLabel" class="modal-title">{{ trans('Cash Register Details') }}</h5>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                                aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                    </div>
                    <div class="modal-body">
                        <p>{{ trans('Please review the transaction and payments.') }}</p>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-hover">
                                    <tbody>
                                        <tr>
                                            <td>{{ trans('Cash in Hand') }}:</td>
                                            <td id="cash_in_hand" class="text-right">100</td>
                                        </tr>
                                        <tr>
                                            <td>{{ trans('Total Sale Amount') }}:</td>
                                            <td id="total_sale_amount" class="text-right"></td>
                                        </tr>
                                        <tr>
                                            <td>{{ trans('Total Payment') }}:</td>
                                            <td id="total_payment" class="text-right"></td>
                                        </tr>
                                        <tr>
                                            <td>{{ trans('Cash Payment') }}:</td>
                                            <td id="cash_payment" class="text-right"></td>
                                        </tr>
                                        <tr>
                                            <td>{{ trans('Credit Card Payment') }}:</td>
                                            <td id="credit_card_payment" class="text-right"></td>
                                        </tr>
                                        <tr>
                                            <td>{{ trans('Cheque Payment') }}:</td>
                                            <td id="cheque_payment" class="text-right"></td>
                                        </tr>
                                        <tr>
                                            <td>{{ trans('Gift Card Payment') }}:</td>
                                            <td id="gift_card_payment" class="text-right"></td>
                                        </tr>
                                        <tr>
                                            <td>{{ trans('Paypal Payment') }}:</td>
                                            <td id="paypal_payment" class="text-right"></td>
                                        </tr>
                                        <tr>
                                            <td>{{ trans('Total Sale Return') }}:</td>
                                            <td id="total_sale_return" class="text-right"></td>
                                        </tr>
                                        <tr>
                                            <td>{{ trans('Total Expense') }}:</td>
                                            <td id="total_expense" class="text-right"></td>
                                        </tr>
                                        <tr>
                                            <td><strong>{{ trans('Total Cash') }}:</strong></td>
                                            <td id="total_cash" class="text-right"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-6" id="closing-section">
                                <form action="{{ route('superAdmin.cashRegister.close') }}" method="POST">
                                    @csrf
                                    <input type="hidden" name="cash_register_id">
                                    <button type="submit" class="btn btn-primary"
                                        onclick="return confirmClose()">{{ trans('Close Register') }}</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


@push('custom_scripts')
    <script type="text/javascript">
        function confirmClose() {
            if (confirm("Are you sure want to close?")) {
                return true;
            }
            return false;
        }

        $(".register-details-btn").on("click", function(e) {
            id = $(this).data('id');
            getUrl = "{{url ( 'superAdmin/cash-register/getDetails' )}}" + "/" + id ;         
            $.ajax({
                url: getUrl,  
                // url: 'cash-register/getDetails/' + id,
                type: "GET",
                success: function(data) {              
                    if (data['status'])
                        $("#register-details-modal #closing-section").removeClass('d-none');
                    else
                        $("#register-details-modal #closing-section").addClass('d-none');

                    $('#register-details-modal #cash_in_hand').text(data['cash_in_hand']);
                    $('#register-details-modal #total_sale_amount').text(data['total_sale_amount']);
                    $('#register-details-modal #total_payment').text(data['total_payment']);
                    $('#register-details-modal #cash_payment').text(data['cash_payment']);
                    $('#register-details-modal #credit_card_payment').text(data['credit_card_payment']);
                    $('#register-details-modal #cheque_payment').text(data['cheque_payment']);
                    $('#register-details-modal #gift_card_payment').text(data['gift_card_payment']);
                    $('#register-details-modal #paypal_payment').text(data['paypal_payment']);
                    $('#register-details-modal #total_sale_return').text(data['total_sale_return']);
                    $('#register-details-modal #total_expense').text(data['total_expense']);
                    $('#register-details-modal #total_cash').text(data['total_cash']);
                    $('#register-details-modal input[name=cash_register_id]').val(id);
                }
            });
        });

        $('#cash-register-table').DataTable({
            "order": [],
            'language': {
                'lengthMenu': '_MENU_ {{ trans('records per page') }}',
                "info": '<small>{{ trans('Showing') }} _START_ - _END_ (_TOTAL_)</small>',
                "search": '{{ trans('Search') }}',
                'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
                }
            },
            'columnDefs': [{
                    "orderable": false,
                    'targets': [0, 7]
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
            // dom: '<"row"lfB>rtip',
            buttons: [{
                    extend: 'pdf',
                    text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                    exportOptions: {
                        columns: ':visible:Not(.not-exported)',
                        rows: ':visible'
                    },
                    footer: true
                },
                {
                    extend: 'excel',
                    text: '<i title="export to excel" class="dripicons-document-new"></i>',
                    exportOptions: {
                        columns: ':visible:Not(.not-exported)',
                        rows: ':visible'
                    },
                    footer: true
                },
                {
                    extend: 'csv',
                    text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                    exportOptions: {
                        columns: ':visible:Not(.not-exported)',
                        rows: ':visible'
                    },
                    footer: true
                },
                {
                    extend: 'print',
                    text: '<i title="print" class="fa fa-print"></i>',
                    exportOptions: {
                        columns: ':visible:Not(.not-exported)',
                        rows: ':visible'
                    },
                    footer: true
                },
                {
                    extend: 'colvis',
                    text: '<i title="column visibility" class="fa fa-eye"></i>',
                    columns: ':gt(0)'
                },
            ],
        });
    </script>
@endpush
