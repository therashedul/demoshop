<?php $__env->startSection('content'); ?>
<section>
	<h3 class="text-center"><?php echo e(trans('Summary Report')); ?></h3>
	<?php echo Form::open(['route' => 'superAdmin.report.profitLoss', 'method' => 'post']); ?>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 offset-md-3 mt-4">
                <div class="form-group">
                    <label class="d-tc mt-2"><strong><?php echo e(trans('Choose Your Date')); ?></strong> &nbsp;</label>
                    <div class="d-tc">
                        <div class="input-group">
                            <input type="text" class="daterangepicker-field form-control" value="<?php echo e($start_date); ?> To <?php echo e($end_date); ?>" required />
                            <input type="hidden" name="start_date" value="<?php echo e($start_date); ?>" />
                            <input type="hidden" name="end_date" value="<?php echo e($end_date); ?>" />
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit"><?php echo e(trans('submit')); ?></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<?php echo e(Form::close()); ?>

	<div class="container-fluid">
		<div class="row mt-4">
			<div class="col-md-3">
                <div class="card">
                    <div class="card-body">
                        <h3><i class="fa fa-heart"></i> <?php echo e(trans('Purchase')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Amount')); ?> <span class="float-right"> <?php echo e(number_format((float)$purchase[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Purchase')); ?> <span class="float-right"><?php echo e($total_purchase); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Paid')); ?> <span class="float-right"><?php echo e(number_format((float)$purchase[0]->paid_amount, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Tax')); ?> <span class="float-right"><?php echo e(number_format((float)$purchase[0]->tax, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Discount')); ?> <span class="float-right"><?php echo e(number_format((float)$purchase[0]->discount, 2, '.', '')); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
			<div class="col-md-3">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-shopping-cart"></i> <?php echo e(trans('Sale')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Amount')); ?> <span class="float-right"> <?php echo e(number_format((float)$sale[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Sale')); ?> <span class="float-right"><?php echo e($total_sale); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Paid')); ?> <span class="float-right"><?php echo e(number_format((float)$sale[0]->paid_amount, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Tax')); ?> <span class="float-right"><?php echo e(number_format((float)$sale[0]->tax, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Discount')); ?> <span class="float-right"><?php echo e(number_format((float)$sale[0]->discount, 2, '.', '')); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
			<div class="col-md-3">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-random "></i> <?php echo e(trans('Sale Return')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Amount')); ?> <span class="float-right"> <?php echo e(number_format((float)$return[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Return')); ?> <span class="float-right"><?php echo e($total_return); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Tax')); ?> <span class="float-right"><?php echo e(number_format((float)$return[0]->tax, 2, '.', '')); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
			<div class="col-md-3">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-random "></i> <?php echo e(trans('Purchase Return')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Amount')); ?> <span class="float-right"> <?php echo e(number_format((float)$purchase_return[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Return')); ?> <span class="float-right"><?php echo e($total_purchase_return); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Tax')); ?> <span class="float-right"><?php echo e(number_format((float)$purchase_return[0]->tax, 2, '.', '')); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-4">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-money"></i> <?php echo e(trans('profit')); ?> / <?php echo e(trans('Loss')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Sale')); ?> <span class="float-right"><?php echo e(number_format((float)$sale[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Product Cost')); ?> <span class="float-right">- <?php echo e(number_format((float)$product_cost, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('profit')); ?> <span class="float-right"> <?php echo e(number_format((float)($sale[0]->grand_total - $product_cost), 2, '.', '')); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
			<div class="col-md-4">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-money"></i> <?php echo e(trans('profit')); ?> / <?php echo e(trans('Loss')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Sale')); ?> <span class="float-right"><?php echo e(number_format((float)$sale[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Product Cost')); ?> <span class="float-right">- <?php echo e(number_format((float)$product_cost, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Sale Return')); ?> <span class="float-right">- <?php echo e(number_format((float)$return[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Purchase Return')); ?> <span class="float-right"> <?php echo e(number_format((float)$purchase_return[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('profit')); ?> <span class="float-right"> <?php echo e(number_format((float)($sale[0]->grand_total - $product_cost - $return[0]->grand_total + $purchase_return[0]->grand_total), 2, '.', '')); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
			<div class="col-md-4">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-money "></i> <?php echo e(trans('Net Profit')); ?> / <?php echo e(trans('Net Loss')); ?></h3>
                        <hr>
                        <h4 class="text-center"><?php echo e(number_format((float)(($sale[0]->grand_total-$sale[0]->tax) - ($product_cost-$product_tax) - ($return[0]->grand_total-$return[0]->tax) + ($purchase_return[0]->grand_total-$purchase_return[0]->tax) - $expense), 2, '.', '')); ?></h4>
                        <p class="text-center">
                            (<?php echo e(trans('Sale')); ?> <?php echo e(number_format((float)($sale[0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('Tax')); ?> <?php echo e(number_format((float)($sale[0]->tax), 2, '.', '')); ?>) - (<?php echo e(trans('Product Cost')); ?> <?php echo e(number_format((float)($product_cost), 2, '.', '')); ?> - <?php echo e(trans('Tax')); ?> <?php echo e(number_format((float)($product_tax), 2, '.', '')); ?>) - (<?php echo e(trans('Return')); ?> <?php echo e(number_format((float)($return[0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('Tax')); ?> <?php echo e(number_format((float)($return[0]->tax), 2, '.', '')); ?>) + (<?php echo e(trans('Purchase Return')); ?> <?php echo e(number_format((float)($purchase_return[0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('Tax')); ?> <?php echo e(number_format((float)($purchase_return[0]->tax), 2, '.', '')); ?>) - (<?php echo e(trans('Expense')); ?> <?php echo e(number_format((float)($expense), 2, '.', '')); ?>)
                        </p>
                    </div>
                </div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-3">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-dollar"></i> <?php echo e(trans('Payment Recieved')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Amount')); ?> <span class="float-right"> <?php echo e(number_format((float)$payment_recieved, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Recieved')); ?> <span class="float-right"><?php echo e($payment_recieved_number); ?></span></p>
                            <p class="mt-2">Cash <span class="float-right"><?php echo e(number_format((float)$cash_payment_sale, 2, '.', '')); ?></span></p>
                            <p class="mt-2">Cheque <span class="float-right"><?php echo e(number_format((float)$cheque_payment_sale, 2, '.', '')); ?></span></p>
                            <p class="mt-2">Credit Card <span class="float-right"><?php echo e(number_format((float)$credit_card_payment_sale, 2, '.', '')); ?></span></p>
                            <p class="mt-2">Gift Card <span class="float-right"><?php echo e(number_format((float)$gift_card_payment_sale, 2, '.', '')); ?></span></p>
                            <p class="mt-2">Paypal <span class="float-right"><?php echo e(number_format((float)$paypal_payment_sale, 2, '.', '')); ?></span></p>
                            <p class="mt-2">Deposit <span class="float-right"><?php echo e(number_format((float)$deposit_payment_sale, 2, '.', '')); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
			<div class="col-md-3">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-dollar"></i> <?php echo e(trans('Payment Sent')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Amount')); ?> <span class="float-right"> <?php echo e(number_format((float)$payment_sent, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Recieved')); ?> <span class="float-right"><?php echo e($payment_sent_number); ?></span></p>
                            <p class="mt-2">Cash <span class="float-right"><?php echo e(number_format((float)$cash_payment_purchase, 2, '.', '')); ?></span></p>
                            <p class="mt-2">Cheque <span class="float-right"><?php echo e(number_format((float)$cheque_payment_purchase, 2, '.', '')); ?></span></p>
                            <p class="mt-2">Credit Card <span class="float-right"><?php echo e(number_format((float)$credit_card_payment_purchase, 2, '.', '')); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
			<div class="col-md-3">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-dollar"></i> <?php echo e(trans('Expense')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Amount')); ?> <span class="float-right"> <?php echo e(number_format((float)$expense, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Expense')); ?> <span class="float-right"><?php echo e($total_expense); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
			<div class="col-md-3">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-dollar"></i> <?php echo e(trans('Payroll')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Amount')); ?> <span class="float-right"> <?php echo e(number_format((float)$payroll, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Payroll')); ?> <span class="float-right"><?php echo e($total_payroll); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body">

                        <h3><i class="fa fa-dollar"></i> <?php echo e(trans('Cash in Hand')); ?></h3>
                        <hr>
                        <div class="mt-3">
                            <p class="mt-2"><?php echo e(trans('Recieved')); ?> <span class="float-right"> <?php echo e(number_format((float)($payment_recieved), 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Sent')); ?> <span class="float-right">- <?php echo e(number_format((float)($payment_sent), 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Sale Return')); ?> <span class="float-right">- <?php echo e(number_format((float)$return[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Purchase Return')); ?> <span class="float-right"> <?php echo e(number_format((float)$purchase_return[0]->grand_total, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Expense')); ?> <span class="float-right">- <?php echo e(number_format((float)$expense, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('Payroll')); ?> <span class="float-right">- <?php echo e(number_format((float)$payroll, 2, '.', '')); ?></span></p>
                            <p class="mt-2"><?php echo e(trans('In Hand')); ?> <span class="float-right"><?php echo e(number_format((float)($payment_recieved - $payment_sent - $return[0]->grand_total + $purchase_return[0]->grand_total - $expense - $payroll), 2, '.', '')); ?></span></p>
                        </div>
                    </div>
                </div>
			</div>
		</div>
		<div class="row mt-2">
			<?php $__currentLoopData = $warehouse_name; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $name): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
				<div class="col-md-4">
                    <div class="card">
                        <div class="card-body">

                            <h3><i class="fa fa-money"></i> <?php echo e($name); ?></h3>
                            <h4 class="text-center mt-3"><?php echo e(number_format((float)($warehouse_sale[$key][0]->grand_total - $warehouse_purchase[$key][0]->grand_total - $warehouse_return[$key][0]->grand_total + $warehouse_purchase_return[$key][0]->grand_total), 2, '.', '')); ?></h4>
                            <p class="text-center">
                                <?php echo e(trans('Sale')); ?> <?php echo e(number_format((float)($warehouse_sale[$key][0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('Purchase')); ?> <?php echo e(number_format((float)($warehouse_purchase[$key][0]->grand_total), 2, '.', '')); ?> - <?php echo e(trans('Sale Return')); ?> <?php echo e(number_format((float)($warehouse_return[$key][0]->grand_total), 2, '.', '')); ?> + <?php echo e(trans('Purchase Return')); ?> <?php echo e(number_format((float)($warehouse_purchase_return[$key][0]->grand_total), 2, '.', '')); ?>

                            </p>
                            <hr style="border-color: rgba(0, 0, 0, 0.2);">
                            <h4 class="text-center"><?php echo e(number_format((float)(($warehouse_sale[$key][0]->grand_total - $warehouse_sale[$key][0]->tax) - ($warehouse_purchase[$key][0]->grand_total - $warehouse_purchase[$key][0]->tax) - ($warehouse_return[$key][0]->grand_total - $warehouse_return[$key][0]->tax) + ($warehouse_purchase_return[$key][0]->grand_total - $warehouse_purchase_return[$key][0]->tax) ), 2, '.', '')); ?></h4>
                            <p class="text-center">
                                <?php echo e(trans('Net Sale')); ?> <?php echo e(number_format((float)($warehouse_sale[$key][0]->grand_total - $warehouse_sale[$key][0]->tax), 2, '.', '')); ?> -  <?php echo e(trans('Net Purchase')); ?> <?php echo e(number_format((float)($warehouse_purchase[$key][0]->grand_total - $warehouse_purchase[$key][0]->tax), 2, '.', '')); ?> - <?php echo e(trans('Net Sale Return')); ?> <?php echo e(number_format((float)($warehouse_return[$key][0]->grand_total - $warehouse_return[$key][0]->tax), 2, '.', '')); ?> + <?php echo e(trans('Net Purchase Return')); ?> <?php echo e(number_format((float)($warehouse_purchase_return[$key][0]->grand_total - $warehouse_purchase_return[$key][0]->tax), 2, '.', '')); ?>

                            </p>
                            <hr style="border-color: rgba(0, 0, 0, 0.2);">
                            <h4 class="text-center"><?php echo e(number_format((float)$warehouse_expense[$key], 2, '.', '')); ?></h4>
                            <p class="text-center"><?php echo e(trans('Expense')); ?></p>
                        </div>
                    </div>
				</div>
			<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
		</div>
	</div>
</section>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('custom_scripts'); ?>
<script type="text/javascript">

	$("ul#report").siblings('a').attr('aria-expanded','true');
    $("ul#report").addClass("show");
    $("ul#report #profit-loss-report-menu").addClass("active");

	$(".daterangepicker-field").daterangepicker({
	  callback: function(startDate, endDate, period){
	    var start_date = startDate.format('YYYY-MM-DD');
	    var end_date = endDate.format('YYYY-MM-DD');
	    var title = start_date + ' To ' + end_date;
	    $(this).val(title);
	    $('input[name="start_date"]').val(start_date);
	    $('input[name="end_date"]').val(end_date);
	  }
	});
</script>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.deshboard', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/report/profit_loss.blade.php ENDPATH**/ ?>