<?php $__env->startSection('title', 'Pruchase page'); ?>
<?php $__env->startSection('content'); ?>
    <?php if(\Session::has('success')): ?>
        <div class="alert alert-success">
            <p><?php echo e(\Session::get('success')); ?></p>
        </div>
    <?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.backend.superAdmin.purchase.purchaseedit','data' => ['limswarehouselist' => $lims_warehouse_list,'limssupplierlist' => $lims_supplier_list,'limsproductlistwithoutvariant' => $lims_product_list_without_variant,'limsproductlistwithvariant' => $lims_product_list_with_variant,'limstaxlist' => $lims_tax_list,'limspurchasedata' => $lims_purchase_data,'limsproductpurchasedata' => $lims_product_purchase_data]]); ?>
<?php $component->withName('backend.superAdmin.purchase.purchaseedit'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['limswarehouselist' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_warehouse_list),'limssupplierlist' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_supplier_list),'limsproductlistwithoutvariant' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_product_list_without_variant),'limsproductlistwithvariant' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_product_list_with_variant),'limstaxlist' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_tax_list),'limspurchasedata' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_purchase_data),'limsproductpurchasedata' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($lims_product_purchase_data)]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>    


<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/purchase/edit.blade.php ENDPATH**/ ?>