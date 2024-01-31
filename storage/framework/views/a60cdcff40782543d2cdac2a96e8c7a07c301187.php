<?php $__env->startSection('content'); ?>
    
    <style>
        @media (min-width: 576px) {
            .modal-content {
                width: 40rem;
            }
        }

        .menuScrolling {
            overflow-x: hidden;
            overflow-y: auto;
            width: 200px;
            z-index: 9999;
        }
    </style>
    <?php if(session()->has('message')): ?>
        <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo session()->get('message'); ?>

        </div>
    <?php endif; ?>
    <?php if(session()->has('not_permitted')): ?>
        <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert"
                aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?>

        </div>
    <?php endif; ?>

    <section>
        <div class="container-fluid">
            <div class="card custom-daterange" style="display: none;">
                <div class="card-header mt-2">
                    <h3 class="text-center"><?php echo e(trans('Sale List')); ?></h3>
                </div>
                <div class="row ml-1 mt-2">
                    
                    <div class="form-group col-md-3 ">
                        <h5>Start Date <span class="text-danger"></span></h5>
                        <div class="controls">
                            <input type="date" name="start_date" id="start_date"
                                class="form-control datepicker-autoclose" placeholder="Please select start date">
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
                    <div class="col-md-2 ">
                        

                        <div class="form-group">
                            <label><strong><?php echo e(trans('Warehouse')); ?></strong></label>
                            <select id="warehouse_id" name="warehouse_id" class="form-control warehouse_id"
                                data-live-search="true" data-live-search-style="begins">
                                <option value=""><?php echo e(trans('All Warehouse')); ?></option>
                                <?php $__currentLoopData = $lims_warehouse_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($warehouse->id); ?>"><?php echo e($warehouse->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label><strong><?php echo e(trans('Sale Status')); ?></strong></label>
                            <select id="sale-status" class="form-control sale_status" name="sale_status">
                                <option value=""><?php echo e(trans('All')); ?></option>
                                <option value="1"><?php echo e(trans('Completed')); ?></option>
                                <option value="2"><?php echo e(trans('Pending')); ?></option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label><strong><?php echo e(trans('Payment Status')); ?></strong></label>
                            <select id="payment-status" class="form-control payment_status" name="payment_status">
                                <option value=""><?php echo e(trans('All')); ?></option>
                                <option value="1"><?php echo e(trans('Pending')); ?></option>
                                <option value="2"><?php echo e(trans('Due')); ?></option>
                                <option value="3"><?php echo e(trans('Partial')); ?></option>
                                <option value="4"><?php echo e(trans('Paid')); ?></option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <h5> Search</h5>
                        <input type="text" name="sale_name" class="form-control searchEmail"
                            placeholder="Search Reference No ...">
                        
                    </div>

                </div>
            </div>
            <div class="row justify-content-center align-items-center g-2">
                <a href="<?php echo e(route('superAdmin.sale.create')); ?>" class="btn  btn-primary"><i class="dripicons-plus"></i>
                <?php echo e(trans('Add Sale')); ?></a>&nbsp;
                
                    &NonBreakingSpace;
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

        <div class="table-responsive">


            
            <table id="tableLoad" class="table data-table table-bordered table-striped sale-list tbody" style="width:100%;">
                <thead>
                    <tr>
                        <th class="not-exported">Image</th>
                        <th><?php echo e(trans('Date')); ?></th>
                        <th><?php echo e(trans('reference')); ?></th>
                        <th><?php echo e(trans('Biller')); ?></th>
                        <th><?php echo e(trans('customer')); ?></th>
                        <th><?php echo e(trans('Sale Status')); ?></th>
                        <th><?php echo e(trans('Payment Status')); ?></th>
                        <th><?php echo e(trans('Delivery Status')); ?></th>
                        <th><?php echo e(trans('grand total')); ?></th>
                        <th><?php echo e(trans('Returned Amount')); ?></th>
                        <th><?php echo e(trans('Paid')); ?></th>
                        <th><?php echo e(trans('Due')); ?></th>
                        <th class="not-exported"><?php echo e(trans('action')); ?></th>
                    </tr>
                </thead>

                <tfoot class="tfoot active">
                    <th colspan="8"><?php echo e(trans('Total')); ?></th>


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
                                    class="dripicons-print"></i> <?php echo e(trans('Print')); ?></button>

                            <?php echo e(Form::open(['route' => 'superAdmin.sale.sendmail', 'method' => 'post', 'class' => 'sendmail-form'])); ?>

                            <input type="hidden" name="sale_id">
                            <button class="btn btn-default btn-sm d-print-none"><i class="dripicons-mail"></i>
                                <?php echo e(trans('Email')); ?></button>
                            <?php echo e(Form::close()); ?>

                        </div>
                        <div class="col-md-6 d-print-none">
                            <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close"
                                class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                        </div>
                        <div class="col-md-12">
                            <h3 id="exampleModalLabel" class="modal-title text-center container-fluid">
                                <?php echo e($general_setting->site_title); ?>

                                
                            </h3>
                        </div>
                        <div class="col-md-12 text-center">
                            <i style="font-size: 15px;"><?php echo e(trans('Sale Details')); ?></i>
                        </div>
                    </div>
                </div>
                <div id="sale-content" class="modal-body">
                </div>
                <br>

                <table class="table table-bordered product-sale-list">
                    <thead>
                        <th>#</th>
                        <th><?php echo e(trans('product')); ?></th>
                        <th><?php echo e(trans('Batch No')); ?></th>
                        <th><?php echo e(trans('Qty')); ?></th>
                        <th><?php echo e(trans('Unit')); ?></th>
                        <th><?php echo e(trans('Unit Price')); ?></th>
                        <th><?php echo e(trans('Tax')); ?></th>
                        <th><?php echo e(trans('Discount')); ?></th>
                        <th><?php echo e(trans('Subtotal')); ?></th>
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
                    <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('All')); ?> <?php echo e(trans('Payment')); ?>

                    </h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <table class="table table-hover payment-list">
                        <thead>
                            <tr>
                                <th><?php echo e(trans('date')); ?></th>
                                <th><?php echo e(trans('reference')); ?></th>
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
                    <?php echo Form::open([
                        'route' => 'superAdmin.sale.add-payment',
                        'method' => 'post',
                        'files' => true,
                        'class' => 'payment-form',
                    ]); ?>

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
                                <option value="2">Gift Card</option>
                                <option value="3">Credit Card</option>
                                <option value="4">Cheque</option>
                                <option value="5">Paypal</option>
                                <option value="6">Deposit</option>
                                <?php if($lims_reward_point_setting_data->is_active): ?>
                                    <option value="7">Points</option>
                                <?php endif; ?>
                            </select>
                        </div>
                    </div>
                    <div class="gift-card form-group">
                        <label> <?php echo e(trans('Gift Card')); ?> *</label>
                        <select id="gift_card_id" name="gift_card_id" class="selectpicker form-control"
                            data-live-search="true" data-live-search-style="begins" title="Select Gift Card...">
                            <?php
                                $balance = [];
                                $expired_date = [];
                            ?>
                            <?php $__currentLoopData = $lims_gift_card_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $gift_card): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php
                                    $balance[$gift_card->id] = $gift_card->amount - $gift_card->expense;
                                    $expired_date[$gift_card->id] = $gift_card->expired_date;
                                ?>
                                <option value="<?php echo e($gift_card->id); ?>"><?php echo e($gift_card->card_no); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
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
                        <select class="form-control" name="account_id">
                            <?php $__currentLoopData = $lims_account_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $account): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
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

                    <input type="hidden" name="sale_id">

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
                    <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Update Payment')); ?></h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <?php echo Form::open(['route' => 'superAdmin.sale.update-payment', 'method' => 'post', 'class' => 'payment-form']); ?>

                    <div class="row">
                        <div class="col-md-6">
                            <label><?php echo e(trans('file.Recieved Amount')); ?> *</label>
                            <input type="text" name="edit_paying_amount" class="form-control numkey" step="any"
                                required>
                        </div>
                        <div class="col-md-6">
                            <label><?php echo e(trans('file.Paying Amount')); ?> *</label>
                            <input type="text" name="edit_amount" class="form-control" step="any" required>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label><?php echo e(trans('file.Change')); ?> : </label>
                            <p class="change ml-2">0.00</p>
                        </div>
                        <div class="col-md-6 mt-1">
                            <label><?php echo e(trans('file.Paid By')); ?></label>
                            <select name="edit_paid_by_id" class="form-control selectpicker">
                                <option value="1">Cash</option>
                                <option value="2">Gift Card</option>
                                <option value="3">Credit Card</option>
                                <option value="4">Cheque</option>
                                <option value="5">Paypal</option>
                                <option value="6">Deposit</option>
                                <?php if($lims_reward_point_setting_data->is_active): ?>
                                    <option value="7">Points</option>
                                <?php endif; ?>
                            </select>
                        </div>
                    </div>
                    <div class="gift-card form-group">
                        <label> <?php echo e(trans('file.Gift Card')); ?> *</label>
                        <select id="gift_card_id" name="gift_card_id" class="selectpicker form-control"
                            data-live-search="true" data-live-search-style="begins" title="Select Gift Card...">
                            <?php $__currentLoopData = $lims_gift_card_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $gift_card): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($gift_card->id); ?>"><?php echo e($gift_card->card_no); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="form-group mt-2">
                        <div class="card-element" class="form-control">
                        </div>
                        <div class="card-errors" role="alert"></div>
                    </div>
                    <div id="edit-cheque">
                        <div class="form-group">
                            <label><?php echo e(trans('file.Cheque Number')); ?> *</label>
                            <input type="text" name="edit_cheque_no" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label> <?php echo e(trans('file.Account')); ?></label>
                        <select class="form-control selectpicker" name="account_id">
                            <?php $__currentLoopData = $lims_account_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $account): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($account->id); ?>"><?php echo e($account->name); ?> [<?php echo e($account->account_no); ?>]
                                </option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label><?php echo e(trans('file.Payment Note')); ?></label>
                        <textarea rows="3" class="form-control" name="edit_payment_note"></textarea>
                    </div>

                    <input type="hidden" name="payment_id">

                    <button type="submit" class="btn btn-primary"><?php echo e(trans('file.update')); ?></button>
                    <?php echo e(Form::close()); ?>

                </div>
            </div>
        </div>
    </div>

    <div id="addDelivery" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('Add Delivery')); ?></h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <?php echo Form::open(['route' => 'superAdmin.sale.delivery', 'method' => 'post', 'files' => true]); ?>

                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Delivery Reference')); ?></label>
                            <p id="dr"></p>
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Sale Reference')); ?></label>
                            <p id="sr"></p>
                        </div>
                        <div class="col-md-12 form-group">
                            <label><?php echo e(trans('Status')); ?> *</label>
                            <select name="status" required class="form-control selectpicker">
                                <option value="1"><?php echo e(trans('Packing')); ?></option>
                                <option value="2"><?php echo e(trans('Delivering')); ?></option>
                                <option value="3"><?php echo e(trans('Delivered')); ?></option>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Courier</label>
                            <select name="courier_id" class="form-control upcourier" data-live-search="true"
                                title="Select courier...">
                                <?php $__currentLoopData = $lims_deliveres_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $couriar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($couriar->id); ?>"><?php echo e($couriar->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div class="col-md-6 mt-2 form-group">
                            <label><?php echo e(trans('Delivered By')); ?></label>
                            <input type="text" name="delivered_by" class="form-control">
                        </div>
                        <div class="col-md-6 mt-2 form-group">
                            <label><?php echo e(trans('Recieved By')); ?> </label>
                            <input type="text" name="recieved_by" class="form-control">
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('customer')); ?> *</label>
                            <p id="customer"></p>
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Attach File')); ?></label>
                            <input type="file" name="file" class="form-control">
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Address')); ?> *</label>
                            <textarea rows="3" name="address" class="form-control" required></textarea>
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Note')); ?></label>
                            <textarea rows="3" name="note" class="form-control"></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="reference_no">
                    <input type="hidden" name="sale_id">
                    <button type="submit" class="btn btn-primary"><?php echo e(trans('submit')); ?></button>
                    <?php echo e(Form::close()); ?>

                </div>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startPush('custom_scripts'); ?>
    <script type="text/javascript">
        $("ul#sale").siblings('a').attr('aria-expanded', 'true');
        $("ul#sale").addClass("show");
        $("ul#sale #sale-list-menu").addClass("active");
        <?php if(!empty($lims_pos_setting_data->stripe_public_key)): ?>
            var public_key = <?php echo json_encode($lims_pos_setting_data->stripe_public_key) ?>;
        <?php else: ?>
        <?php endif; ?>


        var reward_point_setting = <?php echo json_encode($lims_reward_point_setting_data) ?>;
        var sale_id = [];
        var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;
        var starting_date = <?php echo json_encode($starting_date); ?>;
        var ending_date = <?php echo json_encode($ending_date); ?>;
        var warehouse_id = <?php echo json_encode($warehouse_id); ?>;
        var sale_status = <?php echo json_encode($sale_status); ?>;
        var payment_status = <?php echo json_encode($payment_status); ?>;
        var balance = <?php echo json_encode($balance) ?>;
        var expired_date = <?php echo json_encode($expired_date) ?>;
        var current_date = <?php echo json_encode(date("Y-m-d")) ?>;
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
                '<style>body{font-family: sans-serif;line-height: 1.15;-webkit-text-size-adjust: 100%;}.d-print-none{display:none}.text-center{text-align:center}.row{width:100%;margin-right: -15px;margin-left: -15px;}.col-md-12{width:100%;display:block;padding: 5px 15px;}.col-md-6{width: 50%;float:left;padding: 5px 15px;}table{width:100%;margin-top:30px;}th{text-aligh:left}td{padding:10px}table,th,td{border: 1px solid black; border-collapse: collapse;}</style><style>@media  print {.modal-dialog { max-width: 1000px;} }</style>'
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

            // alert("add payment");

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

            var url = "<?php echo e(route('superAdmin.sale.getpayment', ':id')); ?>";
            var getUrl = url.replace(':id', id);

            $.get(getUrl, function(data) {
                $(".payment-list tbody").remove();
                var newBody = $("<tbody>");
                // console.log(data);
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
                    cols += '<td>' + parseFloat(paid_amount[index]).toFixed(2) + '</td>';
                    cols += '<td>' + paying_method[index] + '</td>';
                    cols +=
                        '<td><div class="btn-group"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo e(trans('action')); ?><span class="caret"></span><span class="sr-only">Toggle Dropdown</span></button><ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">';
                    cols +=
                        '<li><button type="button" class="btn btn-link edit-btn" data-id="' +
                        payment_id[index] +
                        '" data-clicked=false data-toggle="modal" data-target="#edit-payment"><i class="dripicons-document-edit"></i> <?php echo e(trans('edit')); ?></button></li> ';
                    cols +=
                        '<?php echo e(Form::open(['route' => 'superAdmin.sale.delete-payment', 'method' => 'post'])); ?><li><input type="hidden" name="id" value="' +
                        payment_id[index] +
                        '" /> <button type="submit" class="btn btn-link" onclick="return confirmPaymentDelete()"><i class="dripicons-trash"></i> <?php echo e(trans('delete')); ?></button></li><?php echo e(Form::close()); ?>';

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
            $('.gift-card').hide();
            $('#edit-payment select[name="edit_paid_by_id"]').prop('disabled', false);
            var id = $(this).data('id').toString();
            $.each(payment_id, function(index) {
                if (payment_id[index] == parseFloat(id)) {
                    $('input[name="payment_id"]').val(payment_id[index]);
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
                        $.getScript("<?php echo e(asset('vendor/stripe/checkout.js')); ?>");

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

                    $('.selectpicker').selectpicker('refresh');
                    $("#payment_reference").html(payment_reference[index]);
                    $('input[name="edit_paying_amount"]').val(paying_amount[index].toFixed(2));
                    $('#edit-payment .change').text(change[index]);
                    $('input[name="edit_amount"]').val(paid_amount[index].toFixed(2));
                    $('textarea[name="edit_payment_note"]').val(payment_note[index]);
                    return false;
                }
            });
            $('.selectpicker').selectpicker('refresh');
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
                $.getScript("<?php echo e(asset('vendor/stripe/checkout.js')); ?>");
                // $.getScript("public/vendor/stripe/checkout.js");
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
                $.getScript("<?php echo e(asset('vendor/stripe/checkout.js')); ?>");
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
            var url = "<?php echo e(route('superAdmin.sale.delivery.create', ':id')); ?>";
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
                $('#addDelivery').modal('show');
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
                url: "<?php echo e(route('superAdmin.sale')); ?>",
                data: function(d) {
                    d.purchase_name = $('.searchEmail').val();
                    d.from_date = $('#start_date').val();
                    d.to_date = $('#end_date').val();

                    d.warehouse_id = $("#warehouse_id").val();
                    d.sale_status = $("#sale-status").val();
                    d.payment_status = $("#payment-status").val();

                    d.search = $('input[type="search"]').val();
                }
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
                    .column(8)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                returnAmount = api
                    .column(9)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);
                paid = api
                    .column(10)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);
                due = api
                    .column(11)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Total over this page
                pageTotal = api
                    .column(8, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                pageTotalReturnAmount = api
                    .column(9, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);
                pageTotalpaid = api
                    .column(10, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);
                pageTotaldue = api
                    .column(11, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // allTotal = pageTotal1 * pageTotal;
                // Update footer
                $(api.column(8).footer()).html(Math.round(pageTotal) + " /=");
                $(api.column(9).footer()).html(Math.round(pageTotalReturnAmount) + " /=");
                //.toFixed(2) for floting link:23.55 Taka
                $(api.column(10).footer()).html(Math.round(pageTotalpaid) + " /=");
                $(api.column(11).footer()).html(Math.round(pageTotaldue) + " /=");
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

        // Delete
        $('body').on('click', '.deletesale', function(e) {
            e.preventDefault();
            var id = $(this).attr("data-id");
            var url = "<?php echo e(route('superAdmin.sale.deleted', ':id')); ?>";
            var catUrl = url.replace(':id', id);

            let dataDelete = {
                'id': id,
            };
            if (confirm("Are you sure you want to remove this Sale?") == true) {
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




        $(".searchEmail").keyup(function() {
            table.draw(true);
        });
        $(".warehouse_id").change(function() {
            table.draw(true);
        });
        $(".sale_status").change(function() {
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



        // function datatable_sum(dt_selector, is_calling_first) {
        //     if (dt_selector.rows('.selected').any() && is_calling_first) {
        //         var rows = dt_selector.rows('.selected').indexes();

        //         $(dt_selector.column(8).footer()).html(dt_selector.cells(rows, 8, {
        //             page: 'current'
        //         }).data().sum().toFixed(2));
        //         $(dt_selector.column(9).footer()).html(dt_selector.cells(rows, 9, {
        //             page: 'current'
        //         }).data().sum().toFixed(2));
        //         $(dt_selector.column(10).footer()).html(dt_selector.cells(rows, 10, {
        //             page: 'current'
        //         }).data().sum().toFixed(2));
        //         $(dt_selector.column(11).footer()).html(dt_selector.cells(rows, 11, {
        //             page: 'current'
        //         }).data().sum().toFixed(2));
        //     } else {
        //         $(dt_selector.column(8).footer()).html(dt_selector.cells(rows, 8, {
        //             page: 'current'
        //         }).data().sum().toFixed(2));
        //         $(dt_selector.column(9).footer()).html(dt_selector.cells(rows, 9, {
        //             page: 'current'
        //         }).data().sum().toFixed(2));
        //         $(dt_selector.column(10).footer()).html(dt_selector.cells(rows, 10, {
        //             page: 'current'
        //         }).data().sum().toFixed(2));
        //         $(dt_selector.column(11).footer()).html(dt_selector.cells(rows, 11, {
        //             page: 'current'
        //         }).data().sum().toFixed(2));
        //     }
        // }

        function saleDetails(sale) {
            $("#sale-details input[name='sale_id']").val(sale[13]);

            var htmltext = '<strong><?php echo e(trans('Date')); ?>: </strong>' + sale[0] +
                '<br><strong><?php echo e(trans('Reference')); ?>: </strong>' + sale[1] +
                '<br><strong><?php echo e(trans('Warehouse')); ?>: </strong>' + sale[27] +
                '<br><strong><?php echo e(trans('Sale Status')); ?>: </strong>' + sale[2] +
                '<br><br><div class="row"><div class="col-md-6"><strong><?php echo e(trans('From')); ?>:</strong><br>' + sale[
                    3] + '<br>' + sale[4] + '<br>' + sale[5] + '<br>' + sale[6] + '<br>' + sale[7] + '<br>' + sale[8] +
                '</div><div class="col-md-6"><div class="float-right"><strong><?php echo e(trans('To')); ?>:</strong><br>' +
                sale[9] + '<br>' + sale[10] + '<br>' + sale[11] + '<br>' + sale[12] + '</div></div></div>';
            var id = sale[13]

            var url = "<?php echo e(route('superAdmin.sale.product_sale', ':id')); ?>";
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
                cols += '<td colspan=6><strong><?php echo e(trans('Total')); ?>:</strong></td>';
                cols += '<td>' + sale[14] + '</td>';
                cols += '<td>' + sale[15] + '</td>';
                cols += '<td>' + sale[16] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong><?php echo e(trans('Order Tax')); ?>:</strong></td>';
                cols += '<td>' + sale[17] + '(' + sale[18] + '%)' + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong><?php echo e(trans('Order Discount')); ?>:</strong></td>';
                cols += '<td>' + sale[19] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);
                if (sale[28]) {
                    var newRow = $("<tr>");
                    cols = '';
                    cols += '<td colspan=8><strong><?php echo e(trans('Coupon Discount')); ?> [' + sale[28] +
                        ']:</strong></td>';
                    cols += '<td>' + sale[29] + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);
                }
                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong><?php echo e(trans('Shipping Cost')); ?>:</strong></td>';
                cols += '<td>' + sale[20] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);
                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong><?php echo e(trans('grand total')); ?>:</strong></td>';
                cols += '<td>' + sale[21] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong><?php echo e(trans('Paid Amount')); ?>:</strong></td>';
                cols += '<td>' + sale[22] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=8><strong><?php echo e(trans('Due')); ?>:</strong></td>';
                cols += '<td>' + parseFloat(sale[21] - sale[22]).toFixed(2) + '</td>';
                newRow.append(cols);
                newBody.append(newRow);

                $("table.product-sale-list").append(newBody);
            });
            var htmlfooter = '<p><strong><?php echo e(trans('Sale Note')); ?>:</strong> ' + sale[23] +
                '</p><p><strong><?php echo e(trans('Staff Note')); ?>:</strong> ' + sale[24] +
                '</p><strong><?php echo e(trans('Created By')); ?>:</strong><br>' + sale[25] + '<br>' + sale[26];
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
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.deshboard', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/sale/index.blade.php ENDPATH**/ ?>