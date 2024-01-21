
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
                <a class="btn btn-info mb-2 submitOnImage" href="javascript:void(0)" id="createNewcourier">
                    Add New Courier</a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th width="100px">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Modal for courier Add -->

    <div class="modal  fade" id="ajaxModelexa" tabindex="-1" aria-labelledby="addcourierModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable courier-modal">
            {{-- <form method="POST" action="{{ route('superAdmin.courier.store') }}" enctype="multipart/form-data"
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
                            <label class="col-form-label col-md-12 col-sm-12 label-align">courier Name
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="courier_name" id="mySelect_ben"
                                    class="form-control up_courier_name courierName mySelect_ben" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Phone
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="phone" id="phone" class="form-control up_phone phone"
                                    required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Address
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="address" id="address" class="form-control up_address address"
                                    required />
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
                        data: 'phone',
                        targets: [2],
                    },
                    {
                        data: 'address',
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
                    url: "{{ route('superAdmin.courier') }}",
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
            $('#createNewcourier').click(function() {
                $('#submit-all').html("Submit");
                $('#id').val('');
                $('#postForm').trigger("reset");
                $('#modelHeading').html("Create New courier");
                $('#ajaxModelexa').modal('show');
                document.getElementById("up-submitbtn").style.display = "none";
                document.getElementById("submit-all").style.display = "block";
            });

            $('#submit-all').click(function(e) {
                e.preventDefault();


                let courier = $('.courierName').val();
                let phone = $('#phone').val();
                let address = $('#address').val();


                let dataall = {
                    'name': courier,
                    'phone': phone,
                    'address': address,

                };
                console.log(dataall);

                $(this).html('Sending...');

                $.ajax({
                    data: dataall,
                    // data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.courier.store') }}",
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
                $('#modelHeading').html("Edit courier");
                $('#up-submitbtn').html("Update");
                $('#ajaxModelexa').modal('show');
                document.getElementById("submit-all").style.display = "none";
                document.getElementById("up-submitbtn").style.display = "block";

                var id = $(this).data('id');

                var url = "{{ route('superAdmin.courier.update', ':id') }}";
                var catUrl = url.replace(':id', id);

                let nameEn = $(this).data('name');
                let phone = $(this).data('phone');
                let address = $(this).data('address');

                $('#id').val(id);
                $('#mySelect_ben').val(nameEn);
                $('#phone').val(phone);
                $('#address').val(address);

            });

            $('#up-submitbtn').click(function(e) {
                e.preventDefault();
                $(this).html('Updating...');

                let id = $('.id').val();
                let courierName = $('.up_courier_name').val();
                let phone = $('#phone').val();
                let address = $('#address').val();


                let updateData = {
                    'id': id,
                    'name': courierName,
                    'phone': phone,
                    'address': address,
                };

                console.log(updateData);

                $.ajax({
                    type: "POST",
                    data: updateData,
                    // data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.courier.store') }}",

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
            $('body').on('click', '.deletecourier', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var url = "{{ route('superAdmin.courier.deleted', ':id') }}";
                var catUrl = url.replace(':id', id);

                let dataDelete = {
                    'id': id,
                };
                // alert(id);
                if (confirm("Are you sure you want to remove this courier?") == true) {
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