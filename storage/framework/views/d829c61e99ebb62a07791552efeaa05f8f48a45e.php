<?php $__env->startSection('title', 'Pruchase page'); ?>
<?php $__env->startSection('content'); ?>
    <?php if(\Session::has('success')): ?>
        <div class="alert alert-success">
            <p><?php echo e(\Session::get('success')); ?></p>
        </div>
    <?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.backend.superAdmin.purchase.purchaseindex','data' => ['purchase' => $purchase,'limsaccountlist' => $lims_account_list,'allpermission' => $all_permission,'startingdate' => $starting_date,'endingdate' => $ending_date,'warehouseid' => $warehouse_id,'purchasestatus' => $purchase_status,'paymentstatus' => $payment_status,'limswarehouselist' => $lims_warehouse_list]]); ?>
<?php $component->withName('backend.superAdmin.purchase.purchaseindex'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['purchase' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($purchase),'limsaccountlist' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_account_list),'allpermission' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($all_permission),'startingdate' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($starting_date),'endingdate' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($ending_date),'warehouseid' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($warehouse_id),'purchasestatus' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($purchase_status),'paymentstatus' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($payment_status),'limswarehouselist' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_warehouse_list)]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>    
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.deshboard', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/purchase/index.blade.php ENDPATH**/ ?>