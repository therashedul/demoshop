<!DOCTYPE html>
<html lang="en">

<head>

    
    <?php echo $__env->make('asset.homeasset.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        var startTime = new Date();
    </script>

</head>

<body class="hold-transition sidebar-mini layout-fixed" onbeforeunload="MyFunction();">
    <div class="wrapper">
        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
        </div>

        <!-- Navbar -->
        <?php echo $__env->make('asset.homeasset.nav', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        <?php echo $__env->make('asset.homeasset.top', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <?php echo $__env->yieldContent('content'); ?>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <?php echo $__env->make('asset.homeasset.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

        <!-- /footer content -->
    </div>
    
    <?php echo $__env->make('asset.homeasset.bottomfooter', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    <!-- Scripts -->
    <?php echo $__env->yieldPushContent('custom_scripts'); ?>
</body>
</html>
<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/layouts/home.blade.php ENDPATH**/ ?>