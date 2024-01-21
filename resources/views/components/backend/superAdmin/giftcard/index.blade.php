
    @if ($errors->has('card_no'))
        <div class="alert alert-danger alert-dismissible text-center">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>{{ $errors->first('card_no') }}
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

    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="form-group">
                        <h5> Search</h5>
                        <input type="text" name="card_no" class="form-control searchEmail" placeholder="Search ...">
                    </div>
                </div>
                <div class="col-md-5"></div>
                <div class="col-md-2 mt-4">
                    <button class="btn btn-info" data-toggle="modal" data-target="#gift_card-modal"><i
                            class="dripicons-plus"></i>
                        {{ trans('Add Gift Card') }}</button>
                </div>
            </div>
        </div>
        <div class="table-responsive">
            {{-- <table id="gift_card-table" class="table"> --}}
            <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
                <thead>
                    <tr>
                        <th class="not-exported"></th>
                        <th>{{ trans('Card No') }}</th>
                        <th>{{ trans('customer') }}</th>
                        <th>{{ trans('Amount') }}</th>
                        <th class="sum">{{ trans('Expense') }}</th>
                        <th class="sumone">{{ trans('Balance') }}</th>
                        <th>{{ trans('Created By') }}</th>
                        <th>{{ trans('Expired Date') }}</th>
                        <th>{{ trans('Status') }}</th>
                        <th class="not-exported">{{ trans('action') }}</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th colspan="3" class="not-exported">Total</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th colspan="4"></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </section>

    <div id="viewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title d-print-none"> {{ trans('Card Details') }}
                        &nbsp;&nbsp;</h5>
                    <button id="print-btn" type="button" class="btn btn-default btn-sm d-print-none"><i
                            class="dripicons-print"></i> {{ trans('Print') }}</button>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close d-print-none"
                        id="close-btn"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <div class="gift-card" style="margin: 0 auto; max-width: 350px; position: relative; color:#fff;"><img
                            src="{{ asset('images/gift_card/front.jpg') }}" width="350" height="200">
                        <div style="position: absolute; padding: 15px 10px 10px 10px; top:0; left: 0; width: 350px;">
                            <h3 class="d-inline" style="padding-top:10px;">Gift Card</h3>
                            <h3 class="d-inline float-right" style="padding: 0px; margin:0px;">Taka <span id="balance"></span></h3>
                            <p class="card-number" style="font-size: 28px;letter-spacing: 3px; margin-top: 15px; margin-bottom:0px;"></p>
                            <p class="client" style="text-transform: capitalize;margin-bottom: 10px;"></p>
                            <span class="valid" style="font-size: 11px;">Valid Thru</span>
                            <p class="valid-date" style="font-size: 11px;"></p>
                        </div>
                    </div>
                    <br>
                    <div class="gift-card" style="margin: 0 auto; max-width: 350px; position: relative; color:#fff;">
                        <img src="{{ asset('images/gift_card/back.png') }}" width="350" height="200">
                        <div class="site-title"
                            style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                            @if(!empty($general_setting->site_logo))
                            @if ($general_setting->site_logo)
                                <img src="{{ url('public/logo', $general_setting->site_logo) }}" height="38px"
                                    width="38px">&nbsp;
                                <span style="font-size: 25px;">
                            @endif
                            {{ $general_setting->site_title }}
                        </span>
                            @else
                            Sit title
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="gift_card-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('Add Gift Card') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <p class="italic">
                        <small>{{ trans('The field labels marked with * are required input fields') }}.</small>
                    </p>
                    {!! Form::open(['route' => 'superAdmin.giftcard.store', 'method' => 'post']) !!}
                    @php
                        $lims_warehouse_list = DB::table('warehouses')
                            ->where('is_active', true)
                            ->get();
                    @endphp
                    <div class="form-group">
                        <label>{{ trans('Card No') }} *</label>
                        <div class="input-group">
                            {{ Form::text('card_no', null, ['required' => 'required', 'class' => 'form-control']) }}
                            <div class="input-group-append">
                                <button type="button"
                                    class="btn btn-default addgenbutton">{{ trans('Generate') }}</button>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>{{ trans('Amount') }} *</label>
                        <input type="number" name="amount" step="any" required class="form-control">
                    </div>
                    <div class="form-group">
                        <label>{{ trans('User List') }}</label>&nbsp;
                        <input type="checkbox" id="user" name="user" value="1">
                    </div>
                    <div class="form-group user_list">
                        <label>{{ trans('User') }} *</label>
                        <select name="user_id" class="selectpicker form-control" required data-live-search="true"
                            data-live-search-style="begins" title="Select User...">
                            @foreach ($limsuserlist as $user)
                                <option value="{{ $user->id }}">{{ $user->name . ' (' . $user->email . ')' }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group customer_list">
                        <label>{{ trans('customer') }} *</label>
                        <select name="customer_id" class="selectpicker form-control" required data-live-search="true"
                            data-live-search-style="begins" title="Select Customer...">
                            @foreach ($limscustomerlist as $customer)
                                <option value="{{ $customer->id }}">
                                    {{ $customer->name . ' (' . $customer->phone_number . ')' }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>{{ trans('Expired Date') }}</label>
                        <input type="text" id="expired_date" name="expired_date" class="form-control ">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">{{ trans('submit') }}</button>
                    </div>
                    {{ Form::close() }}
                </div>
            </div>
        </div>
    </div>

    {{-- editModal --}}
    <div id="ajaxModelexa" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title">{{ trans('Update Gift Card') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <p class="italic">
                        <small>{{ trans('The field labels marked with * are required input fields') }}.</small>
                    </p>
                    {{-- {!! Form::open(['route' => ['superAdmin.giftcard.update', 1], 'method' => 'put']) !!} --}}
                    <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal getUrl">
                        <input type="hidden" id='id' class="id">
                        <div class="form-group">
                            <input type="hidden" name="gift_card_id">
                            <label>{{ trans('Card No') }} *</label>
                            <div class="input-group">
                                {{ Form::text('card_no_edit', null, ['required' => 'required', 'class' => 'form-control up_card_no', 'id' => 'up_card_no']) }}

                                <div class="input-group-append">
                                    <button type="button"
                                        class="btn btn-default editgenbutton">{{ trans('Generate') }}</button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>{{ trans('Amount') }} *</label>
                            <input type="number" name="amount" step="any" required class="form-control upamount"
                                id="upamount">
                        </div>
                        <div class="form-group">
                            <label>{{ trans('User List') }} </label>&nbsp;
                            {{-- <input type="checkbox" id="user_edit" name="user_edit" class="user_edit" value="1"> --}}
                            <input type="checkbox" class="user_edit" id="user_edit" name="user_edit" value="1">
                        </div>
                        <div class="form-group user_list_edit">
                            <label>{{ trans('User') }} *</label>
                            <select name="user_id_edit" class=" form-control upuser_id_edit" id="upuser_id_edit" required
                                data-live-search="true" data-live-search-style="begins" title="Select User...">
                                @foreach ($limsuserlist as $user)
                                    <option value="{{ $user->id }}">{{ $user->name . ' (' . $user->email . ')' }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group customer_list_edit">
                            <label>{{ trans('customer') }} *</label>
                            <select name="customer_id_edit" class=" form-control customer_id_edit" id="customer_id_edit"
                                required data-live-search="true" data-live-search-style="begins"
                                title="Select Customer...">
                                @foreach ($limscustomerlist as $customer)
                                    <option value="{{ $customer->id }}">
                                        {{ $customer->name . ' (' . $customer->phone_number . ')' }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label>{{ trans('Expired Date') }}</label>
                            <input type="text" id="expired_date_edit" name="expired_date_edit"
                                class="form-control expired_date_edit">
                        </div>

                        <div class="form-group">
                            <button type="submit" id="up-submitbtn"
                                class="btn btn-primary">{{ trans('Update') }}</button>
                        </div>
                        {{-- {{ Form::close() }} --}}
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div id="rechargeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">

        <div role="document" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title modelHeading"> {{ trans('Card No') }}: </h5>
                    <span id="cardNo"></span>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <p class="italic">
                        <small>{{ trans('The field labels marked with * are required input fields') }}.</small>
                    </p>
                    <form style="width: 100%;" id="rechargeForm" name="rechargeForm" class="form-horizontal">

                        <div class="form-group">
                            <input type="hidden" name="gift_card_id" id="gift_card_id" class="gift_card_id">
                            <label>{{ trans('Amount') }} *</label>
                            <input type="number" name="amount" step="any" id="amount" required
                                class="form-control amount">
                        </div>
                        <div class="form-group">
                            <button type="submit" id="upSubmitbtn"
                                class="btn btn-primary">{{ trans('submit') }}</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    {{-- <script src="https://cdn.datatables.net/plug-ins/1.10.19/api/sum().js"></script> --}}

@push('custom_scripts')
    {{-- // publish  // unpublish --}}
    <script type="text/javascript">
        // publish
        $(document).on('click', '.publish', function(e) {
            e.preventDefault();
            let id = $(this).data('id');

            var url = "{{ route('superAdmin.giftcard.publish', ':id') }}";
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
            let url = "{{ route('superAdmin.giftcard.unpublish', ':id') }}";
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
    <script type="text/javascript">
        $("ul#sale").siblings('a').attr('aria-expanded', 'true');
        $("ul#sale").addClass("show");
        $("ul#sale #gift-card-menu").addClass("active");

        var gift_card_id = [];
        var user_verified = @php echo json_encode(env('USER_VERIFIED')); @endphp;

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });

        $("#expired_date").val($.datepicker.formatDate('yy-mm-dd', new Date()));
        $(".user_list").hide();
        $("select[name='user_id']").prop('required', false);

        var expired_date = $('#expired_date');
        expired_date.datepicker({
            format: "yyyy-mm-dd",
            startDate: "@php echo date('Y-m-d'); @endphp",
            autoclose: true,
            todayHighlight: true
        });

        var expired_date = $('#expired_date_edit');
        expired_date.datepicker({
            format: "yyyy-mm-dd",
            startDate: "@php echo date('Y-m-d'); @endphp",
            autoclose: true,
            todayHighlight: true
        });

        $(document).on("change", "#user", function() {
            if ($(this).is(':checked')) {
                $(".user_list").show();
                $(".customer_list").hide();
                $("select[name='user_id']").prop('required', true);
                $("select[name='customer_id']").prop('required', false);
            } else {
                $(".user_list").hide();
                $(".customer_list").show();
                $("select[name='user_id']").prop('required', false);
                $("select[name='customer_id']").prop('required', true);
            }
        });

        $(document).on("change", "#user_edit", function() {
            if ($(this).is(':checked')) {
                $(".user_list_edit").show();
                $(".customer_list_edit").hide();
                $("select[name='user_id_edit']").prop('required', true);
                $("select[name='customer_id_edit']").prop('required', false);
            } else {
                $(".user_list_edit").hide();
                $(".customer_list_edit").show();
                $("select[name='user_id_edit']").prop('required', false);
                $("select[name='customer_id_edit']").prop('required', true);
            }
        });


        $("#print-btn").on("click", function() {
            var divContents = document.getElementById("viewModal").innerHTML;
            var a = window.open('');
            a.document.write('<html>');
            a.document.write(
                '<body><style>body{font-family: sans-serif; -webkit-text-size-adjust: 100%; color:#fff !important;}.d-print-none{display:none}.text-center{text-align:center}.row{width:100%;margin-right: -15px;margin-left: -15px;}.col-md-12{width:100%;display:block;padding: 5px 15px;}.col-md-6{width: 50%;float:left;padding: 5px 15px;}table{width:100%;margin-top:16px;}th{text-aligh:left;}td{padding:10px}table, th, td{border: 1px solid black; border-collapse: collapse;}</style><style>@media print {.modal-dialog { max-width: 1000px;} }</style>'
            );
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            setTimeout(function() {
                a.close();
            }, 10000);
            a.print();
        });
        
        // $(document).on("click", "#print-btn", function() {
        //     var divToPrint = document.getElementById('viewModal');
        //     var newWin = window.open('', 'Print-Window');
        //     // alert(divToPrint);
        //     newWin.document.open();
        //     newWin.document.write('<link rel="stylesheet" href="@php echo asset('bootstrap/css/bootstrap.min.css'); @endphp" type="text/css"><style type="text/css">@media print {.modal-dialog { max-width: 1000px;} }</style><body onload="window.print()">' + divToPrint.innerHTML + '</body>');
        //     newWin.document.close();
        //     setTimeout(function() {
        //         newWin.close();
        //     }, 10);
        // });

        $(document).on("click", '#gift_card-modal .addgenbutton', function() {
            var codeUrl = "{{ route('superAdmin.giftcard.generate') }}";
            $.get(codeUrl, function(data) {
                $("input[name='card_no']").val(data);
            });
        });

        $(document).on("click", '#ajaxModelexa .editgenbutton', function() {
            var codeUrl = "{{ route('superAdmin.giftcard.generate') }}";
            $.get(codeUrl, function(data) {
                $("#ajaxModelexa input[name='card_no_edit']").val(data);
            });
        });

        $(document).on("click", ".view-btn", function() {
            $('#modelHeading').html("Edit brand");
            $('#up-submitbtn').html("Update");
            $('#viewModal').modal('show');
            $("#balance").text($(this).data('amount') - $(this).data('expense'));
            $(".valid-date").text($(this).data('expired_date'));
            $(".client").text($(this).data('coustomer'));
            $(".card-number").text($(this).data('card_no'));
        });

        // Edit / Update
        $('body').on('click', '.editgiftcard', function() {
            $('#modelHeading').html("Edit brand");
            $('#up-submitbtn').html("Update");
            $('#ajaxModelexa').modal('show');

            var id = $(this).data('id');
            let up_card_no = $(this).data('card_no');
            let upamount = $(this).data('amount');
            let expired_date_edit = $(this).data('expired_date');

            var upuser_id = $(this).data('user_id');
            var customer_id = $(this).data('customer_id');

            if (upuser_id) {
                $("#user_edit").prop('checked', true);
                $("select[name='user_id_edit']").val(upuser_id);
                $("select[name='customer_id_edit']").val('');
                $("select[name='user_id_edit']").prop('required', true);
                $("select[name='customer_id_edit']").prop('required', false);
                $(".user_list_edit").show();
                $(".customer_list_edit").hide();
            } else {
                $("#user_edit").prop('checked', false);
                $("select[name='customer_id_edit']").val(customer_id);
                $("select[name='user_id_edit']").val('');
                $("select[name='user_id_edit']").prop('required', false);
                $("select[name='customer_id_edit']").prop('required', true);
                $(".user_list_edit").hide();
                $(".customer_list_edit").show();
            }
            $("#expired_date_edit").val(expired_date_edit);

            $('#id').val(id);
            $('#up_card_no').val(up_card_no);
            $('#upamount').val(upamount);
            $('#upuser_id_edit').val(upuser_id);
            $('#customer_id_edit').val(customer_id);

            // $('.selectpicker').selectpicker('refresh');
            // $('select.selectpicker').selectpicker('refresh');

        });

        // Update
        $('#up-submitbtn').click(function(e) {
            e.preventDefault();
            $(this).html('Updating...');

            let id = $('.id').val();
            let user_edit = $(".user_edit").is(':checked') ? 1 : 0;
            let upuser_id = $('.upuser_id_edit').val();
            let customer_id = $('.customer_id_edit').val();
            let up_card_no = $('.up_card_no').val();
            let upamount = $('.upamount').val();
            let expired_date = $('.expired_date_edit').val();
            var url = "{{ route('superAdmin.giftcard.update', ':id') }}";
            var upUrl = url.replace(':id', id);

            let updateData = {
                'id': id,
                'user_edit': user_edit,
                'card_no_edit': up_card_no,
                'amount_edit': upamount,
                'user_id_edit': upuser_id,
                'customer_id_edit': customer_id,
                'expired_date_edit': expired_date,
            };
            console.log(updateData);

            $.ajax({
                type: "POST",
                data: updateData,
                // data: $('#postForm').serialize(),
                url: upUrl,

                cache: false,
                enctype: 'multipart/form-data',
                dataType: 'json',
                success: function(data) {

                    $('#postForm').trigger("reset");
                    $('#image_file_manager').trigger("reset");
                    $('#ajaxModelexa').modal('hide');
                    $('#tableLoad').DataTable().draw(true);

                    // $('select.selectpicker').selectpicker('refresh');
                },
                error: function(data) {
                    console.log('Error:', data);
                    $('#submit-all').html('Do not Update');
                }
            });
        });

        // Delete
        $('body').on('click', '.deletegiftcard', function(e) {
            e.preventDefault();
            var id = $(this).attr("data-id");

            var url = "{{ route('superAdmin.giftcard.destroy', ':id') }}";
            var catUrl = url.replace(':id', id);

            let dataDelete = {
                'id': id,
            };
            // alert(id);
            if (confirm("Are you sure you want to remove this Gift card?") == true) {
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

        // Recharge
        $('body').on('click', '.recharge', function() {

            $('.modelHeading').html("Card No : ");
            $('#upSubmitbtn').html("Update");
            $('#rechargeModal').modal('show');

            var id = $(this).data('id').toString();
            var amount = $(this).data('amount').toString();
            var rowindex = $(this).closest('tr').index();
            var card_no = $(this).data('card_no');

            $('#id').val(id);
            $('#cardNo').text(card_no);
            $('#amount').val(amount);
            $('#gift_card_id').val(id);
        });

        $('#upSubmitbtn').click(function(e) {
            e.preventDefault();
            $(this).html('Updating...');

            let id = $('.id').val();
            var url = "{{ route('superAdmin.giftcard.recharge', ':id') }}";
            var catUrl = url.replace(':id', id);

            $("#rechargeModal input[name='gift_card_id']").val();
            var card_no = $('#card-no').val();
            var amount = $('#amount').val();

            let dataAmount = {
                'gift_card_id': id,
                'card_no': card_no,
                'amount': amount,
            };

            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: "POST",
                url: catUrl,
                data: dataAmount,
                dataType: "json",
                success: function(res) {
                    $('#rechargeForm').trigger("reset");
                    $('#rechargeModal').modal('hide');
                    $('#tableLoad').DataTable().draw(true);
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
                        data: 'card_no',
                        targets: [1]

                    },
                    {
                        data: 'cuser',
                        targets: [2]

                    },
                    {
                        data: 'amount',
                        targets: [3]

                    },
                    {
                        data: 'expense',
                        targets: [4]

                    },
                    {
                        data: 'blance',
                        targets: [5]

                    },
                    {
                        data: 'user_name',
                        targets: [6]

                    },
                    {
                        data: 'expired_date',
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
                    url: "{{ route('superAdmin.giftcard') }}",
                    data: function(d) {
                        d.card_no = $('.searchEmail').val();
                        d.search = $('input[type="search"]').val();

                    }
                },


                // ==========================
                // https://live.datatables.net/boweyiga/1/edit

                footerCallback: function(row, data, start, end, display) {
                    let api = this.api();

                    // Remove the formatting to get integer data for summation
                    let intVal = function(i) {
                        return typeof i === 'string' ? i.replace(/[\$,]/g, '') * 1 : typeof i === 'number' ? i : 0;
                    };

                    // Total over all pages
                    total = api
                        .column(3)
                        .data()
                        .reduce((a, b) => intVal(a) + intVal(b), 0);

                    // Total over this page
                    pageTotal = api
                        .column(3, {
                            page: 'current'
                        })
                        .data()
                        .reduce((a, b) => intVal(a) + intVal(b), 0);

                    // Update footer
                    api.column(3).footer().innerHTML =
                        'TK' + Math.round(pageTotal) + ' ( TK' + Math.round(total) + ' total)';
                },
                // ============================ Mulipol collam  sum =================================
                // https: //datatables.net/forums/discussion/45385/footer-callback-for-multiple-columns
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
                        .column(4)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    total1 = api
                        .column(5)
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    // Total over this page
                    pageTotal = api
                        .column(4, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    pageTotal1 = api
                        .column(5, {
                            page: 'current'
                        })
                        .data()
                        .reduce(function(a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);

                    allTotal = pageTotal1 * pageTotal;
                    // Update footer
                    $(api.column(4).footer()).html(
                        'TK' + Math.round(pageTotal) + ' ( TK' + Math.round(total) + ' total)'
                    );

                    $(api.column(5).footer()).html(
                        'TK' +Math.round( pageTotal1) + ' ( TK' + Math.round(total1) + ' total)'
                    );
                    // $(api.column(6).footer()).html(
                    //     allTotal
                    // );

                },

                // ============================= Multy collam  sum ======================================
                // https://stackoverflow.com/questions/40034073/sum-on-1-columns-in-datatables-footer-using-footer-callback
                // drawCallback: function(row, data, start, end, display) {
                //     let api = this.api();
                //     data;

                //     // Remove the formatting to get integer data for summation
                //     let intVal = function(i) {
                //         return typeof i === 'string' ?
                //             i.replace(/[\$,]/g, '') * 1 :
                //             typeof i === 'number' ? i : 0;
                //     };

                //     var cols = [4, 5];

                //     for (let index = 0; index < cols.length; index++) {
                //         var col_data = cols[index];
                //         // Total over all pages
                //         total = api
                //             .column(col_data)
                //             .data()
                //             .reduce(function(a, b) {
                //                 return intVal(a) + intVal(b);
                //             }, 0);

                //         // Total over this page
                //         pageTotal = api
                //             .column(col_data, {
                //                 page: 'current'
                //             })
                //             .data()
                //             .reduce(function(a, b) {
                //                 return intVal(a) + intVal(b);
                //             }, 0);

                //         // Update footer
                //         $(api.column(col_data).footer()).html(
                //             'Total: ' + pageTotal + ' ( GrandTotal: ' + total + ' )'
                //         );
                //     }

                // },


                // ============================ Or Mulipol collam  sum =================================
                // https://live.datatables.net/boweyiga/1/edit
                // drawCallback: function(row, data, start, end, display) {
                //     let api = this.api();

                //     // Remove the formatting to get integer data for summation
                //     let intVal = function(i) {
                //         return typeof i === 'string' ?
                //             i.replace(/[\$,]/g, '') * 1 :
                //             typeof i === 'number' ? i : 0;
                //     };

                //     api.columns('.sum', {
                //         page: 'current'
                //     }).every(function() {
                //         var pageTotal = this
                //             .data()
                //             .reduce(function(a, b) {
                //                 return intVal(a) + intVal(b);
                //             }, 0);

                //         this.footer().innerHTML = pageTotal;
                //     });

                //     api.columns('.sumone', {
                //         page: 'current'
                //     }).every(function() {
                //         var sum = this
                //             .data()
                //             .reduce(function(a, b) {
                //                 return intVal(a) + intVal(b);
                //             }, 0);

                //         this.footer().innerHTML = sum;
                //     });

                // },
                // =======================================

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
@endpush
