<!DOCTYPE html>
<html lang="en">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>{{ config('app.name', 'Url') }}</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSRF Token -->
<meta name="csrf-token" content="{{ csrf_token() }}">

<head>

    @include('asset.header')

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        var startTime = new Date();
    </script>
    <link href="{{ asset('css/custom-prodcut.css') }}" rel="stylesheet">

</head>

<body class="hold-transition sidebar-mini layout-fixed" onbeforeunload="MyFunction();">
    <div class="wrapper">
        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60"
                width="60">
        </div>

        <!-- Navbar -->
        @include('asset.nav')
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        @include('asset.top')
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <div class="container px-4">
                <div class="page">
                    <!-- navbar-->

                    <div id="content" class="animate-bottom">

                        @if (session()->has('message'))
                            <div class="alert alert-success alert-dismissible text-center"><button type="button"
                                    class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
                        @endif
                        @if (session()->has('not_permitted'))
                            <div class="alert alert-danger alert-dismissible text-center"><button type="button"
                                    class="close" data-dismiss="alert" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}
                            </div>
                        @endif
                        <section class="forms">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="card">
                                            <div class="card-header d-flex align-items-center">
                                                <h4>{{ trans('file.Create Discount') }}</h4>
                                            </div>
                                            <div class="card-body">
                                                <p class="italic">
                                                    <small>{{ trans('file.The field labels marked with * are required input fields') }}.</small>
                                                </p>
                                                {!! Form::open(['route' => 'superAdmin.discount.store', 'method' => 'post']) !!}
                                                <div class="row">
                                                    <div class="col-md-3 form-group">
                                                        <label>Name *</label>
                                                        <input type="text" name="name" required
                                                            class="form-control">
                                                    </div>
                                                    <div class="col-md-3 form-group">
                                                        <label>{{ trans('file.Discount Plan') }} *</label>
                                                        <select required name="discount_plan_id[]"
                                                            class="selectpicker form-control" data-live-search="true"
                                                            data-live-search-style="begins"
                                                            title="Select discount plan..." multiple>
                                                            @foreach ($lims_discount_plan_list as $discount_plan)
                                                                <option value="{{ $discount_plan->id }}">
                                                                    {{ $discount_plan->name }}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3 form-group">
                                                        <label>Applicable For *</label>
                                                        <select required name="applicable_for" class="form-control">
                                                            <option value="All">All Products</option>
                                                            <option value="Specific">Specific Products</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-3 mt-4">
                                                        <input type="checkbox" name="is_active" value="1" checked>
                                                        <label>Active</label>
                                                    </div>
                                                    <div class="col-md-9 form-group product-selection">
                                                        <label>Select Product *</label>
                                                        <input type="text" name="product_code" id="product-code"
                                                            class="form-control"
                                                            placeholder="Type product code seperated by comma">
                                                    </div>
                                                    <div class="col-md-9 form-group product-selection">
                                                        <div class="table-responsive ml-2">
                                                            <table id="product-table" class="table">
                                                                <thead>
                                                                    <tr>
                                                                        <th><i class="dripicons-view-apps"></i>No </th>
                                                                        <th>Product Name</th>
                                                                        <th>Product Code</th>
                                                                        <th>Item Code</th>
                                                                        <th><i class="dripicons-trash"></i></th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label>Valid From *</label>
                                                        <input type="text" name="valid_from" required
                                                            class="form-control date">
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label>Valid Till *</label>
                                                        <input type="text" name="valid_till" required
                                                            class="form-control date">
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label>Discount Type *</label>
                                                        <select name="type" class="form-control">
                                                            <option value="percentage">Percentage (%)</option>
                                                            <option value="flat">Flat</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label>Value *</label>
                                                        <input type="number" name="value" required
                                                            class="form-control">
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label>Minimum Qty *</label>
                                                        <input type="number" name="minimum_qty" required
                                                            class="form-control">
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label>Maximum Qty *</label>
                                                        <input type="number" name="maximum_qty" required
                                                            class="form-control">
                                                    </div>
                                                    <div class="col-md-4 form-group">
                                                        <label>Valid on the following days</label>
                                                        <ul style="list-style-type: none; margin-left: -30px;">
                                                            <li><input type="checkbox" name="days[]" value="Mon"
                                                                    checked>&nbsp; Monday</li>
                                                            <li><input type="checkbox" name="days[]" value="Tue"
                                                                    checked>&nbsp; Tuesday</li>
                                                            <li><input type="checkbox" name="days[]" value="Wed"
                                                                    checked>&nbsp; Wednesday</li>
                                                            <li><input type="checkbox" name="days[]" value="Thu"
                                                                    checked>&nbsp; Thursday</li>
                                                            <li><input type="checkbox" name="days[]" value="Fri"
                                                                    checked>&nbsp; Friday</li>
                                                            <li><input type="checkbox" name="days[]" value="Sat"
                                                                    checked>&nbsp; Saturday</li>
                                                            <li><input type="checkbox" name="days[]" value="Sun"
                                                                    checked>&nbsp; Sunday</li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-md-12 mt-2">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                                </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>

                    </div>

                    <footer class="main-footer">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-12">
                                    <p>&copy; SalePro | Developed By <span class="external">LionCoders</span> | V
                                        3.10.1</p>
                                </div>
                            </div>
                        </div>
                    </footer>

                    <!-- notification modal -->
                    <div id="notification-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">Send Notification</h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic"><small>The field labels marked with * are required input
                                            fields.</small></p>
                                    <form method="POST" action="https://salepropos.com/demo/notifications/store"
                                        accept-charset="UTF-8" enctype="multipart/form-data"><input name="_token"
                                            type="hidden" value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">
                                        <div class="row">
                                            <div class="col-md-4 form-group">
                                                <input type="hidden" name="sender_id" value="1">
                                                <label>User *</label>
                                                <select name="receiver_id" class="selectpicker form-control" required
                                                    data-live-search="true" data-live-search-style="begins"
                                                    title="Select user...">
                                                    <option value="9">staff (anda@gmail.com)</option>
                                                    <option value="19">shakalaka (shakalaka@gmail.com)</option>
                                                    <option value="21">modon (modon@gmail.com)</option>
                                                    <option value="22">dhiman (dhiman@gmail.com)</option>
                                                    <option value="39">maja (maja@maja.com)</option>
                                                </select>
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label>Reminder Date</label>
                                                <input type="text" name="reminder_date" class="form-control date"
                                                    value="10-09-2023">
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <label>Attach Document</label>
                                                <input type="file" name="document" class="form-control">
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <label>Message *</label>
                                                <textarea rows="5" name="message" class="form-control" required></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end notification modal -->

                    <!-- Category Modal -->
                    <div id="category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <form method="POST" action="https://salepropos.com/demo/category"
                                    accept-charset="UTF-8" enctype="multipart/form-data"><input name="_token"
                                        type="hidden" value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">
                                    <div class="modal-header">
                                        <h5 id="exampleModalLabel" class="modal-title">Add Category</h5>
                                        <button type="button" data-dismiss="modal" aria-label="Close"
                                            class="close"><span aria-hidden="true"><i
                                                    class="dripicons-cross"></i></span></button>
                                    </div>
                                    <div class="modal-body">
                                        <p class="italic"><small>The field labels marked with * are required input
                                                fields.</small></p>
                                        <div class="row">
                                            <div class="col-md-6 form-group">
                                                <label>Name *</label>
                                                <input required="required" class="form-control"
                                                    placeholder="Type category name..." name="name"
                                                    type="text">
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label>Image</label>
                                                <input type="file" name="image" class="form-control">
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label>Parent Category</label>
                                                <select name="parent_id" class="form-control selectpicker"
                                                    id="parent">
                                                    <option value="">No Parent</option>
                                                    <option value="1">Fruits</option>
                                                    <option value="2">electronics</option>
                                                    <option value="3">computer</option>
                                                    <option value="4">toy</option>
                                                    <option value="9">food</option>
                                                    <option value="12">accessories</option>
                                                    <option value="16">desktop</option>
                                                    <option value="19">Paracetamol</option>
                                                    <option value="20">Automobile</option>
                                                    <option value="21">Productos Caballero</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <input type="submit" value="Submit" class="btn btn-primary">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Category Modal -->

                    <!-- expense modal -->
                    <div id="expense-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">Add Expense</h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic"><small>The field labels marked with * are required input
                                            fields.</small></p>
                                    <form method="POST" action="https://salepropos.com/demo/expenses"
                                        accept-charset="UTF-8"><input name="_token" type="hidden"
                                            value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">
                                        <div class="row">
                                            <div class="col-md-6 form-group">
                                                <label>Date</label>
                                                <input type="text" name="created_at" class="form-control date"
                                                    placeholder="Choose date" />
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label>Expense Category *</label>
                                                <select name="expense_category_id" class="selectpicker form-control"
                                                    required data-live-search="true" data-live-search-style="begins"
                                                    title="Select Expense Category...">
                                                    <option value="1">washing (16718342)</option>
                                                    <option value="2">electric bill (60128975)</option>
                                                    <option value="4">snacks (1234)</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label>Warehouse *</label>
                                                <select name="warehouse_id" class="selectpicker form-control" required
                                                    data-live-search="true" data-live-search-style="begins"
                                                    title="Select Warehouse...">
                                                    <option value="1">warehouse 1</option>
                                                    <option value="2">warehouse 2</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label>Amount *</label>
                                                <input type="number" name="amount" step="any" required
                                                    class="form-control">
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label> Account</label>
                                                <select class="form-control selectpicker" name="account_id">
                                                    <option selected value="1">Sales Account [11111]</option>
                                                    <option value="3">Sa [21211]</option>
                                                    <option value="5">zuhair [bank-1]</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Note</label>
                                            <textarea name="note" rows="3" class="form-control"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end expense modal -->

                    <!-- sale return modal -->
                    <div id="add-sale-return" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <form method="GET" action="https://salepropos.com/demo/return-sale/create"
                                    accept-charset="UTF-8">
                                    <div class="modal-header">
                                        <h5 id="exampleModalLabel" class="modal-title">Add Sale Return</h5>
                                        <button type="button" data-dismiss="modal" aria-label="Close"
                                            class="close"><span aria-hidden="true"><i
                                                    class="dripicons-cross"></i></span></button>
                                    </div>
                                    <div class="modal-body">
                                        <p class="italic"><small>The field labels marked with * are required input
                                                fields.</small></p>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Sale Reference *</label>
                                                    <input type="text" name="reference_no" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <input class="btn btn-primary" type="submit" value="Submit">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- end sale return modal -->

                    <!-- purchase return modal -->
                    <div id="add-purchase-return" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <form method="GET" action="https://salepropos.com/demo/return-purchase/create"
                                    accept-charset="UTF-8">
                                    <div class="modal-header">
                                        <h5 id="exampleModalLabel" class="modal-title">Add Purchase Return</h5>
                                        <button type="button" data-dismiss="modal" aria-label="Close"
                                            class="close"><span aria-hidden="true"><i
                                                    class="dripicons-cross"></i></span></button>
                                    </div>
                                    <div class="modal-body">
                                        <p class="italic"><small>The field labels marked with * are required input
                                                fields.</small></p>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Purchase Reference *</label>
                                                    <input type="text" name="reference_no" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                        <input class="btn btn-primary" type="submit" value="Submit">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- end purchase return modal -->

                    <!-- account modal -->
                    <div id="account-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">Add Account</h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic"><small>The field labels marked with * are required input
                                            fields.</small></p>
                                    <form method="POST" action="https://salepropos.com/demo/accounts"
                                        accept-charset="UTF-8"><input name="_token" type="hidden"
                                            value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">
                                        <div class="form-group">
                                            <label>Account No *</label>
                                            <input type="text" name="account_no" required class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Name *</label>
                                            <input type="text" name="name" required class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Initial Balance</label>
                                            <input type="number" name="initial_balance" step="any"
                                                class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Note</label>
                                            <textarea name="note" rows="3" class="form-control"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end account modal -->

                    <!-- account statement modal -->
                    <div id="account-statement-modal" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">Account Statement</h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic"><small>The field labels marked with * are required input
                                            fields.</small></p>
                                    <form method="POST"
                                        action="https://salepropos.com/demo/accounts/account-statement"
                                        accept-charset="UTF-8"><input name="_token" type="hidden"
                                            value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">
                                        <div class="row">
                                            <div class="col-md-6 form-group">
                                                <label> Account</label>
                                                <select class="form-control selectpicker" name="account_id">
                                                    <option value="1">Sales Account [11111]</option>
                                                    <option value="3">Sa [21211]</option>
                                                    <option value="5">zuhair [bank-1]</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <label> Type</label>
                                                <select class="form-control selectpicker" name="type">
                                                    <option value="0">All</option>
                                                    <option value="1">Debit</option>
                                                    <option value="2">Credit</option>
                                                </select>
                                            </div>
                                            <div class="col-md-12 form-group">
                                                <label>Choose Your Date</label>
                                                <div class="input-group">
                                                    <input type="text"
                                                        class="account-statement-daterangepicker-field form-control"
                                                        required />
                                                    <input type="hidden" name="start_date" />
                                                    <input type="hidden" name="end_date" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end account statement modal -->

                    <!-- warehouse modal -->
                    <div id="warehouse-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">Warehouse Report</h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic"><small>The field labels marked with * are required input
                                            fields.</small></p>
                                    <form method="POST" action="https://salepropos.com/demo/report/warehouse_report"
                                        accept-charset="UTF-8"><input name="_token" type="hidden"
                                            value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">

                                        <div class="form-group">
                                            <label>Warehouse *</label>
                                            <select name="warehouse_id" class="selectpicker form-control" required
                                                data-live-search="true" id="warehouse-id"
                                                data-live-search-style="begins" title="Select warehouse...">
                                                <option value="1">warehouse 1</option>
                                                <option value="2">warehouse 2</option>
                                            </select>
                                        </div>

                                        <input type="hidden" name="start_date" value="2023-09-01" />
                                        <input type="hidden" name="end_date" value="2023-09-10" />

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end warehouse modal -->

                    <!-- user modal -->
                    <div id="user-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">User Report</h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic"><small>The field labels marked with * are required input
                                            fields.</small></p>
                                    <form method="POST" action="https://salepropos.com/demo/report/user_report"
                                        accept-charset="UTF-8"><input name="_token" type="hidden"
                                            value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">
                                        <div class="form-group">
                                            <label>User *</label>
                                            <select name="user_id" class="selectpicker form-control" required
                                                data-live-search="true" id="user-id"
                                                data-live-search-style="begins" title="Select user...">
                                                <option value="1">admin (12112)</option>
                                                <option value="9">staff (3123)</option>
                                                <option value="19">shakalaka (1212)</option>
                                                <option value="21">modon (2222)</option>
                                                <option value="22">dhiman (+8801111111101)</option>
                                                <option value="39">maja (444555)</option>
                                            </select>
                                        </div>

                                        <input type="hidden" name="start_date" value="2023-09-01" />
                                        <input type="hidden" name="end_date" value="2023-09-10" />

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end user modal -->

                    <!-- customer modal -->
                    <div id="customer-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">Customer Report</h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic"><small>The field labels marked with * are required input
                                            fields.</small></p>
                                    <form method="POST" action="https://salepropos.com/demo/report/customer_report"
                                        accept-charset="UTF-8"><input name="_token" type="hidden"
                                            value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">
                                        <div class="form-group">
                                            <label>Customer *</label>
                                            <select name="customer_id" class="selectpicker form-control" required
                                                data-live-search="true" id="customer-id"
                                                data-live-search-style="begins" title="Select customer...">
                                                <option value="1">dhiman (+8801111111101)</option>
                                                <option value="2">moinul (+8801200000001)</option>
                                                <option value="3">tariq (3424)</option>
                                                <option value="11">walk-in-customer (01923000001)</option>
                                                <option value="19">Ashfaq (1212)</option>
                                                <option value="21">Modon Miya (2222)</option>
                                                <option value="35">Debu (32423)</option>
                                                <option value="47">mmm (87897987)</option>
                                            </select>
                                        </div>

                                        <input type="hidden" name="start_date" value="2023-09-01" />
                                        <input type="hidden" name="end_date" value="2023-09-10" />

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end customer modal -->

                    <!-- customer group modal -->
                    <div id="customer-group-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">Customer Group Report</h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic"><small>The field labels marked with * are required input
                                            fields.</small></p>
                                    <form method="POST" action="https://salepropos.com/demo/report/customer-group"
                                        accept-charset="UTF-8"><input name="_token" type="hidden"
                                            value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">
                                        <div class="form-group">
                                            <label>Customer Group *</label>
                                            <select name="customer_group_id" class="selectpicker form-control"
                                                required data-live-search="true" id="customer-group-id"
                                                data-live-search-style="begins" title="Select customer group...">
                                                <option value="1">general</option>
                                                <option value="2">distributor</option>
                                                <option value="3">reseller</option>
                                            </select>
                                        </div>

                                        <input type="hidden" name="start_date" value="2023-09-01" />
                                        <input type="hidden" name="end_date" value="2023-09-10" />

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end customer group modal -->

                    <!-- supplier modal -->
                    <div id="supplier-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true" class="modal fade text-left">
                        <div role="document" class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 id="exampleModalLabel" class="modal-title">Supplier Report</h5>
                                    <button type="button" data-dismiss="modal" aria-label="Close"
                                        class="close"><span aria-hidden="true"><i
                                                class="dripicons-cross"></i></span></button>
                                </div>
                                <div class="modal-body">
                                    <p class="italic"><small>The field labels marked with * are required input
                                            fields.</small></p>
                                    <form method="POST" action="https://salepropos.com/demo/report/supplier"
                                        accept-charset="UTF-8"><input name="_token" type="hidden"
                                            value="gKyvdhewQ3ZaafoS8QUEb514r4wtLNNxbSVkGFtM">
                                        <div class="form-group">
                                            <label>Supplier *</label>
                                            <select name="supplier_id" class="selectpicker form-control" required
                                                data-live-search="true" id="supplier-id"
                                                data-live-search-style="begins" title="Select Supplier...">
                                                <option value="1">abdullah (231231)</option>
                                                <option value="3">ismail (23123123)</option>
                                            </select>
                                        </div>

                                        <input type="hidden" name="start_date" value="2023-09-01" />
                                        <input type="hidden" name="end_date" value="2023-09-10" />

                                        <div class="form-group">
                                            <button type="submit" class="btn btn-primary">Submit</button>
                                        </div>
                                        {!! Form::close() !!}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </section>


            </div>

        </div>


        {{-- Fetured image --}}
        <!-- Modal -->
        <div class="modal fade" id="image_file_manager" data-backdrop="static" data-keyboard="false" tabindex="-1"
            aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Image</h5>
                        <div id="msg"></div>
                        <div class="file-manager-search text-center pull-right">
                            <input type="text" id="input_search_image" placeholder="Search Image" name="search"
                                class="form-control">
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="file-manager">
                            <div class="file-manager-left">
                                <form id="dropzoneForm" enctype="multipart/form-data" class="dropzone"
                                    action="{{ route('superAdmin.media.upload') }}">
                                    @csrf
                                    <p class="file-manager-file-types">
                                        <span>JPG</span>
                                        <span>JPEG</span>
                                        <span>PNG</span>
                                        <span>GIF</span>
                                    </p>
                                    <p class="dm-upload-icon text-center mt-5">
                                        {{-- <i class="fas fa-cloud-upload-alt"></i> --}}
                                    </p>
                                </form>
                                <input type="hidden" name="id" id="selected_img_file_id">
                                {{-- =============== --}}

                            </div>
                            {{-- file-manager-left --}}
                            <div class="file-manager-middel">
                                <div class="file-manager-content">
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div id="image_file_upload_response">
                                                <div class="panel panel-default">
                                                    <div class="panel-body" id="uploaded_image">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            {{-- file-manager-middel --}}
                            <div class="file-manager-right">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input class="form-control" readonly type="text" name="name"
                                        id="selected_img_name">
                                </div>
                                <div class="form-group">
                                    <label>URL</label>
                                    <input class="form-control" readonly type="text" name="link"
                                        id="selected_img_file_path">
                                </div>
                                <div class="form-group">
                                    <label>Alt</label>
                                    <input class="form-control" type="text" name="alt" id="altText">
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input class="form-control" type="text" name="title" id="titleText">
                                </div>
                                <div class="form-group">
                                    <label>Caption</label>
                                    <input class="form-control" type="text" name="caption" id="captionText">
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <input class="form-control" type="text" name="description"
                                        id="descriptionText">
                                </div>
                            </div>
                            {{-- file-manager-right --}}
                        </div>
                    </div>

                    <div class="modal-footer">
                        <div class="file-manager-footer">
                            {{-- <form action="{{ route('superAdmin.users.delete') }}">
                            <input type="text" id="selected_img_name">
                            <button type="submit" class="fas fa-trash"></i>&nbsp;&nbsp; Delete </button>
                        </form> --}}
                            <button type="button" id="btn_img_delete"
                                class="btn btn-danger pull-left btn-file-delete"><i
                                    class="fas fa-trash"></i>&nbsp;&nbsp; Delete </button>

                            <button type="button" id="btn_img_select" class="btn btn-success btn-file-select"><i
                                    class="fas fa-check"></i>&nbsp;&nbsp; Select image</button>
                            {{-- Databese value insert --}}
                            {{-- <button type="submit" id="btn_img_select" class="btn btn-primary bg-olive btn-file-select"><i
                                class="fa fa-check"></i>&nbsp;&nbsp; Select image </button> --}}
                            <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    {{-- {!! Form::close() !!} --}}
                </div>
            </div>
        </div>
        {{-- </div> --}}
        {{-- Fetured image --}}

    </div>
    </div>
    <!-- /page content -->

    <!-- footer content -->
    @include('asset.footer')

    <!-- /footer content -->
    </div>
    {{-- wrapper --}}
    @include('asset.bottomfooter')

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.9.2/tinymce.min.js" referrerpolicy="origin"></script>
    <script type="text/javascript">
        $("ul#setting").siblings('a').attr('aria-expanded', 'true');
        $("ul#setting").addClass("show");
        $("ul#setting #discount-menu").addClass("active");
        $(".product-selection").hide();

        $("input[name='product_code']").on("input", function() {
            if ($(this).val().indexOf(',') > -1) {
                var code = $(this).val().slice(0, -1);

                var url = "{{ route('superAdmin.discount.search', ':code') }}";
                var listUrl = url.replace(':code', code);

                // alert(listUrl);

                $.get(listUrl, function(data) {
                    var newRow = $("<tr>");
                    var cols = '';
                    var rowindex = $("table#product-table tbody tr:last").index();
                    console.log(rowindex);
                    cols += '<td><input type="hidden" name="product_list[]" value="' + data[0] + '" />' + (
                        rowindex + 2) + '</td>';
                    cols += '<td>' + data[1] + '</td>';
                    cols += '<td>' + data[2] + '</td>';
                    cols += '<td>' + data[3] + '</td>';
                    cols +=
                        '<td><button type="button" class="pbtnDel btn btn-sm btn-danger">X</button></td>';
                    newRow.append(cols);
                    $("table#product-table tbody").append(newRow);
                });
                $(this).val('');
            }
        });

        //Delete product
        $("table#product-table tbody").on("click", ".pbtnDel", function(event) {
            $(this).closest("tr").remove();
        });

        $("select[name=applicable_for]").on("change", function() {
            if ($(this).val() == 'All') {
                $(".product-selection").hide(300);
            } else {
                $(".product-selection").show(300);
            }
        });

        $('.date').datepicker({
            format: "dd-mm-yyyy",
            startDate: "10-09-2023",
            autoclose: true,
            todayHighlight: true
        });
    </script>
    <script>
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', function() {
                navigator.serviceWorker.register('/salepro/service-worker.js').then(function(registration) {
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
        var theme = "light";
        if (theme == 'dark') {
            $('body').addClass('dark-mode');
            $('#switch-theme i').addClass('dripicons-brightness-low');
        } else {
            $('body').removeClass('dark-mode');
            $('#switch-theme i').addClass('dripicons-brightness-max');
        }
        $('#switch-theme').click(function() {
            if (theme == 'light') {
                theme = 'dark';
                var url = "https:\/\/salepropos.com\/demo\/switch-theme\/dark";
                $('body').addClass('dark-mode');
                $('#switch-theme i').addClass('dripicons-brightness-low');
            } else {
                theme = 'light';
                var url = "https:\/\/salepropos.com\/demo\/switch-theme\/light";
                $('body').removeClass('dark-mode');
                $('#switch-theme i').addClass('dripicons-brightness-max');
            }

            $.get(url, function(data) {
                console.log('theme changed to ' + theme);
            });
        });

        var alert_product = 2;

        if ($(window).outerWidth() > 1199) {
            $('nav.side-navbar').removeClass('shrink');
        }

        function myFunction() {
            setTimeout(showPage, 100);
        }

        function showPage() {
            document.getElementById("loader").style.display = "none";
            document.getElementById("content").style.display = "block";
        }

        $("div.alert:not(#update-alert-section)").delay(4000).slideUp(800);

        function confirmDelete() {
            if (confirm("Are you sure want to delete?")) {
                return true;
            }
            return false;
        }

        $("li#notification-icon").on("click", function(argument) {
            $.get('notifications/mark-as-read', function(data) {
                $("span.notification-number").text(alert_product);
            });
        });

        $("a#add-expense").click(function(e) {
            e.preventDefault();
            $('#expense-modal').modal();
        });

        $("a#send-notification").click(function(e) {
            e.preventDefault();
            $('#notification-modal').modal();
        });

        $("a#add-account").click(function(e) {
            e.preventDefault();
            $('#account-modal').modal();
        });

        $("a#account-statement").click(function(e) {
            e.preventDefault();
            $('#account-statement-modal').modal();
        });

        $("a#profitLoss-link").click(function(e) {
            e.preventDefault();
            $("#profitLoss-report-form").submit();
        });

        $("a#report-link").click(function(e) {
            e.preventDefault();
            $("#product-report-form").submit();
        });

        $("a#purchase-report-link").click(function(e) {
            e.preventDefault();
            $("#purchase-report-form").submit();
        });

        $("a#sale-report-link").click(function(e) {
            e.preventDefault();
            $("#sale-report-form").submit();
        });
        $("a#sale-report-chart-link").click(function(e) {
            e.preventDefault();
            $("#sale-report-chart-form").submit();
        });

        $("a#payment-report-link").click(function(e) {
            e.preventDefault();
            $("#payment-report-form").submit();
        });

        $("a#warehouse-report-link").click(function(e) {
            e.preventDefault();
            $('#warehouse-modal').modal();
        });

        $("a#user-report-link").click(function(e) {
            e.preventDefault();
            $('#user-modal').modal();
        });

        $("a#customer-report-link").click(function(e) {
            e.preventDefault();
            $('#customer-modal').modal();
        });

        $("a#customer-group-report-link").click(function(e) {
            e.preventDefault();
            $('#customer-group-modal').modal();
        });

        // $("a#supplier-report-link").click(function(e) {
        //     e.preventDefault();
        //     $('#supplier-modal').modal();
        // });

        $("a#due-report-link").click(function(e) {
            e.preventDefault();
            $("#customer-due-report-form").submit();
        });

        // $("a#supplier-due-report-link").click(function(e) {
        //     e.preventDefault();
        //     $("#supplier-due-report-form").submit();
        // });

        $(".account-statement-daterangepicker-field").daterangepicker({
            callback: function(startDate, endDate, period) {
                var start_date = startDate.format('YYYY-MM-DD');
                var end_date = endDate.format('YYYY-MM-DD');
                var title = start_date + ' To ' + end_date;
                $(this).val(title);
                $('#account-statement-modal input[name="start_date"]').val(start_date);
                $('#account-statement-modal input[name="end_date"]').val(end_date);
            }
        });

        $('.date').datepicker({
            format: "dd-mm-yyyy",
            autoclose: true,
            todayHighlight: true
        });

        $('.selectpicker').selectpicker({
            style: 'btn-link',
        });
    </script>

</body>

</html>
