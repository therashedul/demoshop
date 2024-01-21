@extends('layouts.deshboard') @section('content')

<style>
    @media (min-width: 576px){
        .modal-dialog {
            max-width: 770px;
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
<div class="container">
    <div class="custom-daterange " style="display: none">
        {{-- <form class="form-horizontal" action="{{ route('superAdmin.purchase') }}" method="GET"> --}}
        <div class="form-group col-md-3 ">
            <h5>Start Date <span class="text-danger"></span></h5>
            <div class="controls">
                <input type="date" name="start_date" id="start_date" class="form-control datepicker-autoclose"
                    placeholder="Please select start date">
                <div class="help-block"></div>
            </div>
        </div>
        <div class="form-group col-md-3">
            <h5>End Date <span class="text-danger"></span></h5>
            <div class="controls">
                <input type="date" name="end_date" id="end_date" class="form-control datepicker-autoclose btnchange"
                    placeholder="Please select end date">
                <div class="help-block"></div>
            </div>
        </div>
        {{-- <button type="submit" class="btn btn-primary">Save</button>
        </form> --}}
        <div class="col-md-2">
            <div class="form-group">
                <label><strong>Warehouse</strong></label>

                <select id="warehouse_id" class="form-control warehouse_id" name="warehouse_id">
                    <option value="">All</option>
                    @foreach ($lims_warehouse_list as $warehouse)
                        <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="form-group col-md-12">
            <h5> Search</h5>
            <input type="text" name="reference_no" class="form-control searchEmail"
                placeholder="Search Reference No ...">
            {{-- <div class="text-left" style=" margin-left: 15px;">
                <button type="text" id="btnFiterSubmitSearch" class="btn btn-info">Submit</button>
            </div> --}}
        </div>
    </div>
</div>
<div class="container px-4 ">
    <div class="row justify-content-center align-items-center g-2">
        <a href="#" data-toggle="modal" data-target="#add-purchase-return" class="btn btn-info"><i class="dripicons-plus"></i> {{trans('Add Return')}}</a> &nbsp; &nbsp;
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
</div>


<section>
    <div class="container-fluid">
        {{-- <div class="card">
            <div class="card-header mt-2">
                <h3 class="text-center">{{trans('Purchase Return List')}}</h3>
            </div>
            {!! Form::open(['route' => 'superAdmin.return-purchase', 'method' => 'get']) !!}
            <div class="row mb-3">
                <div class="col-md-4 offset-md-2 mt-3">
                    <div class="d-flex">
                        <label class="">{{trans('Date')}} &nbsp;</label>
                        <div class="">
                            <div class="input-group">
                                <input type="text" class="daterangepicker-field form-control" value="{{$starting_date}} To {{$ending_date}}" required />
                                <input type="hidden" name="starting_date" value="{{$starting_date}}" />
                                <input type="hidden" name="ending_date" value="{{$ending_date}}" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-3 @if(\Auth::user()->role_id > 2){{'d-none'}}@endif">
                    <div class="d-flex">
                        <label class="">{{trans('Warehouse')}} &nbsp;</label>
                        <div class="">
                            <select id="warehouse_id" name="warehouse_id" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" >
                                <option value="0">{{trans('All Warehouse')}}</option>
                                @foreach($lims_warehouse_list as $warehouse)
                                    @if($warehouse->id == $warehouse_id)
                                        <option selected value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                                    @else
                                        <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 mt-3">
                    <div class="form-group">
                        <button class="btn btn-primary" id="filter-btn" type="submit">{{trans('submit')}}</button>
                    </div>
                </div>
            </div>
            {!! Form::close() !!}
        </div> --}}
        {{-- @if(in_array("purchase-return-add", $all_permission))
        @endif --}}
        
    </div>
    <div class="table-responsive">
        {{-- <table id="return-table" class="table return-list" style="width: 100%"> --}}
            <table id="tableLoad" class="table return-list table-bordered data-table" style="width: 100%">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('Date')}}</th>
                    <th>{{trans('reference')}}</th>
                    <th>{{trans('Purchase Reference')}}</th>
                    <th>{{trans('Warehouse')}}</th>
                    <th>{{trans('Supplier')}}</th>
                    <th>{{trans('grand total')}}</th>
                    <th class="not-exported">{{trans('action')}}</th>
                </tr>
            </thead>

            <tfoot class="tfoot active">
                <th></th>
                <th>{{trans('Total')}}</th>
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

