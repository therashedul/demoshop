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
                    id="createNewunit">
                    Add New Unit</a></div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>unit code</th>
                            <th>Short name</th>
                            <th>Base Name</th>
                            <th>Operator</th>
                            <th>Opration Value</th>
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
    <!-- Modal for unit Add -->

    <div class="modal  fade" id="ajaxModelexa" tabindex="-1" aria-labelledby="addunitModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable unit-modal">
            {{-- <form method="POST" action="{{ route('superAdmin.unit.store') }}" enctype="multipart/form-data"
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
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Base unit
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="base_unit" id="mySelect_en" onchange="myFunction_en()"
                                    class="form-control up_base_unit base_unit mySelect_en" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Short Name
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="short_unit" id="mySelect_bn" onchange="myFunction_bn()"
                                    class="form-control up_short_name short_name mySelect_bn" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Unit code
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="unit_code" id="unit_code"
                                    class="form-control up_unit_code unit_code" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Operator
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="operator" id="operator"
                                    class="form-control up_operator operator " required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Operation Value
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="operation_value" id="operation_value"
                                    class="form-control up_operation_value operation_value" required />
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

    {{-- ajax name check --}}
    <script type="text/javascript">
        $('#mySelect_en').blur(function() {
            var nameValue = $('#mySelect_en ').val();
            const xhttp = new XMLHttpRequest();
            let serverUrl = '/unitCheck.name/' + nameValue;
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
            let serverUrl = '/unitCheck.name/' + nameValue;
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
    {{-- // publish  // unpublish --}}
    <script type="text/javascript">
        // publish
        $(document).on('click', '.publish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');

            var url = "{{ route('superAdmin.unit.publish', ':id') }}";
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
            let url = "{{ route('superAdmin.unit.unpublish', ':id') }}";
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
                        targets: [0, 1, 2, 3, 4, 5, 6]
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
                                data = row.unit_code;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'short_name',
                        targets: [2],
                    },
                    {
                        data: 'id',
                        targets: [3],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.base_unit;
                            }
                            return data;
                        }
                    },

                    {
                        data: 'id',
                        targets: [4],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.operator;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'id',
                        targets: [5],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.operation_value;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'status',
                        targets: [6],
                    },
                    {
                        data: 'action',
                        targets: [7],
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
                    url: "{{ route('superAdmin.unit') }}",
                    data: function(d) {
                        d.base_unit = $('.searchEmail').val();
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
            $('#createNewunit').click(function() {
                $('#submit-all').html("Submit");
                $('#id').val('');
                $('#postForm').trigger("reset");
                $('#modelHeading').html("Create New unit");
                $('#ajaxModelexa').modal('show');
                document.getElementById("up-submitbtn").style.display = "none";
                document.getElementById("submit-all").style.display = "block";
            });

            $('#submit-all').click(function(e) {
                e.preventDefault();

                let base_unit = $('.base_unit').val();
                let short_name = $('.short_name').val();

                let unit_code = $('.unit_code').val();
                let operator = $('.operator').val();
                let operaton_value = $('.operaton_value').val();

                let status = $(".status").is(':checked') ? 1 : 0;

                let dataall = {
                    'base_unit': base_unit,
                    'short_name': short_name,
                    'unit_code': unit_code,
                    'operator': operator,
                    'operaton_value': operaton_value,

                    'status': status,

                };
                console.log(dataall);

                // let status = $('.status:checked').val() ? $('.status:checked').val() : '0';

                $(this).html('Sending...');

                $.ajax({
                    data: dataall,
                    // data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.unit.store') }}",
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
                $('#modelHeading').html("Edit unit");
                $('#up-submitbtn').html("Update");
                $('#ajaxModelexa').modal('show');
                document.getElementById("submit-all").style.display = "none";
                document.getElementById("up-submitbtn").style.display = "block";

                var id = $(this).data('id');


                let base_unit = $(this).data('base_unit');
                let short_name = $(this).data('short_name');
                let unit_code = $(this).data('unit_code');

                let operator = $(this).data('operator');
                let operation_value = $(this).data('operation_value');
                let status = $(this).data('status');




                $('#id').val(id);

                $('#mySelect_en').val(base_unit);
                $('#mySelect_bn').val(short_name);
                $('#unit_code').val(unit_code);
                $('#operator').val(operator);
                $('#operation_value').val(operation_value);

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
                let base_unit = $('.up_base_unit').val();
                let short_name = $('.up_short_name').val();
                let unit_code = $('.up_unit_code').val();
                let operator = $('.up_operator').val();
                let operation_value = $('.up_operation_value').val();


                let status = $(".status").is(':checked') ? 1 : 0;



                let updateData = {
                    'id': id,
                    'base_unit': base_unit,
                    'short_name': short_name,
                    'unit_code': unit_code,
                    'operator': operator,
                    'operation_value': operation_value,


                    'status': status,
                };

                // console.log(updateData);

                $.ajax({
                    type: "POST",
                    data: updateData,
                    // data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.unit.store') }}",

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
            $('body').on('click', '.deleteunit', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var url = "{{ route('superAdmin.unit.deleted', ':id') }}";
                var catUrl = url.replace(':id', id);

                let dataDelete = {
                    'id': id,
                };
                // alert(id);
                if (confirm("Are you sure you want to remove this unit?") == true) {
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
