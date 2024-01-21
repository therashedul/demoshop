@extends('layouts.deshboard') 
@section('content')
<style>
@media (min-width: 576px){
    .modal-dialog {
        max-width: 600px;
        margin: 1.75rem auto;
    }
}
</style>
@if(session()->has('message'))
    <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div>
@endif
@if(session()->has('not_permitted'))
    <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

<section>
    <div class="container-fluid">
       <div class="row">
                    <div class="form-group col-md-3 ">
                        <h5>Start Date <span class="text-danger"></span></h5>
                        <div class="controls">
                            <input type="date" name="starting_date" id="starting_date" class="form-control datepicker-autoclose starting_date"
                                placeholder="Please select start date">
                            <div class="help-block"></div>
                        </div>
                    </div>

                    <div class="form-group col-md-3">
                        <h5>End Date <span class="text-danger"></span></h5>
                        <div class="controls">
                            <input type="date" name="ending_date" id="ending_date" class="form-control datepicker-autoclose ending_date btnchange"
                                placeholder="Please select end date">
                            <div class="help-block"></div>
                        </div>
                    </div>        
        
                    <div class="form-group col-md-3">
                        <label class="">{{trans('From Warehouse')}} &nbsp;</label>
                        <div class="">
                            <select id="from_warehouse_id" name="from_warehouse_id" class="form-control from_warehouse_id" data-live-search="true" data-live-search-style="begins" >
                                <option value="">All</option>
                                @foreach($lims_warehouse_list as $warehouse)                                 
                                    <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-md-3">
                        <label class="">{{trans('To Warehouse')}} &nbsp;</label>
                        <div class="">
                            <select id="to_warehouse_id" name="to_warehouse_id" class="form-control to_warehouse_id" data-live-search="true" data-live-search-style="begins" >
                                <option value="">All</option>
                                @foreach($lims_warehouse_list as $warehouse)                                    
                                    <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>                                
                                @endforeach
                            </select>
                        </div>
                    </div>
       </div>
        <a href="{{route('superAdmin.transfers.create')}}" class="btn btn-info"><i class="dripicons-plus"></i> {{trans('Add Transfer')}}</a>&nbsp;
    </div>
    <div class="table-responsive">
        {{-- <table id="transfer-table" class="table transfer-list" style="width: 100%"> --}}
        <table id="tableLoad" class="table data-table table-bordered table-striped transfer-list" style="width:100%;">
            <thead>
                <tr>
                    <th class="not-exported" ></th>
                    <th>{{trans('Date')}}</th>
                    <th>{{trans('reference')}} No</th>
                    <th>{{trans('Warehouse')}}({{trans('From')}})</th>
                    <th>{{trans('Warehouse')}}({{trans('To')}})</th>
                    <th>{{trans('product')}} {{trans('Cost')}}</th>
                    <th>{{trans('product')}} {{trans('Tax')}}</th>
                    <th>{{trans('grand total')}}</th>
                    <th>{{trans("Status")}}</th>
                    <th class="not-exported">{{trans('action')}}</th>
                </tr>
            </thead>
            <tfoot class="tfoot active">
                <th ></th>
                <th colspan="4">{{trans('Total')}}</th>
        
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tfoot>
        </table>
    </div>
</section>
{{-- <form action="{{ route('superAdmin.transfers.destroy', 6) }}" method="POST">
        @csrf
      <input type="submit" name="submint">
</form> --}}
<div id="transfer-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        <div class="container mt-3 pb-2 border-bottom">
            <div class="row">
                <div class="col-md-6 d-print-none">
                    <button id="print-btn" type="button" class="btn btn-default btn-sm"><i class="dripicons-print"></i> {{trans('Print')}}</button>
                </div>
                <div class="col-md-6 d-print-none">
                    <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="col-md-12">
                    <h3 id="exampleModalLabel" class="modal-title text-center container-fluid">{{$general_setting->site_title}}</h3>
                </div>
                <div class="col-md-12 text-center">
                    <i style="font-size: 15px;">{{trans('Transfer Details')}}</i>
                </div>
            </div>
        </div>
            <div id="transfer-content" class="modal-body">
            </div>
            <br>
            <table class="table table-bordered product-transfer-list">
                <thead>
                    <th>#</th>
                    <th>{{trans('product')}}</th>
                    <th>{{trans('Batch No')}}</th>
                    <th>Qty</th>
                    <th>{{trans('Unit Cost')}}</th>
                    <th>{{trans('Tax')}}</th>
                    <th>{{trans('Subtotal')}}</th>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div id="transfer-footer" class="modal-body"></div>
      </div>
    </div>
