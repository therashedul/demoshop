    @if (session()->has('message'))
        <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
    @endif
    @if (session()->has('not_permitted'))
        <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert"
                aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}
        </div>
    @endif
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h4>{{ trans('Update Discount') }}</h4>
                        </div>
                        <div class="card-body">
                            <p class="italic">
                                <small>{{ trans('The field labels marked with * are required input fields') }}.</small>
                            </p>
                            {!! Form::open(['route' => ['superAdmin.discount.update', $limsdiscountdata->id], 'method' => 'patch']) !!}
                            @csrf
                            <input type="hidden" name="id" value="{{ $limsdiscountdata->id }}">
                            <div class="row">
                                <div class="col-md-3 form-group">
                                    <label>{{ trans('name') }} *</label>
                                    <input type="text" name="name" value="{{ $limsdiscountdata->name }}" required
                                        class="form-control">
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>{{ trans('Discount Plan') }} *</label>
                                    <select required name="discount_plan_id[]"
                                        class="selectpicker form-control discount-plan-id" data-live-search="true"
                                        data-live-search-style="begins" title="Select discount plan..." multiple>
                                        @foreach ($limsdiscountplanlist as $discount_plan)
                                            <option value="{{ $discount_plan->id }}">{{ $discount_plan->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-3 form-group">
                                    <label>{{ trans('Applicable For') }} *</label>
                                    <select required name="applicable_for" class="form-control">
                                        @if ($limsdiscountdata->applicable_for == 'All')
                                            <option selected value="All">{{ trans('All Products') }}</option>
                                            <option value="Specific">{{ trans('Specific Products') }}</option>
                                        @else
                                            <option value="All">{{ trans('All Products') }}</option>
                                            <option selected value="Specific">{{ trans('Specific Products') }}
                                            </option>
                                        @endif
                                    </select>
                                </div>
                                <div class="col-md-3 mt-4">
                                    @if ($limsdiscountdata->is_active)
                                        <input type="checkbox" name="is_active" value="1" checked>
                                    @else
                                        <input type="checkbox" name="is_active" value="1">
                                    @endif
                                    <label>{{ trans('Active') }}</label>
                                </div>
                                <div class="col-md-9 form-group product-selection">
                                    <label>{{ trans('Select Product') }} *</label>
                                    <input type="text" name="product_code" id="product-code" class="form-control"
                                        placeholder="{{ trans('Type product code seperated by comma') }}">
                                </div>
                                <div class="col-md-9 form-group product-selection">
                                    <div class="table-responsive ml-2">
                                        <table id="product-table" class="table">
                                            <thead>
                                                <tr>
                                                    <th><i class="dripicons-view-apps"></i> No</th>
                                                    <th>{{ trans('Product Name') }}</th>
                                                    <th>{{ trans('Product Code') }}</th>
                                                    {{-- <th>{{ trans('Product Item') }}</th> --}}
                                                    <th><i class="dripicons-trash"></i>Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @if ($limsdiscountdata->applicable_for == 'Specific')
                                                @php $product_ids = explode(',', $limsdiscountdata->product_list); 
                                                
                                                @endphp

                                                @foreach ($product_ids as $key => $product_id)
                                                @php
                                                // dd($product_id);
                                                        $product_data = \App\Models\Product::select('id', 'product_name', 'product_code')->find($product_id);

                                                        if ($product_data) {
                                                            $product_datas = \App\Models\Product::join('product_variants', 'products.id', 'product_variants.product_id')->where([
                                                                ['product_variants.product_id', $product_id],
                                                                ])->select('products.id', 'products.product_name', 'products.product_code', 'product_variants.item_code')->first();
                                                            }
                                                    @endphp 
                                                    {{-- {{ optional($product_data)->id }}  --}}
                                                
                                                    <tr>
                                                        <td><input type="hidden" name="product_list[]"
                                                                value="{{ optional($product_data)->id }}" />{{ $key + 1 }}
                                                        </td>
                                                        <td>{{ optional($product_data)->product_name }}</td>
                                                        <td>{{ optional($product_data)->product_code }}</td>
                                                        {{-- <td>{{ optional($product_datas)->item_code }}</td> --}}
                                                        <td><button type="button"
                                                                class="pbtnDel btn btn-sm btn-danger">X</button></td>
                                                    </tr>
                                                @endforeach
                                            @endif
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>{{ trans('Valid From') }} *</label>
                                    <input type="date" name="valid_from"
                                        value="{{ date('Y-m-d', strtotime($limsdiscountdata->valid_from)) }}" required
                                        class="form-control date">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>{{ trans('Valid Till') }} *</label>
                                    <input type="date" name="valid_till"
                                        value="{{ date('Y-m-d', strtotime($limsdiscountdata->valid_till)) }}" required
                                        class="form-control date">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>{{ trans('Discount Type') }} *</label>
                                    <select name="type" class="form-control">
                                        @if ($limsdiscountdata->type == 'percentage')
                                            <option value="percentage" selected>Percentage (%)</option>
                                            <option value="flat">Flat</option>
                                        @else
                                            <option value="percentage">Percentage (%)</option>
                                            <option value="flat" selected>Flat</option>
                                        @endif
                                    </select>
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>{{ trans('Value') }} *</label>
                                    <input type="number" name="value" value="{{ $limsdiscountdata->value }}" required
                                        class="form-control">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>{{ trans('Minimum Qty') }} *</label>
                                    <input type="number" name="minimum_qty" value="{{ $limsdiscountdata->minimum_qty }}"
                                        required class="form-control">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>{{ trans('Maximum Qty') }} *</label>
                                    <input type="number" name="maximum_qty" value="{{ $limsdiscountdata->maximum_qty }}"
                                        required class="form-control">
                                </div>
                                <div class="col-md-4 form-group">
                                    <label>{{ trans('Valid on the following days') }}</label>
                                    <ul style="list-style-type: none; margin-left: -30px;">
                                        <li><input type="checkbox" class="Mon" name="days[]" value="Mon">&nbsp;
                                            Monday</li>
                                        <li><input type="checkbox" class="Tue" name="days[]" value="Tue">&nbsp;
                                            Tuesday</li>
                                        <li><input type="checkbox" class="Wed" name="days[]" value="Wed">&nbsp;
                                            Wednesday</li>
                                        <li><input type="checkbox" class="Thu" name="days[]" value="Thu">&nbsp;
                                            Thursday</li>
                                        <li><input type="checkbox" class="Fri" name="days[]" value="Fri">&nbsp;
                                            Friday</li>
                                        <li><input type="checkbox" class="Sat" name="days[]" value="Sat">&nbsp;
                                            Saturday</li>
                                        <li><input type="checkbox" class="Sun" name="days[]" value="Sun">&nbsp;
                                            Sunday</li>
                                    </ul>
                                </div>
                                <div class="col-md-12 mt-2">
                                    <button type="submit" class="btn btn-primary">{{ trans('submit') }}</button>
                                </div>
                            </div>
                            {!! Form::close() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        $("ul#setting").siblings('a').attr('aria-expanded', 'true');
        $("ul#setting").addClass("show");
        $("ul#setting #discount-menu").addClass("active");


        var discountplanids = @php echo json_encode($discountplanids); @endphp;
        var applicable_for = @php echo json_encode($limsdiscountdata->applicable_for); @endphp;
        var days = @php echo json_encode(explode(',', $limsdiscountdata->days)); @endphp;
        // console.log(days);
        for (i = 0; i < days.length; i++) {
            $("." + days[i]).prop('checked', true);
        }

        // var discountplanids = [1];
        // var applicable_for = "Specific";
        // var days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
        // for (i = 0; i < days.length; i++) {
        //     $("." + days[i]).prop('checked', true);
        // }


        if (applicable_for == 'All')
            $(".product-selection").hide();
        $(".discount-plan-id").val(discountplanids);

        $("input[name='product_code']").on("input", function() {
            if ($(this).val().indexOf(',') > -1) {
                var code = $(this).val().slice(0, -1);

                var url = "{{ route('superAdmin.discount.search', ':code') }}";
                var listUrl = url.replace(':code', code);

                // alert(listUrl);

                $.get(listUrl, function(data) {
                    var newRow = $("<tr>");
                    var cols = '';
                    var rowindex = $("table#product-table tbody tr:last").index();
                    console.log(rowindex);
                    cols += '<td><input type="hidden" name="product_list[]" value="' + data[0] + '" />' + (
                        rowindex + 2) + '</td>';
                    cols += '<td>' + data[1] + '</td>';
                    cols += '<td>' + data[2] + '</td>';
                    // cols += '<td>' + data[3] + '</td>';
                    cols +=
                        '<td><button type="button" class="pbtnDel btn btn-sm btn-danger">X</button></td>';
                    newRow.append(cols);
                    $("table#product-table tbody").append(newRow);
                });
                $(this).val('');
            }
        });

        //Delete product
        $("table#product-table tbody").on("click", ".pbtnDel", function(event) {
            $(this).closest("tr").remove();
        });

        $("select[name=applicable_for]").on("change", function() {
            if ($(this).val() == 'All') {
                $(".product-selection").hide(300);
            } else {
                $(".product-selection").show(300);
            }
        });

        $('.date').datepicker({
            format: "dd-mm-yyyy",
            startDate: "@php echo date('d-m-Y'); @endphp",
            autoclose: true,
            todayHighlight: true
        });
    </script>