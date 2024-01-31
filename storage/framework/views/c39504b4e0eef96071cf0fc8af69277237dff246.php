<!DOCTYPE html>
<html lang="en">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><?php echo e(config('app.name', 'Url')); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSRF Token -->
<meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

<head>

    <?php echo $__env->make('asset.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        var startTime = new Date();
    </script>
    <link href="<?php echo e(asset('css/custom-prodcut.css')); ?>" rel="stylesheet">

</head>


<body class="hold-transition sidebar-mini layout-fixed" onbeforeunload="MyFunction();">
    <div class="wrapper">
        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60"
                width="60">
        </div>

        <!-- Navbar -->
        <?php echo $__env->make('asset.nav', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        <?php echo $__env->make('asset.top', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <div class="container px-4">

                <section class="forms">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header d-flex align-items-center">
                                        <h4><?php echo e(trans('Add Sale')); ?></h4>
                                    </div>
                                    <div class="card-body">
                                        <p class="italic">
                                            <small><?php echo e(trans('The field labels marked with * are required input fields')); ?>.</small>
                                        </p>
                                        <?php echo Form::open([
                                            'route' => 'superAdmin.sale.store',
                                            'method' => 'post',
                                            'files' => true,
                                            'class' => 'payment-form',
                                        ]); ?>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Date')); ?></label>
                                                            <input type="text" name="created_at"
                                                                class="form-control date" placeholder="Choose date" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label>
                                                                <?php echo e(trans('Reference No')); ?>

                                                            </label>
                                                            <input type="text" name="reference_no"
                                                                class="form-control" />
                                                        </div>
                                                        <?php if($errors->has('reference_no')): ?>
                                                            <span>
                                                                <strong><?php echo e($errors->first('reference_no')); ?></strong>
                                                            </span>
                                                        <?php endif; ?>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('customer')); ?> *</label>
                                                            <select required name="customer_id" id="customer_id"
                                                                class="selectpicker form-control"
                                                                data-live-search="true" title="Select customer...">
                                                                <?php
                                                                    $deposit = [];
                                                                    $points = [];
                                                                ?>
                                                                <?php $__currentLoopData = $limscustomerlist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $customer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <?php
                                                                        $deposit[$customer->id] = $customer->deposit - $customer->expense;

                                                                        $points[$customer->id] = $customer->points;
                                                                    ?>
                                                                    <option value="<?php echo e($customer->id); ?>">
                                                                        <?php echo e($customer->name . ' (' . $customer->phone_number . ')'); ?>

                                                                    </option>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                <button type="button" class="btn btn-default btn-sm"
                                                                    data-toggle="modal" data-target="#addCustomer"><i
                                                                        class="dripicons-plus"></i></button>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Warehouse')); ?> *</label>
                                                            <select required name="warehouse_id" id="warehouse_id"
                                                                class="selectpicker form-control"
                                                                data-live-search="true" data-live-search-style="begins"
                                                                title="Select warehouse...">
                                                                <?php $__currentLoopData = $limswarehouselist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <option value="<?php echo e($warehouse->id); ?>">
                                                                        <?php echo e($warehouse->name); ?></option>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Biller')); ?> *</label>
                                                            <select required name="biller_id"
                                                                class="selectpicker form-control"
                                                                data-live-search="true" data-live-search-style="begins"
                                                                title="Select Biller...">
                                                                <?php $__currentLoopData = $limsbillerlist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $biller): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <option value="<?php echo e($biller->id); ?>">
                                                                        <?php echo e($biller->name . ' (' . $biller->company_name . ')'); ?>

                                                                    </option>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mt-3">
                                                    <div class="col-md-12">
                                                        <label><?php echo e(trans('Select Product')); ?></label>
                                                        <div class="search-box input-group">
                                                            <button type="button" class="btn btn-secondary btn-lg"><i
                                                                    class="fa fa-barcode"></i></button>
                                                            <input type="text" name="product_code_name"
                                                                id="lims_productcodeSearch"
                                                                placeholder="Please type product code and select..."
                                                                class="form-control" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mt-5">
                                                    <div class="col-md-12">
                                                        <h5><?php echo e(trans('Order Table')); ?> *</h5>
                                                        <div class="table-responsive mt-3">
                                                            <table id="myTable" class="table table-hover order-list">
                                                                <thead>
                                                                    <tr>
                                                                        <th><?php echo e(trans('name')); ?></th>
                                                                        <th><?php echo e(trans('Code')); ?></th>
                                                                        <th><?php echo e(trans('Quantity')); ?></th>
                                                                        <th><?php echo e(trans('Batch No')); ?></th>
                                                                        <th><?php echo e(trans('Expired Date')); ?></th>
                                                                        <th><?php echo e(trans('Net Unit Price')); ?></th>
                                                                        <th><?php echo e(trans('Discount')); ?></th>
                                                                        <th><?php echo e(trans('Tax')); ?></th>
                                                                        <th><?php echo e(trans('Subtotal')); ?></th>
                                                                        <th><i class="dripicons-trash"></i></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                                <tfoot class="tfoot active">
                                                                    <th colspan="2"><?php echo e(trans('Total')); ?></th>
                                                                    <th id="total-qty">0</th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th id="total-discount">0.00</th>
                                                                    <th id="total-tax">0.00</th>
                                                                    <th id="total">0.00</th>
                                                                    <th><i class="dripicons-trash"></i></th>
                                                                </tfoot>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <input type="hidden" name="total_qty" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <input type="hidden" name="total_discount" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <input type="hidden" name="total_tax" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <input type="hidden" name="total_price" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <input type="hidden" name="item" />
                                                            <input type="hidden" name="order_tax" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <input type="hidden" name="grand_total" />
                                                            <input type="hidden" name="used_points" />
                                                            <input type="hidden" name="pos" value="0" />
                                                            <input type="hidden" name="coupon_active"
                                                                value="0" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mt-3">
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Order Tax')); ?></label>
                                                            <select class="form-control" name="order_tax_rate">
                                                                <option value="0">No Tax</option>
                                                                <?php $__currentLoopData = $limstaxlist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tax): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <option value="<?php echo e($tax->rate); ?>">
                                                                        <?php echo e($tax->name); ?></option>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Order Discount Type')); ?></label>
                                                            <select id="order-discount-type"
                                                                name="order_discount_type" class="form-control">
                                                                <option value="Flat"><?php echo e(trans('Flat')); ?>

                                                                </option>
                                                                <option value="Percentage">
                                                                    <?php echo e(trans('Percentage')); ?></option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Value')); ?></label>
                                                            <input type="text" name="order_discount_value"
                                                                class="form-control numkey" id="order-discount-val">
                                                            <input type="hidden" name="order_discount"
                                                                class="form-control" id="order-discount">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label>
                                                                <?php echo e(trans('Shipping Cost')); ?>

                                                            </label>
                                                            <input type="number" name="shipping_cost"
                                                                class="form-control" step="any" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Attach Document')); ?></label> <i
                                                                class="dripicons-question" data-toggle="tooltip"
                                                                title="Only jpg, jpeg, png, gif, pdf, csv, docx, xlsx and txt file is supported"></i>
                                                            <input type="file" name="document"
                                                                class="form-control" />
                                                            <?php if($errors->has('extension')): ?>
                                                                <span>
                                                                    <strong><?php echo e($errors->first('extension')); ?></strong>
                                                                </span>
                                                            <?php endif; ?>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Sale Status')); ?> *</label>
                                                            <select name="sale_status" class="form-control">
                                                                <option value="1"><?php echo e(trans('Completed')); ?>

                                                                </option>
                                                                <option value="2"><?php echo e(trans('Pending')); ?>

                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Payment Status')); ?> *</label>
                                                            <select name="payment_status" class="form-control">
                                                                <option value="1"><?php echo e(trans('Pending')); ?>

                                                                </option>
                                                                <option value="2"><?php echo e(trans('Due')); ?>

                                                                </option>
                                                                <option value="3"><?php echo e(trans('Partial')); ?>

                                                                </option>
                                                                <option value="4"><?php echo e(trans('Paid')); ?>

                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="payment">
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label><?php echo e(trans('Paid By')); ?></label>
                                                                <select name="paid_by_id" class="form-control">
                                                                    <option value="1">Cash</option>
                                                                    <option value="2">Gift Card</option>
                                                                    <option value="3">Credit Card</option>
                                                                    <option value="4">Cheque</option>
                                                                    <option value="5">Paypal</option>
                                                                    <option value="6">Deposit</option>
                                                                    <?php if($limsrewardpointsettingdata->is_active): ?>
                                                                        <option value="7">Points</option>
                                                                    <?php endif; ?>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label><?php echo e(trans('Recieved Amount')); ?> *</label>
                                                                <input type="number" name="paying_amount"
                                                                    class="form-control" id="paying-amount"
                                                                    step="any" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label><?php echo e(trans('Paying Amount')); ?> *</label>
                                                                <input type="number" name="paid_amount"
                                                                    class="form-control" id="paid-amount"
                                                                    step="any" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label><?php echo e(trans('Change')); ?></label>
                                                                <p id="change" class="ml-2">0.00</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <div class="card-element" class="form-control">
                                                                </div>
                                                                <div class="card-errors" role="alert"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row" id="gift-card">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label> <?php echo e(trans('Gift Card')); ?> *</label>
                                                                <select id="gift_card_id" name="gift_card_id"
                                                                    class="selectpicker form-control"
                                                                    data-live-search="true"
                                                                    data-live-search-style="begins"
                                                                    title="Select Gift Card..."></select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row" id="cheque">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label><?php echo e(trans('Cheque Number')); ?> *</label>
                                                                <input type="text" name="cheque_no"
                                                                    class="form-control">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <label><?php echo e(trans('Payment Note')); ?></label>
                                                            <textarea rows="3" class="form-control" name="payment_note"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row mt-2">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Sale Note')); ?></label>
                                                            <textarea rows="5" class="form-control" name="sale_note"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label><?php echo e(trans('Staff Note')); ?></label>
                                                            <textarea rows="5" class="form-control" name="staff_note"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <input type="submit" value="<?php echo e(trans('submit')); ?>"
                                                        class="btn btn-primary" id="submit-button">
                                                </div>
                                            </div>
                                        </div>
                                        <?php echo Form::close(); ?>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid">
                        <table class="table table-bordered table-condensed totals">
                            <td><strong><?php echo e(trans('Items')); ?></strong>
                                <span class="pull-right" id="item">0.00</span>
                            </td>
                            <td><strong><?php echo e(trans('Total')); ?></strong>
                                <span class="pull-right" id="subtotal">0.00</span>
                            </td>
                            <td><strong><?php echo e(trans('Order Tax')); ?></strong>
                                <span class="pull-right" id="order_tax">0.00</span>
                            </td>
                            <td><strong><?php echo e(trans('Order Discount')); ?></strong>
                                <span class="pull-right" id="order_discount">0.00</span>
                            </td>
                            <td><strong><?php echo e(trans('Shipping Cost')); ?></strong>
                                <span class="pull-right" id="shipping_cost">0.00</span>
                            </td>
                            <td><strong><?php echo e(trans('grand total')); ?></strong>
                                <span class="pull-right" id="grand_total">0.00</span>
                            </td>
                        </table>
                    </div>

                    <div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="modal_header" class="modal-title"></h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="row modal-element">
                                            <div class="col-md-4 form-group">
                                                <label><?php echo e(trans('Quantity')); ?></label>
                                                <input type="number" step="any" name="edit_qty"
                                                    class="form-control numkey">
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label><?php echo e(trans('Unit Discount')); ?></label>
                                                <input type="number" name="edit_discount"
                                                    class="form-control numkey">
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label><?php echo e(trans('Unit Price')); ?></label>
                                                <input type="number" name="edit_unit_price"
                                                    class="form-control numkey" step="any">
                                            </div>
                                            <?php
                                                $tax_name_all[] = 'No Tax';
                                                $tax_rate_all[] = 0;
                                                foreach ($limstaxlist as $tax) {
                                                    $tax_name_all[] = $tax->name;
                                                    $tax_rate_all[] = $tax->rate;
                                                }
                                            ?>
                                            <div class="col-md-4 form-group">
                                                <label><?php echo e(trans('Tax Rate')); ?></label>
                                                <select name="edit_tax_rate" class="form-control selectpicker">
                                                    <?php $__currentLoopData = $tax_name_all; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <option value="<?php echo e($key); ?>"><?php echo e($name); ?>

                                                        </option>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </select>
                                            </div>
                                            <div id="edit_unit" class="col-md-4 form-group">
                                                <label><?php echo e(trans('Product Unit')); ?></label>
                                                <select name="edit_unit" class="form-control selectpicker">
                                                </select>
                                            </div>
                                        </div>
                                        <button type="button" name="update_btn"
                                            class="btn btn-primary"><?php echo e(trans('update')); ?></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div id="cash-register-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <?php echo Form::open(['route' => 'superAdmin.sale.cashRegister', 'method' => 'post']); ?>

                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">
                                        <?php echo e(trans('Add Cash Register')); ?></h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic">
                                        <small><?php echo e(trans('The field labels marked with * are required input fields')); ?>.</small>
                                    </p>
                                    <div class="row">
                                        <div class="col-md-6 form-group warehouse-section">
                                            <label><?php echo e(trans('Warehouse')); ?> *</strong> </label>
                                            <select required name="warehouse_id" class="form-control"
                                                data-live-search="true" data-live-search-style="begins"
                                                title="Select warehouse...">
                                                <?php $__currentLoopData = $limswarehouselist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <option value="<?php echo e($warehouse->id); ?>"><?php echo e($warehouse->name); ?>

                                                    </option>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            </select>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <label><?php echo e(trans('Cash in Hand')); ?> *</strong> </label>
                                            <input type="number" name="cash_in_hand" required class="form-control">
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <button type="submit"
                                                class="btn btn-primary"><?php echo e(trans('submit')); ?></button>
                                        </div>
                                    </div>
                                </div>
                                <?php echo e(Form::close()); ?>

                            </div>
                        </div>
                    </div>
                    <!-- add customer modal -->
                    <div id="addCustomer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <form method="POST" action="https://salepropos.com/demo/customer"
                                    accept-charset="UTF-8" id="customer-form" enctype="multipart/form-data"><input
                                        name="_token" type="hidden"
                                        value="BQN3aQElsoD1gdxWJtMiVCFTV905Kh5SfnEzBaaU">
                                    <div class="modal-header">
                                        <h5 id="exampleModalLabel" class="modal-title">Add Customer</h5>
                                        <button type="button" data-dismiss="modal" aria-label="Close"
                                            class="close"><span aria-hidden="true"><i
                                                    class="dripicons-cross"></i></span></button>
                                    </div>
                                    <div class="modal-body">
                                        <p class="italic"><small>The field labels marked with * are required input
                                                fields.</small></p>
                                        <div class="form-group">
                                            <label>Customer Group *</strong> </label>
                                            <select required class="form-control selectpicker"
                                                name="customer_group_id">
                                                <option value="1">general</option>
                                                <option value="2">distributor</option>
                                                <option value="3">reseller</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Name *</strong> </label>
                                            <input type="text" name="customer_name" required class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="text" name="email" placeholder="example@example.com"
                                                class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Phone Number *</label>
                                            <input type="text" name="phone_number" required class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Address *</label>
                                            <input type="text" name="address" required class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>City *</label>
                                            <input type="text" name="city" required class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <input type="hidden" name="pos" value="1">
                                            <button type="button"
                                                class="btn btn-primary customer-submit-btn">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    

                </section>

            </div>
        </div>
    </div>
    <!-- /page content -->

    <!-- footer content -->
    <?php echo $__env->make('asset.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <!-- /footer content -->
    </div>
    
    <?php echo $__env->make('asset.bottomfooter', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.9.2/tinymce.min.js" referrerpolicy="origin"></script>
    <script src="https://salepropos.com/salepro/service-worker.js"></script>

    <script type="text/javascript">

        // $.getScript("public/coustom.js");
        // $.getScript("<?php echo e(asset('coustom.js')); ?>");
        $("ul#sale").siblings('a').attr('aria-expanded', 'true');
        $("ul#sale").addClass("show");
        $("ul#sale #sale-create-menu").addClass("active");

        var public_key = <?php echo json_encode($limspossettingdata->stripe_public_key); ?>;

        $("#payment").hide();
        $(".card-element").hide();
        $("#gift-card").hide();
        $("#cheque").hide();

        // array data depend on warehouse
        var lims_product_array = [];
        var product_code = [];
        var product_name = [];
        var product_qty = [];
        var product_type = [];
        var product_id = [];
        var product_list = [];
        var variant_list = [];
        var qty_list = [];

        // array data with selection
        var product_price = [];
        var product_discount = [];
        var tax_rate = [];
        var tax_name = [];
        var tax_method = [];
        var unit_name = [];
        var unit_operator = [];
        var unit_operation_value = [];
        var is_imei = [];
        var is_variant = [];
        var gift_card_amount = [];
        var gift_card_expense = [];
        // temporary array
        var temp_unit_name = [];
        var temp_unit_operator = [];
        var temp_unit_operation_value = [];

        var deposit = <?php echo json_encode($deposit); ?>;
        var points = <?php echo json_encode($points); ?>;
        var reward_point_setting = <?php echo json_encode($limsrewardpointsettingdata); ?>;

        var rowindex;
        var customer_group_rate;
        var row_product_price;
        var pos;
        var role_id = 1;
        // var role_id = <?php echo json_encode(Auth::user()->role_id); ?>;

        // $('.selectpicker').selectpicker({
        //     style: 'btn-link',
        // });

        // $('[data-toggle="tooltip"]').tooltip();

        $('select[name="customer_id"]').on('change', function() {
            var id = $(this).val();
            $.get('sale.getcustomergroup/' + id, function(data) {
                customer_group_rate = (data / 100);
            });
        });

        $('select[name="warehouse_id"]').on('change', function() {
            var id = $(this).val();
            $.get('sale.getProduct/' + id, function(data) {
                lims_product_array = [];
                product_code = data[0];
                product_name = data[1];
                product_qty = data[2];
                product_type = data[3];
                product_id = data[4];
                product_list = data[5];
                qty_list = data[6];
                product_warehouse_price = data[7];
                batch_no = data[8];
                product_batch_id = data[9];
                expired_date = data[10];
                is_embeded = data[11];
                $.each(product_code, function(index) {
                    if (is_embeded[index])
                        lims_product_array.push(product_code[index] + ' (' + product_name[index] +
                            ')|' + is_embeded[index]);
                    else
                        lims_product_array.push(product_code[index] + ' (' + product_name[index] +
                            ')');
                });
            });

            isCashRegisterAvailable(id);
        });

        $('#lims_productcodeSearch').on('input', function() {
            var customer_id = $('#customer_id').val();
            var warehouse_id = $('#warehouse_id').val();
            temp_data = $('#lims_productcodeSearch').val();;
            if (!customer_id) {
                $('#lims_productcodeSearch').val(temp_data.substring(0, temp_data.length - 1));
                alert('Please select Customer!');
            } else if (!warehouse_id) {
                $('#lims_productcodeSearch').val(temp_data.substring(0, temp_data.length - 1));
                alert('Please select Warehouse!');
            }

        });

        var lims_productcodeSearch = $('#lims_productcodeSearch');

        lims_productcodeSearch.autocomplete({
            source: function(request, response) {
                var matcher = new RegExp(".?" + $.ui.autocomplete.escapeRegex(request.term), "i");
                response($.grep(lims_product_array, function(item) {
                    return matcher.test(item);
                }));
            },
            response: function(event, ui) {
                if (ui.content.length == 1) {
                    var data = ui.content[0].value;
                    $(this).autocomplete("close");
                    productSearch(data);
                } else if (ui.content.length == 0 && $('#lims_productcodeSearch').val().length == 13) {
                    productSearch($('#lims_productcodeSearch').val() + '|' + 1);
                }
            },
            select: function(event, ui) {
                var data = ui.item.value;
                productSearch(data);
            }
        });

        //Change quantity
        $("#myTable").on('input', '.qty', function() {
            rowindex = $(this).closest('tr').index();
            if ($(this).val() < 0 && $(this).val() != '') {
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(1);
                alert("Quantity can't be less than 0");
            }
            if (is_variant[rowindex])
                checkQuantity($(this).val(), true);
            else
                checkDiscount($(this).val(), true);
            //checkQuantity($(this).val(), true);
        });


        //Delete product
        $("table.order-list tbody").on("click", ".ibtnDel", function(event) {
            rowindex = $(this).closest('tr').index();
            product_price.splice(rowindex, 1);
            product_discount.splice(rowindex, 1);
            tax_rate.splice(rowindex, 1);
            tax_name.splice(rowindex, 1);
            tax_method.splice(rowindex, 1);
            unit_name.splice(rowindex, 1);
            unit_operator.splice(rowindex, 1);
            unit_operation_value.splice(rowindex, 1);
            $(this).closest("tr").remove();
            calculateTotal();
        });

        //Edit product
        $("table.order-list").on("click", ".edit-product", function() {
            rowindex = $(this).closest('tr').index();
            edit();
        });

        //Update product
        $('button[name="update_btn"]').on("click", function() {
            if (is_imei[rowindex]) {
                var imeiNumbers = $("#editModal input[name=imei_numbers]").val();
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.imei-number').val(
                    imeiNumbers);
            }

            var edit_discount = $('input[name="edit_discount"]').val();
            var edit_qty = $('input[name="edit_qty"]').val();
            var edit_unit_price = $('input[name="edit_unit_price"]').val();

            if (parseFloat(edit_discount) > parseFloat(edit_unit_price)) {
                alert('Invalid Discount Input!');
                return;
            }

            if (edit_qty < 1) {
                $('input[name="edit_qty"]').val(1);
                edit_qty = 1;
                alert("Quantity can't be less than 1");
            }

            var tax_rate_all = <?php echo json_encode($tax_rate_all); ?>;
            tax_rate[rowindex] = parseFloat(tax_rate_all[$('select[name="edit_tax_rate"]').val()]);
            tax_name[rowindex] = $('select[name="edit_tax_rate"] option:selected').text();
            if (product_type[pos] == 'standard') {
                var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
                var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[
                    rowindex].indexOf(","));
                if (row_unit_operator == '*') {
                    product_price[rowindex] = $('input[name="edit_unit_price"]').val() / row_unit_operation_value;
                } else {
                    product_price[rowindex] = $('input[name="edit_unit_price"]').val() * row_unit_operation_value;
                }
                var position = $('select[name="edit_unit"]').val();
                var temp_operator = temp_unit_operator[position];
                var temp_operation_value = temp_unit_operation_value[position];
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sale-unit').val(
                    temp_unit_name[position]);
                temp_unit_name.splice(position, 1);
                temp_unit_operator.splice(position, 1);
                temp_unit_operation_value.splice(position, 1);

                temp_unit_name.unshift($('select[name="edit_unit"] option:selected').text());
                temp_unit_operator.unshift(temp_operator);
                temp_unit_operation_value.unshift(temp_operation_value);

                unit_name[rowindex] = temp_unit_name.toString() + ',';
                unit_operator[rowindex] = temp_unit_operator.toString() + ',';
                unit_operation_value[rowindex] = temp_unit_operation_value.toString() + ',';
            } else {
                product_price[rowindex] = $('input[name="edit_unit_price"]').val();
            }
            product_discount[rowindex] = $('input[name="edit_discount"]').val();
            checkDiscount(edit_qty, false);
            //checkQuantity(edit_qty, false);
        });

        $("#myTable").on("change", ".batch-no", function() {
            rowindex = $(this).closest('tr').index();
            var product_id = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.product-id')
                .val();
            var warehouse_id = $('#warehouse_id').val();
            $.get('sale.checkBatchAvailability/' + product_id + '/' + $(this).val() + '/' + warehouse_id, function(
                data) {
                if (data['message'] != 'ok') {
                    alert(data['message']);
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.batch-no').val(
                        '');
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find(
                        '.product-batch-id').val('');
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.expired-date')
                        .text('');
                } else {
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find(
                        '.product-batch-id').val(data['product_batch_id']);
                    $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.expired-date')
                        .text(data['expired_date']);
                    code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find(
                        '.product-code').val();
                    pos = product_code.indexOf(code);
                    product_qty[pos] = data['qty'];
                }
            });
        });

        function isCashRegisterAvailable(warehouse_id) {
            var id = warehouse_id;
            var url = "<?php echo e(route('superAdmin.sale.checkAvailability',':id')); ?>";
            var getUrl = url.replace(':id', id);

            $.ajax({
                url: getUrl,
                // url: 'sale.checkAvailability/' + warehouse_id,
                type: "GET",
                success: function(data) {
                    if (data == 'false') {
                        $('#cash-register-modal select[name=warehouse_id]').val(warehouse_id);
                        // $('.selectpicker').selectpicker('refresh');
                        if (role_id <= 2) {
                            $("#cash-register-modal .warehouse-section").removeClass('d-none');
                        } else {
                            $("#cash-register-modal .warehouse-section").addClass('d-none');
                        }
                        $("#cash-register-modal").modal('show');
                    }
                }
            });
        }

        function productSearch(data) {
            var product_info = data.split(" ");
            var code = product_info[0];
            var pre_qty = 0;
            $(".product-code").each(function(i) {
                if ($(this).val() == code) {
                    rowindex = i;
                    pre_qty = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val();
                }
            });
            data += '?' + $('#customer_id').val() + '?' + (parseFloat(pre_qty) + 1);
            alert(data);
            $.ajax({
                type: 'GET',
                url: "<?php echo e(route('superAdmin.sale.productSearch')); ?>",
                // url: 'lims_product_search',
                data: {
                    data: data
                },
                success: function(data) {

                    console.log(data);
                    var flag = 1;
                    if (pre_qty > 0) {
                        var qty = data[15];
                        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(qty);
                        pos = product_code.indexOf(data[1]);
                        if (!data[11] && product_warehouse_price[pos]) {
                            product_price[rowindex] = parseFloat(product_warehouse_price[pos] [
                                'exchange_rate']) + parseFloat(product_warehouse_price[pos] [
                                'exchange_rate'] * customer_group_rate);
                        } else {
                            product_price[rowindex] = parseFloat(data[2] ) +
                                parseFloat(data[2]  * customer_group_rate);
                        }
                        flag = 0;
                        checkQuantity(String(qty), true);
                        flag = 0;
                    }
                    $("input[name='product_code_name']").val('');
                    if (flag) {
                        var newRow = $("<tr>");
                        var cols = '';
                        pos = product_code.indexOf(data[1]);
                        temp_unit_name = (data[6]).split(',');
                        cols += '<td>' + data[0] +
                            '<button type="button" class="edit-product btn btn-link" data-toggle="modal" data-target="#editModal"> <i class="fas fa-edit"></i></i></button></td>';
                        cols += '<td>' + data[1] + '</td>';
                        cols += '<td><input type="number" class="form-control qty" name="qty[]" value="' + data[
                            15] + '" step="any" required/></td>';
                        if (data[12]) {
                            cols += '<td><input type="text" class="form-control batch-no" value="' + batch_no[
                                    pos] +
                                '" required/> <input type="hidden" class="product-batch-id" name="product_batch_id[]" value="' +
                                product_batch_id[pos] + '"/> </td>';
                            cols += '<td class="expired-date">' + expired_date[pos] + '</td>';
                        } else {
                            cols +=
                                '<td><input type="text" class="form-control batch-no" disabled/> <input type="hidden" class="product-batch-id" name="product_batch_id[]"/> </td>';
                            cols += '<td class="expired-date">N/A</td>';
                        }

                        cols += '<td class="net_unit_price"></td>';
                        cols += '<td class="discount">0.00</td>';
                        cols += '<td class="tax"></td>';
                        cols += '<td class="sub-total"></td>';
                        cols +=
                            '<td><button type="button" class="ibtnDel btn btn-md btn-danger"><?php echo e(trans('delete')); ?></button></td>';
                        cols += '<input type="hidden" class="product-code" name="product_code[]" value="' +
                            data[1] + '"/>';
                        cols += '<input type="hidden" class="product-id" name="product_id[]" value="' + data[
                            9] + '"/>';
                        cols += '<input type="hidden" class="sale-unit" name="sale_unit[]" value="' +
                            temp_unit_name[0] + '"/>';
                        cols += '<input type="hidden" class="net_unit_price" name="net_unit_price[]" />';
                        cols += '<input type="hidden" class="discount-value" name="discount[]" />';
                        cols += '<input type="hidden" class="tax-rate" name="tax_rate[]" value="' + data[3] +
                            '"/>';
                        cols += '<input type="hidden" class="tax-value" name="tax[]" />';
                        cols += '<input type="hidden" class="subtotal-value" name="subtotal[]" />';
                        cols += '<input type="hidden" class="imei-number" name="imei_number[]" />';

                        newRow.append(cols);
                        $("table.order-list tbody").prepend(newRow);
                        rowindex = newRow.index();

                        if (!data[11] && product_warehouse_price[pos]) {
                            product_price.splice(rowindex, 0, parseFloat(product_warehouse_price[pos] ) + parseFloat(product_warehouse_price[pos]  * customer_group_rate));
                        } else {
                            product_price.splice(rowindex, 0, parseFloat(data[2]) +
                                parseFloat(data[2] * customer_group_rate));
                        }
                        product_discount.splice(rowindex, 0, '0.00');
                        tax_rate.splice(rowindex, 0, parseFloat(data[3]));
                        tax_name.splice(rowindex, 0, data[4]);
                        tax_method.splice(rowindex, 0, data[5]);
                        unit_name.splice(rowindex, 0, data[6]);
                        unit_operator.splice(rowindex, 0, data[7]);
                        unit_operation_value.splice(rowindex, 0, data[8]);
                        is_imei.splice(rowindex, 0, data[13]);
                        is_variant.splice(rowindex, 0, data[14]);
                        checkQuantity(data[15], true);
                        if (data[13]) {
                            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find(
                                '.edit-product').click();
                        }
                    }
                }
            });
        }

        function edit() {
            $(".imei-section").remove();
            if (is_imei[rowindex]) {
                var imeiNumbers = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.imei-number')
                    .val();

                htmlText =
                    '<div class="col-md-12 form-group imei-section"><label>IMEI or Serial Numbers</label><input type="text" name="imei_numbers" value="' +
                    imeiNumbers +
                    '" class="form-control imei_number" placeholder="Type imei or serial numbers and separate them by comma. Example:1001,2001" step="any"></div>';
                $("#editModal .modal-element").append(htmlText);
            }

            var row_product_name = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(1)')
                .text();
            var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)')
                .text();
            $('#modal_header').text(row_product_name + '(' + row_product_code + ')');

            var qty = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val();
            $('input[name="edit_qty"]').val(qty);

            $('input[name="edit_discount"]').val(parseFloat(product_discount[rowindex]).toFixed(2));

            var tax_name_all = <?php echo json_encode($tax_name_all); ?>;
            pos = tax_name_all.indexOf(tax_name[rowindex]);
            $('select[name="edit_tax_rate"]').val(pos);

            pos = product_code.indexOf(row_product_code);
            if (product_type[pos] == 'standard') {
                unitConversion();
                temp_unit_name = (unit_name[rowindex]).split(',');
                temp_unit_name.pop();
                temp_unit_operator = (unit_operator[rowindex]).split(',');
                temp_unit_operator.pop();
                temp_unit_operation_value = (unit_operation_value[rowindex]).split(',');
                temp_unit_operation_value.pop();
                $('select[name="edit_unit"]').empty();
                $.each(temp_unit_name, function(key, value) {
                    $('select[name="edit_unit"]').append('<option value="' + key + '">' + value + '</option>');
                });
                $("#edit_unit").show();
            } else {
                row_product_price = product_price[rowindex];
                $("#edit_unit").hide();
            }
            $('input[name="edit_unit_price"]').val(row_product_price.toFixed(2));
            $('.selectpicker').selectpicker('refresh');
        }

        function checkDiscount(qty, flag) {
            var customer_id = $('#customer_id').val();
            var product_id = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .product-id').val();

            if (flag) {
                $.ajax({
                    type: 'GET',
                    async: false,
                    url: "<?php echo e(route('superAdmin.sale.check_discount')); ?>" + '?qty=' + qty + '&customer_id=' +
                        customer_id + '&product_id=' +
                        product_id,
                    success: function(data) {
                        pos = product_code.indexOf($('table.order-list tbody tr:nth-child(' + (rowindex +
                                1) +
                            ') .product-code').val());
                        product_price[rowindex] = parseFloat(data[0] ) +
                            parseFloat(
                                data[0]  * customer_group_rate);
                    }
                });
            }
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .qty').val(qty);
            checkQuantity(String(qty), flag);
        }

        function checkQuantity(sale_qty, flag) {
            var row_product_code = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('td:nth-child(2)')
                .text();
            pos = product_code.indexOf(row_product_code);
            if (product_type[pos] == 'standard') {
                var operator = unit_operator[rowindex].split(',');
                var operation_value = unit_operation_value[rowindex].split(',');
                if (operator[0] == '*')
                    total_qty = sale_qty * operation_value[0];
                else if (operator[0] == '/')
                    total_qty = sale_qty / operation_value[0];
                if (total_qty > parseFloat(product_qty[pos])) {
                    alert('Quantity exceeds stock quantity!');
                    if (flag) {
                        sale_qty = sale_qty.substring(0, sale_qty.length - 1);
                        $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(sale_qty);
                    } else {
                        edit();
                        return;
                    }
                }
            } else if (product_type[pos] == 'combo') {
                child_id = product_list[pos].split(',');
                child_qty = qty_list[pos].split(',');
                $(child_id).each(function(index) {
                    var position = product_id.indexOf(parseInt(child_id[index]));
                    if (parseFloat(sale_qty * child_qty[index]) > product_qty[position]) {
                        alert('Quantity exceeds stock quantity!');
                        if (flag) {
                            sale_qty = sale_qty.substring(0, sale_qty.length - 1);
                            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(
                                sale_qty);
                        } else {
                            edit();
                            flag = true;
                            return false;
                        }
                    }
                });
            }

            if (!flag) {
                $('#editModal').modal('hide');
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.qty').val(sale_qty);
            }
            calculateRowProductData(sale_qty);
        }

        function calculateRowProductData(quantity) {
            if (product_type[pos] == 'standard')
                unitConversion();
            else
                row_product_price = product_price[rowindex];

            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.discount').text((product_discount[
                rowindex] * quantity).toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.discount-value').val((product_discount[
                rowindex] * quantity).toFixed(2));
            $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-rate').val(tax_rate[rowindex]
                .toFixed(2));

            if (tax_method[rowindex] == 1) {
                var net_unit_price = row_product_price - product_discount[rowindex];
                var tax = net_unit_price * quantity * (tax_rate[rowindex] / 100);
                var sub_total = (net_unit_price * quantity) + tax;

                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_price').text(net_unit_price
                    .toFixed(2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_price').val(net_unit_price
                    .toFixed(2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax').text(tax.toFixed(2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sub-total').text(sub_total.toFixed(
                    2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total
                    .toFixed(2));
            } else {
                var sub_total_unit = row_product_price - product_discount[rowindex];
                var net_unit_price = (100 / (100 + tax_rate[rowindex])) * sub_total_unit;
                var tax = (sub_total_unit - net_unit_price) * quantity;
                var sub_total = sub_total_unit * quantity;

                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_price').text(net_unit_price
                    .toFixed(2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.net_unit_price').val(net_unit_price
                    .toFixed(2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax').text(tax.toFixed(2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.tax-value').val(tax.toFixed(2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.sub-total').text(sub_total.toFixed(
                    2));
                $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ')').find('.subtotal-value').val(sub_total
                    .toFixed(2));
            }

            calculateTotal();
        }

        function unitConversion() {
            var row_unit_operator = unit_operator[rowindex].slice(0, unit_operator[rowindex].indexOf(","));
            var row_unit_operation_value = unit_operation_value[rowindex].slice(0, unit_operation_value[rowindex].indexOf(
                ","));

            if (row_unit_operator == '*') {
                row_product_price = product_price[rowindex] * row_unit_operation_value;
            } else {
                row_product_price = product_price[rowindex] / row_unit_operation_value;
            }
        }

        function calculateTotal() {
            //Sum of quantity
            var total_qty = 0;
            $(".qty").each(function() {
                if ($(this).val() == '') {
                    total_qty += 0;
                } else {
                    total_qty += parseFloat($(this).val());
                }
            });
            $("#total-qty").text(total_qty);
            $('input[name="total_qty"]').val(total_qty);

            //Sum of discount
            var total_discount = 0;
            $(".discount").each(function() {
                total_discount += parseFloat($(this).text());
            });
            $("#total-discount").text(total_discount.toFixed(2));
            $('input[name="total_discount"]').val(total_discount.toFixed(2));

            //Sum of tax
            var total_tax = 0;
            $(".tax").each(function() {
                total_tax += parseFloat($(this).text());
            });
            $("#total-tax").text(total_tax.toFixed(2));
            $('input[name="total_tax"]').val(total_tax.toFixed(2));

            //Sum of subtotal
            var total = 0;
            $(".sub-total").each(function() {
                total += parseFloat($(this).text());
            });
            $("#total").text(total.toFixed(2));
            $('input[name="total_price"]').val(total.toFixed(2));

            calculateGrandTotal();
        }

        function calculateGrandTotal() {

            var item = $('table.order-list tbody tr:last').index();
            var total_qty = parseFloat($('#total-qty').text());
            var subtotal = parseFloat($('#total').text());
            var order_tax = parseFloat($('select[name="order_tax_rate"]').val());
            var shipping_cost = parseFloat($('input[name="shipping_cost"]').val());
            var order_discount_type = $('select[name="order_discount_type"]').val();
            var order_discount_value = parseFloat($('input[name="order_discount_value"]').val());
            if (!order_discount_value)
                order_discount_value = 0.00;

            if (order_discount_type == 'Flat')
                var order_discount = parseFloat(order_discount_value);
            else
                var order_discount = parseFloat(subtotal * (order_discount_value / 100));

            if (!shipping_cost)
                shipping_cost = 0.00;

            item = ++item + '(' + total_qty + ')';
            order_tax = (subtotal - order_discount) * (order_tax / 100);
            var grand_total = (subtotal + order_tax + shipping_cost) - order_discount;

            $('input[name="order_discount"]').val(order_discount);
            $('#item').text(item);
            $('input[name="item"]').val($('table.order-list tbody tr:last').index() + 1);
            $('#subtotal').text(subtotal.toFixed(2));
            $('#order_tax').text(order_tax.toFixed(2));
            $('input[name="order_tax"]').val(order_tax.toFixed(2));
            $('#order_discount').text(order_discount.toFixed(2));
            $('#shipping_cost').text(shipping_cost.toFixed(2));
            $('#grand_total').text(grand_total.toFixed(2));
            if ($('select[name="payment_status"]').val() == 4) {
                $('#paying-amount').val('');
                $('#paid-amount').val(grand_total.toFixed(2));
            }
            $('input[name="grand_total"]').val(grand_total.toFixed(2));
        }

        $('select[name="order_discount_type"]').on("change", function() {
            calculateGrandTotal();
        });

        $('input[name="order_discount_value"]').on("input", function() {
            calculateGrandTotal();
        });

        $('input[name="shipping_cost"]').on("input", function() {
            calculateGrandTotal();
        });

        $('select[name="order_tax_rate"]').on("change", function() {
            calculateGrandTotal();
        });

        $('select[name="payment_status"]').on("change", function() {
            var payment_status = $(this).val();
            if (payment_status == 3 || payment_status == 4) {
                $("#paid-amount").prop('disabled', false);
                $("#payment").show();
                $("#paying-amount").prop('required', true);
                $("#paid-amount").prop('required', true);
                if (payment_status == 4) {
                    $("#paid-amount").prop('disabled', true);
                    $('input[name="paying_amount"]').val($('input[name="grand_total"]').val());
                    $('input[name="paid_amount"]').val($('input[name="grand_total"]').val());
                }
            } else {
                $("#paying-amount").prop('required', false);
                $("#paid-amount").prop('required', false);
                $('input[name="paying_amount"]').val('');
                $('input[name="paid_amount"]').val('');
                $("#payment").hide();
            }
        });

        $('select[name="paid_by_id"]').on("change", function() {
            var id = $(this).val();
            $(".payment-form").off("submit");
            $('input[name="cheque_no"]').attr('required', false);
            $('select[name="gift_card_id"]').attr('required', false);
            if (id == 2) {
                $("#gift-card").show();
                $.ajax({
                    url: "<?php echo e(route('superAdmin.sale.getGiftCard')); ?>",
                    type: "GET",
                    dataType: "json",
                    success: function(data) {
                        $('select[name="gift_card_id"]').empty();
                        $.each(data, function(index) {
                            gift_card_amount[data[index]['id']] = data[index]['amount'];
                            gift_card_expense[data[index]['id']] = data[index]['expense'];
                            $('select[name="gift_card_id"]').append('<option value="' + data[
                                    index]['id'] + '">' + data[index]['card_no'] +
                                '</option>');
                        });
                        $('.selectpicker').selectpicker('refresh');
                    }
                });
                $(".card-element").hide();
                $("#cheque").hide();
                $('select[name="gift_card_id"]').attr('required', true);
            } else if (id == 3) {
                $.getScript("<?php echo e(asset('vendor/stripe/checkout.js')); ?>");
                // $.getScript("public/vendor/stripe/checkout.js");
                $(".card-element").show();
                $("#gift-card").hide();
                $("#cheque").hide();
            } else if (id == 4) {
                $("#cheque").show();
                $("#gift-card").hide();
                $(".card-element").hide();
                $('input[name="cheque_no"]').attr('required', true);
            } else {
                $("#gift-card").hide();
                $(".card-element").hide();
                $("#cheque").hide();
                if (id == 6) {
                    if ($('input[name="paid_amount"]').val() > deposit[$('#customer_id').val()]) {
                        alert('Amount exceeds customer deposit! Customer deposit : ' + deposit[$('#customer_id')
                            .val()]);
                    }
                } else if (id == 7) {
                    pointCalculation();
                }
            }
        });

        function pointCalculation() {
            paid_amount = $('input[name=paid_amount]').val();
            required_point = Math.ceil(paid_amount / reward_point_setting['per_point_amount']);
            if (required_point > points[$('#customer_id').val()]) {
                alert('Customer does not have sufficient points. Available points: ' + points[$('#customer_id').val()]);
            } else {
                $("input[name=used_points]").val(required_point);
            }
        }

        $('select[name="gift_card_id"]').on("change", function() {
            var balance = gift_card_amount[$(this).val()] - gift_card_expense[$(this).val()];
            if ($('input[name="paid_amount"]').val() > balance) {
                alert('Amount exceeds card balance! Gift Card balance: ' + balance);
            }
        });

        $('input[name="paid_amount"]').on("input", function() {
            if ($(this).val() > parseFloat($('input[name="paying_amount"]').val())) {
                alert('Paying amount cannot be bigger than recieved amount');
                $(this).val('');
            } else if ($(this).val() > parseFloat($('#grand_total').text())) {
                alert('Paying amount cannot be bigger than grand total');
                $(this).val('');
            }

            $("#change").text(parseFloat($("#paying-amount").val() - $(this).val()).toFixed(2));
            var id = $('select[name="paid_by_id"]').val();
            if (id == 2) {
                var balance = gift_card_amount[$("#gift_card_id").val()] - gift_card_expense[$("#gift_card_id")
                    .val()];
                if ($(this).val() > balance)
                    alert('Amount exceeds card balance! Gift Card balance: ' + balance);
            } else if (id == 6) {
                if ($('input[name="paid_amount"]').val() > deposit[$('#customer_id').val()])
                    alert('Amount exceeds customer deposit! Customer deposit : ' + deposit[$('#customer_id')
                        .val()]);
            }
        });

        $('input[name="paying_amount"]').on("input", function() {
            $("#change").text(parseFloat($(this).val() - $("#paid-amount").val()).toFixed(2));
        });

        $(window).keydown(function(e) {
            if (e.which == 13) {
                var $targ = $(e.target);
                if (!$targ.is("textarea") && !$targ.is(":button,:submit")) {
                    var focusNext = false;
                    $(this).find(":input:visible:not([disabled],[readonly]), a").each(function() {
                        if (this === e.target) {
                            focusNext = true;
                        } else if (focusNext) {
                            $(this).focus();
                            return false;
                        }
                    });
                    return false;
                }
            }
        });

        $(document).on('submit', '.payment-form', function(e) {
            var rownumber = $('table.order-list tbody tr:last').index();
            if (rownumber < 0) {
                alert("Please insert product to order table!")
                e.preventDefault();
            } else if (parseFloat($("#paying-amount").val()) < parseFloat($("#paid-amount").val())) {
                alert('Paying amount cannot be bigger than recieved amount');
                e.preventDefault();
            } else if ($('select[name="payment_status"]').val() == 3 && parseFloat($("#paid-amount").val()) ==
                parseFloat($('input[name="grand_total"]').val())) {
                alert('Paying amount equals to grand total! Please change payment status.');
                e.preventDefault();
            } else {
                $("#submit-button").prop('disabled', true);
                $("#paid-amount").prop('disabled', false);
                $(".batch-no").prop('disabled', false);
            }
        });
    </script>
    
    <script>
        // if ('serviceWorker' in navigator) {
        //     window.addEventListener('load', function() {
        //         navigator.serviceWorker.register('/salepro/service-worker.js').then(function(registration) {
        //             // Registration was successful
        //             console.log('ServiceWorker registration successful with scope: ', registration.scope);
        //         }, function(err) {
        //             // registration failed :(
        //             console.log('ServiceWorker registration failed: ', err);
        //         });
        //     });
        // }
    </script>
    <script type="text/javascript">
        var theme = "light";
        if (theme == 'dark') {
            $('body').addClass('dark-mode');
            $('#switch-theme i').addClass('dripicons-brightness-low');
        } else {
            $('body').removeClass('dark-mode');
            $('#switch-theme i').addClass('dripicons-brightness-max');
        }
        $('#switch-theme').click(function() {
            if (theme == 'light') {
                theme = 'dark';
                var url = "https:\/\/salepropos.com\/demo\/switch-theme\/dark";
                $('body').addClass('dark-mode');
                $('#switch-theme i').addClass('dripicons-brightness-low');
            } else {
                theme = 'light';
                var url = "https:\/\/salepropos.com\/demo\/switch-theme\/light";
                $('body').removeClass('dark-mode');
                $('#switch-theme i').addClass('dripicons-brightness-max');
            }

            $.get(url, function(data) {
                console.log('theme changed to ' + theme);
            });
        });

        var alert_product = 2;

        if ($(window).outerWidth() > 1199) {
            $('nav.side-navbar').removeClass('shrink');
        }

        function myFunction() {
            setTimeout(showPage, 100);
        }

        function showPage() {
            document.getElementById("loader").style.display = "none";
            document.getElementById("content").style.display = "block";
        }

        $("div.alert:not(#update-alert-section)").delay(4000).slideUp(800);

        function confirmDelete() {
            if (confirm("Are you sure want to delete?")) {
                return true;
            }
            return false;
        }

        $("li#notification-icon").on("click", function(argument) {
            $.get('notifications/mark-as-read', function(data) {
                $("span.notification-number").text(alert_product);
            });
        });

        $("a#add-expense").click(function(e) {
            e.preventDefault();
            $('#expense-modal').modal();
        });

        $("a#send-notification").click(function(e) {
            e.preventDefault();
            $('#notification-modal').modal();
        });

        $("a#add-account").click(function(e) {
            e.preventDefault();
            $('#account-modal').modal();
        });

        $("a#account-statement").click(function(e) {
            e.preventDefault();
            $('#account-statement-modal').modal();
        });

        $("a#profitLoss-link").click(function(e) {
            e.preventDefault();
            $("#profitLoss-report-form").submit();
        });

        $("a#report-link").click(function(e) {
            e.preventDefault();
            $("#product-report-form").submit();
        });

        $("a#purchase-report-link").click(function(e) {
            e.preventDefault();
            $("#purchase-report-form").submit();
        });

        $("a#sale-report-link").click(function(e) {
            e.preventDefault();
            $("#sale-report-form").submit();
        });
        $("a#sale-report-chart-link").click(function(e) {
            e.preventDefault();
            $("#sale-report-chart-form").submit();
        });

        $("a#payment-report-link").click(function(e) {
            e.preventDefault();
            $("#payment-report-form").submit();
        });

        $("a#warehouse-report-link").click(function(e) {
            e.preventDefault();
            $('#warehouse-modal').modal();
        });

        $("a#user-report-link").click(function(e) {
            e.preventDefault();
            $('#user-modal').modal();
        });

        $("a#customer-report-link").click(function(e) {
            e.preventDefault();
            $('#customer-modal').modal();
        });

        $("a#customer-group-report-link").click(function(e) {
            e.preventDefault();
            $('#customer-group-modal').modal();
        });

        $("a#supplier-report-link").click(function(e) {
            e.preventDefault();
            $('#supplier-modal').modal();
        });

        $("a#due-report-link").click(function(e) {
            e.preventDefault();
            $("#customer-due-report-form").submit();
        });

        $("a#supplier-due-report-link").click(function(e) {
            e.preventDefault();
            $("#supplier-due-report-form").submit();
        });

        $(".account-statement-daterangepicker-field").daterangepicker({
            callback: function(startDate, endDate, period) {
                var start_date = startDate.format('YYYY-MM-DD');
                var end_date = endDate.format('YYYY-MM-DD');
                var title = start_date + ' To ' + end_date;
                $(this).val(title);
                $('#account-statement-modal input[name="start_date"]').val(start_date);
                $('#account-statement-modal input[name="end_date"]').val(end_date);
            }
        });

        $('.date').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true
        });

        $('.selectpicker').selectpicker({
            style: 'btn-link',
        });
    </script>
    <script type="text/javascript" src="https://js.stripe.com/v3/"></script>

</body>

</html>
<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/components/backend/superAdmin/sale/salecreate.blade.php ENDPATH**/ ?>