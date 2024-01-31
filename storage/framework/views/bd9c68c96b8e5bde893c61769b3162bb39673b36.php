<!DOCTYPE html>
<html lang="en">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title><?php echo e(config('app.name', 'Url')); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSRF Token -->
<meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

<head>

    <?php echo $__env->make('asset.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        var startTime = new Date();
    </script>
    <link href="<?php echo e(asset('css/custom-prodcut.css')); ?>" rel="stylesheet">
    <style>
        /* ========================= */

        @media (min-width: 1200px) {
            .modal-lg {
                max-width: 1250px !important;
            }
        }

        .modal-file-manager .modal-header .modal-title {
            float: left;
        }

        .modal-file-manager .modal-content {
            border-radius: 4px;
        }

        .modal-file-manager .modal-body {
            padding: 0;
        }

        .file-manager {
            width: 100%;
            max-width: 100%;
            display: table;
        }

        .file-manager-content {
            height: 422px;
            overflow-y: auto;
        }

        .file-manager-left {
            width: 20%;
            display: table-cell;
            border-right: 1px solid #eee;
            vertical-align: top;
            padding: 15px;
            background-color: #dce0e6;
        }

        .file-manager-middel {
            width: auto;
            display: table-cell;
            vertical-align: top;
            padding: 15px;
        }

        .file-manager-right {
            width: 20%;
            display: table-cell;
            vertical-align: top;
            padding: 15px;
            background-color: #dce0e6;
        }

        .file-manager-left .btn-upload {
            display: block;
            font-size: 14px;
            position: relative;
            cursor: pointer !important;
            padding: 8px 14px;
        }

        .file-manager-left .btn-upload span {
            cursor: pointer !important;
            z-index: 10 !important;
        }

        .file-manager-left .btn-upload input {
            cursor: pointer !important;
        }

        .col-file-manager {
            float: left;
            width: auto;
            padding: 5px;
        }

        .file-box {
            display: block;
            width: 100%;
            border: 1px solid #eee;
            cursor: pointer;
            text-align: center;
            position: relative;
            border-radius: 2px;
        }

        .file-box .image-container {
            display: block;
            width: 122px;
            height: 100px;
            overflow: hidden;
            text-align: center;
            border-radius: 2px;
        }

        .file-box .icon-container {
            padding: 10px;
            height: 110px;
        }

        .file-box .image-container img {
            margin: 0 auto;
            position: relative;
            width: auto;
            min-width: 100%;
            max-width: none;
            height: 100%;
            margin-left: 50%;
            transform: translateX(-50%);
            object-fit: cover;
        }

        .file-box .file-name {
            width: 100%;
            position: absolute;
            bottom: 0;
            left: 0;
            font-size: 12px;
            line-height: 14px;
            background-color: #f4f4f4;
            padding: 2px;
            display: block;
            text-align: center;
            word-break: break-all;
        }

        #audio_file_manager .file-box,
        #video_file_manager .file-box {
            height: 132px;
            text-align: center;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .file-icon {
            width: 80px;
            margin: 0 auto;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            cursor: pointer;
        }

        .file-manager .selected {
            box-shadow: 0 0 3px rgba(40, 174, 141, 1);
            border: 1px solid rgba(40, 174, 141, 1);
        }

        .file-manager-footer {
            margin-left: 235px;
        }

        .btn-file-delete {
            display: none;
        }

        .btn-file-select {
            display: none;
        }

        .file-manager-list-item-name {
            width: 100%;
            padding: 0 5px;
            margin: 0;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            cursor: pointer;
        }

        .input-file-label {
            width: 190px;
            background-color: #5bc0de;
            color: #fff;
            text-align: center;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            padding: 0 5px;
            font-size: 12px;
        }

        .loader-file-manager {
            display: none;
            position: relative;
            width: 100%;
            text-align: center;
            margin-top: 10px;
        }

        .loader-file-manager img {
            position: relative;
            width: 50px;
            height: 50px;
        }

        .file-manager-search {
            /* position: absolute;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    margin-left: 235px; */
        }

        #image_file_manager .modal-header .close {
            padding: 1rem 1rem;
            margin: -1rem 1rem auto;
        }

        .file-manager-search input {
            border-radius: 2px;
            width: 300px;
            text-align: center
        }

        .dm-uploaded-files .bg-success {
            background-color: #28a745;
        }

        .file-manager-file-types {
            width: 100%;
            position: relative;
            margin: 0;
            left: 0;
            right: 0;
            top: 15px;
            text-align: center;
        }

        .file-manager-file-types span {
            display: inline-block;
            font-size: 11px;
            margin-right: 2px;
            margin-bottom: 2px;
            color: #979ba1 !important;
            padding: 2px 4px;
            border: 1px dashed #dce0e6 !important;
            border-radius: 2px;
        }

        @media (max-width: 900px) {
            .file-manager-left {
                display: block !important;
                width: 100% !important;
                float: left;
            }

            .file-manager-middel {
                display: block !important;
                width: 100% !important;
                float: left;
            }

            .file-manager-footer {
                margin-left: 0 !important;
            }

            .file-manager-search {
                position: relative;
                margin: 0;
                margin-top: 5px;
                display: block;
            }

            .file-manager-search input {
                width: 100%;
            }
        }

        a.upload-text {
            font-size: 1vw;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 10px;
        }

        div#post_select_image_container {
            width: 150px;
            height: 150px;
            margin-bottom: 5%;
        }

        div#post_select_image_container .post-select-image-container img {
            width: 100%;
        }

        .btn-browse-files {
            background-color: transparent !important;
            color: #979ba1;
            border-color: #cfd3d9 !important;
            margin-top: 10px;
        }

        /* Hide scrollbar for Chrome, Safari and Opera */
        .file-manager-content::-webkit-scrollbar {
            display: none;
            background: transparent;
            width: 0;
            /* Remove scrollbar space */
            /* Optional: just make scrollbar invisible */
        }

        /* Hide scrollbar for IE, Edge and Firefox */
        .file-manager-content {
            -ms-overflow-style: none;
            /* IE and Edge */
            scrollbar-width: none;
            /* Firefox */
        }

        .lang_en {
            margin-bottom: 3%;
        }
    </style>
