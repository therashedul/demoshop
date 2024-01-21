@extends('layouts.deshboard')
@section('content')
    <style>
        #tableLoad td.centered {
            text-align: center;
        }
    </style>

    <div class="container px-4">
        <div class="row">
            <div class="col-md-5">

                <div class="form-group">
                    <h5> Search</h5>
                    <input type="text" name="name" class="form-control searchEmail" placeholder="Search ...">

                </div>
            </div>
            <div class="col-md-5">
            </div>
            <div class="col-md-2 mt-4"> <a class="btn btn-info mb-2 submitOnImage" href="javascript:void(0)"
                    id="createNewpromotion">
                    Add New promotion</a></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Prodcut name</th>
                            <th>Price</th>
                            <th>Strart Date</th>
                            <th>End Date</th>
                            <th>Status</th>
                            <th width="100px">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Modal for promotion Add -->

    <div class="modal  fade" id="ajaxModelexa" tabindex="-1" aria-labelledby="addpromotionModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable promotion-modal">
            {{-- <form method="POST" action="{{ route('superAdmin.promotion.store') }}" enctype="multipart/form-data"
                    style="width: 100%;"> --}}
            <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal getUrl">
                @csrf
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
                            <label class="col-form-label col-md-12 col-sm-12 label-align">promotion
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="promotion" id="promotion"
                                    class="form-control up_promotion promotion" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Prodcut name
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <select name="prodcut_id" class="form-control selectpicker">
                                    <option value="">No Tax</option>
                                    <option value="1">vat@10</option>
                                    <option value="2">vat@15</option>
                                    <option value="4">vat 20</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Price
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="price" id="price" class="form-control up_price price"
                                    required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Start Date
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">

                                <input type='text' id='startdatetimepicker' class="form-control up_start_date start_date"
                                    name="start_date" value="{{ date('Y-m-d H:i', time()) }}" />


                                <script type="text/javascript">
                                    // var today = new Date();
                                    // document.getElementById("datetime").value = today.getFullYear() +
                                    //     '-' + ('0' + (today.getMonth() + 1)).slice(-2) +
                                    //     '-' + ('0' + today.getDate()).slice(-2) +
                                    //     ' ' + ('0' + today.getHours()).slice(-2) +
                                    //     ':' + ('0' + today.getMinutes()).slice(-2) +
                                    //     ':' + ('0' + today.getSeconds()).slice(-2);
                                    $(function() {
                                        $('#startdatetimepicker').datetimepicker({
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
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">End Date
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type='text' id='enddatetimepicker' class="form-control up_end_date end_date"
                                    name="end_date" value="{{ date('Y-m-d H:i', time()) }}" />


                                <script type="text/javascript">
                                    // var today = new Date();
                                    // document.getElementById("datetime").value = today.getFullYear() +
                                    //     '-' + ('0' + (today.getMonth() + 1)).slice(-2) +
                                    //     '-' + ('0' + today.getDate()).slice(-2) +
                                    //     ' ' + ('0' + today.getHours()).slice(-2) +
                                    //     ':' + ('0' + today.getMinutes()).slice(-2) +
                                    //     ':' + ('0' + today.getSeconds()).slice(-2);
                                    $(function() {
                                        $('#enddatetimepicker').datetimepicker({
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
                        <div class="form-group">
                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Status
                            </label>
                            <div class="col-md-9 col-sm-9 pt-2 ">
                                <input type="checkbox" class="js-switch mycheckbox status" id="status" name="status">
                            </div>
                        </div>

                        <div class="form-group ">
                            <div class="col-md-12 col-sm-12 mb-3">
                                <button type="submit" class="btn btn-outline-success btn-lg btn-block btnSubmit"
                                    id="submit-all" style="display: none">Submit</button>
                                <button type="submit" class="btn btn-outline-success btn-lg btn-block btnSubmit "
                                    id="up-submitbtn" style="display: none">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
                {{-- modal-content --}}
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

    {{-- // publish  // unpublish --}}
    <script type="text/javascript">
        // publish
        $(document).on('click', '.publish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');

            var url = "{{ route('superAdmin.promotion.publish', ':id') }}";
            var pubUrl = url.replace(':id', id);

            let dataPub = {
                'id': id,
            };
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: "GET",
                url: pubUrl,
                data: dataPub,
                dataType: "json",
                success: function(res) {
                    if (res.status == 'success') {
                        $('#tableLoad').DataTable().ajax.reload();
                    }
                }
            });
        })
        // unpublish
        $(document).on('click', '.unpublish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');
            let url = "{{ route('superAdmin.promotion.unpublish', ':id') }}";
            let unUrl = url.replace(':id', id);

            let dataUn = {
                'id': id,
            };

            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: "GET",
                url: unUrl,
                data: dataUn,
                dataType: "json",
                success: function(res) {
                    if (res.status == 'success') {
                        $('#tableLoad').DataTable().ajax.reload();
                    }
                }
            });
        })
    </script>

    {{-- Datatables --}}
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
                        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8]
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
                                data = row.name;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'id',
                        targets: [2],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.phone;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'email',
                        targets: [3],
                    },

                    {
                        data: 'id',
                        targets: [4],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.address;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'id',
                        targets: [5],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.phone;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'id',
                        targets: [6],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.phone;
                            }
                            return data;
                        }
                    },

                    {
                        data: 'is_active',
                        targets: [7],
                    },
                    {
                        data: 'action',
                        targets: [8],
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
                    url: "{{ route('superAdmin.promotion') }}",
                    data: function(d) {
                        d.name = $('.searchEmail').val();
                        d.search = $('input[type="search"]').val();
                    }
                },
                buttons: [{
                        extend: 'copy',
                        text: window.copyButtonTrans,
                        title: 'Datatables example: Customisation of the print view window',
                        exportOptions: {
                            columns: ':visible'
                            // columns: [1, 2, 3] // Column index which needs to export
                        },
                    },
                    {
                        extend: 'csv',
                        text: window.csvButtonTrans,
                        exportOptions: {
                            columns: ':visible'
                            // columns: [1, 2, 3] // Column index which needs to export
                        },

                    },
                    {
                        extend: 'excel',
                        text: window.excelButtonTrans,
                        exportOptions: {
                            columns: ':visible'
                            // columns: [1, 2, 3] // Column index which needs to export
                        },
                    },
                    {
                        extend: 'pdf',
                        text: window.pdfButtonTrans,
                        title: 'Datatables example: Customisation of the print view window',

                        exportOptions: {
                            columns: [1, 2, 3] // Column index which needs to export
                        },


                    },
                    {
                        extend: 'print',
                        text: window.printButtonTrans,

                        className: 'btn btn-danger box-shadow--4dp btn-sm-menu',

                        title: 'Datatables example: Customisation of the print view window',
                        messageTop: 'User Report',
                        messageBottom: 'The information in this table is copyright to Sirius Cybernetics Corp.',
                        exportOptions: {

                            columns: [1, 2, 3] // Column index which needs to export
                        },

                    },
                    {
                        extend: 'colvis',
                        text: window.colvisButtonTrans,
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                ],

                language: {
                    decimal: "",
                    lengthMenu: "Display _MENU_ records per page",
                    zeroRecords: "Nothing found - sorry",
                    info: "Showing page _PAGE_ of _PAGES_",
                    infoEmpty: "No records available",
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

                // table.draw(true);
                // $('#tableLoad').DataTable().destroy();

            });


            // Add
            $('#createNewpromotion').click(function() {
                $('#submit-all').html("Submit");
                $('#id').val('');
                $('#postForm').trigger("reset");
                $('#modelHeading').html("Create New promotion");
                $('#ajaxModelexa').modal('show');
                document.getElementById("up-submitbtn").style.display = "none";
                document.getElementById("submit-all").style.display = "block";
            });

            $('#submit-all').click(function(e) {
                e.preventDefault();

                let promotion = $('.promotion').val();
                let number = $('.number').val();
                let email = $('.email').val();
                let address = $('.address').val();

                let status = $(".status").is(':checked') ? 1 : 0;

                let dataall = {
                    'promotion': promotion,
                    'number': number,
                    'email': email,
                    'address': address,
                    'is_active': status,

                };
                console.log(dataall);

                // let status = $('.status:checked').val() ? $('.status:checked').val() : '0';

                $(this).html('Sending...');

                $.ajax({
                    data: dataall,
                    // data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.promotion.store') }}",
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
                        $('#submit-all').html('Save Changes');
                    }
                });
            });

            // Edit / Update
            $('body').on('click', '.editPost', function() {
                $('#modelHeading').html("Edit promotion");
                $('#up-submitbtn').html("Update");
                $('#ajaxModelexa').modal('show');
                document.getElementById("submit-all").style.display = "none";
                document.getElementById("up-submitbtn").style.display = "block";

                var id = $(this).data('id');

                let name = $(this).data('name');
                let number = $(this).data('phone');
                let email = $(this).data('email');
                let address = $(this).data('address');
                let status = $(this).data('status');




                $('#id').val(id);

                $('#promotion').val(name);
                $('#number').val(number);
                $('#email').val(email);
                $('#address').val(address);

                $('#status').val(status);
                if (status == 1) {
                    $(".status").attr('checked', true);
                } else {
                    $(".status").attr('checked', false);
                }
            });

            $('#up-submitbtn').click(function(e) {
                e.preventDefault();
                $(this).html('Updating...');

                let id = $('.id').val();
                let promotion = $('.up_promotion').val();
                let number = $('.up_number').val();
                let email = $('.up_email').val();
                let address = $('.up_address').val();

                let status = $(".status").is(':checked') ? 1 : 0;


                let updateData = {
                    'id': id,
                    'promotion': promotion,
                    'number': number,
                    'email': email,
                    'address': address,
                    'is_active': status,
                };

                console.log(updateData);

                $.ajax({
                    type: "POST",
                    data: updateData,
                    // data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.promotion.store') }}",

                    cache: false,
                    enctype: 'multipart/form-data',
                    dataType: 'json',
                    success: function(data) {

                        $('#postForm').trigger("reset");
                        $('#ajaxModelexa').modal('hide');
                        table.draw();

                    },
                    error: function(data) {
                        console.log('Error:', data);
                        $('#submit-all').html('Save Changes');
                    }
                });
            });
            // Delete
            $('body').on('click', '.deletepromotion', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var url = "{{ route('superAdmin.promotion.deleted', ':id') }}";
                var catUrl = url.replace(':id', id);

                let dataDelete = {
                    'id': id,
                };
                // alert(id);
                if (confirm("Are you sure you want to remove this promotion?") == true) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        type: "POST",
                        url: catUrl,
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
@endsection

{{-- <x-backend.superAdmin.brand.catindex :categories="$categories" /> --}}
