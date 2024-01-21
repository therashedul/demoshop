

<link rel="preload" href="{{asset('css/daterangepicker.min.css')}}" as="style" onload="this.onload=null;this.rel='stylesheet'">

{{-- <noscript><link href="https://salepropos.com/demo/vendor/daterange/css/daterangepicker.min.css" rel="stylesheet"></noscript> --}}

<style>
    .modal-backdrop.show {
        opacity: 0 !important;
    }
        .modal-backdrop {
        position: inherit !important;

    }
    </style>
    @php
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
    @endphp
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <a href="{{ asset($values->name) }}" class="brand-link">
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
                    <li class="nav-item menu-open mb-3"> <a href="{{ url('/') }}" target="_blank" class="font-page"
                            style="background: #ff1717;
                                    text-align: center;
                                    display: block;
                                    color: #fff;
                                    padding: 2% 0%">
                            Display Fornt Page </a>
                    </li>
                    <li class="nav-item menu-open">
                        <a href="{{ route('home') }}" class="nav-link active">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Dashboar
                            </p>
                        </a>
                    </li>
                    @foreach ($roleprms as $roleprm)
                        {{-- <li> {{ $roleprm }}</li> --}}
                        @php
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
                        @endphp
                        @if ($value == 'media')
                            <li class="nav-item"> <a class="nav-link" href="{{ route($role_name . '.' . $value) }}"
                                    style="text-transform: uppercase;">
                                    <p>{{ $value }}</p>
                                </a></li>
                        @elseif ($value == 'category')
                            <li class="nav-item"> <a class="nav-link" href="{{ route($role_name . '.' . $value) }}"
                                    style="text-transform: uppercase;">
                                    <p>{{ $value }}</p>
                                </a></li>
                        @elseif ($value == 'post')
                            <li class="nav-item"> <a class="nav-link" href="{{ route($role_name . '.' . $value) }}"
                                    style="text-transform: uppercase;">
                                    <p>{{ $value }}</p>
                                </a></li>
                        @elseif ($value == 'page')
                            <li class="nav-item"> <a class="nav-link" href="{{ route($role_name . '.' . $value) }}"
                                    style="text-transform: uppercase;">
                                    <p>{{ $value }}</p>
                                </a></li>
                        @elseif ($value == 'comments')
                            <li class="nav-item"> <a class="nav-link" href="{{ route($role_name . '.' . $value) }}"
                                    style="text-transform: uppercase;">
                                    <p>{{ $value }}</p>
                                </a></li>
                        @endif
                    @endforeach
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
                                <a href="{{ route('superAdmin.products') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Product List</p>
                                </a>
                            </li>

                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.category') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Category</p>
                                </a></li>
                                <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.warehouse') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Warehouse</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.brand') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Brand</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.barcode') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Barcode</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.tax') }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Tax</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.unit') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Unite</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.transfers') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Product Transfer</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.qty_adjustment') }}" class="nav-link">
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
                                <a href="{{ route('superAdmin.sale') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Sell list</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.coupon') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Coupon list</p>
                                </a></li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.courier') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Courier list</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.delivery') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Delevary list</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.giftcard') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Gift card</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="{{ route('superAdmin.sale.pos') }}" class="nav-link">
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
                                <a href="{{ route('superAdmin.products') }}" class="nav-link">
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
                                <a href="{{ route('superAdmin.purchase') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Purchases list</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.supplier') }}">
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
                                <a href="{{ route('superAdmin.expenses') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Expense list</p>
                                </a>
                            </li>

                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.expense_categories') }}">
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
                                <a href="{{ route('superAdmin.accounts') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Account List</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.money-transfers') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Money Transfers</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.accounts.balancesheet') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Balancesheet</p>
                                </a>
                            </li>
                                {{-- <li id="account-statement-menu">
                                    <a id="account-statement" href="">{{trans('Account Statement')}}</a>
                                </li> --}}
                            <li class="nav-item" id="account-statement-menu">
                                <a class="nav-link" id="account-statement" href="">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Account Statement</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.cashRegister') }}">
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
                            {{-- <li class="nav-item">
                                <a href="{{ route('superAdmin.products') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>HTM List</p>
                                </a>
                            </li> --}}
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.departments') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Depertment</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.employees') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Employee</p>
                                </a></li>
                                <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.payroll') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Payroll</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.attendance') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Attandance</p>
                                </a></li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.stock-count') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Stock Count</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.holidays') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Holidays</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.setting.hrm') }}">
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
                                <a href="{{ route('superAdmin.return-sale') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Sell return </p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.return-purchase') }}">
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


                        <li><a href="#report" aria-expanded="false" data-toggle="collapse"> <i class="dripicons-document-remove"></i><span>{{trans('Reports')}}</span></a>
                        <ul id="report" class="collapse list-unstyled ">
                            <li id="profit-loss-report-menu">
                            {!! Form::open(['route' => 'superAdmin.report.profitLoss', 'method' => 'post', 'id' => 'profitLoss-report-form']) !!}
                            <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                            <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />
                            <button id="profitLossLink" href="">{{trans('Summary Reporting')}}</button>
                            {!! Form::close() !!}
                            </li>
                            <li id="product-report-menu">
                                {!! Form::open(['route' => 'superAdmin.report.product', 'method' => 'get', 'id' => 'product-report-form']) !!}
                                <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                                <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />
                                <input type="hidden" name="warehouse_id" value="0" />
                                <button id="report-link" href="">{{trans('Product Report')}}</button>
                            {!! Form::close() !!}
                        </li>
                            <li id="daily-sale-report-menu">
                            <a href="{{url('superAdmin/report/daily_sale/'.date('Y').'/'.date('m'))}}">{{trans('Daily Sale')}}</a>
                            </li>
                            <li id="monthly-sale-report-menu">
                                <a href="{{url('superAdmin/report/monthly_sale/'.date('Y'))}}">{{trans('Monthly Sale')}}</a>
                            </li>
                            <li id="best-seller-report-menu">
                            <a href="{{url('superAdmin/report/best_seller')}}">{{trans('Best Seller')}}</a>
                            </li>
                            <li id="daily-purchase-report-menu">
                                <a href="{{url('superAdmin/report/daily_purchase/'.date('Y').'/'.date('m'))}}">{{trans('Daily Purchase')}}</a>
                            </li>

                            <li id="monthly-purchase-report-menu">
                            <a href="{{url('superAdmin/report/monthly_purchase/'.date('Y'))}}">{{trans('Monthly Purchase')}}</a>
                            </li>
                            <li id="sale-report-menu">
                            {!! Form::open(['route' => 'superAdmin.report.sale', 'method' => 'post', 'id' => 'sale-report-form']) !!}
                            <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                            <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />
                            <input type="hidden" name="warehouse_id" value="0" />
                            <button id="sale-report-link" href="">{{trans('Sale Report')}}</button>
                            {!! Form::close() !!}
                            </li>
                            <li id="sale-report-chart-menu">
                                {!! Form::open(['route' => 'superAdmin.report.saleChart', 'method' => 'post', 'id' => 'sale-report-chart-form']) !!}
                                <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                                <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />
                                <input type="hidden" name="warehouse_id" value="0" />
                                <input type="hidden" name="time_period" value="weekly" />
                                <button id="sale-report-chart-link" href="">{{trans('Sale Report Chart')}}</button>
                                {!! Form::close() !!}
                            </li>

                            <li id="payment-report-menu">
                            {!! Form::open(['route' => 'superAdmin.report.paymentByDate', 'method' => 'post', 'id' => 'payment-report-form']) !!}
                            <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                            <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />
                            <button id="payment-report-link" href="">{{trans('Payment Report')}}</button>
                            {!! Form::close() !!}
                            </li>


                            <li id="purchase-report-menu">
                            {!! Form::open(['route' => 'superAdmin.report.purchase', 'method' => 'post', 'id' => 'purchase-report-form']) !!}
                            <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                            <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />
                            <input type="hidden" name="warehouse_id" value="0" />
                            <button id="purchase-report-link" href="">{{trans('Purchase Report')}}</button>
                            {!! Form::close() !!}
                            </li>
                            {{-- <li id="customer-report-menu">
                            <button id="customer-report-link" href="">{{trans('Customer Report')}}</button>
                            </li> --}}
                            <li id="due-report-menu">
                                {!! Form::open(['route' => 'superAdmin.report.customerDueByDate', 'method' => 'post', 'id' => 'customer-due-report-form']) !!}
                                <input type="hidden" name="start_date" value="{{date('Y-m-d', strtotime('-1 year'))}}" />
                                <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />
                                <button id="due-report-link" href="">{{trans('Customer Due Report')}}</button>
                                {!! Form::close() !!}
                            </li>

                            <li id="supplier-report-menu">
                                <a id="supplier-report-link" href="">{{trans('Supplier Report')}}</a>
                            </li>
                            <li id="supplier-due-report-menu">
                                {!! Form::open(['route' => 'superAdmin.report.supplierDueByDate', 'method' => 'post', 'id' => 'supplier-due-report-form']) !!}
                                <input type="hidden" name="start_date" value="{{date('Y-m-d', strtotime('-1 year'))}}" />
                                <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />
                                <button id="supplier-due-report-link" href="">{{trans('Supplier Due Report')}}</button>
                                {!! Form::close() !!}
                            </li>
                            <li id="warehouse-report-menu">
                            <a id="warehouse-report-link" href="">{{trans('Warehouse Report')}}</a>
                            </li>
                            <li id="warehouse-stock-report-menu">
                            <a href="{{route('superAdmin.report.warehouseStock')}}">{{trans('Warehouse Stock Chart')}}</a>
                            </li>
                            <li id="productExpiry-report-menu">
                            <a href="{{route('superAdmin.report.productExpiry')}}">{{trans('Product Expiry Report')}}</a>
                            </li>
                            <li id="qtyAlert-report-menu">
                            <a href="{{route('superAdmin.report.qtyAlert')}}">{{trans('Product Quantity Alert')}}</a>
                            </li>
                            <li id="daily-sale-objective-menu">
                                <button href="{{route('superAdmin.report.dailySaleObjective')}}">{{trans('Daily Sale Objective Report')}}</button>
                            </li>
                            <li id="user-report-menu">
                            <a id="user-report-link" href="">{{trans('User Report')}}</a>
                            </li>
                        </ul>
                        </li>
                            {{-- <li class="nav-item">
                                <a href="{{ route('superAdmin.report.profitLoss') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Summary Report</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.category') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Best product Seller</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.category') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Sale Report </p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.category') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Monthly Sale Report </p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.category') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Sale Report chart </p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.category') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Balance Sheet </p>
                                </a>
                            </li> --}}

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
                                <a href="{{ route('superAdmin.customer') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Customar</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.supplier') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Suppliers</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.biller') }}">
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
                            @php
                                $rhps = DB::table('role_has_permissions')->get();
                                $permissions = DB::table('permissions')->get();
                                $roles = DB::table('roles')->get();
                            @endphp
                            @foreach ($roles as $role)
                                @foreach ($rhps as $rhp)
                                    @foreach ($permissions as $permission)
                                        @if ($role->id == Auth::user()->role_id && $role->id == $rhp->role_id)
                                            @if ($rhp->permission_id == $permission->id)
                                                @php
                                                    $name = $permission->name;
                                                @endphp
                                                @if (stristr($name, 'menu'))
                                                    @php
                                                        $value = substr(strstr($name, '-'), 1);
                                                        $role_id = Auth::user()->role_id;
                                                        $nameRole = DB::table('roles')
                                                            ->where('id', $role_id)
                                                            ->get();
                                                        $role_name = $nameRole[0]->name;
                                                        //  print_r($role_name);
                                                        //  print_r($value);
                                                    @endphp
                                                    <li class="nav-item">
                                                        @if ($value == 'users')
                                                            <a class="nav-link"
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">
                                                                <i class="far fa-circle nav-icon"></i>
                                                                <p> {{ $value }}</p>
                                                            </a>
                                                        @elseif ($value == 'roles')
                                                            <a class="nav-link"
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">
                                                                <i class="far fa-circle nav-icon"></i>
                                                                <p> {{ $value }}</p>
                                                            </a>
                                                        @elseif ($value == 'permissions')
                                                            <a class="nav-link"
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">
                                                                <i class="far fa-circle nav-icon"></i>
                                                                <p> {{ $value }}</p>
                                                            </a>
                                                        @elseif ($value == 'white')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">
                                                                <p> {{ $value }}</p>
                                                            </a>
                                                        @elseif ($value == 'black')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">
                                                                <p> {{ $value }}</p>
                                                            </a>
                                                        @elseif ($value == 'menus')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">{{ $value }}</a>
                                                        @elseif ($value == 'csv')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">{{ $value }}</a>
                                                        @elseif ($value == 'slider')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">{{ $value }}</a>
                                                        @elseif ($value == 'video')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">{{ $value }}</a>
                                                        @elseif ($value == 'gallery')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">{{ $value }}</a>
                                                        @elseif ($value == 'loginhistory')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">{{ $value }}</a>
                                                            {{-- @elseif ($value == 'language')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">{{ $value }}</a> --}}
                                                        @elseif ($value == 'databasebackup')
                                                            <a class=""
                                                                href="{{ route($role_name . '.' . $value) }}"
                                                                style="text-transform: uppercase;">{{ $value }}</a>
                                                        @else
                                                        @endif
                                                    </li>
                                                @endif
                                            @endif
                                        @endif
                                    @endforeach
                                @endforeach
                            @endforeach
                            <li class="nav-item">
                                <a href="{{ route('superAdmin.ganeralsetting') }}" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Ganeral Setting</p>
                                </a>
                            </li>

                             <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.coustomergroup') }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Coustomer Group </p>
                            </a>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.customer') }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Coustomer</p>
                            </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.discount') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Discount </p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.discountPlan') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Discount Plan</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.rewardPointSetting') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Reward Point Setting</p>
                                </a>
                            </li>
                            <li class="nav-item"> <a class="nav-link" href="{{ route('superAdmin.possetting') }}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>POS Setting</p>
                                </a>
                            </li>
                            {{-- ============================= --}}
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
                        <a href="{{ route('superAdmin.promotion') }}" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>Promotion</p>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="pages/widgets.html" class="nav-link">
                            <i class="nav-icon fas fa-th"></i>
                            <p>
                                Widgets
                                <span class="right badge badge-danger">New</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-copy"></i>
                            <p>
                                Layout Options
                                <i class="fas fa-angle-left right"></i>
                                <span class="badge badge-info right">6</span>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
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
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-chart-pie"></i>
                            <p>
                                Charts
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="pages/charts/chartjs.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>ChartJS</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/charts/flot.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Flot</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/charts/inline.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Inline</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/charts/uplot.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>uPlot</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tree"></i>
                            <p>
                                UI Elements
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="pages/UI/general.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>General</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/UI/icons.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Icons</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/UI/buttons.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Buttons</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/UI/sliders.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Sliders</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/UI/modals.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Modals & Alerts</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/UI/navbar.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Navbar & Tabs</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/UI/timeline.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Timeline</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/UI/ribbons.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Ribbons</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-edit"></i>
                            <p>
                                Forms
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="pages/forms/general.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>General Elements</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/forms/advanced.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Advanced Elements</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/forms/editors.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Editors</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/forms/validation.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Validation</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Tables
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="pages/tables/simple.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Simple Tables</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/tables/data.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>DataTables</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/tables/jsgrid.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>jsGrid</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-header">EXAMPLES</li>
                    <li class="nav-item">
                        <a href="pages/calendar.html" class="nav-link">
                            <i class="nav-icon far fa-calendar-alt"></i>
                            <p>
                                Calendar
                                <span class="badge badge-info right">2</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="pages/gallery.html" class="nav-link">
                            <i class="nav-icon far fa-image"></i>
                            <p>
                                Gallery
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="pages/kanban.html" class="nav-link">
                            <i class="nav-icon fas fa-columns"></i>
                            <p>
                                Kanban Board
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-envelope"></i>
                            <p>
                                Mailbox
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="pages/mailbox/mailbox.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Inbox</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/mailbox/compose.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Compose</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/mailbox/read-mail.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Read</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-book"></i>
                            <p>
                                Pages
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="pages/examples/invoice.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Invoice</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/prohtml" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Profile</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/e-commerce.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>E-commerce</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/projects.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Projects</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/project-add.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Project Add</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/project-edit.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Project Edit</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/project-detail.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Project Detail</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/contacts.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Contacts</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/faq.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>FAQ</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/contact-us.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Contact us</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p>
                                Extras
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Login & Register v1
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="pages/examples/login.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Login v1</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="pages/examples/register.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Register v1</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="pages/examples/forgot-password.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Forgot Password v1</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="pages/examples/recover-password.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Recover Password v1</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Login & Register v2
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="pages/examples/login-v2.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Login v2</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="pages/examples/register-v2.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Register v2</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="pages/examples/forgot-password-v2.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Forgot Password v2</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="pages/examples/recover-password-v2.html" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Recover Password v2</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/lockscreen.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Lockscreen</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/legacy-user-menu.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Legacy User Menu</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/language-menu.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Language Menu</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/404.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Error 404</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/500.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Error 500</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/pace.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Pace</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/examples/blank.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Blank Page</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="starter.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Starter Page</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-search"></i>
                            <p>
                                Search
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="pages/search/simple.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Simple Search</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="pages/search/enhanced.html" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Enhanced</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-header">MISCELLANEOUS</li>
                    <li class="nav-item">
                        <a href="iframe.html" class="nav-link">
                            <i class="nav-icon fas fa-ellipsis-h"></i>
                            <p>Tabbed IFrame Plugin</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="https://adminlte.io/docs/3.1/" class="nav-link">
                            <i class="nav-icon fas fa-file"></i>
                            <p>Documentation</p>
                        </a>
                    </li>
                    <li class="nav-header">MULTI LEVEL EXAMPLE</li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>Level 1</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-circle"></i>
                            <p>
                                Level 1
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Level 2</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Level 2
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="far fa-dot-circle nav-icon"></i>
                                            <p>Level 3</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="far fa-dot-circle nav-icon"></i>
                                            <p>Level 3</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="far fa-dot-circle nav-icon"></i>
                                            <p>Level 3</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Level 2</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="fas fa-circle nav-icon"></i>
                            <p>Level 1</p>
                        </a>
                    </li>
                    <li class="nav-header">LABELS</li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-circle text-danger"></i>
                            <p class="text">Important</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-circle text-warning"></i>
                            <p>Warning</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-circle text-info"></i>
                            <p>Informational</p>
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
                <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Add Expense')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'superAdmin.expenses.store', 'method' => 'post']) !!}
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
                        <label>{{trans('file.Date')}}</label>
                        <input type="text" name="created_at" class="form-control date" placeholder="Choose date"/>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('file.Expense Category')}} *</label>
                        <select name="expense_category_id" class="selectpicker form-control" required data-live-search="true" data-live-search-style="begins" title="Select Expense Category...">
                            @foreach($lims_expense_category_list as $expense_category)
                            <option value="{{$expense_category->id}}">{{$expense_category->name . ' (' . $expense_category->code. ')'}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('file.Warehouse')}} *</label>
                        <select name="warehouse_id" class="selectpicker form-control" required data-live-search="true" data-live-search-style="begins" title="Select Warehouse...">
                            @foreach($lims_warehouse_list as $warehouse)
                            <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('file.Amount')}} *</label>
                        <input type="number" name="amount" step="any" required class="form-control">
                    </div>
                    <div class="col-md-6 form-group">
                        <label> {{trans('file.Account')}}</label>
                        <select class="form-control selectpicker" name="account_id">
                        @foreach($lims_account_list as $account)
                            @if($account->is_default)
                            <option selected value="{{$account->id}}">{{$account->name}} [{{$account->account_no}}]</option>
                            @else
                            <option value="{{$account->id}}">{{$account->name}} [{{$account->account_no}}]</option>
                            @endif
                        @endforeach
                        </select>
                    </div>
                  </div>
                  <div class="form-group">
                      <label>{{trans('file.Note')}}</label>
                      <textarea name="note" rows="3" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                  </div>
                {{ Form::close() }}
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
                <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Add Account')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'superAdmin.accounts.store', 'method' => 'post']) !!}
                  <div class="form-group">
                      <label>{{trans('file.Account No')}} *</label>
                      <input type="text" name="account_no" required class="form-control">
                  </div>
                  <div class="form-group">
                      <label>{{trans('file.name')}} *</label>
                      <input type="text" name="name" required class="form-control">
                  </div>
                  <div class="form-group">
                      <label>{{trans('file.Initial Balance')}}</label>
                      <input type="number" name="initial_balance" step="any" class="form-control">
                  </div>
                  <div class="form-group">
                      <label>{{trans('file.Note')}}</label>
                      <textarea name="note" rows="3" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                  </div>
                {{ Form::close() }}
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
                <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Account Statement')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'superAdmin.accounts.statement', 'method' => 'post']) !!}
                  <div class="row">
                    <div class="col-md-6 form-group">
                        <label> {{trans('file.Account')}}</label>
                        <select class="form-control selectpicker" name="account_id">
                        @foreach($lims_account_list as $account)
                            <option value="{{$account->id}}">{{$account->name}} [{{$account->account_no}}]</option>
                        @endforeach
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label> {{trans('file.Type')}}</label>
                        <select class="form-control selectpicker" name="type">
                            <option value="0">{{trans('file.All')}}</option>
                            <option value="1">{{trans('file.Debit')}}</option>
                            <option value="2">{{trans('file.Credit')}}</option>
                        </select>
                    </div>
                    <div class="col-md-12 form-group">
                        <label>{{trans('file.Choose Your Date')}}</label>
                        <div class="input-group">
                            <input type="text" class="account-statement-daterangepicker-field form-control" required />
                            <input type="hidden" name="start_date" />
                            <input type="hidden" name="end_date" />
                        </div>
                    </div>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                  </div>
                {{ Form::close() }}
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
                <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Warehouse Report')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'superAdmin.report.warehouse', 'method' => 'post']) !!}

                  <div class="form-group">
                      <label>{{trans('file.Warehouse')}} *</label>
                      <select name="warehouse_id" class="selectpicker form-control" required data-live-search="true" id="warehouse-id" data-live-search-style="begins" title="Select warehouse...">
                          @foreach($lims_warehouse_list as $warehouse)
                          <option value="{{$warehouse->id}}">{{$warehouse->name}}</option>
                          @endforeach
                      </select>
                  </div>

                  <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                  <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />

                  <div class="form-group">
                      <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                  </div>
                {{ Form::close() }}
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
                <h5 id="exampleModalLabel" class="modal-title">{{trans('file.User Report')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'superAdmin.report.user', 'method' => 'post']) !!}
                <?php
                  $lims_user_list = DB::table('users')->where('is_active', true)->get();
                ?>
                  <div class="form-group">
                      <label>{{trans('file.User')}} *</label>
                      <select name="user_id" class="selectpicker form-control" required data-live-search="true" id="user-id" data-live-search-style="begins" title="Select user...">
                          @foreach($lims_user_list as $user)
                          <option value="{{$user->id}}">{{$user->name . ' (' . $user->mobile. ')'}}</option>
                          @endforeach
                      </select>
                  </div>

                  <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                  <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />

                  <div class="form-group">
                      <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                  </div>
                {{ Form::close() }}
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
                <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Customer Report')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'superAdmin.report.customer', 'method' => 'post']) !!}
                <?php
                  $lims_customer_list = DB::table('customers')->where('is_active', true)->get();
                ?>
                  <div class="form-group">
                      <label>{{trans('file.customer')}} *</label>
                      <select name="customer_id" class="selectpicker form-control" required data-live-search="true" id="customer-id" data-live-search-style="begins" title="Select customer...">
                          @foreach($lims_customer_list as $customer)
                          <option value="{{$customer->id}}">{{$customer->name . ' (' . $customer->phone_number. ')'}}</option>
                          @endforeach
                      </select>
                  </div>

                  <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                  <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />

                  <div class="form-group">
                      <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                  </div>
                {{ Form::close() }}
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
                <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Supplier Report')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'superAdmin.report.supplier', 'method' => 'post']) !!}
                <?php
                  $lims_supplier_list = DB::table('suppliers')->where('is_active', true)->get();
                ?>
                  <div class="form-group">
                      <label>{{trans('file.Supplier')}} *</label>
                      <select name="supplier_id" class="selectpicker form-control" required data-live-search="true" id="supplier-id" data-live-search-style="begins" title="Select Supplier...">
                          @foreach($lims_supplier_list as $supplier)
                          <option value="{{$supplier->id}}">{{$supplier->name . ' (' . $supplier->phone_number. ')'}}</option>
                          @endforeach
                      </select>
                  </div>

                  <input type="hidden" name="start_date" value="{{date('Y-m').'-'.'01'}}" />
                  <input type="hidden" name="end_date" value="{{date('Y-m-d')}}" />

                  <div class="form-group">
                      <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                  </div>
                {{ Form::close() }}
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
                        <h5 id="exampleModalLabel" class="modal-title">{{trans('Account Statement')}}</h5>
                        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                    </div>
                    <div class="modal-body">
                      <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
                        {!! Form::open(['route' => 'superAdmin.accounts.statement', 'method' => 'post']) !!}
                          <div class="row">
                            @php
                               $lims_account_list = App\Models\Account::where('is_active', true)->get();
                                //    $lims_account_list = Account::where('is_active', true)->get();
                            @endphp
                            <div class="col-md-6 form-group">
                                <label> {{trans('Account')}}</label>
                                <select class="form-control selectpicker" name="account_id">
                                @foreach($lims_account_list as $account)
                                    <option value="{{$account->id}}">{{$account->name}} [{{$account->account_no}}]</option>
                                @endforeach
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label> {{trans('Type')}}</label>
                                <select class="form-control selectpicker" name="type">
                                    <option value="0">{{trans('All')}}</option>
                                    <option value="1">{{trans('Debit')}}</option>
                                    <option value="2">{{trans('Credit')}}</option>
                                </select>
                            </div>
                            <div class="col-md-12 form-group">
                                <label>{{trans('Choose Your Date')}}</label>
                                <div class="input-group">
                                    <input type="text" class="account-statement-daterangepicker-field form-control" required />
                                    <input type="hidden" name="start_date" />
                                    <input type="hidden" name="end_date" />
                                </div>
                            </div>
                          </div>
                          <div class="form-group">
                              <button type="submit" class="btn btn-primary">{{trans('submit')}}</button>
                          </div>
                        {{ Form::close() }}
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
