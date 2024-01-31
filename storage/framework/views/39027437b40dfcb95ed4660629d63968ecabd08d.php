<?php $__env->startSection('title', 'Pruchase Create Page'); ?>
<?php $__env->startSection('content'); ?>
    <?php if(\Session::has('success')): ?>
        <div class="alert alert-success">
            <p><?php echo e(\Session::get('success')); ?></p>
        </div>
    <?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.backend.superAdmin.sale.salecreate','data' => ['limscustomerlist' => $lims_customer_list,'limscustomergroupall' => $lims_customer_group_all,'limswarehouselist' => $lims_warehouse_list,'limsbillerlist' => $lims_biller_list,'limspossettingdata' => $lims_pos_setting_data,'limstaxlist' => $lims_tax_list,'limsrewardpointsettingdata' => $lims_reward_point_setting_data,'options' => $options,'numberofinvoice' => $numberOfInvoice,'customfields' => $custom_fields]]); ?>
<?php $component->withName('backend.superAdmin.sale.salecreate'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['limscustomerlist' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_customer_list),'limscustomergroupall' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_customer_group_all),'limswarehouselist' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_warehouse_list),'limsbillerlist' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_biller_list),'limspossettingdata' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_pos_setting_data),'limstaxlist' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_tax_list),'limsrewardpointsettingdata' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_reward_point_setting_data),'options' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($options),'numberofinvoice' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($numberOfInvoice),'customfields' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($custom_fields)]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>

<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/sale/create.blade.php ENDPATH**/ ?>