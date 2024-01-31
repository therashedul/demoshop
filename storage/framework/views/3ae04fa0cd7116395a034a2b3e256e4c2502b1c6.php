    <style type="text/css">
        @media (min-width: 576px) {
            .modal-dialog {
                max-width: max-content !important;
            }
        }

        .menuScrolling {
            height: auto;
            overflow-x: hidden;
            overflow-y: auto;
            width: auto;
        }
    </style>
    <?php if(session()->has('message')): ?>
        <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button><?php echo e(session()->get('message')); ?></div>
    <?php endif; ?>
    <?php if(session()->has('not_permitted')): ?>
        <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div>
    <?php endif; ?>

    <div class="container">
        <div class="custom-daterange " style="display: none">
            
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
                    <input type="date" name="end_date" id="end_date"
                        class="form-control datepicker-autoclose btnchange" placeholder="Please select end date">
                    <div class="help-block"></div>
                </div>
            </div>
            
            <div class="col-md-2">
                <div class="form-group">
                    <label><strong>Warehouse</strong></label>

                    <select id="warehouse_id" class="form-control warehouse_id" name="warehouse_id">
                        <option value="">All</option>
                        <?php $__currentLoopData = $limswarehouselist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($warehouse->id); ?>"><?php echo e($warehouse->name); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </select>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label><strong>Purchase Status</strong></label>
                    
                    <select name="purchase_status" class="form-control purchase_status" id="purchase_status">
                        <option value="">All</option>
                        <option value="1"><?php echo e(trans('Recieved')); ?>

                        </option>
                        <option value="2"><?php echo e(trans('Partial')); ?>

                        </option>
                        <option value="3"><?php echo e(trans('Pending')); ?>

                        </option>
                        <option value="4"><?php echo e(trans('Ordered')); ?>

                        </option>
                    </select>
                </div>
            </div>
            <div class="col-md-2">
                <div class="form-group">
                    <label><strong>Payment Status</strong></label>

                    <select id="payment_status" class="form-control payment_status" name="payment_status">
                        <option value="">All</option>
                        <option value="1">Due</option>
                        <option value="2">Paid</option>
                    </select>
                </div>
            </div>

            <div class="form-group col-md-12">
                <h5> Search</h5>
                <input type="text" name="purchase_name" class="form-control searchEmail"
                    placeholder="Search Reference No ...">
                
            </div>
        </div>
    </div>

    <div class="container px-4 ">
        <div class="row justify-content-center align-items-center g-2">
            <a class="btn btn-primary float-right pull-right" href="<?php echo e(route('superAdmin.purchase.create')); ?>"
                id="createNewpurchase"> <i class="fas fa-plus"></i> Add New purchase</a> &NonBreakingSpace; &nbsp;
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
        <div class="table-responsive">
            <table id="tableLoad" class="table table-bordered data-table purchase-list" style="width:100%;">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Name</th>
                        <th>Reference</th>
                        <th>Supplier</th>
                        <th>Purchase status</th>
                        <th>Grand Total</th>
                        <th>Return Amount</th>
                        <th>Paid</th>
                        <th>Due</th>
                        <th>Payment Status</th>
                        <th width="100px">Actions</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td colspan="4">Total</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td colspan="2"></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <!-- Modal for purchase Add -->
    <div id="purchase-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="container mt-3 pb-2 border-bottom">
                    <div class="row">
                        <div class="col-md-6 d-print-none">
                            <button id="print-btn" type="button" class="btn btn-default btn-sm"><i
                                    class="dripicons-print"></i> <?php echo e(trans('Print')); ?></button>
                        </div>
                        <div class="col-md-6 d-print-none">
                            <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close"
                                class="close"><span aria-hidden="true"><i
                                        class="dripicons-cross"></i></span></button>
                        </div>
                        <div class="col-md-12">
                            <h3 id="exampleModalLabel" class="modal-title text-center container-fluid">
                                
                                site tile
                            </h3>
                        </div>
                        <div class="col-md-12 text-center">
                            <i style="font-size: 15px;"><?php echo e(trans('Purchase Details')); ?></i>
                        </div>
                    </div>
                </div>
                <div id="purchase-content" class="modal-body"></div>
                <br>
                <table class="table table-bordered product-purchase-list">
                    <thead>
                        <th>#</th>
                        <th><?php echo e(trans('product')); ?></th>
                        <th><?php echo e(trans('Batch No')); ?></th>
                        <th>Qty</th>
                        <th><?php echo e(trans('Unit Cost')); ?></th>
                        <th><?php echo e(trans('Tax')); ?></th>
                        <th><?php echo e(trans('Discount')); ?></th>
                        <th><?php echo e(trans('Subtotal')); ?></th>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div id="purchase-footer" class="modal-body"></div>
            </div>
        </div>
    </div>

    <div id="view-payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('All Payment')); ?></h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <table class="table table-hover payment-list">
                        <thead>
                            <tr>
                                <th><?php echo e(trans('date')); ?></th>
                                <th><?php echo e(trans('Reference No')); ?></th>
                                <th><?php echo e(trans('Account')); ?></th>
                                <th><?php echo e(trans('Amount')); ?></th>
                                <th><?php echo e(trans('Paid By')); ?></th>
                                <th><?php echo e(trans('action')); ?></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    
    <div id="add-payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('Add Payment')); ?></h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <?php echo Form::open(['route' => 'superAdmin.purchase.add-payment', 'method' => 'post', 'class' => 'payment-form']); ?>

                    <div class="row">
                        <input type="hidden" name="balance">
                        <div class="col-md-6">
                            <label><?php echo e(trans('Recieved Amount')); ?> *</label>
                            <input type="text" name="paying_amount" class="form-control numkey" step="any"
                                required>
                        </div>
                        <div class="col-md-6">
                            <label><?php echo e(trans('Paying Amount')); ?> *</label>
                            <input type="text" id="amount" name="amount" class="form-control" step="any"
                                required>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label><?php echo e(trans('Change')); ?> : </label>
                            <p class="change ml-2">0.00</p>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label><?php echo e(trans('Paid By')); ?></label>
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
                            <label><?php echo e(trans('Cheque Number')); ?> *</label>
                            <input type="text" name="cheque_no" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label> <?php echo e(trans('Account')); ?></label>
                        <select class="form-control selectpicker" name="account_id">
                            <?php $__currentLoopData = $limsaccountlist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $account): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php if($account->is_default): ?>
                                    <option selected value="<?php echo e($account->id); ?>"><?php echo e($account->name); ?>

                                        [<?php echo e($account->account_no); ?>]</option>
                                <?php else: ?>
                                    <option value="<?php echo e($account->id); ?>"><?php echo e($account->name); ?>

                                        [<?php echo e($account->account_no); ?>]</option>
                                <?php endif; ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><?php echo e(trans('Payment Note')); ?></label>
                        <textarea rows="3" class="form-control" name="payment_note"></textarea>
                    </div>

                    <input type="hidden" name="purchase_id">

                    <button type="submit" class="btn btn-primary"><?php echo e(trans('submit')); ?></button>
                    <?php echo e(Form::close()); ?>

                </div>
            </div>
        </div>
    </div>
    

    <div id="edit-payment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('Update Payment')); ?></h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <?php echo Form::open(['route' => 'superAdmin.purchase.update-payment', 'method' => 'post', 'class' => 'payment-form']); ?>

                    <div class="row">
                        <div class="col-md-6">
                            <label><?php echo e(trans('Recieved Amount')); ?> *</label>
                            <input type="text" name="edit_paying_amount" class="form-control numkey"
                                step="any" required>
                        </div>
                        <div class="col-md-6">
                            <label><?php echo e(trans('Paying Amount')); ?> *</label>
                            <input type="text" name="edit_amount" class="form-control" step="any" required>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label><?php echo e(trans('Change')); ?> : </label>
                            <p class="change ml-2">0.00</p>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label><?php echo e(trans('Paid By')); ?></label>
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
                            <label><?php echo e(trans('Cheque Number')); ?> *</label>
                            <input type="text" name="edit_cheque_no" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label> <?php echo e(trans('Account')); ?></label>
                        <select class="form-control selectpicker" name="account_id">
                            <?php $__currentLoopData = $limsaccountlist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $account): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($account->id); ?>"><?php echo e($account->name); ?>

                                    [<?php echo e($account->account_no); ?>]
                                </option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><?php echo e(trans('Payment Note')); ?></label>
                        <textarea rows="3" class="form-control" name="edit_payment_note"></textarea>
                    </div>

                    <input type="hidden" name="payment_id">

                    <button type="submit" class="btn btn-primary"><?php echo e(trans('update')); ?></button>
                    <?php echo e(Form::close()); ?>

                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("ul#purchase").siblings('a').attr('aria-expanded', 'true');
        $("ul#purchase").addClass("show");
        $("ul#purchase #purchase-list-menu").addClass("active");

        var purchase_id = [];
        // var user_verified = <?php echo json_encode(env('USER_VERIFIED')); ?>;
        // var startingdate = <?php echo json_encode($startingdate); ?>;
        // var endingdate = <?php echo json_encode($endingdate); ?>;
        var warehouse_id = <?php echo json_encode($warehouseid); ?>;
        var purchase_status = <?php echo json_encode($purchasestatus); ?>;
        var payment_status = <?php echo json_encode($paymentstatus); ?>;
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
                        className: "left",
                        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                    },
                    {
                        data: 'date',
                        targets: [0],
                    },
                    {
                        data: 'name',
                        targets: [1],
                    },
                    {
                        data: 'reference_no',
                        targets: [2],
                    },
                    {
                        data: 'suppler',
                        targets: [3],
                    },
                    {
                        data: 'purchase_status',
                        targets: [4],
                    },
                    {
                        data: 'grand_total',
                        targets: [5],
                    },
                    {
                        data: 'returned_amount',
                        targets: [6],
                    },
                    {
                        data: 'paid_amount',
                        targets: [7],
                    },
                    {
                        data: 'due',
                        targets: [8],
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

                processing: true,
                serverSide: true,
                searching: false,
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
                // className: "left",

                ajax: {
                    url: "<?php echo e(route('superAdmin.purchase')); ?>",
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
                        .column(5)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    total1 = api
                        .column(6)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                    total2 = api
                        .column(7)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    total3 = api
                        .column(8)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Total over this page
                    pageTotal = api
                        .column(5, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    pageTotal1 = api
                        .column(6, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                    pageTotal2 = api
                        .column(7, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    pageTotal3 = api
                        .column(8, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    allTotal = pageTotal1 * pageTotal;
                    // Update footer
                    $(api.column(5).footer()).html(
                        'TK: ' + Math.round(pageTotal).toLocaleString('en-IN')
                    );

                    $(api.column(6).footer()).html(
                        'TK: ' + Math.round(pageTotal1).toLocaleString('en-IN')
                    );
                    $(api.column(7).footer()).html(
                        'TK: ' + Math.round(pageTotal2).toLocaleString('en-IN')
                    );

                    $(api.column(8).footer()).html(
                        'TK: ' + Math.round(pageTotal3).toLocaleString('en-IN')
                    );
                    // $(api.column(6).footer()).html(
                    //     allTotal
                    // );
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

                var url = "<?php echo e(route('superAdmin.purchase.deleted', ':id')); ?>";
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
        });
    </script>

    <script type="text/javascript">
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
            var purchase = $(this).data('purchase');
            purchaseDetails(purchase);
        });

        $(document).on("click", ".view", function() {
            var purchase = $(this).data('id')
            var reference_no = $(this).data('reference_no')
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

            var total_tax = $(this).data('total_tax')
            var total_discount = $(this).data('total_discount')
            var total_cost = $(this).data('total_cost')

            var order_tax = $(this).data('order_tax')
            var order_tax_rate = $(this).data('order_tax_rate')
            var order_discount = $(this).data('order_discount')
            var shipping_cost = $(this).data('shipping_cost')
            var grand_total = $(this).data('grand_total')
            var paid_amount = $(this).data('paid_amount')
            var user_name = $(this).data('user_name')
            var user_email = $(this).data('user_email')
            var note = $(this).data('note')

            purchaseDetails(
                purchase,
                reference_no,
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

                total_tax,
                total_discount,
                total_cost,

                order_tax,
                order_tax_rate,
                order_discount,

                shipping_cost,
                grand_total,
                paid_amount,

                user_name,
                user_email,
                note
            );

        });

        function purchaseDetails(
            purchase,
            reference_no,
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

            total_tax,
            total_discount,
            total_cost,

            order_tax,
            order_tax_rate,
            order_discount,

            shipping_cost,
            grand_total,
            paid_amount,

            user_name,
            user_email,
            note
        ) {

            var htmltext = '<strong><?php echo e(trans('Date')); ?>: </strong>' + date +
                '<br><strong><?php echo e(trans('reference')); ?>: </strong>' + reference_no +
                '<br><strong><?php echo e(trans('Purchase Status')); ?>: </strong>' + purchase_status +
                '<br><br><div class="row"><div class="col-md-6"><strong><?php echo e(trans('From')); ?>:</strong><br>' +
                warehouse_name + '<br>' + warehouse_phone + '<br>' + warehouse_address +
                '</div><div class="col-md-6"><div class="float-right"><strong><?php echo e(trans('To')); ?>:</strong><br>' +
                supplier_name + '<br>' + company_name + '<br>' + supplier_phone_number + '<br>' + supplier_email + '<br>' +
                supplier_address + '</div></div></div>';
            // console.log(purchase[1]);
            $(".product-purchase-list tbody").remove();


            var id = purchase;
            var url = "<?php echo e(route('superAdmin.purchases.product_purchase', ':id')); ?>";
            var getUrl = url.replace(':id', id);

            $.get(getUrl, function(data) {
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
                        var cost = (subtotal[index] / qty[index]);
                        var newRow = $("<tr>");
                        var cols = '';
                        cols += '<td><strong>' + (index + 1) + '</strong></td>';
                        cols += '<td>' + name_code[index] + '</td>';
                        cols += '<td>' + batch_no[index] + '</td>';
                        cols += '<td>' + qty[index] + ' ' + unit_code[index] + '</td>';
                        cols += '<td>' + cost.toLocaleString() + '</td>';
                        cols += '<td>' + tax[index] + '(' + tax_rate[index] + '%)' + '</td>';
                        cols += '<td>' + discount[index] + '</td>';
                        cols += '<td>' + subtotal[index] + '</td>';
                        newRow.append(cols);
                        newBody.append(newRow);
                    });

                    var newRow = $("<tr>");
                    cols = '';

                    cols += '<td colspan=5><strong><?php echo e(trans('Total')); ?>:</strong></td>';
                    cols += '<td>' + total_tax + '</td>';
                    cols += '<td>' + total_discount + '</td>';
                    cols += '<td>' + total_cost + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong><?php echo e(trans('Order Tax')); ?>:</strong></td>';
                    cols += '<td>' + order_tax + '(' + order_tax_rate + '%)' + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong><?php echo e(trans('Order Discount')); ?>:</strong></td>';
                    cols += '<td>' + order_discount + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong><?php echo e(trans('Shipping Cost')); ?>:</strong></td>';
                    cols += '<td>' + shipping_cost + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong><?php echo e(trans('grand total')); ?>:</strong></td>';
                    cols += '<td>' + grand_total.toLocaleString() + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong><?php echo e(trans('Paid Amount')); ?>:</strong></td>';
                    cols += '<td>' + paid_amount.toLocaleString() + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=7><strong><?php echo e(trans('Due')); ?>:</strong></td>';
                    cols += '<td>' + (grand_total - paid_amount) + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);

                    $("table.product-purchase-list").append(newBody);
                }
            });

            var htmlfooter = '<p><strong><?php echo e(trans('Note')); ?>:</strong> ' + note +
                '</p><strong><?php echo e(trans('Created By')); ?>:</strong><br>' + user_name + '<br>' + user_email;

            $('#purchase-content').html(htmltext);
            $('#purchase-footer').html(htmlfooter);
            $('#purchase-details').modal('show');
        }


        $("#print-btn").on("click", function() {
            var divContents = document.getElementById("purchase-details").innerHTML;
            var a = window.open('');
            a.document.write('<html>');
            a.document.write(
                '<body><style>body{font-family: sans-serif;line-height: 1.15;-webkit-text-size-adjust: 100%;}.d-print-none{display:none}.text-center{text-align:center}.row{width:100%;margin-right: -15px;margin-left: -15px;}.col-md-12{width:100%;display:block;padding: 5px 15px;}.col-md-6{width: 50%;float:left;padding: 5px 15px;}table{width:100%;margin-top:30px;}th{text-aligh:left;}td{padding:10px}table, th, td{border: 1px solid black; border-collapse: collapse;}</style><style>@media  print {.modal-dialog { max-width: 1000px;} }</style>'
            );
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            setTimeout(function() {
                a.close();
            }, 10);
            a.print();
        });

        $(document).on("click", "table.purchase-list tbody .add-payment", function(event) {
            $("#cheque").hide();
            $(".card-element").hide();
            $('select[name="paid_by_id"]').val(1);
            rowindex = $(this).closest('tr').index();
            var purchase_id = $(this).data('id').toString();
            var balance = $('table.purchase-list tbody tr:nth-child(' + (rowindex + 1) + ')').find(
                'td:nth-child(9)').text();
            balance = parseFloat(balance.replace(/,/g, ''));
            $('input[name="amount"]').val(balance);
            $('input[name="balance"]').val(balance);
            $('input[name="paying_amount"]').val(balance);
            $('input[name="purchase_id"]').val(purchase_id);
        });

        $(document).on("click", "table.purchase-list tbody .get-payment", function(event) {
            var id = $(this).data('id').toString();
            var url = "<?php echo e(route('superAdmin.purchases.getpayment', ':id')); ?>";
            var listUrl = url.replace(':id', id);
            $.get(listUrl, function(data) {
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
                    console.log(payment_reference[index]);

                    cols += '<td>' + payment_date[index] + '</td>';
                    cols += '<td>' + payment_reference[index] + '</td>';
                    cols += '<td>' + account_name[index] + '</td>';
                    cols += '<td>' + paid_amount[index] + '</td>';
                    cols += '<td>' + paying_method[index] + '</td>';
                    cols +=
                        '<td><div class="btn-group"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action<span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button><ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">';
                    cols +=
                        '<li><button type="button" class="btn btn-link edit-btn" data-id="' +
                        payment_id[index] +
                        '" data-clicked=false data-toggle="modal" data-target="#edit-payment"><i class="dripicons-document-edit"></i> Edit</button></li><li class="divider"></li>';

                    cols +=
                        '<?php echo e(Form::open(['route' => 'superAdmin.purchase.delete-payment', 'method' => 'post'])); ?><li><input type="hidden" name="id" value="' +
                        payment_id[index] +
                        '" /> <button type="submit" class="btn btn-link" onclick="return confirmDeletePayment()"><i class="dripicons-trash"></i> Delete</button></li><?php echo e(Form::close()); ?>';
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
                        $.getScript("<?php echo e(asset('vendor/stripe/checkout.js')); ?>");
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
                $.getScript("<?php echo e(asset('vendor/stripe/checkout.js')); ?>");
                $(".card-element").show();
                $(".card-errors").show();
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
                $.getScript("<?php echo e(asset('vendor/stripe/checkout.js')); ?>");
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

        // if (allpermission.indexOf("purchases-delete") == -1)
        //     $('.buttons-delete').addClass('d-none');
    </script>


    
    
    
<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/components/backend/superAdmin/purchase/purchaseindex.blade.php ENDPATH**/ ?>