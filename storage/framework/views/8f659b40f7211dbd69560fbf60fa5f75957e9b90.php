
    <div class="container px-4">
        <div class="row">
            <div class="col-md-8">
                <div class="form-group">
                    <h5> Search</h5>
                    <input type="text" name="name" class="form-control searchEmail" placeholder="Search ...">
                    
                </div>
            </div>
            <div class="col-md-2">

            </div>
            <div class="col-md-2 mt-4">
                <a class="btn btn-primary mb-2 " href="<?php echo e(route('superAdmin.barcode.print')); ?>">Print</a>
                <a class="btn btn-info mb-2 submitOnImage" href="javascript:void(0)" id="createNewbarcode">
                    Add New barcode</a>
            </div>
        </div>
     <div class="row">
            <div class="col-md-12">
                <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>Barcode</th>
                            <th width="100px">Actions</th>
                        </tr>
                    </thead>
                    
                    
                    <tbody>
                        <?php
                            $i = 1;
                        ?>
                         <?php if(!empty($barcodes)): ?>
                        <?php $__currentLoopData = $barcodes; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                                <td><?php echo e($i++); ?></td>
                                <td>
                                    

                                    <?php
                                        
                                        $barcodresult = $item->product_code;
                                        $barcodeimg = str_replace('\/', '/', $barcodresult);
                                        echo '<img src="' . $barcodeimg . '" alt="barcode"  class="barcode-img"  />';
                                        
                                        // echo DNS1D::getBarcodeSVG('4445645656', 'PHARMA2T', 3, 33);
                                        // echo DNS1D::getBarcodeHTML('4445645656', 'PHARMA2T', 3, 33);
                                        // DNS1D::getBarcodePNGPath('4445645656', 'C39+', 3, 33);
                                        
                                        // echo '<img src="data:image/png;base64,' . DNS1D::getBarcodePNG($item->product_code, 'C39+', 2, 30) . '" alt="barcode"   />';
                                        
                                        // echo '<img src="data:image/png;base64,' . DNS2D::getBarcodePNG($item->product_code, 'QRCODE', 2, 2) . '" alt="barcode"   />';
                                        // echo '<img src="data:image/png;base64,' . DNS2D::getBarcodePNG($item->product_code, 'PDF417', 2, 2) . '" alt="barcode"   />';
                                        
                                    ?>
                                    
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <?php else: ?>
                        No data found
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    
    </div>
    <!-- Modal for barcode Add -->

    <div class="modal  fade" id="ajaxModelexa" tabindex="-1" aria-labelledby="addbarcodeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable barcode-modal">
            
            <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal getUrl">
                <?php echo csrf_field(); ?>
                <input type="hidden" name="id" id="id" class="id">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modelHeading"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <div class="errMsgContainer"></div>
                        <p id="res_en"></p>
                        <p id="res_bn"></p>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Product Name
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">

                                <select name="product_name" class="form-control up_product_name productName"
                                    data-live-search="true" data-live-search-style="begins" id="productName"
                                    title="Select Prodcut...">
                                    <option value="" selected>Select Prodcut...</option>
                                    <?php
                                    
                                        $prodcutId = [];
                                        $product = '';
                                    ?>
                                    <?php if(!empty($products)): ?>
                                        <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <?php if($product->id != null): ?>
                                                <option value="<?php echo e($product->product_name); ?>">
                                                    <?php echo e($product->product_name); ?></option>
                                            <?php endif; ?>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php
                                            $prodcutId[] = $product->id;
                                        ?>
                                        <?php else: ?>
                                        No data found
                                    <?php endif; ?>
                                </select>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Brand Name
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <select name="brand_name" id="brandName"
                                    class="form-control up_brand_name brandName mySelect_ben"
                                    data-live-search="true" data-live-search-style="begins" title="Select Prodcut...">
                                    <option value="" selected>Select Brand...</option>
                                    <?php if(!empty($brands)): ?>
                                    <?php $__currentLoopData = $brands; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $brand): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <?php if($brand->id != null): ?>
                                        <option value="<?php echo e($brand->id); ?>">
                                        <?php echo e($brand->brand_name); ?></option>
                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php else: ?>
                                    No data found
                                    <?php endif; ?>
                                </select>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Price

                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="number" name="price" id="mySelect_ben"
                                    class="form-control up_price price mySelect_ben" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Product code

                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="product_code" id="mySelect_ben"
                                    class="form-control up_product_code productCode mySelect_ben" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Description

                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="description" id="mySelect_ben"
                                    class="form-control up_description description " required />
                            </div>
                        </div>



                        <div class="form-group ">
                            <div class="col-md-12 col-sm-12 mb-3 mt-4">
                                <button type="submit" class="btn btn-outline-success btn-lg btn-block btnSubmit"
                                    id="submit-all" style="display: none">Submit</button>
                                <button type="submit" class="btn btn-outline-success btn-lg btn-block btnSubmit "
                                    id="up-submitbtn" style="display: none">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
                
            </form>
        </div>
    </div>

    

    <script type="text/javascript">
        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
        })
    </script>

    
    <script type="text/javascript">
        $('#mySelect_ben').blur(function() {
            var nameValue = $('#mySelect_ben ').val();
            const xhttp = new XMLHttpRequest();
            let serverUrl = '/categoryCheck.name/' + nameValue;
            xhttp.open("GET", serverUrl);
            xhttp.onreadystatechange = function() {
                // alert(this.responseText);
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("res_en").innerHTML =
                        this.responseText;
                    if (this.responseText == "Name already exist") {
                        $("#res_en").css({
                            "color": "red",
                            "font-size": "1rem"
                        })
                        document.querySelector('#submit-all').disabled = true;
                        document.querySelector('#up-submitbtn').disabled = true;
                    } else {
                        $("#res_en").css({
                            "color": "green",
                            "font-size": "1rem"
                        })
                        document.querySelector('#submit-all').disabled = false;
                        document.querySelector('#up-submitbtn').disabled = false;
                    }
                }
            };
            xhttp.send(null);
        });


        $('#mySelect_bn').blur(function() {
            var nameValue = $('#mySelect_bn ').val();
            const xhttp = new XMLHttpRequest();
            let serverUrl = '/categoryCheck.name/' + nameValue;
            xhttp.open("GET", serverUrl);
            xhttp.onreadystatechange = function() {
                // alert(this.responseText);
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("res_bn").innerHTML =
                        this.responseText;
                    if (this.responseText == "Name already exist") {
                        $("#res_bn").css({
                            "color": "red",
                            "font-size": "1rem"
                        })

                        document.querySelector('#submit-all').disabled = true;
                        document.querySelector('#up-submitbtn').disabled = true;
                    } else {
                        $("#res_bn").css({
                            "color": "green",
                            "font-size": "1rem"
                        })
                        document.querySelector('#submit-all').disabled = false;
                        document.querySelector('#up-submitbtn').disabled = false;
                    }
                }
            };
            xhttp.send(null);
        });
    </script>

    
    <script type="text/javascript">
        $(function() {

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            var table = $('.data-table').DataTable({

                columnDefs: [{
                        orderable: true,
                        searchable: true,
                        className: "left",
                        targets: [0, 1, 2, 3, 4]
                    },
                    {
                        data: 'DT_RowIndex',
                        targets: [0],
                    },

                    {
                        data: 'id',
                        targets: [1],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.product_name;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'price',
                        targets: [2],
                    },
                    {
                        data: 'product_code',
                        targets: [3],
                    },
                    {
                        data: 'action',
                        targets: [4],
                    },

                ],
                order: [
                    [0, 'desc']
                ],
                lengthMenu: [
                    [10, 25, 50, 100, 200],
                    [10, 25, 50, 100, 200]
                ],
                searching: false,
                processing: true,
                serverSide: true,
                stateSave: true,
                autoWidth: false,
                pageLength: 10,
                paging: true,
                info: true,
                buttons: true,
                scrollX: true,
                ordering: false,
                deferRender: true,
                scrollCollapse: true,
                scroller: true,
                responsive: true,

                ajax: {
                    url: "<?php echo e(route('superAdmin.barcode')); ?>",
                    data: function(d) {
                        d.product_name = $('.searchEmail').val();
                        d.search = $('input[type="search"]').val();

                    }
                },
                // dom: 'lBfrtip<"actions">',

                language: {
                    decimal: "",
                    lengthMenu: "Display _MENU_ records per page",
                    zeroRecords: "Nothing found - sorry",
                    info: "Showing page _PAGE_ of _PAGES_",
                    infoEmpty: "No records available",
                    pagingType: "full_numbers",
                    paginate: {
                        first: "First",
                        last: "Last",
                        next: '&#8594;', // or '→'
                        previous: '&#8592;' // or '←' 
                    },
                    processing: '<span>Processing...</span>',

                    aria: {
                        sortAscending: ": activate to sort column ascending",
                        sortDescending: ": activate to sort column descending"
                    }
                },

            });
            $(".searchEmail").keyup(function() {
                table.draw(true);
            });

            // Add
            $('#createNewbarcode').click(function() {
                $('#submit-all').html("Submit");
                $('#id').val('');
                $('#postForm').trigger("reset");
                $('#modelHeading').html("Create New barcode");
                $('#ajaxModelexa').modal('show');
                document.getElementById("up-submitbtn").style.display = "none";
                document.getElementById("submit-all").style.display = "block";
            });

            $('#submit-all').click(function(e) {
                e.preventDefault();

                // let productName--- = $('.productName').val();
                // let brandName--- = $('.brandName').val();
                let pName = document.querySelector('#productName');
                let productName = pName.options[pName.selectedIndex].value ?? 0;

                let bName = document.querySelector('#brandName');
                let brandName = bName.options[bName.selectedIndex].value ?? 0;


                let price = $('.price').val();
                let productCode = $('.productCode').val();
                let description = $('.description').val();

                let dataall = {
                    'product_name': productName,
                    'brand': brandName,
                    'price': price,
                    'product_code': productCode,
                    'description': description,
                };
                console.log(dataall);

                $(this).html('Sending...');

                $.ajax({
                    data: dataall,
                    // data: $('#postForm').serialize(),
                    url: "<?php echo e(route('superAdmin.barcode.store')); ?>",
                    type: "POST",
                    enctype: 'multipart/form-data',
                    dataType: 'json',
                    success: function(data) {
                        $('#postForm').trigger("reset");
                        $('#ajaxModelexa').modal('hide');
                        table.draw();
                    },
                    error: function(data) {
                        console.log('Error:', data);
                        $('#submit-all').html('Do not Save');
                    }
                });
            });

            // Edit / Update
            $('body').on('click', '.editPost', function() {
                $('#modelHeading').html("Edit barcode");
                $('#up-submitbtn').html("Update");
                $('#ajaxModelexa').modal('show');
                document.getElementById("submit-all").style.display = "none";
                document.getElementById("up-submitbtn").style.display = "block";

                var id = $(this).data('id');

                var url = "<?php echo e(route('superAdmin.barcode.update', ':id')); ?>";
                var catUrl = url.replace(':id', id);

                let product_name = $(this).data('product_name');
                let brand = $(this).data('brand');
                let price = $(this).data('price');
                let product_code = $(this).data('product_code');
                let description = $(this).data('description');
                let new_product_code = product_code
                    .replace("\\/", "")
                    .replace(".png", "");

                $('#id').val(id);
                alert(brand);
                // $('.productName').val(product_name);
                // $('.brandName').val(brand);
                $('.price').val(price);
                $('.productCode').val(new_product_code);
                $('.description').val(description);

                $(".productName option:selected").removeAttr("selected")
                $(".productName option[value='" + product_name + "']").attr('selected', 'selected');

                $(".brandName option:selected").removeAttr("selected")
                $(".brandName option[value='" + brand + "']").attr('selected', 'selected');


            });

            $('#up-submitbtn').click(function(e) {
                e.preventDefault();
                $(this).html('Updating...');

                let id = $('.id').val();
                // let productName = $('.up_product_name').val();
                // let brandName = $('.up_brand_name').val();
                let price = $('.up_price').val();
                let productCode = $('.up_product_code').val();
                let description = $('.up_description').val();

                let pName = document.querySelector('#productName');
                let productName = pName.options[pName.selectedIndex].value ?? 0;

                let bName = document.querySelector('#brandName');
                let brandName = bName.options[bName.selectedIndex].value ?? 0;

                alert(brandName);

                // https://www.studentstutorial.com/laravel/laravel-ajax-update


                let updateData = {
                    'id': id,
                    'product_name': productName,
                    'brand': brandName,
                    'price': price,
                    'product_code': productCode,
                    'description': description,
                };

                console.log(updateData);

                $.ajax({
                    type: "POST",
                    data: updateData,
                    // data: $('#postForm').serialize(),
                    url: "<?php echo e(route('superAdmin.barcode.store')); ?>",

                    cache: false,
                    enctype: 'multipart/form-data',
                    dataType: 'json',
                    success: function(data) {

                        $('#postForm').trigger("reset");
                        $('#image_file_manager').trigger("reset");
                        $('#ajaxModelexa').modal('hide');
                        table.draw();

                    },
                    error: function(data) {
                        console.log('Error:', data);
                        $('#submit-all').html('Do not Update');
                    }
                });
            });
            // Delete
            $('body').on('click', '.deletebarcode', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var durl = "<?php echo e(route('superAdmin.barcode.deleted', ':id')); ?>";
                var dcatUrl = durl.replace(':id', id);

                let dataDelete = {
                    'id': id,
                };
                if (confirm("Are you sure you want to remove this brand?") == true) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: "POST",
                        url: dcatUrl,
                        data: dataDelete,
                        dataType: "json",
                        success: function(res) {
                            $('#postForm').trigger("reset");
                            $('#ajaxModelexa').modal('hide');
                            table.draw();
                        }
                    });
                }
            });

        });
    </script>


<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/components/backend/superAdmin/barcode/index.blade.php ENDPATH**/ ?>