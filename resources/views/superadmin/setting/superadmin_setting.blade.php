@extends('layouts.deshboard') @section('content').


@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4>{{trans('file.General Setting')}}</h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                        {!! Form::open(['route' => 'superAdmin.ganeralsetting.superadminsettingStore', 'files' => true, 'method' => 'post']) !!}
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.System Title')}} *</label>
                                        <input type="text" name="site_title" class="form-control" value="@if($lims_general_setting_data){{$lims_general_setting_data->site_title}}@endif" required />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.System Logo')}} *</label>
                                        <input type="file" name="site_logo" class="form-control" value=""/>
                                    </div>
                                    @if($errors->has('site_logo'))
                                   <span>
                                       <strong>{{ $errors->first('site_logo') }}</strong>
                                    </span>
                                    @endif
                                </div>
                                <div class="col-md-4 mt-4">
                                    <div class="form-group">
                                        @if($lims_general_setting_data->is_rtl)
                                        <input type="checkbox" name="is_rtl" value="1" checked>
                                        @else
                                        <input type="checkbox" name="is_rtl" value="1" />
                                        @endif
                                        &nbsp;
                                        <label>{{trans('file.RTL Layout')}}</label>

                                    </div>
                                </div>
                                @if(config('database.connections.saleprosaas_landlord'))
                                    <div class="col-md-4 mt-4">
                                        <div class="form-group">
                                            @if($lims_general_setting_data->is_zatca)
                                            <input type="checkbox" name="is_zatca" value="1" checked>
                                            @else
                                            <input type="checkbox" name="is_zatca" value="1" />
                                            @endif
                                            &nbsp;
                                            <label>{{trans('file.ZATCA QrCode')}}</label>

                                        </div>
                                    </div>
                                @endif
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.Company Name')}}</label>
                                        <input type="text" name="company_name" class="form-control" value="@if($lims_general_setting_data){{$lims_general_setting_data->company_name}}@endif" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.VAT Registration Number')}}</label>
                                        <input type="text" name="vat_registration_number" class="form-control" value="@if($lims_general_setting_data){{$lims_general_setting_data->vat_registration_number}}@endif" />
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('free_trial_limit')}} *</label>
                                        @if($lims_general_setting_data)
                                        <input type="hidden" name="free_trial_limit" value="{{$lims_general_setting_data->free_trial_limit}}">
                                        @endif
                                        <select name="free_trial_limit" class="selectpicker form-control">
                                            <option value="yearly"> {{trans('yearly')}}</option>
                                            <option value="monthly"> {{trans('monthly')}}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('phone')}}*</label>
                                        <input class="form-control" type="text" name="phone" value="@if($lims_general_setting_data){{$lims_general_setting_data->phone}}@endif" max="6" min="0">
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('phone')}}*</label>
                                        <div class="controls">
                                            <input type="date" name="expiry_date" value="@if($lims_general_setting_data){{$lims_general_setting_data->expiry_date}}@endif" class="form-control datepicker-autoclose"
                                                placeholder="Please select start date">
                                            <div class="help-block"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('email')}}*</label>
                                        <input class="form-control" type="text" name="email" value="@if($lims_general_setting_data){{$lims_general_setting_data->email}}@endif" max="6" min="0">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.Digits after deciaml point')}}*</label>
                                        <input class="form-control" type="number" name="decimal" value="@if($lims_general_setting_data){{$lims_general_setting_data->decimal}}@endif" max="6" min="0">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.Theme')}} *</label>
                                        <div class="row ml-1">
                                            <div class="col-md-3 theme-option" data-color="default.css" style="background: #7c5cc4; min-height: 40px; max-width: 50px;" title="Purple"></div>&nbsp;&nbsp;
                                            <div class="col-md-3 theme-option" data-color="green.css" style="background: #1abc9c; min-height: 40px;max-width: 50px;" title="Green"></div>&nbsp;&nbsp;
                                            <div class="col-md-3 theme-option" data-color="blue.css" style="background: #3498db; min-height: 40px;max-width: 50px;" title="Blue"></div>&nbsp;&nbsp;
                                            <div class="col-md-3 theme-option" data-color="dark.css" style="background: #34495e; min-height: 40px;max-width: 50px;" title="Dark"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.Sale and Quotation without stock')}} *</label><br>
                                        @if($lims_general_setting_data->without_stock == 'yes')
                                        <label class="radio-inline">
                                            <input type="radio" name="without_stock" value="yes" checked> {{trans('file.Yes')}}
                                        </label>
                                        <label class="radio-inline">
                                          <input type="radio" name="without_stock" value="no"> {{trans('file.No')}}
                                        </label>
                                        @else
                                        <label class="radio-inline">
                                            <input type="radio" name="without_stock" value="yes"> {{trans('file.Yes')}}
                                        </label>
                                        <label class="radio-inline">
                                          <input type="radio" name="without_stock" value="no" checked> {{trans('file.No')}}
                                        </label>
                                        @endif
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.Staff Access')}} *</label>
                                        @if($lims_general_setting_data)
                                        <input type="hidden" name="staff_access_hidden" value="{{$lims_general_setting_data->staff_access}}">
                                        @endif
                                        <select name="staff_access" class="selectpicker form-control">
                                            <option value="all"> {{trans('file.All Records')}}</option>
                                            <option value="own"> {{trans('file.Own Records')}}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.Invoice Format')}} *</label>
                                        @if($lims_general_setting_data)
                                        <input type="hidden" name="invoice_format_hidden" value="{{$lims_general_setting_data->invoice_format}}">
                                        @endif
                                        <select name="invoice_format" class="selectpicker form-control" required>
                                            <option value="standard">Standard</option>
                                            <option value="gst">Indian GST</option>
                                        </select>
                                    </div>
                                </div>
                                <div id="state" class="col-md-4 d-none">
                                    <div class="form-group">
                                        <label>{{trans('file.State')}} *</label>
                                        @if($lims_general_setting_data)
                                        <input type="hidden" name="state_hidden" value="{{$lims_general_setting_data->state}}">
                                        @endif
                                        <select name="state" class="selectpicker form-control">
                                            <option value="1">Home State</option>
                                            <option value="2">Buyer State</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.Date Format')}} *</label>
                                        @if($lims_general_setting_data)
                                        <input type="hidden" name="date_format_hidden" value="{{$lims_general_setting_data->date_format}}">
                                        @endif
                                        <select name="date_format" class="selectpicker form-control">
                                            <option value="d-m-Y"> dd-mm-yyy</option>
                                            <option value="d/m/Y"> dd/mm/yyy</option>
                                            <option value="d.m.Y"> dd.mm.yyy</option>
                                            <option value="m-d-Y"> mm-dd-yyy</option>
                                            <option value="m/d/Y"> mm/dd/yyy</option>
                                            <option value="m.d.Y"> mm.dd.yyy</option>
                                            <option value="Y-m-d"> yyy-mm-dd</option>
                                            <option value="Y/m/d"> yyy/mm/dd</option>
                                            <option value="Y.m.d"> yyy.mm.dd</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>{{trans('file.Developed By')}}</label>
                                        <input type="text" name="developed_by" class="form-control" value="{{$lims_general_setting_data->developed_by}}">
                                    </div>
                                </div>
                                @if(config('database.connections.saleprosaas_landlord'))
                                    <br>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>{{trans('file.Subscription Type')}}</label>
                                            <p>{{$lims_general_setting_data->subscription_type}}</p>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>{{trans('file.Package Name')}}</label>
                                            <p id="package-name"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>{{trans('file.Monthly Fee')}}</label>
                                            <p id="monthly-fee"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>{{trans('file.Yearly Fee')}}</label>
                                            <p id="yearly-fee"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>{{trans('file.Number of Warehouses')}}</label>
                                            <p id="number-of-warehouse"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>{{trans('file.Number of Products')}}</label>
                                            <p id="number-of-product"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>{{trans('file.Number of Invoices')}}</label>
                                            <p id="number-of-invoice"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>{{trans('file.Number of User Account')}}</label>
                                            <p id="number-of-user-account"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>{{trans('file.Number of Employees')}}</label>
                                            <p id="number-of-employee"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="form-group">
                                            <label>{{trans('file.Subscription Ends at')}}</label>
                                            <p>{{date($lims_general_setting_data->date_format, strtotime($lims_general_setting_data->expiry_date))}}</p>
                                        </div>
                                    </div>
                                @endif
                            </div>
                            <div class="form-group">
                                <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
                            </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


