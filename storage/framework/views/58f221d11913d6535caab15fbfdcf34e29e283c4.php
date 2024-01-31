<h1>Payment Details</h1>
<p><strong>Sale Reference: </strong><?php echo e($payment_data['sale_reference']); ?></p>
<p><strong>Payment Reference: </strong><?php echo e($payment_data['payment_reference']); ?></p>
<p><strong>Payment Method: </strong><?php echo e($payment_data['payment_method']); ?></p>
<p><strong>Grand Total: </strong><?php echo e($payment_data['currency']); ?> <?php echo e($payment_data['grand_total']); ?></p>
<p><strong>Paid Amount: </strong><?php echo e($payment_data['currency']); ?> <?php echo e($payment_data['paid_amount']); ?></p>
<p><strong>Due: </strong><?php echo e($payment_data['currency']); ?> <?php echo e(number_format((float)($payment_data['due']), 2, '.', '')); ?></p>
<p>Thank You</p>
<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/mail/payment_details.blade.php ENDPATH**/ ?>