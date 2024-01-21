@extends('layouts.deshboard') @section('content')
@if($errors->has('name'))
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ $errors->first('name') }}</div>
@endif
@if($errors->has('image'))
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ $errors->first('image') }}</div>
@endif
@if($errors->has('email'))
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ $errors->first('email') }}</div>
@endif
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<section>
 
    <div class="container-fluid">
        <a href="{{route('superAdmin.employees.create')}}" class="btn btn-info"><i class="dripicons-plus"></i> {{trans('Add Employee')}}</a>
    </div>
    <div class="table-responsive">
        <table id="employee-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('Image')}}</th>
                    <th>{{trans('name')}}</th>
                    <th>{{trans('Email')}}</th>
                    <th>{{trans('Phone Number')}}</th>
                    <th>{{trans('Department')}}</th>
                    <th>{{trans('Address')}}</th>
                    <th class="not-exported">{{trans('action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($lims_employee_all as $key=>$employee)
                @php $department = \App\Models\Department::find($employee->department_id); @endphp
                <tr data-id="{{$employee->id}}">
                    <td>{{$key}}</td>
                    @if($employee->image)
                    <td> <img src="{{url('public/images/employee',$employee->image)}}" height="80" width="80">
                    </td>
                    @else
                    <td>No Image</td>
                    @endif
                    <td>{{ $employee->name }}</td>
                    <td>{{ $employee->email}}</td>
                    <td>{{ $employee->phone_number}}</td>
                    <td>{{ $department->name }}</td>
                    <td>{{ $employee->address}}
                            @if($employee->city){{ ', '.$employee->city}}@endif
                            @if($employee->state){{ ', '.$employee->state}}@endif
                            @if($employee->postal_code){{ ', '.$employee->postal_code}}@endif
                            @if($employee->country){{ ', '.$employee->country}}@endif</td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('action')}}
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" data-id="{{$employee->id}}" data-name="{{$employee->name}}" data-email="{{$employee->email}}" data-phone_number="{{$employee->phone_number}}" data-department_id="{{$employee->department_id}}" data-address="{{$employee->address}}" data-city="{{$employee->city}}" data-country="{{$employee->country}}" class="editBtn btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i> {{trans('edit')}}</button>
                                </li>
                              
                                <li class="divider"></li>
                        
                                {{ Form::open(['route' => ['superAdmin.employees.deleted', $employee->id], 'method' => 'DELETE'] ) }}
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

<div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">{{trans('Update Employee')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => ['superAdmin.employees.update', 1], 'method' => 'put', 'files' => true]) !!}
                <div class="row">
                    <div class="col-md-6 form-group">
                        <input type="hidden" name="employee_id" />
                        <label>{{trans('name')}} *</label>
                        <input type="text" name="name" required class="form-control">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('Image')}}</label>
                        <input type="file" name="image" class="form-control">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('Department')}} *</label>
                        <select class="form-control selectpicker" name="department_id" required>
                            @foreach($lims_department_list as $department)
                            <option value="{{$department->id}}">{{$department->name}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('Email')}} *</label>
                        <input type="email" name="email" required class="form-control">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('Phone Number')}} *</label>
                        <input type="text" name="phone_number" required class="form-control">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('Address')}}</label>
                        <input type="text" name="address" class="form-control">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('City')}}</label>
                        <input type="text" name="city" class="form-control">
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('Country')}}</label>
                        <input type="text" name="country" class="form-control">
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

@endsection

@push('custom_scripts')
<script type="text/javascript">
    $("ul#hrm").siblings('a').attr('aria-expanded','true');
    $("ul#hrm").addClass("show");
    $("ul#hrm #employee-menu").addClass("active");



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

    $('body').on('click', '.editBtn', function() {
        $("#editModal input[name='employee_id']").val( $(this).data('id') );
        $("#editModal input[name='name']").val( $(this).data('name') );
        $("#editModal select[name='department_id']").val( $(this).data('department_id') );
        $("#editModal input[name='email']").val( $(this).data('email') );
        $("#editModal input[name='phone_number']").val( $(this).data('phone_number') );
        $("#editModal input[name='address']").val( $(this).data('address') );
        $("#editModal input[name='city']").val( $(this).data('city') );
        $("#editModal input[name='country']").val( $(this).data('country') );
    });
</script>
@endpush