</head>


<body class="hold-transition sidebar-mini layout-fixed" onbeforeunload="MyFunction();">
    <div class="wrapper">
        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60"
                width="60">
        </div>

        <!-- Navbar -->
        <?php echo $__env->make('asset.nav', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        <?php echo $__env->make('asset.top', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
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
                                            <form action="<?php echo e(route('superAdmin.products.update')); ?>" method="POST"
                                                enctype="multipart/form-data">
                                                <?php echo csrf_field(); ?>
                                                <form id="product-form">
                                                    <input type="hidden" name="id"
                                                        value="<?php echo e($limsproductdata->id); ?>" />
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
                                                                        value="<?php echo e($limsproductdata->product_type); ?>">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label><?php echo e(trans('Product Name')); ?> *</strong> </label>
                                                                <input type="text" name="name"
                                                                    value="<?php echo e($limsproductdata->product_name); ?>"
                                                                    class="form-control mySelect_en slugsearch_en"
                                                                    id="mySelect_en" aria-describedby="name"
                                                                    onchange="myFunction_en()" required>
                                                                <span class="validation-msg" id="name-error"></span>
                                                            </div>
                                                            <input type="hidden" name="slug" id="slugValue"
                                                                class="form-control slugEn upslug_en slugValue_en"
                                                                value="<?php echo e($limsproductdata->slug); ?>" />
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
                                                                        url: "<?php echo e(route('superAdmin.products.slugsearch')); ?>",
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
                                                                        value="<?php echo e($limsproductdata->product_code); ?>"
                                                                        class="form-control barcode" id="code"
                                                                        aria-describedby="code" required readonly>
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
                                                            <label><?php echo e(trans('add_product')); ?></label>
                                                            <div class="search-box input-group mb-3">
                                                                <button class="btn btn-secondary"><i
                                                                        class="fa fa-barcode"></i></button>
                                                                <input type="text" name="product_code_name"
                                                                    id="lims_productcodeSearch"
                                                                    placeholder="Please type product code and select..."
                                                                    class="form-control" />
                                                            </div>
                                                            <label><?php echo e(trans('Combo Products')); ?></label>
                                                            <div class="table-responsive">
                                                                <table id="myTable"
                                                                    class="table table-hover order-list">
                                                                    <thead>
                                                                        <tr>
                                                                            <th><?php echo e(trans('product')); ?></th>
                                                                            <th><?php echo e(trans('Quantity')); ?></th>
                                                                            <th><?php echo e(trans('Unit Price')); ?></th>
                                                                            <th><i class="dripicons-trash"></i></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <?php if($limsproductdata->type == 'combo'): ?>
                                                                            <?php
                                                                                $product_list = explode(',', $limsproductdata->product_list);
                                                                                $qty_list = explode(',', $limsproductdata->qty_list);
                                                                                $variant_list = explode(',', $limsproductdata->variant_list);
                                                                                $price_list = explode(',', $limsproductdata->price_list);
                                                                            ?>
                                                                            <?php $__currentLoopData = $product_list; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $id): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                                <tr>
                                                                                    <?php
                                                                                        $product = App\Models\Product::find($id);
                                                                                        if ($limsproductdata->variant_list && $variant_list[$key]) {
                                                                                            $product_variant_data = App\Models\ProductVariant::select('item_code')
                                                                                                ->FindExactProduct($id, $variant_list[$key])
                                                                                                ->first();
                                                                                            $product->code = $product_variant_data->item_code;
                                                                                        } else {
                                                                                            $variant_list[$key] = '';
                                                                                        }
                                                                                    ?>
                                                                                    <td><?php echo e($product->product_name); ?>

                                                                                        [<?php echo e($product->product_code); ?>]</td>
                                                                                    <td><input type="number"
                                                                                            class="form-control qty"
                                                                                            name="product_qty[]"
                                                                                            value="<?php echo e($qty_list[$key]); ?>"
                                                                                            step="any"></td>
                                                                                    <td><input type="number"
                                                                                            class="form-control unit_price"
                                                                                            name="unit_price[]"
                                                                                            value="<?php echo e($price_list[$key]); ?>"
                                                                                            step="any" /></td>
                                                                                    <td><button type="button"
                                                                                            class="ibtnDel btn btn-danger btn-sm">X</button>
                                                                                    </td>
                                                                                    <input type="hidden"
                                                                                        class="product-id"
                                                                                        name="product_id[]"
                                                                                        value="<?php echo e($id); ?>" />
                                                                                    <input type="hidden"
                                                                                        class="variant-id"
                                                                                        name="variant_id[]"
                                                                                        value="<?php echo e($variant_list[$key]); ?>" />
                                                                                </tr>
                                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                        <?php endif; ?>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <input type="hidden" name="brand"
                                                                    value="<?php echo e($limsproductdata->brand_id); ?>">
                                                                <label><?php echo e(trans('brand')); ?> *</strong> </label>
                                                                <div class="input-group">
                                                                    <select name="brand_id" required
                                                                        class="selectpicker form-control"
                                                                        data-live-search="true"
                                                                        data-live-search-style="begins"
                                                                        title="Select brand...">
                                                                        <?php $__currentLoopData = $limsbrandlist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $brand): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                            <option value="<?php echo e($brand->id); ?>">
                                                                                <?php echo e($brand->brand_name); ?></option>
                                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <input type="hidden" name="category"
                                                                    value="<?php echo e($limsproductdata->category_id); ?>">
                                                                <label><?php echo e(trans('category')); ?> *</strong> </label>
                                                                <div class="input-group">
                                                                    <select name="category_id" required
                                                                        class="selectpicker form-control"
                                                                        data-live-search="true"
                                                                        data-live-search-style="begins"
                                                                        title="Select Category...">
                                                                        <?php $__currentLoopData = $limscategorylist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                            <option value="<?php echo e($category->id); ?>">
                                                                                <?php echo e($category->name_en); ?>

                                                                            </option>
                                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div id="cost" class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Product Cost *</strong> </label>
                                                                <input type="number"
                                                                    value="<?php echo e($limsproductdata->product_cost); ?>"
                                                                    name="product_cost" required class="form-control"
                                                                    step="any">
                                                                <span class="validation-msg"></span>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Product Price *</strong> </label>
                                                                <input type="number"
                                                                    value="<?php echo e($limsproductdata->product_price); ?>"
                                                                    name="product_price" required class="form-control"
                                                                    step="any">
                                                                <span class="validation-msg"></span>
                                                            </div>
                                                            <div class="form-group">
                                                                <input type="hidden" name="qty" id="qtyValue"
                                                                    value="0.000">
                                                            </div>
                                                        </div>

                                                        

                                                        <div id="alert-qty" class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Alert Quantity</strong> </label>
                                                                <input type="number" name="alert_qty"
                                                                    value="<?php echo e($limsproductdata->alert_qty); ?>"
                                                                    class="form-control" step="any">
                                                            </div>
                                                        </div>

                                                        <div id="unit" class="col-md-12">
                                                            <div class="row ">

                                                                <div class="col-md-4">
                                                                    <label><?php echo e(trans('Product Unit')); ?> *</strong>
                                                                    </label>
                                                                    <div class="input-group">
                                                                        <select required
                                                                            class="form-control selectpicker"
                                                                            data-live-search="true"
                                                                            data-live-search-style="begins"
                                                                            title="Select unit..." name="unit_id">
                                                                            <?php $__currentLoopData = $limsunitlist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $unit): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                                <?php if($unit->base_unit != null): ?>
                                                                                    <option
                                                                                        value="<?php echo e($unit->id); ?>">
                                                                                        <?php echo e($unit->unit_code); ?></option>
                                                                                <?php endif; ?>
                                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                        </select>
                                                                        <input type="hidden" name="unit"
                                                                            value="<?php echo e($limsproductdata->unit_id); ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4">
                                                                    <label><?php echo e(trans('Sale Unit')); ?></strong>
                                                                    </label>
                                                                    <div class="input-group">
                                                                        <select class="form-control "
                                                                            name="sale_unit_id" id="sale-unit">
                                                                        </select>
                                                                        <input type="hidden" name="sale_unit"
                                                                            value="<?php echo e($limsproductdata->sale_unit_id); ?>">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 mt-2">
                                                                    <div class="form-group">
                                                                        <label><?php echo e(trans('Purchase Unit')); ?></strong>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <select class="form-control "
                                                                                name="purchase_unit_id">
                                                                            </select>
                                                                            <input type="hidden" name="purchase_unit"
                                                                                value="<?php echo e($limsproductdata->purchase_unit_id); ?>">
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </div>
                                                        </div>

                                                        
                                                        <div class="col-md-4">
                                                            <label><?php echo e(trans('Tax')); ?> *</strong>
                                                            </label>
                                                            <div class="input-group">
                                                                <input type="hidden" name="tax"
                                                                    value="<?php echo e($limsproductdata->tax_id); ?>">
                                                                <select required class="form-control selectpicker"
                                                                    data-live-search="true"
                                                                    data-live-search-style="begins"
                                                                    title="Select unit..." name="tax_id">
                                                                    <option selected value="0">Select Tax</option>
                                                                    <?php $__currentLoopData = $limstaxlist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tax): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                        <option selected value="<?php echo e($tax->id); ?>">
                                                                            <?php echo e($tax->rate); ?></option>
                                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                </select>
                                                                <input type="hidden" name="purchase_unit"
                                                                    value="<?php echo e($limsproductdata->purchase_unit_id); ?>">
                                                            </div>
                                                        </div>

                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <input type="hidden" name="tax_method_id"
                                                                    value="<?php echo e($limsproductdata->tax_method); ?>">
                                                                <label><?php echo e(trans('Tax Method')); ?></strong> </label>
                                                                <select name="tax_method"
                                                                    class="form-control selectpicker">

                                                                    <?php if($limsproductdata->tax_method == '1'): ?>
                                                                        <option selected value="1">
                                                                            <?php echo e(trans('Exclusive')); ?></option>

                                                                        <option value="2">
                                                                            <?php echo e(trans('Inclusive')); ?></option>
                                                                    <?php else: ?>
                                                                        <option selected value="2">
                                                                            <?php echo e(trans('Inclusive')); ?></option>

                                                                        <option value="1">
                                                                            <?php echo e(trans('Exclusive')); ?></option>
                                                                    <?php endif; ?>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div id="regular_price" class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Regular price</strong> </label>
                                                                <input type="number" name="product_regular_price"
                                                                    value="<?php echo e($limsproductdata->product_regular_price); ?>"
                                                                    class="form-control" step="any">
                                                            </div>
                                                        </div>
                                                        <div id="sell_price" class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Sell price</strong> </label>
                                                                <input type="number" name="product_sell_price"
                                                                    value="<?php echo e($limsproductdata->product_sell_price); ?>"
                                                                    class="form-control" step="any">
                                                            </div>
                                                        </div>
                                                        

                                                        

                                                        <div id="unit" class="col-md-12">
                                                            <div class="row ">
                                                                <div class="col-md-6 form-group col-sm-6">
                                                                    <div class="x_content" id="">
                                                                        <div class="form-group">
                                                                            <a href="" class="upload-text"
                                                                                type="text" data-toggle="modal"
                                                                                data-target="#image_file_manager">
                                                                                Featured image
                                                                            </a>
                                                                            <?php if(!empty($limsproductdata->product_image)): ?>
                                                                                <div id="post_select_image_container"
                                                                                    class="post-select-image-container">
                                                                                    <?php if($limsproductdata->product_image != null): ?>
                                                                                        <button class="pull-right mt-4"
                                                                                            onclick="displayimageRemove()"
                                                                                            id="btn_delete">
                                                                                            <i class="fa fa-times"></i>
                                                                                        </button>
                                                                                    <?php endif; ?>
                                                                                    <img src="<?php echo e(asset('images/' . $limsproductdata->product_image)); ?>"
                                                                                        id="selected_image_file"
                                                                                        alt="" height="135px"
                                                                                        width="135px">
                                                                                </div>
                                                                            <?php else: ?>
                                                                                <div id="post_select_image_container"
                                                                                    class="post-select-image-container">
                                                                                    <a href=""
                                                                                        class="upload-text"
                                                                                        type="text"
                                                                                        data-toggle="modal"
                                                                                        data-target="#image_file_manager">
                                                                                        <img src="<?php echo e(asset('img/profile/blank-img.jpg')); ?>"
                                                                                            width="170px"
                                                                                            height="200px"
                                                                                            alt=""
                                                                                            title="">
                                                                                    </a>
                                                                                </div>
                                                                            <?php endif; ?>
                                                                            <input type="hidden" name="upload_id"
                                                                                value="">
                                                                            <input type="hidden" name="image_id"
                                                                                id="image_id" value="">
                                                                            <input type="hidden" name="image_name"
                                                                                id="image_name"
                                                                                value="<?php echo e($limsproductdata->product_image); ?>">
                                                                            <input type="hidden" name="alt"
                                                                                id="alt_value" value="">
                                                                            <input type="hidden" name="title"
                                                                                id="title_value" value="">
                                                                            <input type="hidden" name="caption"
                                                                                id="caption_value" value="">
                                                                            <input type="hidden" name="description"
                                                                                id="description_value" value="">
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="col-md-6 col-sm-6 form-group">
                                                                    <label><?php echo e(trans('Published')); ?></strong> </label>
                                                                    <div class="input-group">

                                                                        <input type='text' id='datetimepicker'
                                                                            class="form-control" name="publish_at"
                                                                            value="<?php echo e(date('Y-m-d H:i', time())); ?>" />


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
                                                                <label><?php echo e(trans('Product Details')); ?></label>
                                                                <textarea name="product_details" class="form-control tinymce-editor" rows="5">
                                                            <?php echo e(str_replace('@', '"', $limsproductdata->product_details)); ?></textarea>


                                                                
                                                            </div>
                                                        </div>


                                                        
                                                        <div class="col-md-12">
                                                            <h5>
                                                                <input type="hidden" value="0"
                                                                    class="js-switch" name="status"
                                                                    <?php echo e($limsproductdata->is_active == 0 ? 'checked' : ''); ?>>
                                                                <input type="checkbox" value="1"
                                                                    class="js-switch" name="status"
                                                                    <?php echo e($limsproductdata->is_active == 1 ? 'checked' : ''); ?>>
                                                                &nbsp;
                                                                Status
                                                            </h5>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <h5>
                                                                <input type="hidden" value="0"
                                                                    class="js-switch" name="trending"
                                                                    <?php echo e($limsproductdata->trending == 0 ? 'checked' : ''); ?>>
                                                                <input type="checkbox" value="1"
                                                                    class="js-switch" name="trending"
                                                                    <?php echo e($limsproductdata->trending == 1 ? 'checked' : ''); ?>>
                                                                &nbsp;
                                                                Tranding
                                                            </h5>
                                                        </div>
                                                        <div class="col-md-12 ">

                                                            <h5>
                                                                <?php if($limsproductdata->featured): ?>
                                                                    <input type="checkbox" name="featured"
                                                                        value="1" checked>
                                                                <?php else: ?>
                                                                    <input type="checkbox" name="featured"
                                                                        value="1">
                                                                <?php endif; ?>
                                                                &nbsp;
                                                                Featured Produt
                                                            </h5>

                                                        </div>
                                                        <div class="col-md-12 mt-3" id="variant-option">
                                                            <?php if($limsproductdata->is_variant): ?>
                                                                <h5 class="d-none"><input name="is_variant"
                                                                        type="checkbox" id="is-variant"
                                                                        value="1" checked>&nbsp;
                                                                    <?php echo e(trans('This product has variant')); ?></h5>
                                                            <?php else: ?>
                                                                <h5><input name="is_variant" type="checkbox"
                                                                        id="is-variant" value="1">&nbsp;
                                                                    <?php echo e(trans('This product has variant')); ?>

                                                                </h5>
                                                            <?php endif; ?>
                                                        </div>
                                                        <div class="col-md-12" id="variant-section">
                                                            <?php if($limsproductdata->variant_option): ?>
                                                                <div class="row" id="variant-input-section">
                                                                    <?php $__currentLoopData = $limsproductdata->variant_option; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $variant_option): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                        <?php
                                                                        $noofvariantvalue += count(explode(',', $limsproductdata->variant_value[$key]));
                                                                        ?>
                                                                        <div class="col-md-4 form-group mt-2">
                                                                            <label><?php echo e(trans('Option')); ?> *</label>
                                                                            <input type="text"
                                                                                name="variant_option[]"
                                                                                class="form-control variant-field"
                                                                                value="<?php echo e($limsproductdata->variant_option[$key]); ?>">
                                                                        </div>
                                                                        <div class="col-md-6 form-group mt-2">
                                                                            <label><?php echo e(trans('Value')); ?> *</label>
                                                                            <input type="text"
                                                                                name="variant_value[]"
                                                                                class="type-variant form-control variant-field"
                                                                                value="<?php echo e($limsproductdata->variant_value[$key]); ?>">
                                                                        </div>
                                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                </div>
                                                            <?php endif; ?>
                                                            <div class="col-md-12 form-group">
                                                                <button type="button"
                                                                    class="btn btn-info add-more-variant"><i
                                                                        class="dripicons-plus"></i>
                                                                    <?php echo e(trans('Add More Variant')); ?></button>
                                                            </div>
                                                            <div class="table-responsive ml-2">
                                                                <table id="variant-table"
                                                                    class="table table-hover variant-list">
                                                                    <thead>
                                                                        <tr>
                                                                            <th><?php echo e(trans('name')); ?></th>
                                                                            <th><?php echo e(trans('Item Code')); ?></th>
                                                                            <th><?php echo e(trans('Additional Cost')); ?> </th>
                                                                            <th><?php echo e(trans('Additional Price')); ?> </th>
                                                                            <th><?php echo e(trans('Stock')); ?></th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>

                                                                        <?php $__currentLoopData = $limsproductvariantdata; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $variant): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                            <tr>
                                                                                <td><?php echo e($variant->variant_name); ?>

                                                                                    <input type="hidden"
                                                                                        class="form-control variant-name"
                                                                                        name="variant_name[]"
                                                                                        value="<?php echo e($variant->variant_name); ?>" />
                                                                                </td>
                                                                                <td><input type="text"
                                                                                        class="form-control"
                                                                                        name="item_code[]"
                                                                                        value="<?php echo e($variant->pivot['item_code']); ?>" />
                                                                                </td>
                                                                                <td><input type="number"
                                                                                        class="form-control additional-cost"
                                                                                        name="additional_cost[]"
                                                                                        value="<?php echo e($variant->pivot['additional_cost']); ?>"
                                                                                        step="any" /></td>
                                                                                <td><input type="number"
                                                                                        class="form-control additional-price"
                                                                                        name="additional_price[]"
                                                                                        value="<?php echo e($variant->pivot['additional_price']); ?>"
                                                                                        step="any" /></td>
                                                                                <td><input type="number"
                                                                                        class="form-control additional-qty"
                                                                                        name="additional_qty[]"
                                                                                        value="<?php echo e($variant->pivot['qty']); ?>"
                                                                                        step="any" />
                                                                                </td>
                                                                            </tr>
                                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="col-md-12 mt-2" id="diffPrice-option">
                                                            <?php if($limsproductdata->is_diffPriceWareHouse): ?>
                                                                <h5><input name="is_diffPriceWareHouse"
                                                                        type="checkbox" id="is-diffPrice"
                                                                        value="1" checked>&nbsp;
                                                                    <?php echo e(trans('This product has different price for different warehouse')); ?>

                                                                </h5>
                                                            <?php else: ?>
                                                                <h5><input name="is_diffPriceWareHouse"
                                                                        type="checkbox" id="is-diffPrice"
                                                                        value="1">&nbsp;
                                                                    <?php echo e(trans('This product has different price for different warehouse')); ?>

                                                                </h5>
                                                            <?php endif; ?>
                                                        </div>
                                                        <div class="col-md-12" id="diffPrice-section">
                                                            <div class="table-responsive ml-2">
                                                                <table id="diffPrice-table" class="table table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                            <th><?php echo e(trans('Warehouse')); ?></th>
                                                                            <th><?php echo e(trans('Price')); ?></th>
                                                                            <th><?php echo e(trans('Stock')); ?></th>
                                                                        </tr>
                                                                        <?php $__currentLoopData = $limswarehouselist; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $warehouse): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                            <tr>
                                                                                <td>
                                                                                    <input type="hidden"
                                                                                        name="warehouse_id[]"
                                                                                        value="<?php echo e($warehouse->id); ?>">
                                                                                    <?php echo e($warehouse->name); ?>

                                                                                </td>
                                                                                <?php
                                                                                    $product_warehouse = \App\Models\ProductWarehouse::FindProductWithoutVariant($limsproductdata->id, $warehouse->id)->first();
                                                                                ?>
                                                                                <td>
                                                                                    <?php if($product_warehouse): ?>
                                                                                        <input type="number"
                                                                                            name="diff_price[]"
                                                                                            class="form-control"
                                                                                            value="<?php echo e($product_warehouse->price); ?>">
                                                                                    <?php else: ?>
                                                                                        <input type="number"
                                                                                            name="diff_price[]"
                                                                                            class="form-control">
                                                                                    <?php endif; ?>
                                                                                </td>
                                                                                <td>
                                                                                    <?php if($product_warehouse): ?>
                                                                                        <input type="number"
                                                                                            name="warehouse_qty[]"
                                                                                            class="form-control"
                                                                                            value="<?php echo e($product_warehouse->qty); ?>">
                                                                                    <?php else: ?>
                                                                                        <input type="number"
                                                                                            name="warehouse_qty[]"
                                                                                            class="form-control">
                                                                                    <?php endif; ?>
                                                                                </td>
                                                                            </tr>
                                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                                    </thead>
                                                                    <tbody>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-12 mt-3" id="batch-option">
                                                            <?php if($limsproductdata->is_batch): ?>
                                                                <h5><input name="is_batch" type="checkbox"
                                                                        id="is-batch" value="1" checked>&nbsp;
                                                                    <?php echo e(trans('This product has batch and expired date')); ?>

                                                                </h5>
                                                            <?php else: ?>
                                                                <h5><input name="is_batch" type="checkbox"
                                                                        id="is-batch" value="1">&nbsp;
                                                                    <?php echo e(trans('This product has batch and expired date')); ?>

                                                                </h5>
                                                            <?php endif; ?>
                                                        </div>

                                                        
                                                        <div class="col-md-4 mt-3">
                                                            <input type="hidden" name="promotion_hidden"
                                                                value="<?php echo e($limsproductdata->promotion); ?>">
                                                            <input name="promotion" type="checkbox" id="promotion"
                                                                value="1">&nbsp;
                                                            <label>
                                                                <h5><?php echo e(trans('Add Promotional Price')); ?></h5>
                                                            </label>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="row">
                                                                <div class="col-md-4" id="promotion_price">
                                                                    <label>Promotional Price</label>
                                                                    <input type="number" name="promotion_price"
                                                                        value="<?php echo e($limsproductdata->promotion_price); ?>"
                                                                        class="form-control" step="any" />
                                                                </div>
                                                                <div class="col-md-4" id="starting_date">
                                                                    <div class="form-group">
                                                                        <label>Promotion Starts</label>
                                                                        <div class="input-group">
                                                                            <div class="input-group-prepend">
                                                                                <div class="input-group-text"><i
                                                                                        class="dripicons-calendar"></i>
                                                                                </div>
                                                                            </div>

                                                                            <input type="text" name="start_date"
                                                                                value="<?php echo e($limsproductdata->start_date); ?>"
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
                                                                            <input type="text" name="last_date"
                                                                                value="<?php echo e($limsproductdata->end_date); ?>"
                                                                                id="last_date"
                                                                                class="form-control" />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        

                                                        <div class="form-group mt-3">
                                                            <input type="submit" value="Update" id="submit-btn"
                                                                class="btn btn-primary">
                                                        </div>
                                                </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </section>


                    </div>


                    
                    <div class="modal fade" id="image_file_manager">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Image</h5>
                                    <div id="msg"></div>
                                    <div class="file-manager-search text-center pull-right">
                                        <input type="text" id="input_search_image" placeholder="Search Image"
                                            name="search" class="form-control">
                                    </div>

                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                
                                <div class="modal-body">
                                    <div class="file-manager">
                                        <div class="file-manager-left">
                                            <form id="dropzoneForm" enctype="multipart/form-data" class="dropzone"
                                                action="<?php echo e(route('superAdmin.media.upload')); ?>">
                                                <?php echo csrf_field(); ?>
                                                <p class="file-manager-file-types">
                                                    <span>JPG</span>
                                                    <span>JPEG</span>
                                                    <span>PNG</span>
                                                    <span>GIF</span>
                                                </p>
                                                <p class="dm-upload-icon text-center mt-5">
                                                    
                                                </p>
                                            </form>
                                            <input type="hidden" name="id" id="selected_img_file_id">
                                            
                                            
                                        </div>
                                        
                                        <div class="file-manager-middel">
                                            <div class="file-manager-content">
                                                <div class="col-sm-12 col-md-12">
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
                                        
                                        <div class="file-manager-right">
                                            <div class="form-group">
                                                <label>Name</label>
                                                <input class="form-control" readonly type="text" name="name"
                                                    id="selected_img_name">
                                            </div>
                                            <div class="form-group">
                                                <label>URL</label>
                                                <input class="form-control" type="text" name="link"
                                                    id="selected_img_file_path">
                                            </div>
                                            <div class="form-group">
                                                <label>Alt</label>
                                                <input class="form-control" type="text" name="alt"
                                                    id="altText">
                                            </div>
                                            <div class="form-group">
                                                <label>Title</label>
                                                <input class="form-control" type="text" name="title"
                                                    id="titleText">
                                            </div>
                                            <div class="form-group">
                                                <label>Caption</label>
                                                <input class="form-control" type="text" name="caption"
                                                    id="captionText">
                                            </div>
                                            <div class="form-group">
                                                <label>Description</label>
                                                <input class="form-control" type="text" name="description"
                                                    id="descriptionText">
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="file-manager-footer">

                                        <button type="button" id="btn_img_delete"
                                            class="btn btn-danger pull-left btn-file-delete"><i
                                                class="fas fa-trash"></i>&nbsp;&nbsp; Delete </button>

                                        <button type="button" id="btn_img_select"
                                            class="btn btn-success btn-file-select"><i
                                                class="fas fa-check"></i>&nbsp;&nbsp; Select image</button>
                                        
                                        
                                        <button type="button" class="btn btn-primary"
                                            data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    


                </div>
            </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <?php echo $__env->make('asset.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

        <!-- /footer content -->
    </div>
    
    <?php echo $__env->make('asset.bottomfooter', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.9.2/tinymce.min.js" referrerpolicy="origin"></script>

    
    <script type="text/javascript">
        $("ul#product").siblings('a').attr('aria-expanded', 'true');
        $("ul#product").addClass("show");
        var product_id = <?php   echo json_encode($limsproductdata->id); ?>;
        var is_batch = <?php   echo json_encode($limsproductdata->is_batch); ?>;
        var is_variant = <?php   echo json_encode($limsproductdata->is_variant); ?>;
        var redirectUrl = <?php   echo json_encode(url('products')); ?>;
        var variantPlaceholder = <?php   echo json_encode(trans('Enter variant value seperated by comma')); ?>;
        var variantIds = [];
        var combinations = [];
        var oldCombinations = [];
        var step;
        var count = 1;
        var customizedVariantCode = 1;
        var noofvariantvalue = <?php   echo json_encode($noofvariantvalue); ?>;
        console.log(noofvariantvalue);
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
            $("#starting_date").show(300);
            $("#last_date").show(300);
        } else {
            $("#promotion_price").hide(300);
            $("#starting_date").hide(300);
            $("#last_date").hide(300);
        }
        $("#promotion").on("change", function() {
            if ($(this).is(':checked')) {
                $("#promotion_price").show();
                $("#starting_date").show();
                $("#last_date").show();
            } else {
                $("#promotion_price").hide();
                $("#starting_date").hide();
                $("#last_date").hide();
            }
        });

        var starting_date = $('#starting_date');
        starting_date.datepicker({
            format: "yyyy-mm-dd",
            autoclose: true,
            todayHighlight: true
        });

        var last_date = $('#last_date');
        last_date.datepicker({
            format: "yyyy-mm-dd",
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
                if (count == noofvariantvalue)
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
                            oldAdditionalqty = [];
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

                                oldAdditionalqty.push($('table.variant-list tbody tr:nth-child(' +
                                    (i + 1) + ')').find('.additional-qty').val());
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
                                cols +=
                                    '<td><input type="number" class="form-control additional-qty" name="additional_qty[]" value="' +
                                    oldAdditionalqty[oldIndex] + '" step="any" /></td>';
                            } else {
                                cols +=
                                    '<td><input type="number" class="form-control additional-cost" name="additional_cost[]" value="" step="any" /></td>';
                                cols +=
                                    '<td><input type="number" class="form-control additional-price" name="additional_price[]" value="" step="any" /></td>';
                                cols +=
                                    '<td><input type="number" class="form-control additional-qty" name="additional_qty[]" value="" step="any" /></td>';
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

        if ($("input[name='unit']").val()) {
            $('select[name=unit_id]').val($("input[name='unit']").val());
            populate_unit($("input[name='unit']").val());
        }

        var tax = $("input[name='tax']").val();
        if (tax) {
            $('select[name=tax_id]').val(tax);
        }

        // $('.selectpicker').selectpicker('refresh');

        $('select[name="product_type"]').on('change', function() {
            if ($(this).val() == 'combo') {
                $("input[name='product_cost']").prop('required', false);
                $("select[name='unit_id']").prop('required', false);
                hide();
                $("#digital").hide();
                $("#variant-section, #variant-option, #diffPrice-option, #diffPrice-section").hide(300);
                $("#combo").show();
                $("input[name='product_price']").prop('disabled', true);
            } else if ($(this).val() == 'digital') {
                $("input[name='product_cost']").prop('required', false);
                $("select[name='unit_id']").prop('required', false);
                $("input[name='file']").prop('required', true);
                hide();
                $("#combo").hide();
                $("#digital").show();
                $("#variant-section, #variant-option, #diffPrice-option, #diffPrice-section").hide(300);
                $("input[name='product_price']").prop('disabled', false);
            } else if ($(this).val() == 'service') {
                $("input[name='product_cost']").prop('required', false);
                $("select[name='unit_id']").prop('required', false);
                $("input[name='file']").prop('required', true);
                hide();
                $("#combo").hide(300);
                $("#digital").hide(300);
                $("input[name='product_price']").prop('disabled', false);
                $("#is-variant").prop("checked", false);
                $("#variant-section, #variant-option").hide(300);
            } else if ($(this).val() == 'standard') {
                $("input[name='product_cost']").prop('required', true);
                $("select[name='unit_id']").prop('required', true);
                $("input[name='file']").prop('required', false);
                $("#cost").show();
                $("#unit").show();
                $("#alert-qty").show();
                $("#variant-option").show(300);
                $("#diffPrice-option").show(300);
                $("#digital").hide();
                $("#combo").hide();
                $("input[name='product_price']").prop('disabled', false);
            }
        });

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





        // $('#stateDropdown').on('change', function() {
        //     // $('.changeUnit').on('change', function() {
        //     var unit_id = this.value;
        //     $("#sellDropdown").html('');
        //     $.ajax({
        //         url: "<?php echo e(route('superAdmin.products.sellUnit')); ?>",
        //         type: "POST",
        //         data: {
        //             unit_id: unit_id,
        //             _token: '<?php echo e(csrf_token()); ?>'
        //         },
        //         dataType: 'json',
        //         success: function(result) {

        //             $('#sellDropdown').html('<option value="">-- Select State --</option>');
        //             $.each(result.states, function(key, value) {
        //                 $("#sellDropdown").append('<option value="' + value
        //                     .id + '">' + value.unit_code + '</option>');
        //             });
        //             $('#purchaseDropdown').html('<option value="">-- Select City --</option>');

        //         }
        //     });
        // });
        // $('#sellDropdown').on('change', function() {
        //     var sale_unit_id = this.value;
        //     $("#purchaseDropdown").html('');
        //     $.ajax({
        //         url: "<?php echo e(route('superAdmin.products.purchaseUnit')); ?>",
        //         type: "POST",
        //         data: {
        //             unit_id: sale_unit_id,
        //             _token: '<?php echo e(csrf_token()); ?>'
        //         },
        //         dataType: 'json',
        //         success: function(res) {

        //             $('#purchaseDropdown').html('<option value="">-- Select City --</option>');
        //             $.each(res.cities, function(key, value) {
        //                 $("#purchaseDropdown").append('<option value="' + value
        //                     .id + '">' + value.unit_code + '</option>');
        //             });

        //         }
        //     });
        // });






        $('select[name="unit_id"]').on('change', function() {
            unitID = $(this).val();
            if (unitID) {
                populate_unit_second(unitID);
            } else {
                $('select[name="sale_unit_id"]').empty();
                $('select[name="purchase_unit_id"]').empty();
            }
        });

        function populate_unit(unitID) {
            var url = "<?php echo e(route('superAdmin.products.sellUnitId', ':id')); ?>";
            var sellUrl = url.replace(':id', unitID);
            $.ajax({
                url: sellUrl,
                type: "GET",
                dataType: "json",
                success: function(data) {
                    $('select[name="sale_unit_id"]').empty();
                    $('select[name="purchase_unit_id"]').empty();
                    $.each(data, function(key, value) {
                        $('select[name="sale_unit_id"]').append('<option value="' + value.id + '">' +
                            value
                            .unit_code +
                            '</option>');
                        $('select[name="purchase_unit_id"]').append('<option value="' + value.id +
                            '">' +
                            value.unit_code + '</option>');
                    });
                    $('.selectpicker').selectpicker('refresh');
                    var sale_unit = $("input[name='sale_unit']").val();
                    var purchase_unit = $("input[name='purchase_unit']").val();
                    $('#sale-unit').val(sale_unit);
                    $('select[name=purchase_unit_id]').val(purchase_unit);
                    $('.selectpicker').selectpicker('refresh');
                },
            });
        }

        function populate_unit_second(unitID) {

            var url = "<?php echo e(route('superAdmin.products.purchaseUnitId', ':id')); ?>";
            var purchaseUrl = url.replace(':id', unitID);
            $.ajax({
                url: purchaseUrl,
                type: "GET",
                dataType: "json",
                success: function(data) {
                    $('select[name="sale_unit_id"]').empty();
                    $('select[name="purchase_unit_id"]').empty();
                    $.each(data, function(key, value) {
                        console.log(value.unit_code);
                        $('select[name="sale_unit_id"]').append('<option value="' + value.id + '">' +
                            value
                            .unit_code +
                            '</option>');
                        $('select[name="purchase_unit_id"]').append('<option value="' + value.id +
                            '">' +
                            value.unit_code + '</option>');
                    });
                    $('.selectpicker').selectpicker('refresh');
                },
            });
        };

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

        $("input[name='is_diffPriceWareHouse']").on("change", function() {
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
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/dropzone.js"></script>
    <script type="text/javascript">
        Dropzone.options.dropzoneForm = {
            maxFilesize: 12,
            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
            previewsContainer: "#dropzoneForm",
            uploadMultiple: false,
            autoProcessQueue: true,
            addRemoveLinks: false,
            dictDefaultMessage: "Drop image here to upload",
            dictFileTooBig: "File is too big 500 MiB. Max filesize: 450MiB.",
            dictInvalidFileType: "You can't upload files of this type.",
            dictResponseError: "Server responded with 404 code",

            success: function(file, response) {
                console.log(response);
            },
            error: function(file, response) {
                return false;
            },

            init: function() {

                var submitButton = document.querySelector("#submit-all");
                myDropzone = this;

                // submitButton.addEventListener('click', function() {
                //     myDropzone.preventDefault();
                //     myDropzone.stopPropagation();
                //     myDropzone.processQueue();
                // });

                this.on("complete", function() {
                    if (this.getQueuedFiles().length == 0 && this.getUploadingFiles().length == 0) {
                        var _this = this;
                        _this.removeAllFiles();
                    }
                    load_images();
                });

            }

        };
        load_images();

        function load_images() {
            $.ajax({
                url: "<?php echo e(route('superAdmin.media.fetch')); ?>",
                success: function(data) {
                    $('#uploaded_image').html(data);
                }
            })
        }
    </script>
    <script type="text/javascript">
        /*
         *------------------------------------------------------------------------------------------
         * IMAGES
         *------------------------------------------------------------------------------------------
         */
        var base_url = '';
        //select image
        $(document).on('click', '#image_file_manager .file-box', function() {
            $('#image_file_manager .file-box').removeClass('selected');
            $(this).addClass('selected');
            var file_name = $(this).attr('data-file-name');
            var file_id = $(this).attr('data-file-id');
            var file_path = $(this).attr('data-file-path');
            var alt = $(this).attr('data-file-alt');
            var title = $(this).attr('data-file-title');
            var caption = $(this).attr('data-file-caption');
            var description = $(this).attr('data-file-description');
            $('#selected_img_name').val(file_name);
            $('#selected_img_file_id').val(file_id);
            $('#selected_img_file_path').val(file_path);
            $('#altText').val(alt);
            $('#titleText').val(title);
            $('#captionText').val(caption);
            $('#descriptionText').val(description);
            $('#btn_img_delete').show();
            $('#btn_img_select').show();
        });
        //select image Delete
        $(document).on('click', '#image_file_manager #btn_img_delete', function() {
            var file_name = $('#selected_img_name').val();
            $.ajax({
                url: "<?php echo e(route('superAdmin.media.delete')); ?>",
                data: {
                    name: file_name
                },
                success: function(data) {
                    if (data.action == 'image') {
                        // use for animation hidden
                        $("#msg").html(data.msg).show().delay(2000).fadeOut();
                    } else {
                        load_images();
                    }
                }
            })
        });

        //select image file
        $(document).on('click', '#image_file_manager #btn_img_select', function() {
            select_image();
        });

        //select image file on double click
        $(document).on('dblclick', '#image_file_manager .file-box', function() {
            select_image();
        });


        function select_image() {
            var file_name = $('#selected_img_name').val();
            var file_id = $('#selected_img_file_id').val();
            var img_url = $('#selected_img_file_path').val();

            var alt = $('#altText').val();
            var title = $('#titleText').val();
            var caption = $('#captionText').val();
            var description = $('#descriptionText').val();
            $('#alt_value').val(alt);
            $('#title_value').val(title);
            $('#caption_value').val(caption);
            $('#description_value').val(description);
            // ============================ another way value pass, using input name
            // $('input[name=alt]').val(alt);
            // $('input[name=title]').val(title);

            var image = '<div class="post-select-image-container">' +
                '<a id="btn_delete_post_main_image" onclick="imageRemove()" class="btn btn-danger btn-sm btn-delete-selected-file-image">' +
                '<img src="' + base_url + img_url + '" alt="" id="display_image">' +
                '<i class="fa fa-times"></i> ' +
                '</a>' +
                '</div>';
            document.getElementById("post_select_image_container").innerHTML = image;
            $('input[name=image_id]').val(file_id);
            $('#selected_image_file').css('margin-top', '15px');

            $('input[name=image_name]').val(file_name);
            $('#image_file_manager').modal('toggle');
            $('#image_file_manager .file-box').removeClass('selected');
            $('#btn_img_delete').hide();
            $('#btn_img_select').hide();
            const element = document.getElementById("rightHide");
            element.remove();

            document.getElementById("NewClass").className = "col-md-12";

        }

        function imageRemove() {
            // const element = document.getElementById("image_id");
            // element.remove();
            document.getElementById("image_id").value = '';
            document.getElementById("image_name").value = '';
            document.getElementById('display_image').removeAttribute('src');
            const element = document.getElementById("btn_delete_post_main_image");
            element.remove();
        }

        function fileRemove() {
            document.getElementById("closefile").value = '';
            const element = document.getElementById("btn_delete_post_main_file");
            element.remove();
        }

        function videoRemove() {
            document.getElementById("closevideo").value = '';
            const element = document.getElementById("btn_delete_post_main_video");
            element.remove();
        }

        function displayimageRemove() {
            // const element = document.getElementById("image_id");
            // element.remove();
            document.getElementById("image_id").value = '';
            document.getElementById("image_name").value = '';
            document.getElementById('selected_image_file').removeAttribute('src');
            const element = document.getElementById("btn_delete");
            element.remove();
        }

        //search image
        $(document).on('input', '#input_search_image', function() {
            var search = $(this).val();
            var data = {
                "search": search
            };
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                type: "POST",
                url: "<?php echo e(route('superAdmin.users.search')); ?>",
                data: data,
                success: function(response) {
                    document.getElementById("image_file_upload_response").innerHTML = response
                }
            });
        });
    </script>
    


</body>

</html>
<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/components/backend/superAdmin/product/productedit.blade.php ENDPATH**/ ?>