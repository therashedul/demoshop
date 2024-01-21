@if($errors->has('name'))
<div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ $errors->first('name') }}</div>
@endif
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

<section>
    <div class="container-fluid">
        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#createModal"><i class="dripicons-plus"></i> {{trans('Add Department')}}</button>
    </div>
    <div class="table-responsive">
        <table id="department-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('Department')}}</th>
                    <th class="not-exported">{{trans('action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($limsdepartmentall as $key=>$department)
                <tr data-id="{{$department->id}}">
                    <td>{{$key}}</td>
                    <td>{{ $department->name }}</td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('action')}}
                              <span class="caret"></span>
                              <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" data-id="{{$department->id}}" data-name="{{$department->name}}" class="edit-btn btn btn-link" data-toggle="modal" data-target="#editModal" ><i class="dripicons-document-edit"></i>  {{trans('edit')}}</button>
                                </li>
                                <li class="divider"></li>
                                {{ Form::open(['route' => ['superAdmin.departments.deleted', $department->id], 'method' => 'DELETE'] ) }}
                                <li>
                                  <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> {{trans('delete')}}</button>
                                </li>
                                {{ Form::close() }}
                            </ul>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</section>

<!-- Create Modal -->
<div id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        {!! Form::open(['route' => 'superAdmin.departments.store', 'method' => 'post']) !!}
        <div class="modal-header">
          <h5 id="exampleModalLabel" class="modal-title">{{trans('Add Department')}}</h5>
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
        </div>
        <div class="modal-body">
          <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
          <form>
            <div class="form-group">
                <label>{{trans('name')}} *</label>
                {{Form::text('name',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => 'Type department name...'))}}
            </div>
            <div class="form-group">
              <input type="submit" value="{{trans('submit')}}" class="btn btn-primary">
            </div>
          </form>
        </div>
        {{ Form::close() }}
      </div>
    </div>
</div>
<!-- Edit Modal -->
<div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
  <div role="document" class="modal-dialog">
    <div class="modal-content">
        {{ Form::open(['route' => ['superAdmin.departments.update', 1], 'method' => 'PUT'] ) }}
      <div class="modal-header">
        <h5 id="exampleModalLabel" class="modal-title">{{trans('Update Department')}}</h5>
        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
      </div>
      <div class="modal-body">
        <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
            <div class="form-group">
                <label>{{trans('name')}} *</label>
                {{Form::text('name',null, array('required' => 'required', 'class' => 'form-control'))}}
            </div>
            <input type="hidden" name="department_id">
            <div class="form-group">
                <input type="submit" value="{{trans('submit')}}" class="btn btn-primary">
              </div>
            </div>
      {{ Form::close() }}
    </div>
  </div>
</div>

@push('custom_scripts')
<script type="text/javascript">
    $("ul#hrm").siblings('a').attr('aria-expanded','true');
    $("ul#hrm").addClass("show");
    $("ul#hrm #dept-menu").addClass("active");

    var department_id = [];

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
$(document).ready(function() {
    $('.edit-btn').on('click', function(){
        $("#editModal input[name='department_id']").val($(this).data('id'));
        $("#editModal input[name='name']").val($(this).data('name'));
    });
});

    $('#department-table').DataTable( {
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
                'targets': [0, 2]
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
