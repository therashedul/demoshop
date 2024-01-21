@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

<section>
    <div class="container-fluid">
        <button class="btn btn-info" data-toggle="modal" data-target="#createModal"><i class="dripicons-plus"></i> {{trans('Add Attendance')}} </button>
    </div>
    <div class="table-responsive">
        <table id="attendance-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('date')}}</th>
                    <th>{{trans('Employee')}}</th>
                    <th>{{trans('CheckIn')}}</th>
                    <th>{{trans('CheckOut')}}</th>
                    <th>{{trans('Status')}}</th>
                    <th>{{trans('Created By')}}</th>
                    <th class="not-exported">{{trans('action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($limsattendanceall as $key=>$attendance)
                @php
                    $employee = \App\Models\Employee::find($attendance->employee_id);
                    $user = \App\Models\User::find($attendance->user_id);
                @endphp
                <tr data-id="{{$attendance->id}}">
                    <td>{{$key}}</td>
                    <td>{{ date($general_setting->date_format, strtotime($attendance->date)) }}</td>
                    <td>{{ $employee->name }}</td>
                    <td>{{ $attendance->checkin }}</td>
                    <td>{{ $attendance->checkout }}</td>
                    @if($attendance->status)
                        <td><div class="badge badge-success">{{trans('Present')}}</div></td>
                    @else()
                        <td><div class="badge badge-danger">{{trans('Late')}}</div></td>
                    @endif
                    <td>{{$user->name}}</td>
                    <td>
                        <div class="btn-group">
                            {{ Form::open(['route' => ['superAdmin.attendance.deleted', $attendance->id], 'method' => 'DELETE'] ) }}
                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirmDelete()" title="{{trans('delete')}}"><i class="dripicons-trash"></i>Delete</button>
                            {{ Form::close() }}
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</section>

<div id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">{{trans('Add Attendance')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'superAdmin.attendance.store', 'method' => 'post', 'files' => true]) !!}
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>{{trans('Employee')}} *</label>
                        <select class="form-control selectpicker" name="employee_id[]" required data-live-search="true" data-live-search-style="begins" title="Select Employee..." multiple>
                            @foreach($limsemployeelist as $employee)
                            <option value="{{$employee->id}}">{{$employee->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    @if(!empty($general_setting->date_format))
                    <div class="col-md-6 form-group">
                        <label>{{trans('date')}} *</label>
                        <input type="text" name="date" class="form-control date" value="{{date($general_setting->date_format)}}" required>

                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('CheckIn')}} *</label>
                        <input type="text" id="checkin" name="checkin" class="form-control" value="{{$limshrmsettingdata->checkin}}" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('CheckOut')}} *</label>
                        <input type="text" id="checkout" name="checkout" class="form-control" value="{{$limshrmsettingdata->checkout}}" required>
                    </div>
                    <div class="col-md-12 form-group">
                        <label>{{trans('Note')}}</label>
                        <textarea name="note" rows="3" class="form-control"></textarea>
                    </div>
                    @else
                    @endif
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">{{trans('submit')}}</button>
                </div>
                {{ Form::close() }}
            </div>
        </div>
    </div>
</div>



@push('custom_scripts')
<script type="text/javascript">

	$("ul#hrm").siblings('a').attr('aria-expanded','true');
    $("ul#hrm").addClass("show");
    $("ul#hrm #attendance-menu").addClass("active");

    function confirmDelete() {
        if (confirm("Are you sure want to delete?")) {
            return true;
        }
        return false;
    }

    var attendance_id = [];
    var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

	var date = $('.date');
    date.datepicker({
     format: "dd-mm-yyyy",
     autoclose: true,
     todayHighlight: true
     });

    $('#checkin, #checkout').timepicker({
    	'step': 15,
    });

    var table = $('#attendance-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ {{trans("records per page")}}',
             "info":      '<small>{{trans("Showing")}} _START_ - _END_ (_TOTAL_)</small>',
            "search":  '{{trans("Search")}}',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': [0, 7]
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
                    rows: ':visible',
                }
            },
            {
                extend: 'excel',
                text: '<i title="export to excel" class="dripicons-document-new"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                },
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                },
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                },
            },
            {
                text: '<i title="delete" class="dripicons-cross"></i>',
                className: 'buttons-delete',
                action: function ( e, dt, node, config ) {
                    if(user_verified == '1') {
                        attendance_id.length = 0;
                        $(':checkbox:checked').each(function(i){
                            if(i){
                                attendance_id[i-1] = $(this).closest('tr').data('id');
                            }
                        });
                        if(attendance_id.length && confirm("Are you sure want to delete?")) {
                            $.ajax({
                                type:'POST',
                                url:'attendance/deletebyselection',
                                data:{
                                    attendanceIdArray: attendance_id
                                },
                                success:function(data){
                                    alert(data);
                                }
                            });
                            dt.rows({ page: 'current', selected: true }).remove().draw(false);
                        }
                        else if(!attendance_id.length)
                            alert('Nothing is selected!');
                    }
                    else
                        alert('This feature is disable for demo!');
                }
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ],
    } );
</script>
@endpush