<div id="add-purchase-return" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        {!! Form::open(['route' => 'superAdmin.return-purchase.create', 'method' => 'get']) !!}
        <div class="modal-header">
          <h5 id="exampleModalLabel" class="modal-title">Add Purchase Return</h5>
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
        </div>
        <div class="modal-body">
          <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
           <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label>{{trans('Purchase Reference')}} *</label>
                        <input type="text" name="reference_no" class="form-control">
                    </div>
                </div>
           </div>
            {{Form::submit('Submit', ['class' => 'btn btn-primary'])}}
        </div>
        {!! Form::close() !!}
      </div>
    </div>
</div>

<div id="return-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
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
                @if(!empty($general_setting->site_title))
                <h3 id="exampleModalLabel" class="modal-title text-center container-fluid">{{$general_setting->site_title}}</h3>
                @else
                Site title
                @endif
            </div>
            <div class="col-md-12 text-center">
                <i style="font-size: 15px;">{{trans('Purchase Return Details')}}</i>
            </div>
        </div>
    </div>
            <div id="return-content" class="modal-body">
            </div>
            <br>
            <table class="table table-bordered product-return-list">
                <thead>
                    <th>#</th>
                    <th>{{trans('product')}}</th>
                    <th>{{trans('Batch No')}}</th>
                    <th>{{trans('Qty')}}</th>
                    <th>{{trans('Unit Price')}}</th>
                    <th>{{trans('Tax')}}</th>
                    <th>{{trans('Discount')}}</th>
                    <th>{{trans('Subtotal')}}</th>
                </thead>
                <tbody>
                </tbody>
            </table>
            <div id="return-footer" class="modal-body"></div>
      </div>
    </div>
</div>

@endsection

@push('custom_scripts')
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
                    targets: [0, 1, 2, 3, 4, 5, 6,7]
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
                    data: 'purchase_reference',
                    targets: [3],
                },
                {
                    data: 'warehouse',
                    targets: [4],
                },
                {
                    data: 'supplier',
                    targets: [5],
                }, 
                {
                    data: 'groundTotal',
                    targets: [6],
                },
                
                {
                    data: 'action',
                    targets: [7],
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
                url: "{{ route('superAdmin.return-purchase') }}",
                data: function(d) {
                    d.reference_no = $('.searchEmail').val();
                    d.from_date = $('#start_date').val();
                    d.to_date = $('#end_date').val();

                    d.warehouse_id = $("#warehouse_id").val();
                

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
       

        $('.btnchange').change(function() {
            $('#tableLoad').DataTable().draw(true);

            // table.draw(true);
            // $('#tableLoad').DataTable().destroy();

        });

        // Delete
        $('body').on('click', '.deletereturnpurchase', function(e) {
            e.preventDefault();

            var id = $(this).attr("data-id");

            var url = "{{ route('superAdmin.return-purchase.delete', ':id') }}";
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
                        $('#tableLoad').DataTable().draw(true);
                    }
                });
            }
        });
    });
