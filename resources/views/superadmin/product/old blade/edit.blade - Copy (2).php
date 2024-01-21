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
                        <section class="forms">

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card">
                                        <div class="card-header d-flex align-items-center">
                                            <h4>Add Product</h4>
                                        </div>
                                        <div class="card-body">
                                            <p class="italic"><small>The field labels marked with * are required
                                                    input
                                                    fields.</small></p>
                                            <form action="{{ route('superAdmin.products.store') }}" method="POST"
                                                enctype="multipart/form-data">
                                                @csrf
                                                <form id="product-form">
                                                    <input type="hidden" name="id"
                                                        value="{{ $lims_product_data->id }}" />
                                                    <div class="row">
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Product Type *</strong> </label>
                                                                <div class="input-group">
                                                                    <select name="product_type" required
                                                                        class="form-control selectpicker"
                                                                        id="type">
                                                                        <option value="standard">Standard</option>
                                                                        <option value="combo">Combo</option>
                                                                        <option value="digital">Digital</option>
                                                                        <option value="service">Service</option>
                                                                    </select>
                                                                    <input type="hidden" name="type_hidden"
                                                                        value="{{ $lims_product_data->prodcut_type }}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>{{ trans('Product Name') }} *</strong> </label>
                                                                <input type="text" name="name"
                                                                    value="{{ $lims_product_data->prodcut_name }}"
                                                                    class="form-control mySelect_en slugsearch_en"
                                                                    id="mySelect_en" aria-describedby="name"
                                                                    onchange="myFunction_en()" required>
                                                                <span class="validation-msg" id="name-error"></span>
                                                            </div>
                                                            <input type="hidden" name="slug" id="slugValue"
                                                                class="form-control slugEn upslug_en slugValue_en"
                                                                required />
                                                            <script type="text/javascript">
                                                                function myFunction_en() {
                                                                    var strng = document.getElementById("mySelect_en").value;
                                                                    const spt = strng.split(" ");
                                                                    var imp = spt.join('_');
                                                                }
                                                                $('.slugsearch_en').on('change', function() {
                                                                    var strng = document.getElementById("mySelect_en").value;
                                                                    const spt = strng.split(" ");
                                                                    var imp = spt.join('_');
                                                                    var slg = document.getElementById("slugValue").value = imp;
                                                                    $value = $(this).val();
                                                                    // $value = $(this).val();

                                                                    $.ajax({
                                                                        type: 'get',
                                                                        url: "{{ route('superAdmin.products.slugsearch') }}",
                                                                        data: {
                                                                            'slug': slg
                                                                        },
                                                                        success: function(data) {
                                                                            console.log(data);
                                                                            if (data) {
                                                                                document.getElementById("slugValue").value = data + "_1";
                                                                            } else {
                                                                                document.getElementById("slugValue").value = data;
                                                                            }
                                                                            // alert(data)
                                                                            // $('.slugValue').data
                                                                            // $('table').html(data);
                                                                        }
                                                                    });
                                                                })
                                                            </script>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Product Code *</strong> </label>
                                                                <div class="input-group">
                                                                    <input type="text" name="product_code"
                                                                        value="{{ $lims_product_data->product_code }}"
                                                                        class="form-control barcode" id="code"
                                                                        aria-describedby="code" required>
                                                                    <div class="input-group-append">
                                                                        <button id="genbutton" type="button"
                                                                            class="btn btn-sm btn-default"
                                                                            title="Generate"><i
                                                                                class="fa fa-refresh"></i></button>
                                                                    </div>
                                                                </div>
                                                                <span class="validation-msg" id="code-error"></span>
                                                            </div>
                                                        </div>
                                                        <div id="digital" class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Attach File *</strong> </label>
                                                                <div class="input-group">
                                                                    <input type="file" id="file" name="file"
                                                                        class="form-control">
                                                                </div>
                                                                <span class="validation-msg"></span>
                                                            </div>
                                                        </div>
                                                        <div id="combo" class="col-md-9 mb-1">
                                                            <label>{{ trans('file.add_product') }}</label>
                                                            <div class="search-box input-group mb-3">
                                                                <button class="btn btn-secondary"><i
                                                                        class="fa fa-barcode"></i></button>
                                                                <input type="text" name="product_code_name"
                                                                    id="lims_productcodeSearch"
                                                                    placeholder="Please type product code and select..."
                                                                    class="form-control" />
                                                            </div>
                                                            <label>{{ trans('file.Combo Products') }}</label>
                                                            <div class="table-responsive">
                                                                <table id="myTable"
                                                                    class="table table-hover order-list">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>{{ trans('file.product') }}</th>
                                                                            <th>{{ trans('file.Quantity') }}</th>
                                                                            <th>{{ trans('file.Unit Price') }}</th>
                                                                            <th><i class="dripicons-trash"></i></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        @if ($lims_product_data->type == 'combo')
                                                                            @php
                                                                                $product_list = explode(',', $lims_product_data->product_list);
                                                                                $qty_list = explode(',', $lims_product_data->qty_list);
                                                                                $variant_list = explode(',', $lims_product_data->variant_list);
                                                                                $price_list = explode(',', $lims_product_data->price_list);
                                                                            @endphp
                                                                            @foreach ($product_list as $key => $id)
                                                                                <tr>
                                                                                    @php
                                                                                        $product = App\Models\Product::find($id);
                                                                                        if ($lims_product_data->variant_list && $variant_list[$key]) {
                                                                                            $product_variant_data = App\Models\ProductVariant::select('item_code')
                                                                                                ->FindExactProduct($id, $variant_list[$key])
                                                                                                ->first();
                                                                                            $product->code = $product_variant_data->item_code;
                                                                                        } else {
                                                                                            $variant_list[$key] = '';
                                                                                        }
                                                                                    @endphp
                                                                                    <td>{{ $product->name }}
                                                                                        [{{ $product->code }}]</td>
                                                                                    <td><input type="number"
                                                                                            class="form-control qty"
                                                                                            name="product_qty[]"
                                                                                            value="{{ $qty_list[$key] }}"
                                                                                            step="any"></td>
                                                                                    <td><input type="number"
                                                                                            class="form-control unit_price"
                                                                                            name="unit_price[]"
                                                                                            value="{{ $price_list[$key] }}"
                                                                                            step="any" /></td>
                                                                                    <td><button type="button"
                                                                                            class="ibtnDel btn btn-danger btn-sm">X</button>
                                                                                    </td>
                                                                                    <input type="hidden"
                                                                                        class="product-id"
                                                                                        name="product_id[]"
                                                                                        value="{{ $id }}" />
                                                                                    <input type="hidden"
                                                                                        class="variant-id"
                                                                                        name="variant_id[]"
                                                                                        value="{{ $variant_list[$key] }}" />
                                                                                </tr>
                                                                            @endforeach
                                                                        @endif
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <input type="hidden" name="brand"
                                                                    value="{{ $lims_product_data->brand_id }}">
                                                                <label>{{ trans('file.brand') }} *</strong> </label>
                                                                <div class="input-group">
                                                                    <select name="brand_id" required
                                                                        class="selectpicker form-control"
                                                                        data-live-search="true"
                                                                        data-live-search-style="begins"
                                                                        title="Select brand...">
                                                                        @foreach ($lims_brand_list as $brand)
                                                                            <option value="{{ $brand->id }}">
                                                                                {{ $brand->brand_name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <input type="hidden" name="category"
                                                                    value="{{ $lims_product_data->category_id }}">
                                                                <label>{{ trans('file.category') }} *</strong> </label>
                                                                <div class="input-group">
                                                                    <select name="category_id" required
                                                                        class="selectpicker form-control"
                                                                        data-live-search="true"
                                                                        data-live-search-style="begins"
                                                                        title="Select Category...">
                                                                        @foreach ($lims_category_list as $category)
                                                                            <option value="{{ $category->id }}">
                                                                                {{ $category->name_en }}
                                                                            </option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div id="cost" class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Product Cost *</strong> </label>
                                                                <input type="number"
                                                                    value="{{ $lims_product_data->prodcut_coust }}"
                                                                    name="prodcut_coust" required class="form-control"
                                                                    step="any">
                                                                <span class="validation-msg"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Product Price *</strong> </label>
                                                                <input type="number"
                                                                    value="{{ $lims_product_data->prodcut_price }}"
                                                                    name="prodcut_price" required class="form-control"
                                                                    step="any">
                                                                <span class="validation-msg"></span>
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="hidden" name="qty" id="qtyValue"
                                                                    value="0.000">
                                                            </div>

                                                        </div>

                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Product Quantity *</strong> </label>
                                                                <input type="number" name="quantity"
                                                                    value="{{ $lims_product_data->qty }}"
                                                                    id="mySelect_qty" required class="form-control"
                                                                    step="any" onchange="myFunction_qty()">
                                                                <span class="validation-msg"></span>
                                                            </div>
                                                            <script>
                                                                function myFunction_qty() {
                                                                    var strng = document.getElementById("mySelect_qty").value;
                                                                    document.getElementById("qtyValue").value = strng;
                                                                }
                                                            </script>
                                                        </div>

                                                        <div id="alert-qty" class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Alert Quantity</strong> </label>
                                                                <input type="number" name="alert_qty"
                                                                    value="{{ $lims_product_data->alert_qty }}"
                                                                    class="form-control" step="any">
                                                            </div>
                                                        </div>

                                                        <div id="unit" class="col-md-12">
                                                            <div class="row ">


                                                                <div class="col-md-4">
                                                                    <label>{{ trans('Product Unit') }} *</strong>
                                                                    </label>
                                                                    <div class="input-group">
                                                                        <select required
                                                                            class="form-control selectpicker"
                                                                            data-live-search="true"
                                                                            data-live-search-style="begins"
                                                                            title="Select unit..."
                                                                            name="sale_unit_id">
                                                                            @foreach ($lims_unit_list as $unit)
                                                                                @if ($unit->base_unit != null)
                                                                                    <option
                                                                                        value="{{ $unit->id }}">
                                                                                        {{ $unit->unit_code }}</option>
                                                                                @endif
                                                                            @endforeach
                                                                        </select>
                                                                        <input type="hidden" name="sale_unit"
                                                                            value="{{ $lims_product_data->unit_id }}">
                                                                    </div>
                                                                </div>


                                                                <div class="col-md-4">
                                                                    <label>{{ trans('Sale Unit') }} *</strong>
                                                                    </label>
                                                                    <div class="input-group">
                                                                        <select required
                                                                            class="form-control selectpicker"
                                                                            data-live-search="true"
                                                                            data-live-search-style="begins"
                                                                            title="Select unit..."
                                                                            name="	sale_unit_id">
                                                                            @foreach ($lims_unit_list as $unit)
                                                                                @if ($unit->base_unit != null)
                                                                                    <option
                                                                                        value="{{ $unit->id }}">
                                                                                        {{ $unit->unit_code }}</option>
                                                                                @endif
                                                                            @endforeach
                                                                        </select>
                                                                        <input type="hidden" name="sale_unit"
                                                                            value="{{ $lims_product_data->sale_unit_id }}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <label>{{ trans('Purchase Unit') }} *</strong>
                                                                    </label>
                                                                    <div class="input-group">
                                                                        <select required
                                                                            class="form-control selectpicker"
                                                                            data-live-search="true"
                                                                            data-live-search-style="begins"
                                                                            title="Select unit..."
                                                                            name="purchase_unit_id">
                                                                            @foreach ($lims_unit_list as $unit)
                                                                                @if ($unit->base_unit != null)
                                                                                    <option
                                                                                        value="{{ $unit->id }}">
                                                                                        {{ $unit->unit_code }}</option>
                                                                                @endif
                                                                            @endforeach
                                                                        </select>
                                                                        <input type="hidden" name="purchase_unit"
                                                                            value="{{ $lims_product_data->purchase_unit_id }}">
                                                                    </div>
                                                                </div>



                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>{{ trans('Tax') }} *</strong>
                                                            </label>
                                                            <div class="input-group">
                                                                <input type="hidden" name="tax"
                                                                    value="{{ $lims_product_data->tax_id }}">
                                                                <select required class="form-control selectpicker"
                                                                    data-live-search="true"
                                                                    data-live-search-style="begins"
                                                                    title="Select unit..." name="tax_id">
                                                                    @foreach ($lims_tax_list as $tax)
                                                                        <option value="{{ $tax->id }}">
                                                                            {{ $tax->rate }}</option>
                                                                    @endforeach
                                                                </select>
                                                                <input type="hidden" name="purchase_unit"
                                                                    value="{{ $lims_product_data->purchase_unit_id }}">
                                                            </div>
                                                        </div>

                                                        <div id="regular_price" class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Regular price</strong> </label>
                                                                <input type="number" name="prodcut_regular_price"
                                                                    value="{{ $lims_product_data->prodcut_regular_price }}"
                                                                    class="form-control" step="any">
                                                            </div>
                                                        </div>
                                                        <div id="sell_price" class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Sell price</strong> </label>
                                                                <input type="number" name="prodcut_sell_price"
                                                                    value="{{ $lims_product_data->prodcut_sell_price }}"
                                                                    class="form-control" step="any">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group mt-3">
                                                                <input type="checkbox" name="is_initial_stock"
                                                                    value="1">&nbsp;
                                                                <label>Initial Stock</label>
                                                                <p class="italic">This feature will not work for
                                                                    product with
                                                                    variants and batches</p>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group mt-3">
                                                                @if ($lims_product_data->featured)
                                                                    <input type="checkbox" name="featured"
                                                                        value="1" checked>
                                                                @else
                                                                    <input type="checkbox" name="featured"
                                                                        value="1">
                                                                @endif
                                                                <label>{{ trans('Featured') }}</label>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6" id="initial-stock-section">
                                                            <div class="table-responsive ml-2">
                                                                <table id="diffPrice-table" class="table table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>{{ trans('Warehouse') }}</th>
                                                                            <th>{{ trans('Qty') }}</th>
                                                                        </tr>
                                                                        @php
                                                                            $warehouses = DB::table('warehouses')->get();
                                                                        @endphp
                                                                        @foreach ($warehouses as $warehouse)
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="hidden"
                                                                                        name="warehouse_id[]"
                                                                                        value="{{ $warehouse->id }}">
                                                                                    {{ $warehouse->name }}
                                                                                </td>
                                                                                <td><input type="number"
                                                                                        name="stockssss[]"
                                                                                        class="form-control"></td>
                                                                            </tr>
                                                                        @endforeach
                                                                    </thead>
                                                                    <tbody>
                                                                    </tbody>
                                                                </table>
                                                                {{-- <table class="table table-hover">
                                                                <thead>
                                                                    <tr>
                                                                        <th>Warehouse</th>
                                                                        <th>Qty</th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="hidden"
                                                                                name="stock_warehouse_id[]"
                                                                                value="1">
                                                                            warehouse 1
                                                                        </td>
                                                                        <td><input type="number" name="stock[]"
                                                                                min="0" class="form-control">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <input type="hidden"
                                                                                name="stock_warehouse_id[]"
                                                                                value="2">
                                                                            warehouse 2
                                                                        </td>
                                                                        <td><input type="number" name="stock[]"
                                                                                min="0" class="form-control">
                                                                        </td>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table> --}}
                                                            </div>
                                                        </div>
                                                        <div id="unit" class="col-md-12">
                                                            <div class="row ">
                                                                <div class="col-md-6 form-group col-sm-6">
                                                                    <label>{{ trans('Featured Image') }} *</strong>
                                                                    </label>
                                                                    <div class="input-group">

                                                                    </div>

                                                                </div>
                                                                <div class="col-md-6 col-sm-6 form-group">
                                                                    <label>{{ trans('Published') }}</strong> </label>
                                                                    <div class="input-group">

                                                                        <input type='text' id='datetimepicker'
                                                                            class="form-control" name="publish_at"
                                                                            value="{{ date('Y-m-d H:i', time()) }}" />


                                                                        <script type="text/javascript">
                                                                            // var today = new Date();
                                                                            // document.getElementById("datetime").value = today.getFullYear() +
                                                                            //     '-' + ('0' + (today.getMonth() + 1)).slice(-2) +
                                                                            //     '-' + ('0' + today.getDate()).slice(-2) +
                                                                            //     ' ' + ('0' + today.getHours()).slice(-2) +
                                                                            //     ':' + ('0' + today.getMinutes()).slice(-2) +
                                                                            //     ':' + ('0' + today.getSeconds()).slice(-2);
                                                                            $(function() {
                                                                                $('#datetimepicker').datetimepicker({
                                                                                    format: 'yyyy-mm-dd hh:ii',
                                                                                    //   format: 'yyyy-mm-dd hh:ii:ss',
                                                                                    autoclose: true,
                                                                                    timePicker: true,
                                                                                    todayHighlight: true,
                                                                                });
                                                                            });
                                                                        </script>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>{{ trans('Product Details') }}</label>
                                                                <textarea name="product_details" class="form-control tinymce-editor" rows="5">
                                                            {{ str_replace('@', '"', $lims_product_data->product_details) }}</textarea>


                                                                {{-- <textarea name="product_details" class="form-control tinymce-editor" rows="3"></textarea> --}}
                                                            </div>
                                                        </div>


                                                        <div class="col-md-12 mt-3" id="variant-option">
                                                            <h5><input name="is_variant" type="checkbox"
                                                                    id="is-variant" value="1">&nbsp; This product
                                                                has variant</h5>
                                                        </div>


                                                        <div class="col-md-12" id="variant-section">
                                                            <div class="row" id="variant-input-section">
                                                                <div class="col-md-4 form-group mt-2">
                                                                    <label>Option *</label>
                                                                    <input type="text" name="variant_option[]"
                                                                        class="form-control variant-field"
                                                                        placeholder="Size, Color model etc...">
                                                                </div>
                                                                <div class="col-md-6 form-group mt-2">
                                                                    <label>Value *</label>
                                                                    <input type="text" name="variant_value[]"
                                                                        class="type-variant form-control variant-field">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12 form-group">
                                                                <button type="button"
                                                                    class="btn btn-info add-more-variant"><i
                                                                        class="dripicons-plus"></i> Add More
                                                                    Variant</button>
                                                            </div>
                                                            <div class="table-responsive ml-2">
                                                                <table id="variant-table"
                                                                    class="table table-hover variant-list">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Name</th>
                                                                            <th>Item Code</th>
                                                                            <th>Additional Cost</th>
                                                                            <th>Additional Price</th>
                                                                            <th>Stock</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 mt-2" id="diffPrice-option">
                                                            <h5><input name="is_diffPrice" type="checkbox"
                                                                    id="is-diffPrice" value="1">&nbsp; This
                                                                product
                                                                has different price for
                                                                different warehouse</h5>
                                                        </div>
                                                        <div class="col-md-6" id="diffPrice-section">
                                                            <div class="table-responsive ml-2">
                                                                <table id="diffPrice-table" class="table table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>{{ trans('Warehouse') }}</th>
                                                                            <th>{{ trans('Price') }}</th>
                                                                            <th>{{ trans('Qty') }}</th>
                                                                        </tr>
                                                                        @php
                                                                            $warehouses = DB::table('warehouses')->get();
                                                                        @endphp
                                                                        @foreach ($warehouses as $warehouse)
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="hidden"
                                                                                        name="warehouse_id[]"
                                                                                        value="{{ $warehouse->id }}">
                                                                                    {{ $warehouse->name }}
                                                                                </td>
                                                                                <td><input type="number"
                                                                                        name="diff_price[]"
                                                                                        class="form-control">
                                                                                </td>
                                                                                <td><input type="number"
                                                                                        name="stock[]"
                                                                                        class="form-control"></td>
                                                                            </tr>
                                                                        @endforeach
                                                                    </thead>
                                                                    <tbody>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12 mt-3" id="batch-option">
                                                            <h5><input name="is_batch" type="checkbox" id="is-batch"
                                                                    value="1">&nbsp; This product has batch and
                                                                expired date
                                                            </h5>
                                                        </div>

                                                        {{-- <div class="col-md-12 mt-3" id="imei-option">
                                                        <h5><input name="is_imei" type="checkbox" id="is-imei"
                                                                value="1">&nbsp; This product has IMEI or
                                                            Serial
                                                            numbers
                                                        </h5>
                                                    </div> --}}
                                                        <div class="col-md-4 mt-3">
                                                            <input type="hidden" name="promotion_hidden"
                                                                value="{{ $lims_product_data->promotion }}">
                                                            <input name="promotion" type="checkbox" id="promotion"
                                                                value="1">&nbsp;
                                                            <label>
                                                                <h5>{{ trans('Add Promotional Price') }}</h5>
                                                            </label>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-4" id="promotion_price">
                                                                    <label>Promotional Price</label>
                                                                    <input type="number" name="promotion_price"
                                                                        value="{{ $lims_product_data->promotion_price }}"
                                                                        class="form-control" step="any" />
                                                                </div>
                                                                <div class="col-md-4" id="start_date">
                                                                    <div class="form-group">
                                                                        <label>Promotion Starts</label>
                                                                        <div class="input-group">
                                                                            <div class="input-group-prepend">
                                                                                <div class="input-group-text"><i
                                                                                        class="dripicons-calendar"></i>
                                                                                </div>
                                                                            </div>
                                                                            <input type="text" name="start_date"
                                                                                value="{{ $lims_product_data->start_date }}"
                                                                                id="starting_date"
                                                                                class="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4" id="last_date">
                                                                    <div class="form-group">
                                                                        <label>Promotion Ends</label>
                                                                        <div class="input-group">
                                                                            <div class="input-group-prepend">
                                                                                <div class="input-group-text"><i
                                                                                        class="dripicons-calendar"></i>
                                                                                </div>
                                                                            </div>
                                                                            <input type="text" name="end_date"
                                                                                value="{{ $lims_product_data->end_date }}"
                                                                                id="ending_date"
                                                                                class="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        {{-- <div class="col-md-12 mt-3">
                                                        <h5><input name="is_sync_disable" type="checkbox"
                                                                id="is_sync_disable" value="1">&nbsp;
                                                            Disable
                                                            Woocommerce Sync</h5>
                                                    </div> --}}

                                                    </div>
                                                    <div class="form-group mt-3">
                                                        <input type="submit" value="Submit" id="submit-btn"
                                                            class="btn btn-primary">
                                                    </div>
                                                </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </section>


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

    {{-- <script type="text/javascript" src="https://salepropos.com/demo/vendor/tinymce/js/tinymce/tinymce.min.js"></script> --}}
    <script type="text/javascript">
        $("ul#product").siblings('a').attr('aria-expanded', 'true');
        $("ul#product").addClass("show");
        var product_id = @php   echo json_encode($lims_product_data->id); @endphp;
        var is_batch = @php   echo json_encode($lims_product_data->is_batch); @endphp;
        var is_variant = @php   echo json_encode($lims_product_data->is_variant); @endphp;
        var redirectUrl = @php   echo json_encode(url('products')); @endphp;
        var variantPlaceholder = @php   echo json_encode(trans('file.Enter variant value seperated by comma')); @endphp;
        var variantIds = [];
        var combinations = [];
        var oldCombinations = [];
        var step;
        var count = 1;
        var customizedVariantCode = 1;
        var noOfVariantValue = @php   echo json_encode($noOfVariantValue); @endphp;
        console.log(noOfVariantValue);
        $('[data-toggle="tooltip"]').tooltip();

        $("#digital").hide();
        $("#combo").hide();
        $("select[name='type']").val($("input[name='type_hidden']").val());
        variantShowHide();
        diffPriceShowHide();
        if (is_batch)
            $("#variant-option").hide();
        if (is_variant) {
            var customizedVariantCode = 0;
            $("#batch-option").hide();
        }

        if ($("input[name='type_hidden']").val() == "digital") {
            $("input[name='cost']").prop('required', false);
            $("select[name='unit_id']").prop('required', false);
            hide();
            $("#digital").show();
        } else if ($("input[name='type_hidden']").val() == "service") {
            $("input[name='cost']").prop('required', false);
            $("select[name='unit_id']").prop('required', false);
            hide();
            $("#variant-section, #variant-option").hide();
        } else if ($("input[name='type_hidden']").val() == "combo") {
            $("input[name='cost']").prop('required', false);
            $("input[name='price']").prop('disabled', true);
            $("select[name='unit_id']").prop('required', false);
            hide();
            $("#combo").show();
        }

        var promotion = $("input[name='promotion_hidden']").val();
        if (promotion) {
            $("input[name='promotion']").prop('checked', true);
            $("#promotion_price").show(300);
            $("#start_date").show(300);
            $("#last_date").show(300);
        } else {
            $("#promotion_price").hide(300);
            $("#start_date").hide(300);
            $("#last_date").hide(300);
        }
        $("#promotion").on("change", function() {
            if ($(this).is(':checked')) {
                $("#promotion_price").show();
                $("#start_date").show();
                $("#last_date").show();
            } else {
                $("#promotion_price").hide();
                $("#start_date").hide();
                $("#last_date").hide();
            }
        });

        var starting_date = $('#starting_date');
        starting_date.datepicker({
            format: "dd-mm-yyyy",
            startDate: "14-08-2023",
            autoclose: true,
            todayHighlight: true
        });

        var ending_date = $('#ending_date');
        ending_date.datepicker({
            format: "dd-mm-yyyy",
            startDate: "14-08-2023",
            autoclose: true,
            todayHighlight: true
        });
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $('#genbutton').on("click", function() {

            // $.get('gencode', function(data) {
            //     let storage = data;
            // });

            $.get('gencode', function(data) {
                $("input[name='product_code']").val(data);
            });
        });

        $('.add-more-variant').on("click", function() {
            var htmlText =
                '<div class="col-md-4 form-group mt-2"><label>Option *</label><input type="text" name="variant_option[]" class="form-control variant-field" placeholder="Size, Color etc..."></div><div class="col-md-6 form-group mt-2"><label>Value *</label><input type="text" name="variant_value[]" class="type-variant form-control variant-field"></div>';
            $("#variant-input-section").append(htmlText);
            $('.type-variant').tagsInput();
        });

        //start variant related js
        $(function() {
            $('.type-variant').tagsInput();
        });

        (function($) {
            var delimiter = [];
            var inputSettings = [];
            var callbacks = [];

            $.fn.addTag = function(value, options) {
                if (count == noOfVariantValue)
                    customizedVariantCode = 1;
                options = jQuery.extend({
                    focus: false,
                    callback: true
                }, options);

                this.each(function() {
                    var id = $(this).attr('id');
                    var tagslist = $(this).val().split(_getDelimiter(delimiter[id]));
                    if (tagslist[0] === '') tagslist = [];

                    value = jQuery.trim(value);

                    if ((inputSettings[id].unique && $(this).tagExist(value)) || !_validateTag(value,
                            inputSettings[id], tagslist, delimiter[id])) {
                        $('#' + id + '_tag').addClass('error');
                        return false;
                    }

                    $('<span>', {
                        class: 'tag'
                    }).append(
                        $('<span>', {
                            class: 'tag-text'
                        }).text(value),
                        $('<button>', {
                            class: 'tag-remove'
                        }).click(function() {
                            return $('#' + id).removeTag(encodeURI(value));
                        })
                    ).insertBefore('#' + id + '_addTag');

                    tagslist.push(value);

                    $('#' + id + '_tag').val('');
                    if (options.focus) {
                        $('#' + id + '_tag').focus();
                    } else {
                        $('#' + id + '_tag').blur();
                    }

                    $.fn.tagsInput.updateTagsField(this, tagslist);

                    if (options.callback && callbacks[id] && callbacks[id]['onAddTag']) {
                        var f = callbacks[id]['onAddTag'];
                        f.call(this, this, value);
                    }

                    if (callbacks[id] && callbacks[id]['onChange']) {
                        var i = tagslist.length;
                        var f = callbacks[id]['onChange'];
                        f.call(this, this, value);
                    }

                    $(".type-variant").each(function(index) {
                        variantIds.splice(index, 1, $(this).attr('id'));
                    });
                    count++;
                    if (customizedVariantCode) {
                        first_variant_values = $('#' + variantIds[0]).val().split(_getDelimiter(delimiter[
                            variantIds[0]]));
                        combinations = first_variant_values;
                        step = 1;
                        while (step < variantIds.length) {
                            var newCombinations = [];
                            for (var i = 0; i < combinations.length; i++) {
                                new_variant_values = $('#' + variantIds[step]).val().split(_getDelimiter(
                                    delimiter[variantIds[step]]));
                                for (var j = 0; j < new_variant_values.length; j++) {
                                    newCombinations.push(combinations[i] + '/' + new_variant_values[j]);
                                }
                            }
                            combinations = newCombinations;
                            step++;
                        }
                        var rownumber = $('table.variant-list tbody tr:last').index();
                        if (rownumber > -1) {
                            oldCombinations = [];
                            oldAdditionalCost = [];
                            oldAdditionalPrice = [];
                            oldProductVariantId = [];
                            $(".variant-name").each(function(i) {
                                oldCombinations.push($(this).val());
                                oldProductVariantId.push($(
                                    'table.variant-list tbody tr:nth-child(' + (i + 1) + ')'
                                ).find('.product-variant-id').val());
                                oldAdditionalCost.push($('table.variant-list tbody tr:nth-child(' +
                                    (i + 1) + ')').find('.additional-cost').val());
                                oldAdditionalPrice.push($('table.variant-list tbody tr:nth-child(' +
                                    (i + 1) + ')').find('.additional-price').val());
                            });
                        }

                        $("table.variant-list tbody").remove();
                        var newBody = $("<tbody>");
                        for (i = 0; i < combinations.length; i++) {
                            var variant_name = combinations[i];
                            var item_code = variant_name + '-' + $("#code").val();
                            var newRow = $("<tr>");
                            var cols = '';
                            cols += '<td>' + variant_name +
                                '<input type="hidden" class="variant-name" name="variant_name[]" value="' +
                                variant_name + '" /></td>';
                            cols +=
                                '<td><input type="text" class="form-control item-code" name="item_code[]" value="' +
                                item_code + '" /></td>';
                            //checking if this variant already exist in the variant table
                            oldIndex = oldCombinations.indexOf(combinations[i]);
                            if (oldIndex >= 0) {
                                cols +=
                                    '<td><input type="number" class="form-control additional-cost" name="additional_cost[]" value="' +
                                    oldAdditionalCost[oldIndex] + '" step="any" /></td>';
                                cols +=
                                    '<td><input type="number" class="form-control additional-price" name="additional_price[]" value="' +
                                    oldAdditionalPrice[oldIndex] + '" step="any" /></td>';
                            } else {
                                cols +=
                                    '<td><input type="number" class="form-control additional-cost" name="additional_cost[]" value="" step="any" /></td>';
                                cols +=
                                    '<td><input type="number" class="form-control additional-price" name="additional_price[]" value="" step="any" /></td>';
                            }
                            newRow.append(cols);
                            newBody.append(newRow);
                        }
                        $("table.variant-list").append(newBody);
                    }
                });

                return false;
            };

            $.fn.removeTag = function(value) {
                value = decodeURI(value);

                this.each(function() {
                    var id = $(this).attr('id');

                    var old = $(this).val().split(_getDelimiter(delimiter[id]));

                    $('#' + id + '_tagsinput .tag').remove();

                    var str = '';
                    for (i = 0; i < old.length; ++i) {
                        if (old[i] != value) {
                            str = str + _getDelimiter(delimiter[id]) + old[i];
                        }
                    }

                    $.fn.tagsInput.importTags(this, str);

                    if (callbacks[id] && callbacks[id]['onRemoveTag']) {
                        var f = callbacks[id]['onRemoveTag'];
                        f.call(this, this, value);
                    }
                });

                return false;
            };

            $.fn.tagExist = function(val) {
                var id = $(this).attr('id');
                var tagslist = $(this).val().split(_getDelimiter(delimiter[id]));
                return (jQuery.inArray(val, tagslist) >= 0);
            };

            $.fn.importTags = function(str) {
                var id = $(this).attr('id');
                $('#' + id + '_tagsinput .tag').remove();
                $.fn.tagsInput.importTags(this, str);
            };

            $.fn.tagsInput = function(options) {
                var settings = jQuery.extend({
                    interactive: true,
                    placeholder: variantPlaceholder,
                    minChars: 0,
                    maxChars: null,
                    limit: null,
                    validationPattern: null,
                    width: 'auto',
                    height: 'auto',
                    autocomplete: null,
                    hide: true,
                    delimiter: ',',
                    unique: true,
                    removeWithBackspace: true
                }, options);

                var uniqueIdCounter = 0;

                this.each(function() {
                    if (typeof $(this).data('tagsinput-init') !== 'undefined') return;

                    $(this).data('tagsinput-init', true);

                    if (settings.hide) $(this).hide();

                    var id = $(this).attr('id');
                    if (!id || _getDelimiter(delimiter[$(this).attr('id')])) {
                        id = $(this).attr('id', 'tags' + new Date().getTime() + (++uniqueIdCounter)).attr(
                            'id');
                    }

                    var data = jQuery.extend({
                        pid: id,
                        real_input: '#' + id,
                        holder: '#' + id + '_tagsinput',
                        input_wrapper: '#' + id + '_addTag',
                        fake_input: '#' + id + '_tag'
                    }, settings);

                    delimiter[id] = data.delimiter;
                    inputSettings[id] = {
                        minChars: settings.minChars,
                        maxChars: settings.maxChars,
                        limit: settings.limit,
                        validationPattern: settings.validationPattern,
                        unique: settings.unique
                    };

                    if (settings.onAddTag || settings.onRemoveTag || settings.onChange) {
                        callbacks[id] = [];
                        callbacks[id]['onAddTag'] = settings.onAddTag;
                        callbacks[id]['onRemoveTag'] = settings.onRemoveTag;
                        callbacks[id]['onChange'] = settings.onChange;
                    }

                    var markup = $('<div>', {
                        id: id + '_tagsinput',
                        class: 'tagsinput'
                    }).append(
                        $('<div>', {
                            id: id + '_addTag'
                        }).append(
                            settings.interactive ? $('<input>', {
                                id: id + '_tag',
                                class: 'tag-input',
                                value: '',
                                placeholder: settings.placeholder
                            }) : null
                        )
                    );

                    $(markup).insertAfter(this);

                    $(data.holder).css('width', settings.width);
                    $(data.holder).css('min-height', settings.height);
                    $(data.holder).css('height', settings.height);

                    if ($(data.real_input).val() !== '') {
                        $.fn.tagsInput.importTags($(data.real_input), $(data.real_input).val());
                    }

                    // Stop here if interactive option is not chosen
                    if (!settings.interactive) return;

                    $(data.fake_input).val('');
                    $(data.fake_input).data('pasted', false);

                    $(data.fake_input).on('focus', data, function(event) {
                        $(data.holder).addClass('focus');

                        if ($(this).val() === '') {
                            $(this).removeClass('error');
                        }
                    });

                    $(data.fake_input).on('blur', data, function(event) {
                        $(data.holder).removeClass('focus');
                    });

                    if (settings.autocomplete !== null && jQuery.ui.autocomplete !== undefined) {
                        $(data.fake_input).autocomplete(settings.autocomplete);
                        $(data.fake_input).on('autocompleteselect', data, function(event, ui) {
                            $(event.data.real_input).addTag(ui.item.value, {
                                focus: true,
                                unique: settings.unique
                            });

                            return false;
                        });

                        $(data.fake_input).on('keypress', data, function(event) {
                            if (_checkDelimiter(event)) {
                                $(this).autocomplete("close");
                            }
                        });
                    } else {
                        $(data.fake_input).on('blur', data, function(event) {
                            $(event.data.real_input).addTag($(event.data.fake_input).val(), {
                                focus: true,
                                unique: settings.unique
                            });

                            return false;
                        });
                    }

                    // If a user types a delimiter create a new tag
                    $(data.fake_input).on('keypress', data, function(event) {
                        if (_checkDelimiter(event)) {
                            event.preventDefault();

                            $(event.data.real_input).addTag($(event.data.fake_input).val(), {
                                focus: true,
                                unique: settings.unique
                            });

                            return false;
                        }
                    });

                    $(data.fake_input).on('paste', function() {
                        $(this).data('pasted', true);
                    });

                    // If a user pastes the text check if it shouldn't be splitted into tags
                    $(data.fake_input).on('input', data, function(event) {
                        if (!$(this).data('pasted')) return;

                        $(this).data('pasted', false);

                        var value = $(event.data.fake_input).val();

                        value = value.replace(/\n/g, '');
                        value = value.replace(/\s/g, '');

                        var tags = _splitIntoTags(event.data.delimiter, value);

                        if (tags.length > 1) {
                            for (var i = 0; i < tags.length; ++i) {
                                $(event.data.real_input).addTag(tags[i], {
                                    focus: true,
                                    unique: settings.unique
                                });
                            }

                            return false;
                        }
                    });

                    // Deletes last tag on backspace
                    data.removeWithBackspace && $(data.fake_input).on('keydown', function(event) {
                        if (event.keyCode == 8 && $(this).val() === '') {
                            event.preventDefault();
                            var lastTag = $(this).closest('.tagsinput').find('.tag:last > span')
                                .text();
                            var id = $(this).attr('id').replace(/_tag$/, '');
                            $('#' + id).removeTag(encodeURI(lastTag));
                            $(this).trigger('focus');
                        }
                    });

                    // Removes the error class when user changes the value of the fake input
                    $(data.fake_input).keydown(function(event) {
                        // enter, alt, shift, esc, ctrl and arrows keys are ignored
                        if (jQuery.inArray(event.keyCode, [13, 37, 38, 39, 40, 27, 16, 17, 18,
                                225
                            ]) === -1) {
                            $(this).removeClass('error');
                        }
                    });
                });

                return this;
            };

            $.fn.tagsInput.updateTagsField = function(obj, tagslist) {
                var id = $(obj).attr('id');
                $(obj).val(tagslist.join(_getDelimiter(delimiter[id])));
            };

            $.fn.tagsInput.importTags = function(obj, val) {
                $(obj).val('');

                var id = $(obj).attr('id');
                var tags = _splitIntoTags(delimiter[id], val);

                for (i = 0; i < tags.length; ++i) {
                    $(obj).addTag(tags[i], {
                        focus: false,
                        callback: false
                    });
                }

                if (callbacks[id] && callbacks[id]['onChange']) {
                    var f = callbacks[id]['onChange'];
                    f.call(obj, obj, tags);
                }
            };

            var _getDelimiter = function(delimiter) {
                if (typeof delimiter === 'undefined') {
                    return delimiter;
                } else if (typeof delimiter === 'string') {
                    return delimiter;
                } else {
                    return delimiter[0];
                }
            };

            var _validateTag = function(value, inputSettings, tagslist, delimiter) {
                var result = true;

                if (value === '') result = false;
                if (value.length < inputSettings.minChars) result = false;
                if (inputSettings.maxChars !== null && value.length > inputSettings.maxChars) result = false;
                if (inputSettings.limit !== null && tagslist.length >= inputSettings.limit) result = false;
                if (inputSettings.validationPattern !== null && !inputSettings.validationPattern.test(value))
                    result = false;

                if (typeof delimiter === 'string') {
                    if (value.indexOf(delimiter) > -1) result = false;
                } else {
                    $.each(delimiter, function(index, _delimiter) {
                        if (value.indexOf(_delimiter) > -1) result = false;
                        return false;
                    });
                }

                return result;
            };

            var _checkDelimiter = function(event) {
                var found = false;

                if (event.which === 13) {
                    return true;
                }

                if (typeof event.data.delimiter === 'string') {
                    if (event.which === event.data.delimiter.charCodeAt(0)) {
                        found = true;
                    }
                } else {
                    $.each(event.data.delimiter, function(index, delimiter) {
                        if (event.which === delimiter.charCodeAt(0)) {
                            found = true;
                        }
                    });
                }

                return found;
            };

            var _splitIntoTags = function(delimiter, value) {
                if (value === '') return [];

                if (typeof delimiter === 'string') {
                    return value.split(delimiter);
                } else {
                    var tmpDelimiter = '∞';
                    var text = value;

                    $.each(delimiter, function(index, _delimiter) {
                        text = text.split(_delimiter).join(tmpDelimiter);
                    });

                    return text.split(tmpDelimiter);
                }

                return [];
            };
        })(jQuery);





        tinymce.init({
            selector: 'textarea',
            height: 130,
            plugins: [
                'advlist autolink lists link image charmap print preview anchor textcolor',
                'searchreplace visualblocks code fullscreen',
                'insertdatetime media table contextmenu paste code wordcount'
            ],
            toolbar: 'insert | undo redo |  formatselect | bold italic backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat',
            branding: false
        });

        var brand = $("input[name='brand']").val();
        $('select[name=brand_id]').val(brand);

        var cat = $("input[name='category']").val();
        $('select[name=category_id]').val(cat);

        var tax = $("input[name='tax']").val();
        if (tax) {
            $('select[name=tax_id]').val(tax);
        }

        function calculate_price() {
            var price = 0;
            $(".qty").each(function() {
                rowindex = $(this).closest('tr').index();
                quantity = $(this).val();
                unit_price = $('table.order-list tbody tr:nth-child(' + (rowindex + 1) + ') .unit_price').val();
                price += quantity * unit_price;
            });
            $('input[name="price"]').val(price);
        }

        function hide() {
            $("#cost").hide();
            $("#unit").hide();
            $("#alert-qty").hide();
        }


        if ($("input[name='unit']").val()) {
            $('select[name=unit_id]').val($("input[name='unit']").val());
            populate_unit($("input[name='unit']").val());
        }



        $('select[name="unit_id"]').on('change', function() {
            unitID = $(this).val();
            if (unitID) {
                populate_unit_second(unitID);
            } else {
                $('select[name="sale_unit_id"]').empty();
                $('select[name="purchase_unit_id"]').empty();
            }
        });


        // =================================

        // =================================

        $("input[name='is_batch']").on("change", function() {
            if ($(this).is(':checked')) {
                $("#variant-option").hide(300);
            } else
                $("#variant-option").show(300);
        });

        $("input[name='is_variant']").on("change", function() {
            variantShowHide();
        });

        $("input[name='is_diffPrice']").on("change", function() {
            diffPriceShowHide();
        });

        function variantShowHide() {
            if ($("#is-variant").is(':checked')) {
                $("#variant-section").show(300);
                $("#batch-option").hide(300);
                $(".variant-field").prop("required", true);
            } else {
                $("#variant-section").hide(300);
                $("#batch-option").show(300);
                $(".variant-field").prop("required", false);
            }
        };

        function diffPriceShowHide() {
            if ($("#is-diffPrice").is(':checked')) {
                $("#diffPrice-section").show(300);
            } else {
                $("#diffPrice-section").hide(300);
            }
        };
    </script>

</body>

</html>
