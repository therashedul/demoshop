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
                                                <h4>{{ trans('Create Discount') }}</h4>
                                            </div>
                                            <div class="card-body">
                                                <p class="italic">
                                                    <small>{{ trans('The field labels marked with * are required input fields') }}.</small>
                                                </p>
                                                {!! Form::open(['route' => 'superAdmin.discount.store', 'method' => 'post']) !!}
                                                <div class="row">
                                                    <div class="col-md-3 form-group">
                                                        <label>Name *</label>
                                                        <input type="text" name="name" required
                                                            class="form-control">
                                                    </div>
                                                    <div class="col-md-3 form-group">
                                                        <label>{{ trans('Discount Plan') }} *</label>
                                                        <select required name="discount_plan_id[]"
                                                            class="selectpicker form-control" data-live-search="true"
                                                            data-live-search-style="begins"
                                                            title="Select discount plan..." multiple>
                                                            @foreach ($limsdiscountplanlist as $discount_plan)
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
                                                                        {{-- <th>Item Code</th> --}}
                                                                        <th><i class="dripicons-trash"></i>Delete</th>
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

                </div>
                </div>
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
                    // cols += '<td>' + data[3] + '</td>';
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
