<?php if(session()->has('message')): ?>
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('message')); ?></div>
<?php endif; ?>
<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div>
<?php endif; ?>
<?php if($errors->has('account_no')): ?>
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e($errors->first('account_no')); ?></div>
<?php endif; ?>

<section>
    <div class="container-fluid">
        <button class="btn btn-info" data-toggle="modal" data-target="#account-modal"><i class="dripicons-plus"></i> <?php echo e(trans('Add Account')); ?></button>
    </div>
    <div class="table-responsive">
        <table id="account-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th><?php echo e(trans('Account')); ?> No</th>
                    <th><?php echo e(trans('name')); ?></th>
                    <th><?php echo e(trans('Initial Balance')); ?></th>
                    <th><?php echo e(trans('Default')); ?></th>
                    <th><?php echo e(trans('Note')); ?></th>
                    <th class="not-exported"><?php echo e(trans('action')); ?></th>
                </tr>
            </thead>
            <tbody>
                <?php $__currentLoopData = $limsaccountall; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$account): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                    <td><?php echo e($key); ?></td>
                    <td><?php echo e($account->account_no); ?></td>
                    <td><?php echo e($account->name); ?></td>
                    <?php if($account->initial_balance): ?>
                        <td><?php echo e(number_format((float)$account->initial_balance, 2, '.', '')); ?></td>
                    <?php else: ?>
                        <td>0.00</td>
                    <?php endif; ?>
                    <td>
                        <?php if($account->is_default): ?>
                            <input type="checkbox" checked class="default" data-id="<?php echo e($account->id); ?>" data-toggle="toggle" data-onstyle="success" data-offstyle="danger">
                        <?php else: ?>
                            <input type="checkbox" class="default" data-id="<?php echo e($account->id); ?>" data-toggle="toggle"  data-onstyle="success" data-offstyle="danger">
                        <?php endif; ?>
                    </td>
                    <td><?php echo e($account->note); ?></td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo e(trans('action')); ?>

                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li><button type="button" data-id="<?php echo e($account->id); ?>" data-account_no="<?php echo e($account->account_no); ?>" data-name="<?php echo e($account->name); ?>"  data-initial_balance="<?php echo e($account->initial_balance); ?>" data-note="<?php echo e($account->note); ?>" class="edit-btn btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i> <?php echo e(trans('edit')); ?></button></li>
                                <li class="divider"></li>
                                <?php echo e(Form::open(['route' => ['superAdmin.accounts.deleted', $account->id], 'method' => 'DELETE'] )); ?>

                                <li>
                                    <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> <?php echo e(trans('delete')); ?></button>
                                </li>
                                <?php echo e(Form::close()); ?>

                            </ul>
                        </div>
                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
            <tfoot class="tfoot active">
                <th></th>
                <th><?php echo e(trans('Total')); ?></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tfoot>
        </table>
    </div>
</section>

<div id="account-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">Add Account</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>The field labels marked with * are required input fields.</small></p>
              <?php echo Form::open(['route' => ['superAdmin.accounts.store'], 'method' => 'post']); ?>

                
                  <div class="form-group">
                      <label>Account No *</label>
                      <input type="text" name="account_no" required class="form-control">
                  </div>
                  <div class="form-group">
                      <label>Name *</label>
                      <input type="text" name="name" required class="form-control">
                  </div>
                  <div class="form-group">
                      <label>Initial Balance</label>
                      <input type="number" name="initial_balance" step="any" class="form-control">
                  </div>
                  <div class="form-group">
                      <label>Note</label>
                      <textarea name="note" rows="3" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                      <button type="submit" class="btn btn-primary">Submit</button>
                  </div>
                  <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
  </div>
  <!-- end account modal -->

<div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('Update Account')); ?></h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small><?php echo e(trans('The field labels marked with * are required input fields')); ?>.</small></p>
                <?php echo Form::open(['route' => ['superAdmin.accounts.update'], 'method' => 'post']); ?>

                    <div class="form-group">
                        <label><?php echo e(trans('Account')); ?> No *</label>
                        <input type="text" name="account_no" required class="form-control">
                        <input type="hidden" name="account_id">
                    </div>
                    <div class="form-group">
                        <label><?php echo e(trans('name')); ?> *</label>
                        <input type="text" name="name" required class="form-control">
                    </div>
                    <div class="form-group">
                        <label><?php echo e(trans('Initial Balance')); ?></label>
                        <input type="number" name="initial_balance" step="any" class="form-control">
                    </div>
                    <div class="form-group">
                        <label><?php echo e(trans('Note')); ?></label>
                        <textarea name="note" rows="3" class="form-control"></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary"><?php echo e(trans('update')); ?></button>
                    </div>
                <?php echo e(Form::close()); ?>

            </div>
        </div>
    </div>
</div>


<?php $__env->startPush('custom_scripts'); ?>
<script type="text/javascript">

    $("ul#account").siblings('a').attr('aria-expanded','true');
    $("ul#account").addClass("show");
    $("ul#account #account-list-menu").addClass("active");

    $('.edit-btn').on('click', function() {
        $("#editModal input[name='account_no']").val( $(this).data('account_no') );
        $("#editModal input[name='name']").val( $(this).data('name') );
        $("#editModal input[name='initial_balance']").val( $(this).data('initial_balance') );
        $("#editModal input[name='account_id']").val( $(this).data('id') );
        $("#editModal textarea[name='note']").val( $(this).data('note') );
    });

    $('.default').on('change', function() {
        //off to on
        if ($(this).parent().hasClass("btn-success")) {
            var id = $(this).data('id');
            $('.default').not($(this)).parent().removeClass('btn-success');
            $('.default').not($(this)).parent().addClass('btn-danger off');
            $('.default').not($(this)).prop('checked', false);
            $(this).prop('checked', true);
            $.get('accounts/make-default/' + id, function(data) {
                alert(data);
            });
        }
        //on to off
        else {
            $(this).parent().removeClass('btn-danger off');
            $(this).parent().addClass('btn-success');
            $(this).prop('checked', true);
            alert('Please make another account default first!');
        }
    });

function confirmDelete() {
    if (confirm("Are you sure want to delete?")) {
        return true;
    }
    return false;
}
    var table = $('#account-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ <?php echo e(trans("records per page")); ?>',
             "info":      '<small><?php echo e(trans("Showing")); ?> _START_ - _END_ (_TOTAL_)</small>',
            "search":  '<?php echo e(trans("Search")); ?>',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': [0, 6]
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        // dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.pdfHtml5.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                extend: 'excel',
                text: '<i title="export to excel" class="dripicons-document-new"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.excelHtml5.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.csvHtml5.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum(api, false);
        }
    } );
    function datatable_sum(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();
            $( dt_selector.column( 2 ).footer() ).html(dt_selector.cells( rows, 2, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 2 ).footer() ).html(dt_selector.cells( rows, 2, { page: 'current' } ).data().sum().toFixed(2));
        }
    }

</script>
<?php $__env->stopPush(); ?>
<?php /**PATH F:\xampp74\htdocs\demoshop\resources\views/components/backend/superAdmin/account/index.blade.php ENDPATH**/ ?>