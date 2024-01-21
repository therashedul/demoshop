
    <section>
        <div class="container-fluid">
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
                    <a href="{{ route('superAdmin.discount.create') }}" class="btn btn-info"><i class="dripicons-plus"></i>
                        {{ trans('Create Discount') }}</a>&nbsp;
                </div>
            </div>

          
        </div>
        <div class="table-responsive">
            <div class="col-md-12">
                <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
                    <thead>
                        <tr>
                            <th class="not-exported">No</th>
                            <th>{{ trans('name') }}</th>
                            <th>{{ trans('Value') }}</th>
                            <th>{{ trans('Discount Plan') }}</th>
                            <th>{{ trans('start Date') }}</th>
                            <th>{{ trans('End Date') }}</th>
                            <th>{{ trans('Days') }}</th>
                            <th>{{ trans('Products') }}</th>
                            <th>{{ trans('Status') }}</th>
                            <th class="not-exported">{{ trans('action') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    {{ Form::close() }}
    {{-- // publish  // unpublish //Delete --}}
    <script type="text/javascript">
        // publish
        $(document).on('click', '.publish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');

            var url = "{{ route('superAdmin.discount.publish', ':id') }}";
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
            let url = "{{ route('superAdmin.discount.unpublish', ':id') }}";
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
        // Delete
        $('body').on('click', '.deletedisconunt', function(e) {
            e.preventDefault();
            var id = $(this).attr("data-id");

            var url = "{{ route('superAdmin.discount.deleted', ':id') }}";
            var catUrl = url.replace(':id', id);

            let dataDelete = {
                'id': id,
            };
            // alert(id);
            if (confirm("Are you sure you want to remove this Discount?") == true) {
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    type: "POST",
                    url: catUrl,
                    data: dataDelete,
                    dataType: "json",
                    success: function(res) {
                        $('#tableLoad').DataTable().draw(true);
                    }
                });
            }
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
                        targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                    },
                    {
                        data: 'DT_RowIndex',
                        targets: [0],
                    },
                    {
                        data: 'name',
                        targets: [1],
                    },
                    {
                        data: 'descountrate',
                        targets: [2],
                    },
                    {
                        data: 'descountPlan',
                        targets: [3],
                    },
                    {
                        data: 'startdate',
                        targets: [4],
                    },
                    {
                        data: 'enddate',
                        targets: [5],
                    },
                    {
                        data: 'days',
                        targets: [6],
                    },
                    {
                        data: 'applicable_for',
                        targets: [7],
                    },

                    {
                        data: 'status',
                        targets: [8],
                    },
                    {
                        data: 'action',
                        targets: [9],
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
                    url: "{{ route('superAdmin.discount') }}",
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
    </script>
