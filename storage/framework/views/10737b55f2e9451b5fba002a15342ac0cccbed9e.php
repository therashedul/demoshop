 <?php $__env->startSection('content'); ?>.


<?php if(session()->has('message')): ?>
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('message')); ?></div>
<?php endif; ?>
<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div>
<?php endif; ?>
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center">
                        <h4><?php echo e(trans('Super Admin General Setting')); ?></h4>
                    </div>
                    <div class="card-body">
                        <p class="italic"><small><?php echo e(trans('The field labels marked with * are required input fields')); ?>.</small></p>
                        <?php echo Form::open(['route' => 'superAdmin.ganeralsetting.superadminsettingStore', 'files' => true, 'method' => 'post']); ?>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('System Title')); ?> *</label>
                                    <input type="text" name="site_title" class="form-control" value="<?php if($lims_general_setting_data): ?><?php echo e($lims_general_setting_data->site_title); ?><?php endif; ?>" required />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('System Logo')); ?> *</label>
                                    <input type="file" name="site_logo" class="form-control" value=""/>
                                </div>
                                <?php if($errors->has('site_logo')): ?>
                               <span>
                                   <strong><?php echo e($errors->first('site_logo')); ?></strong>
                                </span>
                                <?php endif; ?>
                            </div>
                            <div class="col-md-4 mt-4">
                                <div class="form-group">
                                    <?php if($lims_general_setting_data->is_rtl): ?>
                                    <input type="checkbox" name="is_rtl" value="1" checked>
                                    <?php else: ?>
                                    <input type="checkbox" name="is_rtl" value="1" />
                                    <?php endif; ?>
                                    &nbsp;
                                    <label><?php echo e(trans('RTL Layout')); ?></label>
                                </div>
                            </div>
                            
                                <div class="col-md-4 mt-4">
                                    <div class="form-group">
                                        <?php if($lims_general_setting_data->is_zatca): ?>
                                        <input type="checkbox" name="is_zatca" value="1" checked>
                                        <?php else: ?>
                                        <input type="checkbox" name="is_zatca" value="1" />
                                        <?php endif; ?>
                                        &nbsp;
                                        <label><?php echo e(trans('ZATCA QrCode')); ?></label>

                                    </div>
                                </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Company Name')); ?></label>
                                    <input type="text" name="company_name" class="form-control" value="<?php if($lims_general_setting_data): ?><?php echo e($lims_general_setting_data->company_name); ?><?php endif; ?>" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('VAT Registration Number')); ?></label>
                                    <input type="text" name="vat_registration_number" class="form-control" value="<?php if($lims_general_setting_data): ?><?php echo e($lims_general_setting_data->vat_registration_number); ?><?php endif; ?>" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Phone')); ?></label>
                                    <input type="text" name="phone" class="form-control" value="<?php if($lims_general_setting_data): ?><?php echo e($lims_general_setting_data->phone); ?><?php endif; ?>" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Email')); ?></label>
                                    <input type="email" name="email" class="form-control" value="<?php if($lims_general_setting_data): ?><?php echo e($lims_general_setting_data->email); ?><?php endif; ?>" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('free_trial_limit')); ?> *</label>
                                    <?php if($lims_general_setting_data): ?>
                                    <input type="hidden" name="free_trial_limit_hidden" value="<?php echo e($lims_general_setting_data->free_trial_limit); ?>">
                                    <?php endif; ?>
                                    <select name="free_trial_limit" class=" form-control">
                                        <option value="monthly"> <?php echo e(trans('monthly')); ?></option>
                                        <option value="yearly"> <?php echo e(trans('yearly')); ?></option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Expiry date')); ?></label>
                                    <input type="date" name="expiry_date" class="form-control" value="<?php if($lims_general_setting_data): ?><?php echo e($lims_general_setting_data->expiry_date); ?><?php endif; ?>" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Time Zone')); ?></label>
                                    <?php if($lims_general_setting_data): ?>
                                    <input type="hidden" name="timezone_hidden" value="<?php echo e(env('APP_TIMEZONE')); ?>">
                                    <?php endif; ?>
                                    <select name="timezone" class=" form-control" data-live-search="true" title="Select TimeZone...">
                                        <?php $__currentLoopData = $zones_array; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $zone): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($zone['zone']); ?>"><?php echo e($zone['diff_from_GMT'] . ' - ' . $zone['zone']); ?></option>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Currency Position')); ?> *</label><br>
                                    <?php if($lims_general_setting_data->currency_position == 'prefix'): ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="currency_position" value="prefix" checked> <?php echo e(trans('Prefix')); ?>

                                    </label>
                                    <label class="radio-inline">
                                      <input type="radio" name="currency_position" value="suffix"> <?php echo e(trans('Suffix')); ?>

                                    </label>
                                    <?php else: ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="currency_position" value="prefix"> <?php echo e(trans('Prefix')); ?>

                                    </label>
                                    <label class="radio-inline">
                                      <input type="radio" name="currency_position" value="suffix" checked> <?php echo e(trans('Suffix')); ?>

                                    </label>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Digits after deciaml point')); ?>*</label>
                                    <input class="form-control" type="number" name="decimal" value="<?php if($lims_general_setting_data): ?><?php echo e($lims_general_setting_data->decimal); ?><?php endif; ?>" max="6" min="0">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Theme')); ?> *</label>
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
                                    <label><?php echo e(trans('Sale and Quotation without stock')); ?> *</label><br>
                                    <?php if($lims_general_setting_data->without_stock == 'yes'): ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="without_stock" value="yes" checked> <?php echo e(trans('Yes')); ?>

                                    </label>
                                    <label class="radio-inline">
                                      <input type="radio" name="without_stock" value="no"> <?php echo e(trans('No')); ?>

                                    </label>
                                    <?php else: ?>
                                    <label class="radio-inline">
                                        <input type="radio" name="without_stock" value="yes"> <?php echo e(trans('Yes')); ?>

                                    </label>
                                    <label class="radio-inline">
                                      <input type="radio" name="without_stock" value="no" checked> <?php echo e(trans('No')); ?>

                                    </label>
                                    <?php endif; ?>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Staff Access')); ?> *</label>
                                    <?php if($lims_general_setting_data): ?>
                                    <input type="hidden" name="staff_access_hidden" value="<?php echo e($lims_general_setting_data->staff_access); ?>">
                                    <?php endif; ?>
                                    <select name="staff_access" class=" form-control">
                                        <option value="all"> <?php echo e(trans('All Records')); ?></option>
                                        <option value="own"> <?php echo e(trans('Own Records')); ?></option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Invoice Format')); ?> *</label>
                                    <?php if($lims_general_setting_data): ?>
                                    <input type="hidden" name="invoice_format_hidden" value="<?php echo e($lims_general_setting_data->invoice_format); ?>">
                                    <?php endif; ?>
                                    <select name="invoice_format" class=" form-control" required>
                                        <option value="standard">Standard</option>
                                        <option value="gst">Indian GST</option>
                                    </select>
                                </div>
                            </div>
                            <div id="state" class="col-md-4 d-none">
                                <div class="form-group">
                                    <label><?php echo e(trans('State')); ?> *</label>
                                    <?php if($lims_general_setting_data): ?>
                                    <input type="hidden" name="state_hidden" value="<?php echo e($lims_general_setting_data->state); ?>">
                                    <?php endif; ?>
                                    <select name="state" class=" form-control">
                                        <option value="1">Home State</option>
                                        <option value="2">Buyer State</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><?php echo e(trans('Date Format')); ?> *</label>
                                    <?php if($lims_general_setting_data): ?>
                                    <input type="hidden" name="date_format_hidden" value="<?php echo e($lims_general_setting_data->date_format); ?>">
                                    <?php endif; ?>
                                    <select name="date_format" class=" form-control">
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
                                    <label><?php echo e(trans('Developed By')); ?></label>
                                    <input type="text" name="developed_by" class="form-control" value="<?php echo e($lims_general_setting_data->developed_by); ?>">
                                </div>
                            </div>
                            <?php if(config('database.connections.saleprosaas_landlord')): ?>
                                <br>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Subscription Type')); ?></label>
                                        <p><?php echo e($lims_general_setting_data->subscription_type); ?></p>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Package Name')); ?></label>
                                        <p id="package-name"></p>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Monthly Fee')); ?></label>
                                        <p id="monthly-fee"></p>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Yearly Fee')); ?></label>
                                        <p id="yearly-fee"></p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Number of Warehouses')); ?></label>
                                        <p id="number-of-warehouse"></p>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Number of Products')); ?></label>
                                        <p id="number-of-product"></p>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Number of Invoices')); ?></label>
                                        <p id="number-of-invoice"></p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Number of User Account')); ?></label>
                                        <p id="number-of-user-account"></p>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Number of Employees')); ?></label>
                                        <p id="number-of-employee"></p>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label><?php echo e(trans('Subscription Ends at')); ?></label>
                                        <p><?php echo e(date($lims_general_setting_data->date_format, strtotime($lims_general_setting_data->expiry_date))); ?></p>
                                    </div>
                                </div>
                            <?php endif; ?>
                        </div>
                            <div class="form-group">
                                <input type="submit" value="<?php echo e(trans('submit')); ?>" class="btn btn-primary">
                            </div>
                        <?php echo Form::close(); ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<?php $__env->stopSection(); ?>

<?php $__env->startPush('custom_scripts'); ?>
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
        $('select[name=free_trial_limit]').val($("input[name='free_trial_limit_hidden']").val());
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
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.deshboard', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/superadmin/setting/superadmin_setting.blade.php ENDPATH**/ ?>