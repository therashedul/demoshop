
<style type="text/css">
    @media (min-width: 576px) {
        .modal-dialog {
            max-width: 800px !important;
            margin: 1.75rem auto;
        }
    }
</style>
@section('content')
    @if ($errors->has('coupon_no'))
        <div class="alert alert-danger alert-dismissible text-center">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>{{ $errors->first('coupon_no') }}
        </div>
    @endif
    @if (session()->has('message'))
        <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div>
    @endif
    @if (session()->has('not_permitted'))
        <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
    @endif
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
                <button class="btn btn-info" data-toggle="modal" data-target="#create-modal"><i class="dripicons-plus"></i>
                    {{ trans('Add Coupon') }}</button>
            </div>
        </div>
    </div>

    <section class="px-4">
        <div class="table-responsive">
            <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
                <thead>
                    <tr>
                        <th class="not-exported"></th>
                        <th>{{ trans('Coupon Code') }}</th>
                        <th>{{ trans('Type') }}</th>
                        <th>{{ trans('Amount') }}</th>
                        <th>{{ trans('Minimum Amount') }}</th>
                        <th>Qty</th>
                        <th>{{ trans('Available') }}</th>
                        <th>{{ trans('Expired Date') }}</th>
                        <th>{{ trans('Created By') }}</th>
                        <th>{{ trans('Status') }}</th>
                        <th class="not-exported">{{ trans('action') }}</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </section>

    <div id="create-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('Add Coupon') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <p class="italic">
                        <small>{{ trans('The field labels marked with * are required input fields') }}.</small>
                    </p>
                    {!! Form::open(['route' => 'superAdmin.coupon.store', 'method' => 'post']) !!}
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>{{ trans('Coupon Code') }} *</label>
                            <div class="input-group">
                                {{ Form::text('code', null, ['required' => 'required', 'class' => 'form-control']) }}
                                <div class="input-group-append">
                                    <button type="button"
                                        class="btn btn-default btn-sm genbuttonAdd">{{ trans('Generate') }}</button>
                                </div>
                                <script type="text/javascript">
                                    $(document).on("click", '.genbuttonAdd', function() {
                                        var codeUrl = "{{ route('superAdmin.coupon.generate') }}";
                                        $.get(codeUrl, function(data) {
                                            $("input[name='code']").val(data);
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ trans('Type') }} *</label>
                            <select class="form-control" name="type">
                                <option value="percentage">Percentage</option>
                                <option value="fixed">Fixed Amount</option>
                            </select>
                        </div>
                        <div class="col-md-6 form-group minimum-amount">
                            <label>{{ trans('Minimum Amount') }} *</label>
                            <input type="number" name="minimum_amount" step="any" class="form-control">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ trans('Amount') }} *</label>
                            <div class="input-group">
                                <input type="number" name="amount" step="any" required
                                    class="form-control">&nbsp;&nbsp;
                                <div class="input-group-append mt-1">
                                    <span class="icon-text" style="font-size: 22px;"><strong>%</strong></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Qty *</label>
                            <input type="number" name="quantity" step="any" required class="form-control">
                        </div>
                        <div class="col-md-6 form-group">
                            <label>{{ trans('Expired Date') }}</label>
                            <input type="date" name="expired_date" class="expired_date form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">{{ trans('submit') }}</button>
                    </div>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>

    <div id="ajaxModelexa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('Update Coupon') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <p class="italic">
                        <small>{{ trans('The field labels marked with * are required input fields') }}.</small>
                    </p>
                    <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal getUrl">
                        {{-- {!! Form::open(['route' => ['superAdmin.coupon.update', '1'], 'method' => 'put']) !!} --}}
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>{{ trans('Coupon') }} {{ trans('Code') }} *</label>
                                <div class="input-group">
                                    <input type="hidden" name="id" class="id" id="id">
                                    {{ Form::text('code', null, ['required' => 'required', 'class' => 'form-control upcode', 'id' => 'upcode']) }}
                                    <div class="input-group-append">
                                        <button type="button"
                                            class="btn btn-default btn-sm genbutton">{{ trans('Generate') }}</button>
                                    </div>
                                    <script type="text/javascript">
                                        $(document).on("click", '.genbutton', function() {
                                            var codeUrl = "{{ route('superAdmin.coupon.generate') }}";
                                            $.get(codeUrl, function(data) {
                                                $("#editModal input[name='code']").val(data);
                                            });

                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>{{ trans('Type') }} *</label>
                                <select class="form-control uptype" id="uptype" name="type">
                                    <option value="percentage">Percentage</option>
                                    <option value="fixed">Fixed Amount</option>
                                </select>
                            </div>
                            <div class="col-md-6 form-group minimum-amount">
                                <label>{{ trans('Minimum Amount') }} *</label>
                                <input type="number" name="minimum_amount" step="any"
                                    class="form-control upminimumamount" id="upminimumamount">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>{{ trans('Amount') }} *</label>
                                <div class="input-group">
                                    <input type="number" name="amount" step="any" required
                                        class="form-control upamount" id="upamount">&nbsp;&nbsp;
                                    <div class="input-group-append mt-1">
                                        <span class="icon-text" style="font-size: 22px;"><strong>%</strong></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Qty *</label>
                                <input type="number" name="quantity" step="any" required
                                    class="form-control upquantity" id="upquantity">
                            </div>
                            <div class="col-md-6 form-group">
                                <label>{{ trans('Expired Date') }}</label>
                                <input type="date" name="expired_date" class="upexpired_date form-control"
                                    id="upexpired_date">
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" id="up-submitbtn"
                                class="btn btn-primary">{{ trans('submit') }}</button>
                        </div>
                    </form>
                    {{-- {{ Form::close() }} --}}
                </div>
            </div>
        </div>
    </div>
    {{-- // publish  // unpublish --}}
    <script type="text/javascript">
        // publish
        $(document).on('click', '.publish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');

            var url = "{{ route('superAdmin.coupon.publish', ':id') }}";
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
            let url = "{{ route('superAdmin.coupon.unpublish', ':id') }}";
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
                        searchable: false,
                        className: "left",
                        targets: [0, 1, 2, 3, 4, 5, 6, 7, 9, 10]
                    },
                    {
                        data: 'DT_RowIndex',
                        targets: [0]
                    },

                    {
                        data: 'code',
                        targets: [1]

                    },
                    {
                        data: 'type',
                        targets: [2]

                    },
                    {
                        data: 'amount',
                        targets: [3]

                    },
                    {
                        data: 'minimum_amount',
                        targets: [4]

                    },
                    {
                        data: 'quantity',
                        targets: [5]

                    },
                    {
                        data: 'qty',
                        targets: [6]

                    },
                    {
                        data: 'expired_date',
                        targets: [7]

                    },
                    {
                        data: 'user_name',
                        targets: [8]
                    },
                    {
                        data: 'status',
                        targets: [9]
                    },

                    {
                        data: 'action',
                        targets: [10]
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
                    url: "{{ route('superAdmin.coupon') }}",
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


            // Edit / Update
            $('body').on('click', '.editCoupon', function() {
                $('#modelHeading').html("Edit brand");
                $('#up-submitbtn').html("Update");
                $('#ajaxModelexa').modal('show');

                var id = $(this).data('id');
                let upcode = $(this).data('code');
                let uptype = $(this).data('type');
                let upamount = $(this).data('amount');
                let upminimumamount = $(this).data('minimum_amount');
                let upquantity = $(this).data('quantity');
                let upexpired_date = $(this).data('expired_date');
                let statue = $(this).data('is_active');



                $('#id').val(id);
                $('#upcode').val(upcode);
                $('#uptype').val(uptype);
                $('#upamount').val(upamount);
                $('#upminimumamount').val(upminimumamount);
                $('#upquantity').val(upquantity);
                $('#upexpired_date').val(upexpired_date);
                $('.getUrl').val(url);

            });
            // Update
            $('#up-submitbtn').click(function(e) {
                e.preventDefault();
                $(this).html('Updating...');

                let id = $('.id').val();
                let upcode = $('.upcode').val();
                let uptype = $('.uptype').val();
                let upamount = $('.upamount').val();
                let upminimumamount = $('.upminimumamount').val();
                let upquantity = $('.upquantity').val();
                let upexpired_date = $('.upexpired_date').val();
                // let statue = $(".status").is(':checked') ? 1 : 0;



                let updateData = {
                    'id': id,
                    'code': upcode,
                    'type': uptype,
                    'amount': upamount,
                    'minimum_amount': upminimumamount,
                    'quantity': upquantity,
                    'expired_date': upexpired_date,
                };

                console.log(updateData);

                $.ajax({
                    type: "POST",
                    data: updateData,
                    // data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.coupon.store') }}",

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
            $('body').on('click', '.deletecoupon', function(e) {
                e.preventDefault();
                var id = $(this).attr("data-id");

                var url = "{{ route('superAdmin.coupon.destroy', ':id') }}";
                var catUrl = url.replace(':id', id);

                let dataDelete = {
                    'id': id,
                };
                // alert(id);
                if (confirm("Are you sure you want to remove this Coupon?") == true) {
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
                            table.draw();
                        }
                    });
                }
            });

        });
    </script>

