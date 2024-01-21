<?php $__env->startSection('title', 'Media Page'); ?>
<?php $__env->startSection('content'); ?>
<?php if(\Session::has('success')): ?>
<div class="alert alert-success">
    <p><?php echo e(\Session::get('success')); ?></p>
</div>
<?php endif; ?>
    <?php if (isset($component)) { $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4 = $component; } ?>
<?php $component = $__env->getContainer()->make(Illuminate\View\AnonymousComponent::class, ['view' => 'components.backend.superAdmin.media.index','data' => ['data' => $data]]); ?>
<?php $component->withName('backend.superAdmin.media.index'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php $component->withAttributes(['data' => \Illuminate\View\Compilers\BladeCompiler::sanitizeComponentAttribute($data)]); ?>
<?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4)): ?>
<?php $component = $__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4; ?>
<?php unset($__componentOriginalc254754b9d5db91d5165876f9d051922ca0066f4); ?>
<?php endif; ?>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.deshboard', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/media/index.blade.php ENDPATH**/ ?>