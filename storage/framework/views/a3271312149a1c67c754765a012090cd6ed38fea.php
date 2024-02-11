

<link rel="preload" href="<?php echo e(asset('css/daterangepicker.min.css')); ?>" as="style" onload="this.onload=null;this.rel='stylesheet'">



<style>
    .modal-backdrop.show {
        opacity: 0 !important;
    }
        .modal-backdrop {
        position: inherit !important;

    }
    </style>
    <?php
        $values = DB::table('users')
            ->where('role_id', Auth::user()->role_id)
            ->first();
        $rolepermissions = DB::table('role_has_permissions')
            ->where('role_id', $values->role_id)
            ->get();
        $roleprms = [];

        foreach ($rolepermissions as $rolepermission) {
            $permissions = DB::table('permissions')
                ->where('id', '=', $rolepermission->permission_id)
                ->get();
            foreach ($permissions as $permission) {
                $roleprms[] = $permission->name;
            }
        }
    ?>
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="<?php echo e(asset($values->name)); ?>" class="brand-link">
            <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
                style="opacity: .8">
            <span class="brand-text font-weight-light">My shop</span>
        </a>
        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
              with font-awesome or any other icon font library -->
                    <li class="nav-item menu-open mb-3"> <a href="<?php echo e(url('/')); ?>" target="_blank" class="font-page"
                            style="background: #ff1717;
                                    text-align: center;
                                    display: block;
                                    color: #fff;
                                    padding: 2% 0%">
                            Display Fornt Page </a>
                    </li>
                    <li class="nav-item menu-open">
                        <a href="<?php echo e(route('home')); ?>" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboar
                            </p>
                        </a>
                    </li>
                    <?php $__currentLoopData = $roleprms; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $roleprm): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        
                        <?php
                            $name = $roleprm;
                            $value = substr(strstr($name, '-'), 1);
                            $role_id = Auth::user()->role_id;
                            $nameRole = DB::table('roles')
                                ->where('id', '=', $role_id)
                                ->first();
                            $role_name = $nameRole->name;
                            //  print_r($role_name);
                            //  print_r($value);
                            //  die();
                        ?>
                        <?php if($value == 'media'): ?>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                    style="text-transform: uppercase;">
                                    <p><?php echo e($value); ?></p>
                                </a></li>
                        <?php elseif($value == 'category'): ?>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                    style="text-transform: uppercase;">
                                    <p><?php echo e($value); ?></p>
                                </a></li>
                        <?php elseif($value == 'post'): ?>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                    style="text-transform: uppercase;">
                                    <p><?php echo e($value); ?></p>
                                </a></li>
                        <?php elseif($value == 'page'): ?>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                    style="text-transform: uppercase;">
                                    <p><?php echo e($value); ?></p>
                                </a></li>
                        <?php elseif($value == 'comments'): ?>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                    style="text-transform: uppercase;">
                                    <p><?php echo e($value); ?></p>
                                </a></li>
                        <?php endif; ?>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                Product
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.products')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Product List</p>
                                </a>
                            </li>

                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.category')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Category</p>
                                </a></li>
                                <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.warehouse')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Warehouse</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.brand')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Brand</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.barcode')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Barcode</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.tax')); ?>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tax</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.unit')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Unite</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.transfers')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Product Transfer</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.qty_adjustment')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Product Adjust</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                Sales
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.sale')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Sell list</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.coupon')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Coupon list</p>
                                </a></li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.courier')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Courier list</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.delivery')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Delevary list</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.giftcard')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Gift card</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="<?php echo e(route('superAdmin.sale.pos')); ?>" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                POS
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                Order
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.products')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Order List</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                Purchases
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.purchase')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Purchases list</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.supplier')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Supplier</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                Expense
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.expenses')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Expense list</p>
                                </a>
                            </li>

                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.expense_categories')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Expense Category</p>
                                </a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                Account
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.accounts')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Account List</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.money-transfers')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Money Transfers</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.accounts.balancesheet')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Balancesheet</p>
                                </a>
                            </li>
                                
                            <li class="nav-item" id="account-statement-menu">
                                <a class="nav-link" id="account-statement" href="">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Account Statement</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.cashRegister')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Cash Register</p>
                                </a>
                            </li>

                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                HRM
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.departments')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Depertment</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.employees')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Employee</p>
                                </a></li>
                                <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.payroll')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Payroll</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.attendance')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Attandance</p>
                                </a></li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.stock-count')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Stock Count</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.holidays')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Holidays</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.setting.hrm')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Setting HRM</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p> Return <i class="right fas fa-angle-left"></i> </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.return-sale')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Sell return </p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.return-purchase')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Purchase return</p>
                                </a></li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                Reports
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">


                        <li><a href="#report" aria-expanded="false" data-toggle="collapse"> <i class="dripicons-document-remove"></i><span><?php echo e(trans('Reports')); ?></span></a>
                        <ul id="report" class="collapse list-unstyled ">
                            <li id="profit-loss-report-menu">
                            <?php echo Form::open(['route' => 'superAdmin.report.profitLoss', 'method' => 'post', 'id' => 'profitLoss-report-form']); ?>

                            <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                            <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />
                            <button id="profitLossLink" href=""><?php echo e(trans('Summary Reporting')); ?></button>
                            <?php echo Form::close(); ?>

                            </li>
                            <li id="product-report-menu">
                                <?php echo Form::open(['route' => 'superAdmin.report.product', 'method' => 'get', 'id' => 'product-report-form']); ?>

                                <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                                <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />
                                <input type="hidden" name="warehouse_id" value="0" />
                                <button id="report-link" href=""><?php echo e(trans('Product Report')); ?></button>
                            <?php echo Form::close(); ?>

                        </li>
                            <li id="daily-sale-report-menu">
                            <a href="<?php echo e(url('superAdmin/report/daily_sale/'.date('Y').'/'.date('m'))); ?>"><?php echo e(trans('Daily Sale')); ?></a>
                            </li>
                            <li id="monthly-sale-report-menu">
                                <a href="<?php echo e(url('superAdmin/report/monthly_sale/'.date('Y'))); ?>"><?php echo e(trans('Monthly Sale')); ?></a>
                            </li>
                            <li id="best-seller-report-menu">
                            <a href="<?php echo e(url('superAdmin/report/best_seller')); ?>"><?php echo e(trans('Best Seller')); ?></a>
                            </li>
                            <li id="daily-purchase-report-menu">
                                <a href="<?php echo e(url('superAdmin/report/daily_purchase/'.date('Y').'/'.date('m'))); ?>"><?php echo e(trans('Daily Purchase')); ?></a>
                            </li>

                            <li id="monthly-purchase-report-menu">
                            <a href="<?php echo e(url('superAdmin/report/monthly_purchase/'.date('Y'))); ?>"><?php echo e(trans('Monthly Purchase')); ?></a>
                            </li>
                            <li id="sale-report-menu">
                            <?php echo Form::open(['route' => 'superAdmin.report.sale', 'method' => 'post', 'id' => 'sale-report-form']); ?>

                            <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                            <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />
                            <input type="hidden" name="warehouse_id" value="0" />
                            <button id="sale-report-link" href=""><?php echo e(trans('Sale Report')); ?></button>
                            <?php echo Form::close(); ?>

                            </li>
                            <li id="sale-report-chart-menu">
                                <?php echo Form::open(['route' => 'superAdmin.report.saleChart', 'method' => 'post', 'id' => 'sale-report-chart-form']); ?>

                                <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                                <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />
                                <input type="hidden" name="warehouse_id" value="0" />
                                <input type="hidden" name="time_period" value="weekly" />
                                <button id="sale-report-chart-link" href=""><?php echo e(trans('Sale Report Chart')); ?></button>
                                <?php echo Form::close(); ?>

                            </li>

                            <li id="payment-report-menu">
                            <?php echo Form::open(['route' => 'superAdmin.report.paymentByDate', 'method' => 'post', 'id' => 'payment-report-form']); ?>

                            <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                            <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />
                            <button id="payment-report-link" href=""><?php echo e(trans('Payment Report')); ?></button>
                            <?php echo Form::close(); ?>

                            </li>


                            <li id="purchase-report-menu">
                            <?php echo Form::open(['route' => 'superAdmin.report.purchase', 'method' => 'post', 'id' => 'purchase-report-form']); ?>

                            <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                            <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />
                            <input type="hidden" name="warehouse_id" value="0" />
                            <button id="purchase-report-link" href=""><?php echo e(trans('Purchase Report')); ?></button>
                            <?php echo Form::close(); ?>

                            </li>
                            
                            <li id="due-report-menu">
                                <?php echo Form::open(['route' => 'superAdmin.report.customerDueByDate', 'method' => 'post', 'id' => 'customer-due-report-form']); ?>

                                <input type="hidden" name="start_date" value="<?php echo e(date('Y-m-d', strtotime('-1 year'))); ?>" />
                                <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />
                                <button id="due-report-link" href=""><?php echo e(trans('Customer Due Report')); ?></button>
                                <?php echo Form::close(); ?>

                            </li>

                            <li id="supplier-report-menu">
                                <a id="supplier-report-link" href=""><?php echo e(trans('Supplier Report')); ?></a>
                            </li>
                            <li id="supplier-due-report-menu">
                                <?php echo Form::open(['route' => 'superAdmin.report.supplierDueByDate', 'method' => 'post', 'id' => 'supplier-due-report-form']); ?>

                                <input type="hidden" name="start_date" value="<?php echo e(date('Y-m-d', strtotime('-1 year'))); ?>" />
                                <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />
                                <button id="supplier-due-report-link" href=""><?php echo e(trans('Supplier Due Report')); ?></button>
                                <?php echo Form::close(); ?>

                            </li>
                            <li id="warehouse-report-menu">
                            <a id="warehouse-report-link" href=""><?php echo e(trans('Warehouse Report')); ?></a>
                            </li>
                            <li id="warehouse-stock-report-menu">
                            <a href="<?php echo e(route('superAdmin.report.warehouseStock')); ?>"><?php echo e(trans('Warehouse Stock Chart')); ?></a>
                            </li>
                            <li id="productExpiry-report-menu">
                            <a href="<?php echo e(route('superAdmin.report.productExpiry')); ?>"><?php echo e(trans('Product Expiry Report')); ?></a>
                            </li>
                            <li id="qtyAlert-report-menu">
                            <a href="<?php echo e(route('superAdmin.report.qtyAlert')); ?>"><?php echo e(trans('Product Quantity Alert')); ?></a>
                            </li>
                            <li id="daily-sale-objective-menu">
                                <button href="<?php echo e(route('superAdmin.report.dailySaleObjective')); ?>"><?php echo e(trans('Daily Sale Objective Report')); ?></button>
                            </li>
                            <li id="user-report-menu">
                            <a id="user-report-link" href=""><?php echo e(trans('User Report')); ?></a>
                            </li>
                        </ul>
                        </li>
                            

                        </ul>
                    </li>

                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                Peoples
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.customer')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Customar</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.supplier')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Suppliers</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.biller')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Biller</p>
                                </a>
                            </li>

                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-copy"></i>
                            <p>
                                Setting
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <?php
                                $rhps = DB::table('role_has_permissions')->get();
                                $permissions = DB::table('permissions')->get();
                                $roles = DB::table('roles')->get();
                            ?>
                            <?php $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <?php $__currentLoopData = $rhps; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $rhp): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php $__currentLoopData = $permissions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $permission): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php if($role->id == Auth::user()->role_id && $role->id == $rhp->role_id): ?>
                                            <?php if($rhp->permission_id == $permission->id): ?>
                                                <?php
                                                    $name = $permission->name;
                                                ?>
                                                <?php if(stristr($name, 'menu')): ?>
                                                    <?php
                                                        $value = substr(strstr($name, '-'), 1);
                                                        $role_id = Auth::user()->role_id;
                                                        $nameRole = DB::table('roles')
                                                            ->where('id', $role_id)
                                                            ->get();
                                                        $role_name = $nameRole[0]->name;
                                                        //  print_r($role_name);
                                                        //  print_r($value);
                                                    ?>
                                                    <li class="nav-item">
                                                        <?php if($value == 'users'): ?>
                                                            <a class="nav-link"
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;">
                                                                <i class="far fa-circle nav-icon"></i>
                                                                <p> <?php echo e($value); ?></p>
                                                            </a>
                                                        <?php elseif($value == 'roles'): ?>
                                                            <a class="nav-link"
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;">
                                                                <i class="far fa-circle nav-icon"></i>
                                                                <p> <?php echo e($value); ?></p>
                                                            </a>
                                                        <?php elseif($value == 'permissions'): ?>
                                                            <a class="nav-link"
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;">
                                                                <i class="far fa-circle nav-icon"></i>
                                                                <p> <?php echo e($value); ?></p>
                                                            </a>
                                                        <?php elseif($value == 'white'): ?>
                                                            <a class=""
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;">
                                                                <p> <?php echo e($value); ?></p>
                                                            </a>
                                                        <?php elseif($value == 'black'): ?>
                                                            <a class=""
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;">
                                                                <p> <?php echo e($value); ?></p>
                                                            </a>
                                                        <?php elseif($value == 'menus'): ?>
                                                            <a class=""
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;"><?php echo e($value); ?></a>
                                                        <?php elseif($value == 'csv'): ?>
                                                            <a class=""
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;"><?php echo e($value); ?></a>
                                                        <?php elseif($value == 'slider'): ?>
                                                            <a class=""
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;"><?php echo e($value); ?></a>
                                                        <?php elseif($value == 'video'): ?>
                                                            <a class=""
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;"><?php echo e($value); ?></a>
                                                        <?php elseif($value == 'gallery'): ?>
                                                            <a class=""
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;"><?php echo e($value); ?></a>
                                                        <?php elseif($value == 'loginhistory'): ?>
                                                            <a class=""
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;"><?php echo e($value); ?></a>
                                                            
                                                        <?php elseif($value == 'databasebackup'): ?>
                                                            <a class=""
                                                                href="<?php echo e(route($role_name . '.' . $value)); ?>"
                                                                style="text-transform: uppercase;"><?php echo e($value); ?></a>
                                                        <?php else: ?>
                                                        <?php endif; ?>
                                                    </li>
                                                <?php endif; ?>
                                            <?php endif; ?>
                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <li class="nav-item">
                                <a href="<?php echo e(route('superAdmin.ganeralsetting')); ?>" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Ganeral Setting</p>
                                </a>
                            </li>

                             <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.coustomergroup')); ?>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Coustomer Group </p>
                            </a>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.customer')); ?>">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Coustomer</p>
                            </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.discount')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Discount </p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.discountPlan')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Discount Plan</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.rewardPointSetting')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Reward Point Setting</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="<?php echo e(route('superAdmin.possetting')); ?>">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>POS Setting</p>
                                </a>
                            </li>
                            
                            <li class="nav-item">
                                <a href="pages/layout/top-nav.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Top Navigation</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/layout/top-nav-sidebar.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Top Navigation + Sidebar</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/layout/boxed.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Boxed</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/layout/fixed-sidebar.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Fixed Sidebar</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/layout/fixed-sidebar-custom.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Fixed Sidebar <small>+ Custom Area</small></p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/layout/fixed-topnav.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Fixed Navbar</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/layout/fixed-footer.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Fixed Footer</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/layout/collapsed-sidebar.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Collapsed Sidebar</p>
                                </a>
                            </li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <a href="<?php echo e(route('superAdmin.promotion')); ?>" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>Promotion</p>
                        </a>
                    </li>

                    
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->


  <!-- expense modal -->
  <div id="expense-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Add Expense')); ?></h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => 'superAdmin.expenses.store', 'method' => 'post']); ?>

                <?php
                  $lims_expense_category_list = DB::table('expense_categories')->where('is_active', true)->get();
                  if(Auth::user()->role_id > 2)
                    $lims_warehouse_list = DB::table('warehouses')->where([
                      ['is_active', true],
                      ['id', Auth::user()->warehouse_id]
                    ])->get();
                  else
                    $lims_warehouse_list = DB::table('warehouses')->where('is_active', true)->get();
                  $lims_account_list = \App\Models\Account::where('is_active', true)->get();
                ?>
                  <div class="row">
                    <div class="col-md-6 form-group">
                        <label><?php echo e(trans('file.Date')); ?></label>
                        <input type="text" name="created_at" class="form-control date" placeholder="Choose date"/>
                    </div>
                    <div class="col-md-6 form-group">
                        <label><?php echo e(trans('file.Expense Category')); ?> *</label>
                        <select name="expense_category_id" class="selectpicker form-control" required data-live-search="true" data-live-search-style="begins" title="Select Expense Category...">
                            <?php $__currentLoopData = $lims_expense_category_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $expense_category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($expense_category->id); ?>"><?php echo e($expense_category->name . ' (' . $expense_category->code. ')'); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label><?php echo e(trans('file.Warehouse')); ?> *</label>
                        <select name="warehouse_id" class="selectpicker form-control" required data-live-search="true" data-live-search-style="begins" title="Select Warehouse...">
                            <?php $__currentLoopData = $lims_warehouse_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($warehouse->id); ?>"><?php echo e($warehouse->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label><?php echo e(trans('file.Amount')); ?> *</label>
                        <input type="number" name="amount" step="any" required class="form-control">
                    </div>
                    <div class="col-md-6 form-group">
                        <label> <?php echo e(trans('file.Account')); ?></label>
                        <select class="form-control selectpicker" name="account_id">
                        <?php $__currentLoopData = $lims_account_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $account): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php if($account->is_default): ?>
                            <option selected value="<?php echo e($account->id); ?>"><?php echo e($account->name); ?> [<?php echo e($account->account_no); ?>]</option>
                            <?php else: ?>
                            <option value="<?php echo e($account->id); ?>"><?php echo e($account->name); ?> [<?php echo e($account->account_no); ?>]</option>
                            <?php endif; ?>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                  </div>
                  <div class="form-group">
                      <label><?php echo e(trans('file.Note')); ?></label>
                      <textarea name="note" rows="3" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                  </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
  </div>
  <!-- end expense modal -->

  <!-- account modal -->
  <div id="account-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Add Account')); ?></h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => 'superAdmin.accounts.store', 'method' => 'post']); ?>

                  <div class="form-group">
                      <label><?php echo e(trans('file.Account No')); ?> *</label>
                      <input type="text" name="account_no" required class="form-control">
                  </div>
                  <div class="form-group">
                      <label><?php echo e(trans('file.name')); ?> *</label>
                      <input type="text" name="name" required class="form-control">
                  </div>
                  <div class="form-group">
                      <label><?php echo e(trans('file.Initial Balance')); ?></label>
                      <input type="number" name="initial_balance" step="any" class="form-control">
                  </div>
                  <div class="form-group">
                      <label><?php echo e(trans('file.Note')); ?></label>
                      <textarea name="note" rows="3" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                  </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
  </div>
  <!-- end account modal -->

  <!-- account statement modal -->
  <div id="account-statement-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Account Statement')); ?></h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => 'superAdmin.accounts.statement', 'method' => 'post']); ?>

                  <div class="row">
                    <div class="col-md-6 form-group">
                        <label> <?php echo e(trans('file.Account')); ?></label>
                        <select class="form-control selectpicker" name="account_id">
                        <?php $__currentLoopData = $lims_account_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $account): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($account->id); ?>"><?php echo e($account->name); ?> [<?php echo e($account->account_no); ?>]</option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label> <?php echo e(trans('file.Type')); ?></label>
                        <select class="form-control selectpicker" name="type">
                            <option value="0"><?php echo e(trans('file.All')); ?></option>
                            <option value="1"><?php echo e(trans('file.Debit')); ?></option>
                            <option value="2"><?php echo e(trans('file.Credit')); ?></option>
                        </select>
                    </div>
                    <div class="col-md-12 form-group">
                        <label><?php echo e(trans('file.Choose Your Date')); ?></label>
                        <div class="input-group">
                            <input type="text" class="account-statement-daterangepicker-field form-control" required />
                            <input type="hidden" name="start_date" />
                            <input type="hidden" name="end_date" />
                        </div>
                    </div>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                  </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
  </div>
  <!-- end account statement modal -->

  <!-- warehouse modal -->
  <div id="warehouse-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Warehouse Report')); ?></h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => 'superAdmin.report.warehouse', 'method' => 'post']); ?>


                  <div class="form-group">
                      <label><?php echo e(trans('file.Warehouse')); ?> *</label>
                      <select name="warehouse_id" class="selectpicker form-control" required data-live-search="true" id="warehouse-id" data-live-search-style="begins" title="Select warehouse...">
                          <?php $__currentLoopData = $lims_warehouse_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <option value="<?php echo e($warehouse->id); ?>"><?php echo e($warehouse->name); ?></option>
                          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </select>
                  </div>

                  <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                  <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />

                  <div class="form-group">
                      <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                  </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
  </div>
  <!-- end warehouse modal -->

  <!-- user modal -->
  <div id="user-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.User Report')); ?></h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => 'superAdmin.report.user', 'method' => 'post']); ?>

                <?php
                  $lims_user_list = DB::table('users')->where('is_active', true)->get();
                ?>
                  <div class="form-group">
                      <label><?php echo e(trans('file.User')); ?> *</label>
                      <select name="user_id" class="selectpicker form-control" required data-live-search="true" id="user-id" data-live-search-style="begins" title="Select user...">
                          <?php $__currentLoopData = $lims_user_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <option value="<?php echo e($user->id); ?>"><?php echo e($user->name . ' (' . $user->mobile. ')'); ?></option>
                          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </select>
                  </div>

                  <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                  <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />

                  <div class="form-group">
                      <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                  </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
  </div>
  <!-- end user modal -->

  <!-- customer modal -->
  <div id="customer-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Customer Report')); ?></h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => 'superAdmin.report.customer', 'method' => 'post']); ?>

                <?php
                  $lims_customer_list = DB::table('customers')->where('is_active', true)->get();
                ?>
                  <div class="form-group">
                      <label><?php echo e(trans('file.customer')); ?> *</label>
                      <select name="customer_id" class="selectpicker form-control" required data-live-search="true" id="customer-id" data-live-search-style="begins" title="Select customer...">
                          <?php $__currentLoopData = $lims_customer_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $customer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <option value="<?php echo e($customer->id); ?>"><?php echo e($customer->name . ' (' . $customer->phone_number. ')'); ?></option>
                          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </select>
                  </div>

                  <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                  <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />

                  <div class="form-group">
                      <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                  </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
  </div>
  <!-- end customer modal -->

  <!-- supplier modal -->
  <div id="supplier-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Supplier Report')); ?></h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => 'superAdmin.report.supplier', 'method' => 'post']); ?>

                <?php
                  $lims_supplier_list = DB::table('suppliers')->where('is_active', true)->get();
                ?>
                  <div class="form-group">
                      <label><?php echo e(trans('file.Supplier')); ?> *</label>
                      <select name="supplier_id" class="selectpicker form-control" required data-live-search="true" id="supplier-id" data-live-search-style="begins" title="Select Supplier...">
                          <?php $__currentLoopData = $lims_supplier_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $supplier): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                          <option value="<?php echo e($supplier->id); ?>"><?php echo e($supplier->name . ' (' . $supplier->phone_number. ')'); ?></option>
                          <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                      </select>
                  </div>

                  <input type="hidden" name="start_date" value="<?php echo e(date('Y-m').'-'.'01'); ?>" />
                  <input type="hidden" name="end_date" value="<?php echo e(date('Y-m-d')); ?>" />

                  <div class="form-group">
                      <button type="submit" class="btn btn-primary"><?php echo e(trans('file.submit')); ?></button>
                  </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
  </div>
  <!-- end supplier modal -->

    </aside>

        <!-- account statement modal -->
        <div id="account-statement-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
            <div role="document" class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('Account Statement')); ?></h5>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                    </div>
                    <div class="modal-body">
                      <p class="italic"><small><?php echo e(trans('The field labels marked with * are required input fields')); ?>.</small></p>
                        <?php echo Form::open(['route' => 'superAdmin.accounts.statement', 'method' => 'post']); ?>

                          <div class="row">
                            <?php
                               $lims_account_list = App\Models\Account::where('is_active', true)->get();
                                //    $lims_account_list = Account::where('is_active', true)->get();
                            ?>
                            <div class="col-md-6 form-group">
                                <label> <?php echo e(trans('Account')); ?></label>
                                <select class="form-control selectpicker" name="account_id">
                                <?php $__currentLoopData = $lims_account_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $account): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($account->id); ?>"><?php echo e($account->name); ?> [<?php echo e($account->account_no); ?>]</option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label> <?php echo e(trans('Type')); ?></label>
                                <select class="form-control selectpicker" name="type">
                                    <option value="0"><?php echo e(trans('All')); ?></option>
                                    <option value="1"><?php echo e(trans('Debit')); ?></option>
                                    <option value="2"><?php echo e(trans('Credit')); ?></option>
                                </select>
                            </div>
                            <div class="col-md-12 form-group">
                                <label><?php echo e(trans('Choose Your Date')); ?></label>
                                <div class="input-group">
                                    <input type="text" class="account-statement-daterangepicker-field form-control" required />
                                    <input type="hidden" name="start_date" />
                                    <input type="hidden" name="end_date" />
                                </div>
                            </div>
                          </div>
                          <div class="form-group">
                              <button type="submit" class="btn btn-primary"><?php echo e(trans('submit')); ?></button>
                          </div>
                        <?php echo e(Form::close()); ?>

                    </div>
                </div>
            </div>
          </div>
          <!-- end account statement modal -->
          <script type="text/javascript" src="https://salepropos.com/demo/vendor/daterange/js/moment.min.js"></script>
          <script type="text/javascript" src="https://salepropos.com/demo/vendor/daterange/js/knockout-3.4.2.js"></script>
          <script type="text/javascript" src="https://salepropos.com/demo/vendor/daterange/js/daterangepicker.min.js"></script>
    <script>
        if ('serviceWorker' in navigator ) {
            window.addEventListener('load', function() {
                navigator.serviceWorker.register('/demo/service-worker.js').then(function(registration) {
                    // Registration was successful
                    console.log('ServiceWorker registration successful with scope: ', registration.scope);
                }, function(err) {
                    // registration failed :(
                    console.log('ServiceWorker registration failed: ', err);
                });
            });
        }
    </script>
    <script type="text/javascript">
      $("a#account-statement").click(function(e){
        e.preventDefault();
        $('#account-statement-modal').modal();
      });
      $(".account-statement-daterangepicker-field").daterangepicker({
          callback: function(startDate, endDate, period){
            var start_date = startDate.format('YYYY-MM-DD');
            var end_date = endDate.format('YYYY-MM-DD');
            var title = start_date + ' To ' + end_date;
            $(this).val(title);
            $('#account-statement-modal input[name="start_date"]').val(start_date);
            $('#account-statement-modal input[name="end_date"]').val(end_date);
          }
      });
          function myFunction() {
              setTimeout(showPage, 150);
          }
          function showPage() {
            document.getElementById("loader").style.display = "none";
            document.getElementById("content").style.display = "block";
            $("#lims_productcodeSearch").focus();
          }
    //     $("li#notification-icon").on("click", function (argument) {
    //           $.get('notifications/mark-as-read', function(data) {
    //               $("span.notification-number").text(alert_product);
    //           });
    //       });


      $("a#add-expense").click(function(e){
        e.preventDefault();
        $('#expense-modal').modal();
      });

      $("a#send-notification").click(function(e){
        e.preventDefault();
        $('#notification-modal').modal();
      });

      $("a#add-account").click(function(e){
        e.preventDefault();
        $('#account-modal').modal();
      });

      $("a#profitLossLink").click(function(e){
        e.preventDefault();
        alert("kk");
        // $("#profitLoss-report-form").submit();
      });

      $("a#report-link").click(function(e){
        e.preventDefault();
        $("#product-report-form").submit();
      });

      $("a#purchase-report-link").click(function(e){
        e.preventDefault();
        $("#purchase-report-form").submit();
      });

      $("a#sale-report-link").click(function(e){
        e.preventDefault();
        $("#sale-report-form").submit();
      });

      $("a#payment-report-link").click(function(e){
        e.preventDefault();
        $("#payment-report-form").submit();
      });

      $("a#warehouse-report-link").click(function(e){
        e.preventDefault();
        $('#warehouse-modal').modal();
      });

      $("a#user-report-link").click(function(e){
        e.preventDefault();
        $('#user-modal').modal();
      });

      $("a#customer-report-link").click(function(e){
        e.preventDefault();
        $('#customer-modal').modal();
      });

      $("a#supplier-report-link").click(function(e){
        e.preventDefault();
        $('#supplier-modal').modal();
      });

      $("a#due-report-link").click(function(e){
        e.preventDefault();
        $("#customer-due-report-form").submit();
      });

      $("a#supplier-due-report-link").click(function(e){
        e.preventDefault();
        $("#supplier-due-report-form").submit();
      });

      $('.date').datepicker({
         format: "dd-mm-yyyy",
         autoclose: true,
         todayHighlight: true
       });


    </script>
<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/asset/homeasset/nav.blade.php ENDPATH**/ ?>