</script>
<script type="text/javascript">
    $("ul#return").siblings('a').attr('aria-expanded','true');
    $("ul#return").addClass("show");
    $("ul#return #sale-return-menu").addClass("active");

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


    var return_id = [];
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

    $(document).on("click", "tr.return-link td:not(:first-child, :last-child)", function() {
        var returns = $(this).parent().data('return');
        returnDetails(returns);
    });

    $(document).on("click", ".view", function() {
        var purchase = $(this).data('id')
            var reference_no = $(this).data('reference_no')
            var purchase_reference = $(this).data('purchase_reference')
            
            var date = $(this).data('date')
            var purchase_status = $(this).data('purchase_status')
            var warehouse_name = $(this).data('warehouse_name')
            var warehouse_phone = $(this).data('warehouse_phone')
            var warehouse_address = $(this).data('warehouse_address')
            var supplier_name = $(this).data('supplier_name')
            var supplier_phone_number = $(this).data('supplier_phone_number')
            var supplier_email = $(this).data('supplier_email')
            var supplier_address = $(this).data('supplier_address')
            var company_name = $(this).data('company_name')
            
            var order_tax = $(this).data('order_tax')
            var total_discount = $(this).data('total_discount')
            var total_tax = $(this).data('total_tax')
            var total_cost = $(this).data('total_cost')
            var grand_total = $(this).data('grand_total')

            var return_note = $(this).data('return_note')
            var staff_note = $(this).data('staff_note')
          
            var user_name = $(this).data('user_name')
            var user_email = $(this).data('user_email')
    

        returnDetails(
                purchase,
                reference_no,
                purchase_reference,
                date,
                purchase_status,
                warehouse_name,
                warehouse_phone,
                warehouse_address,

                supplier_name,
                company_name,
                supplier_phone_number,
                supplier_email,
                supplier_address,

                order_tax,
                total_discount,
                total_tax,
                total_cost,
                grand_total,

                return_note,
                staff_note,

                user_name,
                user_email
            );
      
        // var returns = $(this).parent().parent().parent().parent().parent().data('return');
        // returnDetails(returns);
    });

    function returnDetails(
                purchase,
                reference_no,
                purchase_reference,
                date,
                purchase_status,
                warehouse_name,
                warehouse_phone,
                warehouse_address,

                supplier_name,
                company_name,
                supplier_phone_number,
                supplier_email,
                supplier_address,

                order_tax,
                total_discount,
                total_tax,
                total_cost,
                grand_total,

                return_note,
                staff_note,

                user_name,
                user_email
            ){
      
        $('input[name="return_id"]').val(purchase);
        var htmltext = '<strong>{{trans("Date")}}: </strong>'+date+
        '<br><strong>{{trans("Return reference")}}: </strong>'+reference_no+
        '<br><strong>{{trans("Purchase Reference")}}: </strong>'+purchase_reference+
        '<br><br><div class="row"><div class="col-md-6"><strong>{{trans("From")}}:</strong><br>'+warehouse_name+
            '<br>'+warehouse_phone+
            '<br>'+warehouse_address+
            '</div><div class="col-md-6"><div class="float-right"><strong>{{trans("To")}}:</strong><br>'+company_name+
                '<br>'+supplier_name+
                '<br>'+supplier_phone_number+
                '<br>'+supplier_email+
                ', '+supplier_address+
                '</div></div></div>';

            var id = purchase;
            var url = "{{ route('superAdmin.return-purchase.product_return', ':id') }}";
            var getUrl = url.replace(':id', id);
       
        $.get(getUrl, function(data){
            $(".product-return-list tbody").remove();
            var name_code = data[0];
            var qty = data[1];
            var unit_code = data[2];
            var tax = data[3];
            var tax_rate = data[4];
            var discount = data[5];
            var subtotal = data[6];
            var batch_no = data[7];
            var newBody = $("<tbody>");
            $.each(name_code, function(index){
                var newRow = $("<tr>");
                var cols = '';
                cols += '<td><strong>' + (index+1) + '</strong></td>';
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
            cols += '<td colspan=5><strong>{{trans("Total")}}:</strong></td>';
            cols += '<td>' + order_tax + '</td>';
            cols += '<td>' + total_discount + '</td>';
            cols += '<td>' + total_cost + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=7><strong>{{trans("Order Tax")}}:</strong></td>';
            cols += '<td>' + order_tax + '(' + order_tax + '%)' + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=7><strong>{{trans("grand total")}}:</strong></td>';
            cols += '<td>' + grand_total + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            $("table.product-return-list").append(newBody);
        });
        var htmlfooter = '<p><strong>{{trans("Return Note")}}:</strong> '+return_note+'</p><p><strong>{{trans("Staff Note")}}:</strong> '+staff_note+'</p><strong>{{trans("Created By")}}:</strong><br>'+user_name+'<br>'+user_email;
        
                
        $('#return-content').html(htmltext);
        $('#return-footer').html(htmlfooter);
        $('#return-details').modal('show');
      
    }



    $("#print-btn").on("click", function(){
        var divContents = document.getElementById("return-details").innerHTML;
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
    var warehouse_id = $("#warehouse_id").val();

    var getUrl = "{{ route('superAdmin.return-purchase.return-data')}}"
    // if(all_permission.indexOf("returns-delete") == -1)
    //     $('.buttons-delete').addClass('d-none');

</script>
<script type="text/javascript" src="https://js.stripe.com/v3/"></script>
@endpush
