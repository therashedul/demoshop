
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<section>
    <div class="container-fluid">
        <button class="btn btn-info" data-toggle="modal" data-target="#createModal"><i class="dripicons-plus"></i> {{trans('Add Holiday')}} </button>
    </div>
    <div class="table-responsive">
        <table id="holiday-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('date')}}</th>
                    <th>{{trans('Employee')}}</th>
                    <th>{{trans('From')}}</th>
                    <th>{{trans('To')}}</th>
                    <th>{{trans('Note')}}</th>
                    <th class="not-exported">{{trans('action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($limsholidaylist as $key=>$holiday)
                <tr data-id="{{$holiday->id}}">
                    <td>{{$key}}</td>
                    <td>{{ date($general_setting->date_format, strtotime($holiday->created_at->toDateString())) }}</td>
                    <td>{{ $holiday->user->name }}</td>
                    <td>{{ date($general_setting->date_format, strtotime($holiday->from_date)) }}</td>
                    <td>{{ date($general_setting->date_format, strtotime($holiday->to_date)) }}</td>
                    <td>{{$holiday->note}}</td>
                    <td>
                        <div class="btn-group">
                        	@if(!$holiday->is_approved && $approvepermission)
                        	<button type="button" class="btn btn-sm btn-success btn-approve" title="{{trans('Approve')}}" data-id="{{$holiday->id}}">Approve</button>
                        	@endif
                        	<button type="button" class="btn btn-sm btn-primary btn-edit" title="{{trans('edit')}}" data-id="{{$holiday->id}}" data-from="{{date($general_setting->date_format, strtotime($holiday->from_date))}}" data-to="{{date($general_setting->date_format, strtotime($holiday->to_date))}}" data-note="{{$holiday->note}}" data-toggle="modal" data-target="#editModal">Edit</button>
                            {{ Form::open(['route' => ['superAdmin.holidays.deleted', $holiday->id], 'method' => 'DELETE'] ) }}
                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirmDelete()" title="{{trans('delete')}}">Delete</button>
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
                <h5 id="exampleModalLabel" class="modal-title">{{trans('Add Holiday')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'superAdmin.holidays.store', 'method' => 'post']) !!}
                <div class="row">
                    @if(!empty($general_setting->date_format))
                    <div class="col-md-6 form-group">
                        <label>{{trans('From')}} *</label>
                        <input type="text" name="from_date" class="form-control date" value="{{date($general_setting->date_format)}}" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('To')}} *</label>
                        <input type="text" name="to_date" class="form-control date" value="{{date($general_setting->date_format)}}" required>
                    </div>
                    @else
                    @endif

                    <div class="col-md-12 form-group">
                        <label>{{trans('Note')}}</label>
                        <textarea name="note" rows="3" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">{{trans('submit')}}</button>
                </div>
                {{ Form::close() }}
            </div>
        </div>
    </div>
</div>

<div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">{{trans('Update Holiday')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => ['superAdmin.holidays.update', 1], 'method' => 'put']) !!}
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>{{trans('From')}} *</label>
                        <input type="hidden" name="id">
                        <input type="text" name="from_date" class="form-control date" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('To')}} *</label>
                        <input type="text" name="to_date" class="form-control date" required>
                    </div>
                    <div class="col-md-12 form-group">
                        <label>{{trans('Note')}}</label>
                        <textarea name="note" rows="3" class="form-control"></textarea>
                    </div>
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
    $("ul#hrm #holiday-menu").addClass("active");

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function confirmDelete() {
        if (confirm("Are you sure want to delete?")) {
            return true;
        }
        return false;
    }

    var holiday_id = [];

	var date = $('.date');
    date.datepicker({
     format: "dd-mm-yyyy",
     startDate: "<?php echo date('d-m-Y'); ?>",
     autoclose: true,
     todayHighlight: true
     });

    $(document).on('click', '.btn-approve', function() {
	    var id = $(this).data('id');
	    $.get('approve-holiday/'+id, function(data) {
	        $('.btn-approve').addClass('d-none');
	    });
	});

    $(document).on('click', '.btn-edit', function() {
        $("input[name='id']").val($(this).data('id'));
        $("input[name='from_date']").val($(this).data('from'));
        $("input[name='to_date']").val($(this).data('to'));
        $("textarea[name='note']").val($(this).data('note'));
    });

    $('#holiday-table').DataTable( {
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
      
    } );
</script>
@endpush
