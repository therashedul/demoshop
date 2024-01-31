<?php $__env->startSection('content'); ?>
<?php if(session()->has('not_permitted')): ?>
    <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div>
<?php endif; ?>
<section class="forms">
    <div class="container-fluid">
        <div class="card">
            <div class="card-header mt-2">
                <h3 class="text-center"><?php echo e(trans('Product Report')); ?></h3>
            </div>
            <?php echo Form::open(['route' => 'superAdmin.report.product', 'method' => 'get']); ?>

            <div class="row mb-3 product-report-filter">
                <div class="col-md-4 offset-md-2 mt-3">
                    <div class="form-group row">
                        <label class="d-tc mt-2"><strong><?php echo e(trans('Choose Your Date')); ?></strong> &nbsp;</label>
                        <div class="d-tc">
                            <div class="input-group">
                                <input type="text" class="daterangepicker-field form-control" value="<?php echo e($start_date); ?> To <?php echo e($end_date); ?>" required />
                                <input type="hidden" name="start_date" value="<?php echo e($start_date); ?>" />
                                <input type="hidden" name="end_date" value="<?php echo e($end_date); ?>" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-3">
                    <div class="form-group row">
                        <label class="d-tc mt-2"><strong><?php echo e(trans('Choose Warehouse')); ?></strong> &nbsp;</label>
                        <div class="d-tc">
                            <select name="warehouse_id" class="selectpicker form-control" data-live-search="true" data-live-search-style="begins" >
                                <option value="0"><?php echo e(trans('All Warehouse')); ?></option>
                                <?php $__currentLoopData = $lims_warehouse_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($warehouse->id); ?>"><?php echo e($warehouse->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-2 mt-3">
                    <div class="form-group">
                        <button class="btn btn-primary" type="submit"><?php echo e(trans('submit')); ?></button>
                    </div>
                </div>
            </div>
            <?php echo Form::close(); ?>

        </div>
    </div>
    <div class="table-responsive">
        <table id="product-report-table" class="table table-hover data-table" style="width: 100%">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th><?php echo e(trans('Product')); ?></th>
                    <th><?php echo e(trans('category')); ?></th>
                    <th><?php echo e(trans('Purchased Amount')); ?></th>
                    <th><?php echo e(trans('Purchased')); ?> <?php echo e(trans('qty')); ?></th>
                    <!-- <th>Transfered Amount</th>
                    <th>Transfered Qty</th> -->
                    <th><?php echo e(trans('Sold Amount')); ?></th>
                    <th><?php echo e(trans('Sold')); ?> <?php echo e(trans('qty')); ?></th>
                    <th>Returned Amount</th>
                    <th>Returned Qty</th>
                    <th>Purchase Returned Amount</th>
                    <th>Purchase Returned Qty</th>
                    <th><?php echo e(trans('profit')); ?></th>
                    <th><?php echo e(trans('In Stock')); ?></th>
                    
                </tr>
            </thead>

            <tfoot class="tfoot active">
                <th></th>
                <th><?php echo e(trans('Total')); ?></th>
                <th></th>
                <th></th>
                <th></th>
                <!-- <th></th>
                <th></th> -->
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

<?php $__env->stopSection(); ?>

<?php $__env->startPush('custom_scripts'); ?>
<script type="text/javascript">

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var warehouse_id = <?php echo json_encode($warehouse_id) ?>;
    $('.product-report-filter select[name="warehouse_id"]').val(warehouse_id);
    $('.selectpicker').selectpicker('refresh');

    $(".daterangepicker-field").daterangepicker({
      callback: function(startDate, endDate, period){
        var start_date = startDate.format('YYYY-MM-DD');
        var end_date = endDate.format('YYYY-MM-DD');
        var title = start_date + ' To ' + end_date;
        $(this).val(title);
        $(".product-report-filter input[name=start_date]").val(start_date);
        $(".product-report-filter input[name=end_date]").val(end_date);
      }
    });

    var start_date = $(".product-report-filter input[name=start_date]").val();
    var end_date = $(".product-report-filter input[name=end_date]").val();
    var warehouse_id = $(".product-report-filter select[name=warehouse_id]").val();

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
                        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12]
                    },
                    {
                        data: 'DT_RowIndex',
                        targets: [0]
                    },

                    {
                        data: 'productname',
                        targets: [1]

                    },
                    {
                        data: 'category',
                        targets: [2]
                        
                    },
                    {
                        data: 'purchased_amount',
                        targets: [3]

                    },
                    {
                        data: 'purchased_qty',
                        targets: [4]

                    },
                    {
                        data: 'sold_amount',
                        targets: [5]

                    },
                    {
                        data: 'sold_qty',
                        targets: [6]

                    },
                    {
                        data: 'returned_amount',
                        targets: [7]

                    },
                    {
                        data: 'returned_qty',
                        targets: [8]

                    },

                    {
                        data: 'purchase_returned_amount',
                        targets: [9]
                    }, 
                    {
                        data: 'purchase_returned_qty',
                        targets: [10]
                    }, 
                    {
                        data: 'profit',
                        targets: [11]
                    }, 
                    
                    {
                        data: 'qty',
                        targets: [12]
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
                    url: "<?php echo e(route('superAdmin.report/product_report_data')); ?>",
                    data: function(d) {
                        d.card_no = $('.searchEmail').val();
                        d.search = $('input[type="search"]').val();
                    }
                },

                // ==========================
                // https://live.datatables.net/boweyiga/1/edit

                footerCallback: function(row, data, start, end, display) {
                    let api = this.api();

                    // Remove the formatting to get integer data for summation
                    let intVal = function(i) {
                        return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ? i : 0;
                    };

                    // Total over all pages
                    total = api
                        .column(3)
                        .data()
                        .reduce((a, b) => intVal(a) + intVal(b), 0);

                    // Total over this page
                    pageTotal = api
                        .column(3, {
                            page: 'current'
                        })
                        .data()
                        .reduce((a, b) => intVal(a) + intVal(b), 0);

                    // Update footer
                    api.column(3).footer().innerHTML =
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
                        .column(4)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    total1 = api
                        .column(5)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Total over this page
                    pageTotal = api
                        .column(4, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    pageTotal1 = api
                        .column(5, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    allTotal = pageTotal1 * pageTotal;
                    // Update footer
                    $(api.column(4).footer()).html(
                        'TK' + Math.round(pageTotal) + ' ( TK' + Math.round(total) + ' total)'
                    );

                    $(api.column(5).footer()).html(
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


            $(".searchEmail").keyup(function() {
                table.draw(true);
            });

            $('.btnchange').change(function() {
                $('#tableLoad').DataTable().draw(true);
            });
        });


</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.deshboard', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/report/product_report.blade.php ENDPATH**/ ?>