@endsection

@push('custom_scripts')
<script type="text/javascript">
    $("ul#setting").siblings('a').attr('aria-expanded','true');
    $("ul#setting").addClass("show");
    $("ul#setting #general-setting-menu").addClass("active");

    $("select[name=invoice_format]").on("change", function (argument) {
        if($(this).val() == 'standard') {
            $("#state").addClass('d-none');
            $("input[name=state]").prop("required", false);
        }
        else if($(this).val() == 'gst') {
            $("#state").removeClass('d-none');
            $("input[name=state]").prop("required", true);
        }
    })
    if($("input[name='timezone_hidden']").val()){
        $('select[name=timezone]').val($("input[name='timezone_hidden']").val());
        $('select[name=staff_access]').val($("input[name='staff_access_hidden']").val());
        $('select[name=date_format]').val($("input[name='date_format_hidden']").val());
        $('select[name=invoice_format]').val($("input[name='invoice_format_hidden']").val());
        if($("input[name='invoice_format_hidden']").val() == 'gst') {
            $('select[name=state]').val($("input[name='state_hidden']").val());
            $("#state").removeClass('d-none');
        }

    }

    $('.theme-option').on('click', function() {

        $.get('general_setting/change-theme/' + $(this).data('color'), function(data) {
        });
        var style_link= $('#custom-style').attr('href').replace(/([^-]*)$/, $(this).data('color') );
        $('#custom-style').attr('href', style_link);
    });

</script>
@endpush
