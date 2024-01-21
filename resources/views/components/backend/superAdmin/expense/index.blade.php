@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

<section>
    <div class="container-fluid">
        <div class="card">
            <div class="card-header mt-2">
                <h3 class="text-center">Expense List</h3>
            </div>
      
        </div>
        <button class="btn btn-info" data-toggle="modal" data-target="#expense-modal"><i class="dripicons-plus"></i>Add Expense</button>

    </div>
    <div class="table-responsive">
        <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
            {{-- <table id="expense-table" class="table expense-list" style="width: 100%"> --}}
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('Date')}}</th>
                    <th>{{trans('reference')}} No</th>
                    <th>{{trans('Warehouse')}}</th>
                    <th>{{trans('category')}}</th>
                    <th>{{trans('Amount')}}</th>
                    <th>{{trans('Note')}}</th>
                    <th class="not-exported">{{trans('action')}}</th>
                </tr>
            </thead>
            <tfoot class="tfoot active">
                <th colspan="5"> Total</th>
                <th></th>
                <th colspan="2"></th>
            </tfoot>
        </table>
    </div>
</section>
 <!-- expense modal -->
 <div id="expense-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">Add Expense</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>The field labels marked with * are required input fields.</small></p>
                {{-- <form method="POST" action="https://salepropos.com/demo/expenses" accept-charset="UTF-8"> --}}
                    {!! Form::open(['route' => ['superAdmin.expenses.store'], 'method' => 'POST']) !!}                   
                    <div class="row">
                    <div class="col-md-6 form-group">
                        <label>Date</label>
                        <input type="date" name="created_at" class="form-control date" placeholder="Choose date"/>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Expense Category *</label>
                        <select name="expense_category_id" class="selectpicker form-control" required data-live-search="true" data-live-search-style="begins" title="Select Expense Category...">
                            @foreach ( $limsexpensecategorylist as $expenseCategory)    
                                <option value="{{$expenseCategory->id}}">{{$expenseCategory->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Warehouse *</label>
                        <select name="warehouseid" class="selectpicker form-control" required data-live-search="true" data-live-search-style="begins" title="Select Warehouse...">
                            @foreach ( $limswarehouselist as $warehouse)    
                                <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>Amount *</label>
                        <input type="number" name="amount" step="any" required class="form-control">
                    </div>
                    <div class="col-md-6 form-group">
                        <label> Account</label>
                        <select class="form-control selectpicker" name="account_id">
                            @foreach ( $limsaccountlist as $account)    
                                <option value="{{$account->id}}">{{$account->name}}</option>
                            @endforeach
                        </select>
                    </div>
                  </div>
                  <div class="form-group">
                      <label>Note</label>
                      <textarea name="note" rows="3" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary">Submit</button>
                  </div>
                  {{ Form::close() }}
            </div>
        </div>
    </div>
  </div>
  <!-- end expense modal -->
  
{{-- Edit Model  editModal--}}
<div id="ajaxModelexa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">{{trans('Update Expense')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
              <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal getUrl">
                {{-- {!! Form::open(['route' => ['superAdmin.expenses.update'], 'method' => 'POST']) !!} --}}
                @php
                    $lims_expense_category_list = DB::table('expense_categories')->where('is_active', true)->get();
                    if(Auth::user()->role_id > 2)
                        $limswarehouselist = DB::table('warehouses')->where([
                            ['is_active', true],
                            ['id', Auth::user()->warehouseid]
                        ])->get();
                    else
                        $limswarehouselist = DB::table('warehouses')->where('is_active', true)->get();
                @endphp
                  <div class="form-group">
                      <input type="hidden" name="expense_id" id="id" class="id">
                      <label>{{trans('reference')}}</label>
                      <p id="reference"></p>
                      <input type="hidden" name="reference" id="referenceNo" class="referenceNo">
                  </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>{{trans('Date')}}</label>
                            <input type="date" name="created_at" class="form-control expensedate" id="expensedate" placeholder="Choose date"/>
                        </div>
                        
                        <div class="col-md-6 form-group">
                            <label>{{trans('Expense Category')}} *</label>

                            <select name="expense_category_id" class=" form-control expenseCategory" id="expenseCategory" >
                                @foreach($lims_expense_category_list as $expense_category)
                                <option  value="{{$expense_category->id}}">{{$expense_category->name . ' (' . $expense_category->code. ')'}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{trans('Warehouse')}} *</label>
                            <select name="warehouseid" class=" form-control warehouse" id="warehouse">
                                @foreach($limswarehouselist as $warehouse)
                                <option selected value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{trans('Amount')}} *</label>
                            <input type="number" name="amount" step="any" id="amount" required class="form-control amount">
                        </div>
                        <div class="col-md-6 form-group">
                            <label> {{trans('Account')}}</label>
                            <select class="form-control selectpicker" name="account_id">
                            @foreach($limsaccountlist as $account)
                                @if($account->is_default)
                                <option selected value="{{$account->id}}">{{$account->name}} [{{$account->account_no}}]</option>
                                @else
                                <option value="{{$account->id}}">{{$account->name}} [{{$account->account_no}}]</option>
                                @endif
                            @endforeach
                            </select>
                        </div>
                    </div>
                  <div class="form-group">
                      <label>{{trans('Note')}}</label>
                      <textarea name="note" rows="3" id="note" class="form-control note"></textarea>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary updatebtn ">{{trans('Update')}}</button>
                  </div>
                </form>
                {{-- {{ Form::close() }} --}}
            </div>
        </div>
    </div>
</div>


@push('custom_scripts')
<script type="text/javascript">

    $("ul#expense").siblings('a').attr('aria-expanded','true');
    $("ul#expense").addClass("show");
    $("ul#expense #exp-list-menu").addClass("active");

    var expense_id = [];
    var user_verified = 1;
    

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });


    $('body').on('click', '.editexpenses', function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            var reference_no = $(this).data('reference_no');
            var expensedate = $(this).data('date');
            var warehouse = $(this).data('warehouse');
            var expenseCategory = $(this).data('expense_category');
            var amount = $(this).data('amount');
            var note = $(this).data('note');
            
            $('#id').val(id);
            $('#reference').text(reference_no);
            $('#referenceNo').val(reference_no);
            $('#expensedate').val(expensedate);
            $('#warehouse').val(warehouse);
            $('#expenseCategory').val(expenseCategory);
            $('#amount').val(amount);
            $('#note').val(note);
            
            $("#ajaxModelexa").modal('show');
       

       
          

        });
        // Update
        $('.updatebtn').click(function(e) {
            e.preventDefault();
            // $(this).html('Updating...');

            // let uid = $('.id').val();
            // var referenceNo  = $('.referenceNo').val();
            // var dateexpense = $('.expensedate').val();
            // var warehouse = $('.warehouse').val();
            // var expenseCategory = $('.expenseCategory').val();
            // var amount = $('.amount').val();
            // var note = $('.note').val();
            

            // let updateData = {
            //     'id': uid,
            //     'reference_no': referenceNo,
            //     'expense_category_id': expenseCategory,
            //     'warehouseid': warehouse,
            //     'created_at': dateexpense,
            //     'amount': amount,
            //     'note': note,
            // };

            // console.log(updateData);

            $.ajax({
                type: "POST",
                // data: updateData,
                data: $('#postForm').serialize(),
                url: "{{ route('superAdmin.expenses.update') }}",
                cache: false,
                enctype: 'multipart/form-data',
                dataType: 'json',
                success: function(data) {
                    $('#postForm').trigger("reset");
                    $('#ajaxModelexa').modal('hide');
                    $('#tableLoad').DataTable().draw(true);
                },
                error: function(data) {
                    console.log('Error:', data);
                    $('.updatebtn').html('Do not Update');
                }
            });
        });



    $(".daterangepicker-field").daterangepicker({
      callback: function(startDate, endDate, period){
        var startingdate = startDate.format('YYYY-MM-DD');
        var endingdate = endDate.format('YYYY-MM-DD');
        var title = startingdate + ' To ' + endingdate;
        $(this).val(title);
        $('input[name="startingdate"]').val(startingdate);
        $('input[name="endingdate"]').val(endingdate);
      }
    });


    // $(document).ready(function() {
    //     $(document).on('click', 'button.open-Editexpense_categoryDialog', function() {
    //         var id = $(this).attr("data-id");
    //         var url = "{{ route('superAdmin.expenses.edit', ':id') }}";
    //         getUrl =url.replace(':id', id);
            
    //         // var url = "expenses/";
    //         // var id = $(this).data('id').toString();
    //         // url = url.concat(id).concat("/edit");
            
    //         $.get(getUrl, function(data) {
    //             $('#ajaxModelexa #reference').text(data['reference_no']);
    //             $("#ajaxModelexa input[name='created_at']").val(data['date']);
    //             $("#ajaxModelexa select[name='warehouseid']").val(data['warehouseid']);
    //             $("#ajaxModelexa select[name='expense_category_id']").val(data['expense_category_id']);
    //             $("#ajaxModelexa select[name='account_id']").val(data['account_id']);
    //             $("#ajaxModelexa input[name='amount']").val(data['amount']);
    //             $("#ajaxModelexa input[name='expense_id']").val(data['id']);
    //             $("#ajaxModelexa textarea[name='note']").val(data['note']);
    //             // $('.selectpicker').selectpicker('refresh');
    //         });
    //     });
    // });

    function confirmDelete() {
    if (confirm("Are you sure want to delete?")) {
        return true;
    }
    return false;
    }

    var startingdate = $("input[name=startingdate]").val();
    var endingdate = $("input[name=endingdate]").val();
    var warehouseid = $("#warehouseid").val();

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
                        targets: [0, 1, 2, 3, 4, 5, 6, 7]
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
                        data: 'warehouse',
                        targets: [3]

                    },   
                    {
                        data: 'expenseCategory',
                        
                        targets: [4]
                    },
                    {
                        data: 'amount',

                        targets: [5]
                    },
                    {
                        data: 'note',
                        targets: [6]
                    },
               
                    {
                        data: 'action',
                        targets: [7]
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
                    url: "{{ route('superAdmin.expenses') }}",
                    data: function(d) {
                        d.card_no = $('.searchEmail').val();
                        d.search = $('input[type="search"]').val();

                    }
                },
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

            $(".searchEmail").keyup(function() {
                table.draw(true);
            });

            $('.btnchange').change(function() {
                $('#tableLoad').DataTable().draw(true);
            });
        });
            // Delete
            $('body').on('click', '.deleteexpense', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var url = "{{ route('superAdmin.expenses.deleted', ':id') }}";
                var catUrl = url.replace(':id', id);

                let dataDelete = {
                    'id': id,
                };
                // alert(id);
                if (confirm("Are you sure you want to remove this Delivery?") == true) {
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
</script>
@endpush
