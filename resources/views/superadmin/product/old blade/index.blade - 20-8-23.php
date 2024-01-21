@extends('layouts.deshboard')
@section('content')
    <div class="container">
        <div class="custom-daterange">
            <div class="form-group col-md-4">
                <h5>Start Date <span class="text-danger"></span></h5>
                <div class="controls">
                    <input type="date" name="start_date" id="start_date" class="form-control datepicker-autoclose"
                        placeholder="Please select start date">
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="form-group col-md-4">
                <h5>End Date <span class="text-danger"></span></h5>
                <div class="controls">
                    <input type="date" name="end_date" id="end_date" class="form-control datepicker-autoclose btnchange"
                        placeholder="Please select end date">
                    <div class="help-block"></div>
                </div>
            </div>
            <div class="form-group col-md-4">
                <h5> Search</h5>
                <input type="text" name="name" class="form-control searchEmail" placeholder="Search ...">
                {{-- <div class="text-left" style=" margin-left: 15px;">
                    <button type="text" id="btnFiterSubmitSearch" class="btn btn-info">Submit</button>
                </div> --}}
            </div>
        </div>
    </div>

    <div class="container px-4">

        <a class="btn btn-info float-right pull-right" href="{{ route('superAdmin.products.create') }}" id="createNewPost">
            Add New
            Post</a>
        <table id="tableLoad" class="table table-bordered data-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Brand</th>
                    <th>Category</th>
                    <th>Quentity</th>
                    <th>Unite</th>
                    <th>Cost</th>
                    <th>Price</th>
                    <th>Publish</th>
                    <th>Status</th>
                    <th width="100px">Actions</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <!-- Modal for products Add -->


    {{-- // publish  // unpublish --}}
    <script type="text/javascript">
        // publish
        $(document).on('click', '.publish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');

            var url = "{{ route('superAdmin.products.publish', ':id') }}";
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
            let url = "{{ route('superAdmin.products.unpublish', ':id') }}";
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
            // DataTable

            var table = $('.data-table').DataTable({
                // processing: true,
                // serverSide: true,
                // ajax: {
                //     url: "{{ route('superAdmin.products') }}",
                // },
                // columns: [{
                //         data: 'DT_RowIndex',
                //         name: 'DT_RowIndex'
                //     },
                //     {
                //         data: 'parent',
                //         name: 'parent'
                //     },
                //     {
                //         data: 'name_en',
                //         name: 'name_en'
                //     },
                //     {
                //         data: 'status',
                //         name: 'status'
                //     },
                //     {
                //         data: 'action',
                //         name: 'action',
                //         orderable: false,
                //         searchable: false
                //     },
                // ],
                // columnDefs: [{
                //         orderable: false,
                //         targets: [0, 4]
                //     },
                //     {
                //         className: 'text-center',
                //         targets: [0, 1, 2, 3]
                //     },
                // ],
                // order: [
                //     [0, 'desc']
                // ],
                // dom: 'Bfrtip',

                // language: dt_language, // global variable defined in html      
                // https://jsfiddle.net/cheesyMan/3fy0cxur/48/   
                // https://datatables.net/forums/discussion/60005/conditional-formatting-using-rowcallback    

                columnDefs: [{
                        orderable: true,
                        searchable: true,
                        // className: "left",
                        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
                    },
                    {
                        data: 'DT_RowIndex',
                        targets: [0],
                    },
                    {
                        data: 'image',
                        targets: [1],
                    },
                    {
                        data: 'prodcut_name',
                        targets: [2],
                    },
                    {
                        data: 'id',
                        targets: [3],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.product_code;
                            }
                            return data;
                        }
                    },

                    {
                        data: 'brand',
                        targets: [4],
                    },
                    {
                        data: 'category',
                        targets: [5],
                    },
                    {
                        data: 'qty',
                        targets: [6],
                    },
                    {
                        data: 'unit',
                        targets: [7],
                    },
                    {
                        data: 'id',
                        targets: [8],
                        render: function(data, type, row, meta) {
                            if (type === 'display') {
                                data = row.prodcut_coust;
                            }
                            return data;
                        }
                    },
                    {
                        data: 'prodcut_price',
                        targets: [9],
                    },
                    {
                        data: 'publish',
                        targets: [10],
                    },
                    {
                        data: 'status',
                        targets: [11],
                    },
                    {
                        data: 'action',
                        targets: [12],
                    },
                ],

                rowCallback: function(row, data, index) {
                    $("td:eq(1)", row).css('width', 'auto')
                },
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
                    url: "{{ route('superAdmin.products') }}",
                    data: function(d) {
                        d.product_name = $('.searchEmail').val();
                        d.search = $('input[type="search"]').val();


                    }
                },
                dom: 'lBfrtip<"actions">',
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
                            // columns: ':visible'
                            columns: [1, 2, 3] // Column index which needs to export
                        },

                        // customize: function(doc) {

                        //     $(doc.document.body).find('h1').css('text-align', 'center');
                        //     $(doc.document.body).css('font-size', '9px');
                        //     $(doc.document.body).find('table').addClass('compact').css('font-size',
                        //         'inherit');

                        //     $(doc.document.body).addClass('stylecss');
                        //     $(doc.document.body).css('color', 'red');
                        //     // doc.defaultStyle.fontSize = 19;
                        //     // doc.defaultStyle.fontFamily = 'Arial';
                        // }
                    },
                    {
                        extend: 'print',
                        text: window.printButtonTrans,

                        className: 'btn btn-danger box-shadow--4dp btn-sm-menu',

                        title: 'Datatables example: Customisation of the print view window',
                        messageTop: 'User Report',
                        messageBottom: 'The information in this table is copyright to Sirius Cybernetics Corp.',
                        exportOptions: {
                            // columns: ':visible'
                            columns: [2, 3] // Column index which needs to export
                        },
                        // customize: function(win) {
                        //     $(win.document.body)
                        //         .css('font-size', '10pt')
                        //         .prepend(
                        //             '<div><img src="http://datatables.net/media/images/logo-fade.png" style="position:absolute; top:0; left:0;"  alt="logo"/></div>'
                        //         );

                        //     $(win.document.body).find('table')
                        //         .addClass('compact')
                        //         .css('font-size', 'inherit');
                        // },
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


            // editproduct
            $('body').on('change', '.editproduct', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var url = "{{ route('superAdmin.products.edit', ':id') }}";
                var catUrl = url.replace(':id', id);

                // alert(catUrl);

                let dataDelete = {
                    'id': id,
                };
                console.log(dataDelete)
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: "post",
                    url: catUrl,
                    data: dataDelete,
                    dataType: "json",
                    success: function(res) {
                        alert("ok");
                    }
                });
            });

            // Delete
            $('body').on('click', '.deleteproducts', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var url = "{{ route('superAdmin.products.deleted', ':id') }}";
                var catUrl = url.replace(':id', id);

                let dataDelete = {
                    'id': id,
                };
                // alert(id);
                if (confirm("Are you sure you want to remove this products?") == true) {
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
{{-- <x-backend.superAdmin.products.catindex :categories="$categories" /> --}}