</div>

@endsection

@push('custom_scripts')
<script type="text/javascript">
    $("ul#transfer").siblings('a').attr('aria-expanded','true');
    $("ul#transfer").addClass("show");
    $("ul#transfer #transfer-list-menu").addClass("active");

    $(".daterangepicker-field").daterangepicker({
      callback: function(startDate, endDate, period){
        var starting_date = startDate.format('YYYY-MM-DD');
        var ending_date = endDate.format('YYYY-MM-DD');
        var title = starting_date + ' To ' + ending_date;
        $(this).val(title);
        $('input[name="starting_date"]').val(starting_date);
        $('input[name="ending_date"]').val(ending_date);
      }
    });


    var transfer_id = [];
    var user_verified = @php echo json_encode(env('USER_VERIFIED')) @endphp;

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function confirmDelete() {
        if (confirm("Are you sure want to delete?")) {
            return true;
        }
        return false;
    }

    $(document).on("click", "tr.transfer-link td:not(:first-child, :last-child)", function() {
        var transfers = $(this).parent().data('transfer');
        transferDetails(transfers);
    });

    $(document).on("click", ".view", function() {
        var transferId = $(this).data('id')
            var reference_no = $(this).data('reference_no')
            var date = $(this).data('date')
            var status = $(this).data('status')
            var fromWarehousename = $(this).data('from_warehousename')
            var fromWarehousephone = $(this).data('from_warehousephone')
            var fromWarehouseaddress = $(this).data('from_warehouseaddress')

            var toWarehousename = $(this).data('to_warehousename')
            var toWarehousephone = $(this).data('to_warehousephone')
            var toWarehouseaddress = $(this).data('to_warehouseaddress')


            var item = $(this).data('item')
            var total_qty = $(this).data('total_qty')
            var total_tax = $(this).data('total_tax')
            var total_cost = $(this).data('total_cost')       

            var shipping_cost = $(this).data('shipping_cost')
            var grand_total = $(this).data('grand_total')

            var user_name = $(this).data('user_name')
            var user_email = $(this).data('user_email')
            var note = $(this).data('note')

            transferDetails(
                transferId,
                reference_no,
                date,
                status,

                fromWarehousename,
                fromWarehousephone,
                fromWarehouseaddress,

                toWarehousename,                
                toWarehousephone,                
                toWarehouseaddress,                

                total_qty,
                total_tax,
                total_cost,

                shipping_cost,
                grand_total,
                item,

                user_name,
                user_email,
                note
            );

        
  
        
        // var transfers = $(this).parent().parent().parent().parent().parent().data('transfer');
        // transferDetails(transfers);
    });

    $("#print-btn").on("click", function(){
        var divContents = document.getElementById("transfer-details").innerHTML;
        var a = window.open('');
        a.document.write('<html>');
        a.document.write('<body>');
        a.document.write('<style>body{font-family: sans-serif;line-height: 1.15;-webkit-text-size-adjust: 100%;}.d-print-none{display:none}.text-center{text-align:center}.row{width:100%;margin-right: -15px;margin-left: -15px;}.col-md-12{width:100%;display:block;padding: 5px 15px;}.col-md-6{width: 50%;float:left;padding: 5px 15px;}table{width:100%;margin-top:30px;}th{text-aligh:left}td{padding:10px}table,th,td{border: 1px solid black; border-collapse: collapse;}</style><style>@media print {.modal-dialog { max-width: 1000px;} }</style>');
        a.document.write(divContents);
        a.document.write('</body></html>');
        a.document.close();
        setTimeout(function(){a.close();},10);
        a.print();
    });

    var starting_date = $("input[name=starting_date]").val();
    var ending_date = $("input[name=ending_date]").val();
    var from_warehouse_id = $("#from_warehouse_id").val();
    var to_warehouse_id = $("#to_warehouse_id").val();

    function transferDetails(
                transferId,
                reference_no,
                date,
                status,

                fromWarehousename,
                fromWarehousephone,
                fromWarehouseaddress,

                toWarehousename,                
                toWarehousephone,                
                toWarehouseaddress,                

                total_qty,
                total_tax,
                total_cost,

                shipping_cost,
                grand_total,
                item,

                user_name,
                user_email,
                note) {
                    // alert(transferId);
        var htmltext = '<strong>{{trans("Date")}}: </strong>'+ date +'<br><strong>{{trans("reference")}}: </strong>'+ reference_no +'<br><strong> {{trans("Transfer")}} {{trans("Status")}}: </strong>'+ status +'<br><br><div class="row"><div class="col-md-6"><strong>{{trans("From")}}:</strong><br>'+ fromWarehousename +'<br>'+ fromWarehousephone +'<br>'+ fromWarehouseaddress +'</div><div class="col-md-6"><div class="float-right"><strong>{{trans("To")}}:</strong><br>'+ toWarehousename +'<br>'+ toWarehousephone +'<br>'+ toWarehouseaddress +'</div></div></div>';

        $.get('transfers/product_transfer/' + transferId, function(data) {
            $(".product-transfer-list tbody").remove();
            var name_code = data[0];
            var qty = data[1];
            var unit_code = data[2];
            var tax = data[3];
            var tax_rate = data[4];
            var subtotal = data[5];
            var batch_no = data[6];
            var newBody = $("<tbody>");
            $.each(name_code, function(index) {
                var newRow = $("<tr>");
                var cols = '';
                cols += '<td><strong>' + (index+1) + '</strong></td>';
                cols += '<td>' + name_code[index] + '</td>';
                cols += '<td>' + batch_no[index] + '</td>';
                cols += '<td>' + qty[index] + ' ' + unit_code[index] + '</td>';
                cols += '<td>' + (subtotal[index] / qty[index]) + '</td>';
                cols += '<td>' + tax[index] + '(' + tax_rate[index] + '%)' + '</td>';
                cols += '<td>' + subtotal[index] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);
            });

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=5><strong>{{trans("Total")}}:</strong></td>';
            cols += '<td>' + total_tax + '</td>';
            cols += '<td>' + grand_total + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

           

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=6><strong>{{trans("Shipping Cost")}}:</strong></td>';
            cols += '<td>' + shipping_cost + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=6><strong>{{trans("grand total")}}:</strong></td>';
            cols += '<td>' + grand_total + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            $("table.product-transfer-list").append(newBody);
        });

        var htmlfooter = '<p><strong>{{trans("Note")}}:</strong> '+note +'</p><strong>{{trans("Created By")}}:</strong><br>'+user_name+'<br>'+user_email;

        $('#transfer-content').html(htmltext);
        $('#transfer-footer').html(htmlfooter);
        $('#transfer-details').modal('show');
    }

         // Datatable
        $(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            var table = $('.data-table').DataTable({
                columnDefs: [{
                        orderable: true,
                        searchable: true,
                        className: "left",
                        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                    },
                    {
                        data: 'DT_RowIndex',
                        targets: [0]
                    },

                    {
                        data: 'date',
                        targets: [1]

                    },
                    {                        
                        data: 'reference_no',
                        targets: [2]

                    },
                    {
                        data: 'from_warehouse',
                        targets: [3]

                    },
                    {
                        data: 'to_warehouse',
                        targets: [4]

                    },
              
                    {
                        data: 'total_cost',
                        targets: [5]

                    },
                    {
                        data: 'total_tax',
                        targets: [6]

                    },
                    {
                        data: 'grand_total',
                        targets: [7]

                    },
                    {
                        data: 'status',
                        targets: [8]

                    },

                    {
                        data: 'action',
                        targets: [9]
                    },
                ],

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
                fixedHeader: true,
                retrieve: true,

                ajax: {
                    url: "{{ route('superAdmin.transfers') }}",
                    data: function(d) {
                        // d.card_no = $('.searchEmail').val();
                        // d.search = $('input[type="search"]').val();

                        d.starting_date = $('#starting_date').val();
                        d.ending_date = $('#ending_date').val();
      
                        d.from_warehouse_id = $("#from_warehouse_id").val();
                        d.to_warehouse_id = $("#to_warehouse_id").val();

                    }
                },

                // ==========================
                // https://live.datatables.net/boweyiga/1/edit

                footerCallback: function(row, data, start, end, display) {
                    let api = this.api();

                    // Remove the formatting to get integer data for summation
                    let intVal = function(i) {
                        return typeof i === 'string' ? i.replace(/[\$,]/g, '') * 1 : typeof i === 'number' ? i : 0;
                    };

                    // Total over all pages
                    total = api
                        .column(5)
                        .data()
                        .reduce((a, b) => intVal(a) + intVal(b), 0);

                    // Total over this page
                    pageTotal = api
                        .column(5, {
                            page: 'current'
                        })
                        .data()
                        .reduce((a, b) => intVal(a) + intVal(b), 0);

                    // Update footer
                    api.column(5).footer().innerHTML =
                        'TK' + Math.round(pageTotal) + ' ( TK' + Math.round(total) + ' total)';
                },
                // ============================ Mulipol collam  sum =================================
                // https: //datatables.net/forums/discussion/45385/footer-callback-for-multiple-columns
                drawCallback: function(row, data, start, end, display) {
                    let api = this.api();

                    // Remove the formatting to get integer data for summation
                    let intVal = function(i) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ? i : 0;
                    };

                    // Total over all pages
                    total = api
                        .column(6)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    total1 = api
                        .column(7)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Total over this page
                    pageTotal = api
                        .column(6, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    pageTotal1 = api
                        .column(7, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    allTotal = pageTotal1 * pageTotal;
                    // Update footer
                    $(api.column(6).footer()).html(
                        'TK' + Math.round(pageTotal) + ' ( TK' + Math.round(total) + ' total)'
                    );

                    $(api.column(7).footer()).html(
                        'TK' +Math.round( pageTotal1) + ' ( TK' + Math.round(total1) + ' total)'
                    );
                    // $(api.column(6).footer()).html(
                    //     allTotal
                    // );

                },

                // ============================= Multy collam  sum ======================================
                // https://stackoverflow.com/questions/40034073/sum-on-1-columns-in-datatables-footer-using-footer-callback
                // drawCallback: function(row, data, start, end, display) {
                //     let api = this.api();
                //     data;

                //     // Remove the formatting to get integer data for summation
                //     let intVal = function(i) {
                //         return typeof i === 'string' ?
                //             i.replace(/[\$,]/g, '') * 1 :
                //             typeof i === 'number' ? i : 0;
                //     };

                //     var cols = [4, 5];

                //     for (let index = 0; index < cols.length; index++) {
                //         var col_data = cols[index];
                //         // Total over all pages
                //         total = api
                //             .column(col_data)
                //             .data()
                //             .reduce(function(a, b) {
                //                 return intVal(a) + intVal(b);
                //             }, 0);

                //         // Total over this page
                //         pageTotal = api
                //             .column(col_data, {
                //                 page: 'current'
                //             })
                //             .data()
                //             .reduce(function(a, b) {
                //                 return intVal(a) + intVal(b);
                //             }, 0);

                //         // Update footer
                //         $(api.column(col_data).footer()).html(
                //             'Total: ' + pageTotal + ' ( GrandTotal: ' + total + ' )'
                //         );
                //     }

                // },


                // ============================ Or Mulipol collam  sum =================================
                // https://live.datatables.net/boweyiga/1/edit
                // drawCallback: function(row, data, start, end, display) {
                //     let api = this.api();

                //     // Remove the formatting to get integer data for summation
                //     let intVal = function(i) {
                //         return typeof i === 'string' ?
                //             i.replace(/[\$,]/g, '') * 1 :
                //             typeof i === 'number' ? i : 0;
                //     };

                //     api.columns('.sum', {
                //         page: 'current'
                //     }).every(function() {
                //         var pageTotal = this
                //             .data()
                //             .reduce(function(a, b) {
                //                 return intVal(a) + intVal(b);
                //             }, 0);

                //         this.footer().innerHTML = pageTotal;
                //     });

                //     api.columns('.sumone', {
                //         page: 'current'
                //     }).every(function() {
                //         var sum = this
                //             .data()
                //             .reduce(function(a, b) {
                //                 return intVal(a) + intVal(b);
                //             }, 0);

                //         this.footer().innerHTML = sum;
                //     });

                // },
                // =======================================

                // dom: 'lBfrtip<"actions">',
                language: {
                    decimal: "",
                    lengthMenu: "Display _MENU_ records per page",
                    zeroRecords: "Nothing found - sorry",
                    info: "Showing page _PAGE_ of _PAGES_",
                    infoEmpty: "No records available",
                    pagingType: "full_numbers",
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

        // Delete
        $('body').on('click', '.deleteTransfer', function(e) {
                e.preventDefault();

                var id = $(this).attr("data-id");

                var url = "{{ route('superAdmin.transfers.destroy', ':id') }}";
                var catUrl = url.replace(':id', id);
                // alert(catUrl);
                let dataDelete = {
                    'id': id,
                };
                if (confirm("Are you sure you want to remove this Transfer?") == true) {
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
                            $('#tableLoad').DataTable().draw(true);
                        }
                    });
                }
            });
        });
        // $(".searchEmail").keyup(function() {
        //     table.draw(true);
        // });
    
        $(".from_warehouse_id").change(function() {            
            $('#tableLoad').DataTable().draw(true);
        });
        $(".to_warehouse_id").change(function() {
            $('#tableLoad').DataTable().draw(true);
        });
        $('.btnchange').change(function() {
                // alert("kk");
            $('#tableLoad').DataTable().draw(true);
        });

 

</script>
@endpush
