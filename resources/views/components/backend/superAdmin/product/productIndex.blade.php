<div class="container">
    <div class="custom-daterange " style="display: none">
        <div class="form-group col-md-3 ">
            <h5>Start Date <span class="text-danger"></span></h5>
            <div class="controls">
                <input type="date" name="start_date" id="start_date" class="form-control datepicker-autoclose"
                    placeholder="Please select start date">
                <div class="help-block"></div>
            </div>
        </div>
        <div class="form-group col-md-3">
            <h5>End Date <span class="text-danger"></span></h5>
            <div class="controls">
                <input type="date" name="end_date" id="end_date" class="form-control datepicker-autoclose btnchange"
                    placeholder="Please select end date">
                <div class="help-block"></div>
            </div>
        </div>
        <div class="form-group col-md-3 ">
            <div class="form-group">
                <label><strong>Brand</strong></label>
                <select id="brand_id" class="form-control brand_id" name="brand_id">
                    <option value="">All</option>
                    @foreach ($brands as $brand)
                        <option value="{{ $brand->id }}">{{ $brand->brand_name }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="form-group col-md-3">
            <div class="form-group">
                <label><strong>Category</strong></label>

                <select id="category_id" class="form-control category_id" name="category_id">
                    <option value="">All</option>
                    @foreach ($categories as $category)
                        <option value="{{ $category->id }}">{{ $category->name_en }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="form-group col-md-12">
            <h5> Search</h5>
            <input type="text" name="product_name" class="form-control searchEmail"
                placeholder="Search product name...">
            {{-- <div class="text-left" style=" margin-left: 15px;">
                    <button type="text" id="btnFiterSubmitSearch" class="btn btn-info">Submit</button>
                </div> --}}
        </div>
    </div>
</div>

<div class="container px-4 ">
    <div class="row justify-content-center align-items-center g-2">
        <a class="btn btn-primary float-right pull-right" href="{{ route('superAdmin.products.create') }}"
            id="createNewPost"> Add New Post</a> &NonBreakingSpace; &nbsp;
        <button type="button" class="btn btn-info searchBtn"><i class="fas fa-search-plus"></i> Search</button>
    </div>
    <script type="text/javascript">
        // $('.custom-daterange').css('padding-top', '2%');
        $('.searchBtn').click(function(e) {
            e.preventDefault();
            $(".custom-daterange").animate({
                height: 'toggle'
            });
            // $(".custom-daterange").slideToggle("slow");


        })
    </script>



    <table id="tableLoad" class="table table-bordered data-table">
        <thead>
            <tr>
                <th>No</th>
                <th>Image</th>
                <th>Name</th>
                <th>Code</th>
                <th>Brand</th>
                <th>Category</th>
                <th>Unite</th>
                <th>Quentity</th>
                <th>Cost</th>
                <th>Price</th>
                <th>Publish</th>
                <th>Status</th>
                <th width="100px">Actions</th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <td colspan="7">Total</td>
                <td></td>
                <td></td>
                <td></td>
                <td colspan="3"></td>
            </tr>
        </tfoot>
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
                    className: "left",
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
                    data: 'product_name',
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
                    data: 'unit',
                    targets: [6],
                },
                {
                    data: 'qty',
                    targets: [7],
                },
                {
                    data: 'product_cost',
                    targets: [8],
                    render: function(data, type, row, meta) {
                        if (type === 'display') {
                            data = row.product_cost;
                        }
                        return data;
                    }
                },
                {
                    data: 'product_price',
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
            processing: true,
            serverSide: true,
            searching: false,
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
            // className: "left",

            ajax: {
                url: "{{ route('superAdmin.products') }}",
                data: function(d) {
                    d.product_name = $('.searchEmail').val();

                    d.from_date = $('#start_date').val();
                    d.to_date = $('#end_date').val();


                    d.brand_id = $("#brand_id").val();
                    d.category_id = $("#category_id").val();

                    d.search = $('input[type="search"]').val();

                }
            },
            drawCallback: function(row, data, start, end, display) {
                let api = this.api();

                // Remove the formatting to get integer data for summation
                let intVal = function(i) {
                    return typeof i === 'string' ?
                        i.replace(/[\$,]/g, '') * 1 :
                        typeof i === 'number' ? i : 0;
                };

                // Total over all pages
                total = api
                    .column(7)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                total1 = api
                    .column(8)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);
                total2 = api
                    .column(9)
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                // Total over this page
                pageTotal = api
                    .column(7, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                pageTotal1 = api
                    .column(8, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);
                pageTotal2 = api
                    .column(9, {
                        page: 'current'
                    })
                    .data()
                    .reduce(function(a, b) {
                        return intVal(a) + intVal(b);
                    }, 0);

                allTotal = pageTotal1 * pageTotal;
                // Update footer
                $(api.column(7).footer()).html(
                    Math.round(pageTotal)
                );

                $(api.column(8).footer()).html(
                    Math.round(pageTotal1) + " " + "TK"
                );
                $(api.column(9).footer()).html(
                    Math.round(pageTotal2) + " " + "TK"
                );


                // $(api.column(8).footer()).html(
                //     'TK' +Math.round( pageTotal1) + ' ( TK' + Math.round(total1) + ' total)'
                // );
                // $(api.column(9).footer()).html(
                //     'TK' + Math.round(pageTotal2) + ' ( TK' + Math.round(total2) + ' total)'
                // );

                // $(api.column(6).footer()).html(
                //     allTotal
                // );

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

        $(".brand_id").change(function() {
            // alert("kkk");
            table.draw(true);
            // $('#tableLoad').DataTable().draw(true);
        });
        $(".category_id").change(function() {
            table.draw(true);
            // $('#tableLoad').DataTable().draw(true);
        });

        $('.btnchange').change(function() {
            $('#tableLoad').DataTable().draw(true);

            // table.draw(true);
            // $('#tableLoad').DataTable().destroy();

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
                alert(catUrl);
                if (confirm("Are you sure you want to remove this purchase?") == true) {
                    $.ajax({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        },
                        method: 'POST',
                        url: catUrl,
                        data: dataDelete,
                        dataType: "json",
                        success: function(res) {
                            $('#tableLoad').trigger("reset");
                            table.draw();
                        }
                    });
                }
            });

    });
</script>
