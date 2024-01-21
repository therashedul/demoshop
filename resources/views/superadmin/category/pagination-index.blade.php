         @php
             $role_id = Auth::user()->role_id;
             $rhps = DB::table('role_has_permissions')
                 ->where('role_id', $role_id)
                 ->get();
             $permissions = DB::table('permissions')->get();
         @endphp

         <table id="tableLoad" class="table table-bordered table-striped">

             <thead>
                 <tr>
                     <th scope="col">#</th>
                     <th scope="col">Category Name</th>
                 </tr>
             </thead>
             <tbody>
                 @php
                     $sl = 1;
                     //  print_r($categories);
                 @endphp
                 @foreach ($categories as $value)
                     <tr class="update {{ $value->id }}">
                         <th scope="row">{{ $sl++ }}
                         </th>
                         <td>
                             <p class="pull-left" style="float: left;">
                                 {{ $value->{'name_' . app()->getLocale()} }}
                                 &nbsp; &nbsp;</p>

                             @foreach ($rhps as $rhpsvalue)
                                 @php
                                     $permissionId = $rhpsvalue->permission_id;
                                 @endphp

                                 @foreach ($permissions as $pvalue)
                                     @php
                                         $pid = $pvalue->id;
                                     @endphp
                                     @if ($permissionId == $pid)
                                         @if ($pvalue->name == 'category-status')
                                             <div class="pull-right" style="float: right; margin-right: 1%;">
                                                 @if ($value->status == 1)
                                                     <a style=""
                                                         href="{{ route('superAdmin.category.publish', $value->id) }}"
                                                         class="btn btn-sm btn-info "><i class="fa fa-arrow-circle-up"
                                                             aria-hidden="true"></i></a>
                                                 @else
                                                     <a href="{{ route('superAdmin.category.unpublish', $value->id) }}"
                                                         class="btn btn-sm btn-warning ">
                                                         <i class="fa fa-arrow-circle-down " aria-hidden="true"></i>
                                                     </a>
                                                 @endif
                                             </div>
                                         @endif
                                         <div class="pull-right" style="float: right; margin-right: 0.5rem"
                                             data-click="1">
                                             @if ($pvalue->name == 'category-edit')
                                                 <a href="#" data-toggle="modal" data-target="#cateditModal"
                                                     data-id="{{ $value->id }}" data-name_en="{{ $value->name_en }}"
                                                     data-name_bn="{{ $value->name_bn }}"
                                                     data-title_en="{{ $value->title_en }}"
                                                     data-title_bn="{{ $value->title_bn }}"
                                                     data-slug_en="{{ $value->slug_en }}"
                                                     data-slug_bn="{{ $value->slug_bn }}"
                                                     data-pid="{{ $value->parent_id }}"
                                                     data-status="{{ $value->status }}"
                                                     data-image="{{ $value->category_img }}"
                                                     data-url="{{ route('superAdmin.category.update', $value->id) }}"
                                                     class="update-category updateBtn"><i class="fas fa-edit"></i>
                                                 </a>
                                             @endif
                                             @if ($pvalue->name == 'category-deleted')
                                                 <a href="#" data-id="{{ $value->id }}"
                                                     data-url="{{ route('superAdmin.category.deleted', $value->id) }}"
                                                     data-toggle="modal" data-target="#myModal" id="deleteCategory"
                                                     data-modal-action="openconfimdialog"
                                                     class="btn btn-sm btn-info  btn-danger pull-right delete-category"><i
                                                         class="fa fa-trash"></i>
                                                 </a>
                                             @endif
                                         </div>
                                     @endif
                                 @endforeach
                             @endforeach
                             <br>
                             @if (count($value->subcategory) > 0)
                                 <table class="table table-hover" style="margin-bottom: 0px">
                                     @foreach ($value->subcategory as $sub)
                                         <tr>
                                             <td>
                                                 <span
                                                     style="margin-left: 25px;">{{ $sub->{'name_' . app()->getLocale()} }}</span>
                                                 @foreach ($rhps as $rhpsvalue)
                                                     @php
                                                         $permissionId = $rhpsvalue->permission_id;
                                                     @endphp
                                                     @foreach ($permissions as $pvalue)
                                                         @php
                                                             $pid = $pvalue->id;
                                                         @endphp
                                                         @if ($permissionId == $pid)
                                                             @if ($pvalue->name == 'category-status')
                                                                 <div class="pull-right"
                                                                     style="float: right; margin-right: 1%;">
                                                                     @if ($sub->status == 1)
                                                                         <a style=""
                                                                             href="{{ route('superAdmin.category.publish', $sub->id) }}"
                                                                             class="btn btn-sm btn-info "><i
                                                                                 class="fa fa-arrow-circle-up"
                                                                                 aria-hidden="true"></i></a>
                                                                     @else
                                                                         <a href="{{ route('superAdmin.category.unpublish', $sub->id) }}"
                                                                             class="btn btn-sm btn-warning">
                                                                             <i class="fa fa-arrow-circle-down "
                                                                                 aria-hidden="true"></i>
                                                                         </a>
                                                                     @endif
                                                                 </div>
                                                             @endif
                                                             <div class="pull-right"
                                                                 style="float: right; margin-right: 0.5rem">
                                                                 @if ($pvalue->name == 'category-edit')
                                                                     <a href="#" data-toggle="modal"
                                                                         data-target="#cateditModal"
                                                                         data-id="{{ $sub->id }}"
                                                                         data-name_en="{{ $sub->name_en }}"
                                                                         data-name_bn="{{ $sub->name_bn }}"
                                                                         data-title_en="{{ $sub->title_en }}"
                                                                         data-title_bn="{{ $sub->title_bn }}"
                                                                         data-slug_en="{{ $sub->slug_en }}"
                                                                         data-slug_bn="{{ $sub->slug_bn }}"
                                                                         data-pid="{{ $sub->parent_id }}"
                                                                         data-status="{{ $sub->status }}"
                                                                         data-image="{{ $sub->category_img }}"
                                                                         data-url="{{ route('superAdmin.category.update', $sub->id) }}"
                                                                         class="update-category"><i
                                                                             class="fas fa-edit"></i>
                                                                     </a>
                                                                 @endif
                                                                 @if ($pvalue->name == 'category-deleted')
                                                                     <a href="{{ route('superAdmin.category.deleted', $sub->id) }}"
                                                                         class="btn btn-sm btn-danger  pull-right"><i
                                                                             class="fa fa-trash"
                                                                             aria-hidden="true"></i></a>
                                                                 @endif
                                                             </div>
                                                         @endif
                                                     @endforeach
                                                 @endforeach
                                                 <br>
                                                 @if (count($sub->subcategory) > 0)
                                                     @include('superAdmin.category.subcategories', [
                                                         'category' => $sub->subcategory,
                                                     ])
                                                 @endif
                                             </td>
                                         </tr>
                                     @endforeach
                                 </table>
                             @endif
                         </td>
                     </tr>
                 @endforeach
             </tbody>
         </table>

         {!! $categories->links() !!}
         <!-- Modal -->
         {{-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
             <div class="modal-dialog" role="document">
                 <form id="deleteForm">
                     <div class="modal-content">
                         <div class="modal-header">
                             <h4 class="modal-title" id="myModalLabel" style="text-align: center">
                                 Confirmation!</h4>
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                 <span aria-hidden="true">&times;</span></button>
                         </div>
                         <div class="modal-body" style="text-align: center">
                             Are You Sure want to delete ?
                             <input type="text" class="setCid" id="setCid">
                             <input type="text" class="setCurl" id="setCurl">

                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">
                                 No</button>
                             <button type="button" class="btn btn-primary" data-modal-action="yes">
                                 Yes</button>
                         </div>
                     </div>
                 </form>
             </div>
         </div> --}}

         {{-- Delete --}}
         {{-- https://stackoverflow.com/questions/37413108/how-to-create-modal-window-on-delete-button --}}
         <script>
             //  var id = "";
             //  $(".delete-category").click(function(e) {
             //      e.preventDefault();
             //      var id = $(this).attr("data-id");
             //      var url = $(this).data('url');
             //      alert(id);

             //      $('.setCid').val(id);
             //      $('.setCurl').val(url);

             //      $("#myModal").modal("show");
             //  });

             //  /*  <button type="button" class="btn btn-primary" data-modal-action="yes"> Yes</button> */
             //  // when user click yes, already you stored the value in id, you can pass the vales in ajax and delete action

             //  $("[data-modal-action=yes]").click(function() {
             //      //call the delete ajax method 
             //      //awardid= 45

             //      var id = $('#setCid').val();
             //      var url = $('#setCurl').val();
             //      let dataDelete = {
             //          'id': id,
             //      };

             //      $.ajax({
             //          headers: {
             //              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
             //          },
             //          type: "GET",
             //          url: url,
             //          data: dataDelete,
             //          dataType: "json",
             //          success: function(res) {
             //              if (res.status == 'success') {
             //                  $("#myModal").modal("hide");
             //                  //  $('#deleteForm')[0].reset(); // form refresh  
             //                  $('.table').load(location.href +
             //                      ' #tableLoad'
             //                  ); //data display without reload                            
             //              }
             //          }
             //      });
             //  });
         </script>
