<h1>Delivery Details</h1>
<h3>Dear <?php echo e($delivery_data['customer']); ?>,</h3>
<?php if($delivery_data['status'] == 2): ?>
	<p>Your Product is Delivering.</p>
<?php else: ?>
	<p>Your Product is Delivered.</p>
<?php endif; ?>
<p><strong>Sale Reference: </strong><?php echo e($delivery_data['sale_reference']); ?></p>
<p><strong>Delivery Reference: </strong><?php echo e($delivery_data['delivery_reference']); ?></p>
<p><strong>Destination: </strong><?php echo e($delivery_data['address']); ?></p>
<?php if($delivery_data['delivered_by']): ?>
<p><strong>Delivered By: </strong><?php echo e($delivery_data['delivered_by']); ?></p>
<?php endif; ?>
<p>Thank You</p><?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/mail/delivery_details.blade.php ENDPATH**/ ?>