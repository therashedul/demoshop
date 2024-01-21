
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div>
@endif
<section class="forms">
    <div class="container-fluid">
        <h3>{{trans('Account Statement')}}</h3>
        <strong>{{trans('Account')}}:</strong> {{$lims_account_data->name}} [{{$lims_account_data->account_no}}]
    </div>
    <div class="table-responsive mb-4">
        <table id="account-table" class="table table-hover">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('date')}}</th>
                    <th>{{trans('Reference No')}}</th>
                    <th>{{trans('Related Transaction')}}</th>
                    <th>{{trans('Credit')}}</th>
                    <th>{{trans('Debit')}}</th>
                    <th>{{trans('Balance')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($all_transaction_list as $key => $data)
                <?php
                    $transaction = '';
                    if($data->sale_id)
                        $transaction = App\Models\Sale::select('reference_no')->find($data->sale_id);
                    elseif($data->purchase_id)
                        $transaction = App\Models\Purchase::select('reference_no')->find($data->purchase_id);
                    if(str_contains($data->reference_no, 'spr') || str_contains($data->reference_no, 'prr') || (str_contains($data->reference_no, 'mtr') && $data->to_account_id == $lims_account_data->id) ) {
                        $balance += $data->amount;
                        $credit = $data->amount;
                        $debit = 0;
                    }
                    else {
                        $balance -= $data->amount;
                        $debit = $data->amount;
                        $credit = 0;
                    }
                ?>
                <tr>
                    <td>{{$key}}</td>
                    <td>{{date($general_setting->date_format, strtotime($data->created_at->toDateString()))}}</td>
                    <td>{{$data->reference_no}}</td>
                    @if($transaction)
                        <td>{{$transaction->reference_no}}</td>
                    @else
                        <td></td>
                    @endif
                    <td>{{number_format((float)$credit, 2, '.', '')}}</td>
                    <td>{{number_format((float)$debit, 2, '.', '')}}</td>
                    <td>{{number_format((float)$balance, 2, '.', '')}}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</section>


@push('custom_scripts')
<script type="text/javascript">
alert("kkk");
    $("ul#account").siblings('a').attr('aria-expanded','true');
    $("ul#account").addClass("show");
    $("ul#account #account-statement-menu").addClass("active");

    var table = $('#account-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ {{trans("records per page")}}',
             "info":      '<small>{{trans("Showing")}} _START_ - _END_ (_TOTAL_)</small>',
            "search":  '{{trans("Search")}}',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
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
        // dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                }
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                }
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                }
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ],
    } );
</script>
@endpush