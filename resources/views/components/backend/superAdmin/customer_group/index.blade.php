@if($errors->has('name'))
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ $errors->first('name') }}</div>
@endif
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

<section>
    <div class="container-fluid">
        <a href="#" data-toggle="modal" data-target="#createModal" class="btn btn-info"><i class="dripicons-plus"></i> {{trans('Add Customer Group')}}</a>
        <a href="#" data-toggle="modal" data-target="#importcustomer_group" class="btn btn-primary"><i class="dripicons-copy"></i> {{trans('Import Customer Group')}}</a>
    </div>
    <div class="table-responsive">
        <table id="customer-grp-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('name')}}</th>
                    <th>{{trans('Percentage')}}</th>
                    <th class="not-exported">{{trans('action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($limscustomergroupall as $key=>$customer_group)
                <tr data-id="{{$customer_group->id}}">
                    <td>{{$key}}</td>
                    <td>{{ $customer_group->name }}</td>
                    <td>{{ $customer_group->percentage}}</td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('action')}}
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" data-id="{{$customer_group->id}}" class="open-EditCustomerGroupDialog btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i> {{trans('edit')}}
                                    </button>
                                </li>
                                <li class="divider"></li>
                                {{ Form::open(['route' => ['superAdmin.coustomergroup.deleted', $customer_group->id], 'method' => 'DELETE'] ) }}
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

<div id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
<div role="document" class="modal-dialog">
  <div class="modal-content">
    {!! Form::open(['route' => 'superAdmin.coustomergroup.store', 'method' => 'post']) !!}
    <div class="modal-header">
      <h5 id="exampleModalLabel" class="modal-title">{{trans('Add Customer Group')}}</h5>
      <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
    </div>
    <div class="modal-body">
      <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
      <form>
        <div class="form-group">
          <label>{{trans('name')}} *</label>
          <input type="text" name="name" required="required" class="form-control">
        </div>
        <div class="form-group">
          <label>{{trans('Percentage')}}(%) *</label>
          <input type="text" name="percentage" required="required" class="form-control">
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

<div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
<div role="document" class="modal-dialog">
  <div class="modal-content">

    {!! Form::open(['route' => ['superAdmin.coustomergroup.update'], 'method' => 'POST']) !!}
    <div class="modal-header">
      <h5 id="exampleModalLabel" class="modal-title">{{trans('Update Customer Group')}}</h5>
      <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
    </div>
    <div class="modal-body">
      <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
        <div class="form-group">
            <input type="hidden" name="customer_group_id">
          <label>{{trans('name')}} *</label>
          <input type="text" name="name" required="required" class="form-control">
        </div>
        <div class="form-group">
          <label>{{trans('Percentage')}}(%) *</label>
          <input type="text" name="percentage" required="required" class="form-control">
        </div>
        <div class="form-group">
          <input type="submit" value="{{trans('submit')}}" class="btn btn-primary">
        </div>
    </div>
    {{ Form::close() }}
  </div>
</div>
</div>

<div id="importcustomer_group" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
<div role="document" class="modal-dialog">
  <div class="modal-content">
    {!! Form::open(['route' => 'superAdmin.customer_group.import', 'method' => 'post', 'files' => true]) !!}
    <div class="modal-header">
      <h5 id="exampleModalLabel" class="modal-title"> {{trans('Import Customer Group')}}</h5>
      <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
    </div>
    <div class="modal-body">
        <p class="italic"><small>{{trans('The field labels marked with * are required input fields')}}.</small></p>
    <p>{{trans('The correct column order is')}} (name*, percentage*) {{trans('and you must follow this')}}.</p>
      <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>{{trans('Upload CSV File')}} *</label>
                    {{Form::file('file', array('class' => 'form-control','required'))}}
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label> {{trans('Sample File')}}</label>
                    @php
                        $filePath = public_path("sample_file/sample_customer_group.csv");
                    @endphp
                    <a href="{{ asset('sample_file/sample_customer_group.csv') }}" class="btn btn-info btn-block btn-md"><i class="dripicons-download"></i>  {{trans('Download')}}</a>
                </div>
            </div>
      </div>

        <input type="submit" value="{{trans('submit')}}" class="btn btn-primary">
    </div>
    {{ Form::close() }}
  </div>
</div>
</div>



@push('custom_scripts')
<script type="text/javascript">
    // alert("kk");
    $("ul#setting").siblings('a').attr('aria-expanded','true');
    $("ul#setting").addClass("show");
    $("ul#setting #customer-group-menu").addClass("active");

    var customer_group_id = [];
    var user_verified = @php echo json_encode(env('USER_VERIFIED')) @endphp;

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


        $('body').on('click', '.open-EditCustomerGroupDialog', function() {
            var id = $(this).data('id').toString();
            // var url = "coustomergroup/"
            // url = url.concat(id).concat("/edit");

            var url = "{{ route('superAdmin.coustomergroup.edit', ':id') }}";
            var pubUrl = url.replace(':id', id);
            alert(pubUrl);

            $.get(pubUrl, function(data) {
                $("input[name='name']").val(data['name']);
                $("input[name='percentage']").val(data['percentage']);
                $("input[name='customer_group_id']").val(data['id']);
            });
        });


    $('#customer-grp-table').DataTable( {
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
                'targets': [0, 3]
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

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    $( "#select_all" ).on( "change", function() {
        if ($(this).is(':checked')) {
            $("tbody input[type='checkbox']").prop('checked', true);
        }
        else {
            $("tbody input[type='checkbox']").prop('checked', false);
        }
    });

    $("#export").on("click", function(e){
    e.preventDefault();
    var customer_group = [];
    $(':checkbox:checked').each(function(i){
      customer_group[i] = $(this).val();
    });
    $.ajax({
       type:'POST',
       url:'/coustomergroup',
       data:{
            customer_groupArray: customer_group
        },
       success:function(data){
         alert('Exported to CSV file successfully! Click Ok to download file');
         window.location.href = data;
       }
    });
});
</script>

@endpush
