@extends('layouts.deshboard')
@section('content')
    <div class="container px-4">
        <div class="row">
            <div class="col-md-5">
                <div class="form-group">
                    <h5> Search</h5>
                    <input type="text" name="name" class="form-control searchEmail" placeholder="Search ...">
                    {{-- <div class="text-left" style=" margin-left: 15px;">
                    <button type="text" id="btnFiterSubmitSearch" class="btn btn-info">Submit</button>
                </div> --}}
                </div>
            </div>
            <div class="col-md-5"></div>
            <div class="col-md-2 mt-4">
                <a class="btn btn-info mb-2 submitOnImage" href="javascript:void(0)" id="createNewtax">
                    Add New tax</a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Rate</th>
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
    <!-- Modal for tax Add -->

    <div class="modal  fade" id="ajaxModelexa" tabindex="-1" aria-labelledby="addtaxModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable tax-modal">
            {{-- <form method="POST" action="{{ route('superAdmin.tax.store') }}" enctype="multipart/form-data"
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
                            <label class="col-form-label col-md-12 col-sm-12 label-align">tax Name
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="tax_name" id="mySelect_ben"
                                    class="form-control up_tax_name taxName mySelect_ben" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Rate
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="rate" id="rate" class="form-control up_rate rate"
                                    required />
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

    {{-- https://stackoverflow.com/questions/69246427/laravel-datatable-taking-too-much-of-time-to-load-data --}}

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
    {{-- // publish  // unpublish --}}
    <script type="text/javascript">
        // publish
        $(document).on('click', '.publish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');

            alert(id);

            var url = "{{ route('superAdmin.tax.publish', ':id') }}";
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
            let url = "{{ route('superAdmin.tax.unpublish', ':id') }}";
            let unUrl = url.replace(':id', id);
            alert(id);
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
                                data = row.name;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'rate',
                        targets: [2],
                    },
                    {
                        data: 'status',
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
                    url: "{{ route('superAdmin.tax') }}",
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

            // Add
            $('#createNewtax').click(function() {
                $('#submit-all').html("Submit");
                $('#id').val('');
                $('#postForm').trigger("reset");
                $('#modelHeading').html("Create New tax");
                $('#ajaxModelexa').modal('show');
                document.getElementById("up-submitbtn").style.display = "none";
                document.getElementById("submit-all").style.display = "block";
            });

            $('#submit-all').click(function(e) {
                e.preventDefault();


                let tax = $('.taxName').val();
                let rate = $('#rate').val();
                let status = $(".status").is(':checked') ? 1 : 0;

                let dataall = {
                    'name': tax,
                    'rate': rate,
                    'status': status,

                };
                console.log(dataall);

                $(this).html('Sending...');

                $.ajax({
                    data: dataall,
                    // data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.tax.store') }}",
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
                $('#modelHeading').html("Edit tax");
                $('#up-submitbtn').html("Update");
                $('#ajaxModelexa').modal('show');
                document.getElementById("submit-all").style.display = "none";
                document.getElementById("up-submitbtn").style.display = "block";

                var id = $(this).data('id');

                var url = "{{ route('superAdmin.tax.update', ':id') }}";
                var catUrl = url.replace(':id', id);

                let nameEn = $(this).data('name');
                let rate = $(this).data('rate');
                let status = $(this).data('status');

                $('#id').val(id);
                $('#mySelect_ben').val(nameEn);
                $('#rate').val(rate);
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
                let taxName = $('.up_tax_name').val();
                let rate = $('#rate').val();
                let status = $(".status").is(':checked') ? 1 : 0;

                // alert(status);

                // https://www.studentstutorial.com/laravel/laravel-ajax-update


                let updateData = {
                    'id': id,
                    'name': taxName,
                    'rate': rate,
                    'status': status,
                };

                console.log(updateData);

                $.ajax({
                    type: "POST",
                    data: updateData,
                    // data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.tax.store') }}",

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
            $('body').on('click', '.deletetax', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var url = "{{ route('superAdmin.tax.deleted', ':id') }}";
                var catUrl = url.replace(':id', id);

                let dataDelete = {
                    'id': id,
                };
                // alert(id);
                if (confirm("Are you sure you want to remove this tax?") == true) {
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

{{-- <x-backend.superAdmin.tax.catindex :categories="$categories" /> --}}
