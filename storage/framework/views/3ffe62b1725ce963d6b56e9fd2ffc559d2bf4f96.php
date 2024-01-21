<style>
    @media (min-width: 576px){
        .modal-dialog {
            max-width: 40%;
        }
    }
</style>
    <?php if(session()->has('message')): ?>
        <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo session()->get('message'); ?>

        </div>
    <?php endif; ?>
    <?php if(session()->has('not_permitted')): ?>
        <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert"
                aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?>

        </div>
    <?php endif; ?>
    <div class="container px-4">
        <div class="row">
            <div class="col-md-5">
                <div class="form-group">
                    <h5> Search</h5>
                    <input type="text" name="name" class="form-control searchEmail" placeholder="Search Delivery Reference NO ...">
                    
                </div>
            </div>
            <div class="col-md-5"></div>
            <div class="col-md-2 mt-4">

            </div>
        </div>
    </div>

    <section>
        <div class="table-responsive">
            <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
                
                <thead>
                    <tr>
                        <th class="not-exported"></th>
                        <th><?php echo e(trans('Delivery Reference')); ?></th>
                        <th><?php echo e(trans('Sale Reference')); ?></th>
                        <th><?php echo e(trans('Customer')); ?></th>
                        <th><?php echo e(trans('Coriar')); ?></th>
                        <th><?php echo e(trans('Address')); ?></th>
                        <th><?php echo e(trans('Products')); ?></th>
                        <th><?php echo e(trans('Grand total')); ?></th>
                        <th><?php echo e(trans('Status')); ?></th>
                        <th class="not-exported"><?php echo e(trans('action')); ?></th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </section>

    <!-- Modal -->
    <div id="delivery-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="container mt-3 pb-2 border-bottom">
                    <div class="row">
                        <div class="col-md-6 d-print-none">
                            <div class="col-md-3">
                                <button id="print-btn" type="button" class="btn btn-default btn-sm d-print-none"> <i class="fas fa-print"></i> <?php echo e(trans('Print')); ?></button>
                            </div>
                            <div class="col-md-3">
                                <?php echo e(Form::open(['route' => 'superAdmin.delivery.sendMail', 'method' => 'post', 'class' => 'sendmail-form'])); ?>

                                <input type="hidden" name="delivery_id">
                                <button class="btn btn-default btn-sm d-print-none"><i class="fas fa-envelope"></i>
                                    <?php echo e(trans('Email')); ?></button>
                                <?php echo e(Form::close()); ?>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close"
                                class="close d-print-none"><span aria-hidden="true"><i
                                        class="dripicons-cross"></i></span></button>
                        </div>
                        <div class="col-md-12">
                            <h3 id="exampleModalLabel" class="modal-title text-center container-fluid">
                                <?php echo e($general_setting->site_title); ?>

                            </h3>
                        </div>
                        <div class="col-md-12 text-center">
                            <i style="font-size: 15px;"><?php echo e(trans('Delivery Details')); ?></i>
                        </div>
                    </div>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered" id="delivery-content">
                        <tbody></tbody>
                    </table>
                    <br>
                    <table class="table table-bordered product-delivery-list">
                        <thead>
                            <th>No</th>
                            <th>Code</th>
                            <th>Description</th>
                            <th><?php echo e(trans('Batch No')); ?></th>
                            <th><?php echo e(trans('Expired Date')); ?></th>
                            <th>Qty</th>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    <div id="delivery-footer" class="row">
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div id="ajaxModelexa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('Update Delivery')); ?></h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal getUrl">
                    
                    <div class="row">
                        <input type="hidden" id="id" name="id" class="uid">
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Delivery Reference')); ?></label>
                            <p id="delivery_reference"></p>
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Sale Reference')); ?></label>
                            <p id="sale_reference_no"></p>
                        </div>
                        <div class="col-md-12 form-group">
                            <label><?php echo e(trans('Status')); ?> *</label>
                            <select name="status" id="status" required class="form-control upstatus">
                                <option value="1"><?php echo e(trans('Packing')); ?></option>
                                <option value="2"><?php echo e(trans('Delivering')); ?></option>
                                <option value="3"><?php echo e(trans('Delivered')); ?></option>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Courier</label>
                            <select name="courier_id" id="courierId" class="form-control upcourier"
                            data-live-search="true" title="Select courier...">
                                <?php $__currentLoopData = $couriarname; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $couriar): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($couriar->id); ?>"><?php echo e($couriar->name); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                        <div class="col-md-6 mt-2 form-group">
                            <label><?php echo e(trans('Delivered By')); ?></label>
                            <input type="text" id ="deliveredBy" name="delivered_by" class="form-control updelivered">
                        </div>
                        <div class="col-md-6 mt-2 form-group">
                            <label><?php echo e(trans('Recieved By')); ?></label>
                            <input type="text" id ="recievedBy" name="recieved_by" class="form-control uprevieded">
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('customer')); ?> *</label>
                            <p id="customer"></p>
                            <input type="hidden" id="customerId" class="upcustomer" >
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Attach File')); ?></label>
                            <input type="file" name="file" class="form-control upattachfile">
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Address')); ?> *</label>
                            <textarea rows="3" name="address" id="address" class="form-control upaddress" required></textarea>
                        </div>
                        <div class="col-md-6 form-group">
                            <label><?php echo e(trans('Note')); ?></label>
                            <textarea rows="3" name="note" id="note" class="form-control upnote"></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="product" id="product" class="upproduct">
                    <input type="hidden" name="reference_no" id="referenceNo" class="up_reference_id">
                    <input type="hidden" name="delivery_id" id="deliveryId" class="up_delivery_id">
                    <button type="submit" class="btn btn-primary updatebtn"><?php echo e(trans('Update')); ?></button>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>

<?php $__env->startPush('custom_scripts'); ?>
    <script type="text/javascript">
        $("ul#sale").siblings('a').attr('aria-expanded', 'true');
        $("ul#sale").addClass("show");
        $("ul#sale #delivery-menu").addClass("active");

        var delivery_id = [];
        // var user_verified = <?php echo json_encode(env('USER_VERIFIED'));
        // ?>;

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $("#print-btn").on("click", function() {
            var divContents = document.getElementById("delivery-details").innerHTML;
            var a = window.open('');
            a.document.write('<html>');
            a.document.write(
                '<body><style>body{font-family: sans-serif;line-height: 1.15;-webkit-text-size-adjust: 100%;}.d-print-none{display:none}.text-center{text-align:center}.row{width:100%;margin-right: -15px;margin-left: -15px;}.col-md-12{width:100%;display:block;padding: 5px 15px;}.col-md-6{width: 50%;float:left;padding: 5px 15px;}table{width:100%;margin-top:30px;}th{text-aligh:left}td{padding:10px}table,th,td{border: 1px solid black; border-collapse: collapse;}#delivery-footer{margin-left:10px}</style><style>@media  print {.modal-dialog { max-width: 1000px;} }</style>'
            );
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            setTimeout(function() {
                a.close();
            }, 10);
            a.print();
        });


        $('body').on('click', '.delivery-link', function(e) {
            e.preventDefault();
            $("#delivery-details").modal('show');

            var id = $(this).data('id');
            var date = $(this).data('date');
            var reference_no = $(this).data('reference_no');
            var sale_reference_no = $(this).data('sale_reference_no');
            var name_address = $(this).data('name_address');
            var product = $(this).data('product_name');
            var customer = $(this).data('customer');
            var userName = $(this).data('user_name');
            var barcode = $(this).data('barcode');

            var phone = $(this).data('phone');
            var address = $(this).data('address');
            var delivered_by = $(this).data('delivered_by');
            var recieved_by = $(this).data('recieved_by');
            var note = $(this).data('note');
            var grand_total = $(this).data('grand_total');
            var status = $(this).data('status');


            $('input[name="delivery_id"]').val(id);
            $("#delivery-content tbody").remove();
            var newBody = $("<tbody>");
            var rows = '';
            rows += '<tr><td>Date</td><td>' + date + '</td></tr>';
            rows += '<tr><td>Delivery Reference</td><td>' + reference_no + '</td></tr>';
            rows += '<tr><td>Sale Reference</td><td>' + sale_reference_no  + '</td></tr>';
            if (status == 1) {
                rows += '<tr><td>Status</td><td>' + "Packing" + '</td></tr>';
            } else if(status == 2){
                rows += '<tr><td>Status</td><td>' + "Delivering" + '</td></tr>';
            }else{
                rows += '<tr><td>Status</td><td>' + "Delivered" + '</td></tr>';
            }
            rows += '<tr><td>Customer Name</td><td>' + customer + '</td></tr>';
            rows += '<tr><td>Address</td><td>' + address +  '</td></tr>';
            rows += '<tr><td>Phone Number</td><td>' + phone + '</td></tr>';
            rows += '<tr><td>Note</td><td>' + note + '</td></tr>';

            newBody.append(rows);
            $("table#delivery-content").append(newBody);

            var url = "<?php echo e(route('superAdmin.delivery.product_delivery', ':id')); ?>";
            var listUrl = url.replace(':id', id);

            $.get(listUrl, function(data) {
                $(".product-delivery-list tbody").remove();
                var code = data[0];
                var description = data[1];
                var batch_no = data[2];
                var expired_date = data[3];
                var qty = data[4];
                var newBody = $("<tbody>");
                $.each(code, function(index) {
                    var newRow = $("<tr>");
                    var cols = '';
                    cols += '<td><strong>' + (index + 1) + '</strong></td>';
                    cols += '<td>' + code[index] + '</td>';
                    cols += '<td>' + description[index] + '</td>';
                    cols += '<td>' + batch_no[index] + '</td>';
                    cols += '<td>' + expired_date[index] + '</td>';
                    cols += '<td>' + qty[index] + '</td>';
                    newRow.append(cols);
                    newBody.append(newRow);
                });
                $("table.product-delivery-list").append(newBody);
            });

        // convert js variable(reference_no) to php variable(referenceNo) and last output js variable(barcode)
            var barcode = "<?php
                            $reference='"+ reference_no +"';
                            $referenceNo = DNS2D::getBarcodePNG($reference, 'QRCODE');
                                echo $referenceNo;
                            ?>";
            // alert(barcode);

            var htmlfooter = '<div class="col-md-4 form-group"><p>Prepared By: ' +  userName + '</p></div>';
            htmlfooter += '<div class="col-md-4 form-group"><p>Delivered By: ' + delivered_by + '</p></div>';
            htmlfooter += '<div class="col-md-4 form-group"><p>Recieved By: ' + recieved_by + '</p></div>';
            htmlfooter += '<br><br>';
            htmlfooter += '<div class="col-md-2 offset-md-5"><img style="max-width:850px;height:100%;max-height:130px" src="data:image/png;base64,' +
                barcode + '" alt="barcode" /></div>';

            // htmlfooter +='<div class="col-md-12 text-center d-block"><img src="data:image/png;base64,<?php echo DNS2D::getBarcodePNG( $referenceNo, 'QRCODE',8,8,array(0,0,0), true); ?>" alt="barcode" /></div><br><br>';

            $('#delivery-footer').html(htmlfooter);
        });

        $('body').on('click', '.editdelivery', function(e) {
            e.preventDefault();
            $("#ajaxModelexa").modal('show');

            var id = $(this).data('id');
            var url = "<?php echo e(route('superAdmin.delivery.edit', ':id')); ?>";
            var getUrl = url.replace(':id', id);

            var reference_no = $(this).data('reference_no');
            var sale_reference_no = $(this).data('sale_reference_no');
            var name_address = $(this).data('name_address');
            var product = $(this).data('product_name');
            var customer = $(this).data('customer');
            var courier = $(this).data('couriar');
            var address = $(this).data('address');
            var delivered_by = $(this).data('delivered_by');
            var recieved_by = $(this).data('recieved_by');
            var note = $(this).data('note');
            var grand_total = $(this).data('grand_total');
            var status = $(this).data('status');

            // alert(id);

            $('#id').val(id);
            $('#delivery_reference').text(reference_no);
            $('#sale_reference_no').text(sale_reference_no);

            $('#referenceNo').val(reference_no);
            $('#deliveryId').val(sale_reference_no);
            $('#product').val(product);

            $('#status').val(status);
            // $('#courierId').val(courier);
            $('#deliveredBy').val(delivered_by);
            $('#recievedBy').val(recieved_by);

            if (courier) {
                $("select[name='courier_id']").val(courier);
            }

            $('#customer').text(customer);
            $('#customerId').val(customer);

            $('#address').val(address);
            $('#note').val(note);

        });
        // Update
        $('.updatebtn').click(function(e) {
            e.preventDefault();
            $(this).html('Updating...');

            let uid = $('.uid').val();

            var up_reference_id  = $('.up_delivery_id').val();
            var up_delivery_id = $('.up_reference_id').val();

            // alert(up_reference_id);
            if (status == 1) {
                var upstatus =  $('.upstatus').val();
            } else if (status == 2) {
                var upstatus =  $('.upstatus').val();
            } else {
                var upstatus =  $('.upstatus').val();
            }

            var upcourier = $('.upcourier').val();
            var upcustomer = $('.upcustomer').val();
            var updelivered = $('.updelivered').val();
            var uprevieded = $('.uprevieded').val();
            var upaddress = $('.upaddress').val();
            var upproduct = $('.upproduct').val();
            var upnote = $('.upnote').val();



            let updateData = {
                'id': uid,
                'reference_no': up_reference_id,
                'sale_reference_no': up_delivery_id,
                'status': upstatus,
                'courier_id': upcourier,
                'customer': upcustomer,
                'delivered_by': updelivered,
                'recieved_by': uprevieded,
                'courier_id': upcourier,
                'product_name': upproduct,
                'address': upaddress,
                'note': upnote,
            };

            console.log(updateData);

            $.ajax({
                type: "POST",
                data: updateData,
                url: "<?php echo e(route('superAdmin.delivery.update')); ?>",

                cache: false,
                enctype: 'multipart/form-data',
                dataType: 'json',
                success: function(data) {
                    $('#postForm').trigger("reset");
                    $('#ajaxModelexa').modal('hide');
                    $('#tableLoad').DataTable().draw(true);

                },
                error: function(data) {
                    console.log('Error:', data);
                    $('.updatebtn').html('Do not Update');
                }
            });
        });

        // Datatable
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
                        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                    },
                    {
                        data: 'DT_RowIndex',
                        targets: [0]
                    },

                    {
                        data: 'reference_no',
                        targets: [1]

                    },
                    {
                        data: 'sale_ref',
                        targets: [2]

                    },
                    {
                        data: 'coustomer',
                        targets: [3]

                    },
                    {
                        data: 'couriar',

                        targets: [4]
                    },
                    {
                        data: 'address',

                        targets: [5]
                    },
                    {
                        data: 'product',
                        targets: [6]
                    },
                    {
                        data: 'grand_total',
                        targets: [7]
                    },
                    {
                        data: 'status',
                        targets: [8]
                    },
                    {
                        data: 'action',
                        targets: [9]
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
                fixedHeader: true,
                retrieve: true,


                ajax: {
                    url: "<?php echo e(route('superAdmin.delivery')); ?>",
                    data: function(d) {
                        d.name = $('.searchEmail').val();
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

            $('.btnchange').change(function() {
                $('#tableLoad').DataTable().draw(true);
            });
        });
            // Delete
            $('body').on('click', '.deletedelivery', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var url = "<?php echo e(route('superAdmin.delivery.deleted', ':id')); ?>";
                var catUrl = url.replace(':id', id);

                let dataDelete = {
                    'id': id,
                };
                // alert(id);
                if (confirm("Are you sure you want to remove this Delivery?") == true) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: "POST",
                        url: catUrl,
                        data: dataDelete,
                        dataType: "json",
                        success: function(res) {
                            $('#tableLoad').trigger("reset");
                            $('#tableLoad').DataTable().draw(true);
                        }
                    });
                }
            });
    </script>
<?php $__env->stopPush(); ?>
<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/components/backend/superAdmin/delivery/index.blade.php ENDPATH**/ ?>