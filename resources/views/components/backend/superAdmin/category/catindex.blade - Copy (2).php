<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="col-md-8">
                            <input type="text" name="cat-search" id="catSearch" placeholder="Search..."
                                class="form-control cat-search" placeholder="" aria-describedby="helpId">
                        </div>
                        <div class="col-md-4">

                            @php
                                $role_id = Auth::user()->role_id;
                                $rhps = DB::table('role_has_permissions')
                                    ->where('role_id', $role_id)
                                    ->get();
                                $permissions = DB::table('permissions')->get();
                            @endphp
                            @foreach ($rhps as $rhpsvalue)
                                @php
                                    $permissionId = $rhpsvalue->permission_id;
                                @endphp

                                @foreach ($permissions as $pvalue)
                                    @php
                                        $pid = $pvalue->id;
                                    @endphp
                                    @if ($permissionId == $pid)
                                        @if ($pvalue->name == 'category-create')
                                            <span class="float-right">
                                                <button type="button"
                                                    class="btn btn-outline-primary mb-2 ml-2 card-title"
                                                    data-toggle="modal" data-target="#addCategoryModal">
                                                    Add Category
                                                </button>
                                            </span>
                                        @endif
                                    @endif
                                @endforeach
                            @endforeach
                        </div>
                    </div>
                    <!-- Modal for Category Add -->
                    {{-- @include('superadmin.category.createmodal') --}}
                    <div class="card-body cat-result table-data">
                        <div class="table-panel">
                            {{-- @include('superadmin.category.pagination-index') --}}
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
                                            <th scope="row">
                                                {{-- {{ $sl++ }} --}}
                                                {{ ($categories->currentPage() - 1) * $categories->perPage() + $loop->iteration }}


                                                {{-- {{ $loop->iteration }} --}}
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
                                                                <div class="pull-right"
                                                                    style="float: right; margin-right: 1%;">
                                                                    @if ($value->status == 1)
                                                                        <a href="javascript:void(0)"
                                                                            data-id="{{ $value->id }}"
                                                                            data-url="{{ route('superAdmin.category.publish', $value->id) }}"
                                                                            class="btn btn-sm btn-info publish"><i
                                                                                class="fa fa-arrow-circle-up"
                                                                                aria-hidden="true"></i></a>
                                                                    @else
                                                                        <a href="javascript:void(0)"
                                                                            data-id="{{ $value->id }}"
                                                                            data-url="{{ route('superAdmin.category.unpublish', $value->id) }}"
                                                                            class="btn btn-sm btn-warning unpublish ">
                                                                            <i class="fa fa-arrow-circle-down "
                                                                                aria-hidden="true"></i>
                                                                        </a>
                                                                    @endif
                                                                </div>
                                                            @endif
                                                            <div class="pull-right"
                                                                style="float: right; margin-right: 0.5rem"
                                                                data-click="1">
                                                                @if ($pvalue->name == 'category-edit')
                                                                    <a href="" data-toggle="modal"
                                                                        data-target="#cateditModal"
                                                                        data-id="{{ $value->id }}"
                                                                        data-name_en="{{ $value->name_en }}"
                                                                        data-name_bn="{{ $value->name_bn }}"
                                                                        data-title_en="{{ $value->title_en }}"
                                                                        data-title_bn="{{ $value->title_bn }}"
                                                                        data-slug_en="{{ $value->slug_en }}"
                                                                        data-slug_bn="{{ $value->slug_bn }}"
                                                                        data-pid="{{ $value->parent_id }}"
                                                                        data-status="{{ $value->status }}"
                                                                        data-image="{{ $value->category_img }}"
                                                                        data-url="{{ route('superAdmin.category.update', $value->id) }}"
                                                                        class="update-category updateBtn"><i
                                                                            class="fas fa-edit"></i>
                                                                    </a>
                                                                @endif
                                                                @if ($pvalue->name == 'category-deleted')
                                                                    <a href="#" data-id="{{ $value->id }}"
                                                                        data-url="{{ route('superAdmin.category.deleted', $value->id) }}"
                                                                        {{-- data-toggle="modal" data-target="#myModal"
                                                                        data-modal-action="openconfimdialog" --}} id="deleteCategory"
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
                                                                                                href="#"
                                                                                                data-id="{{ $sub->id }}"
                                                                                                data-url="{{ route('superAdmin.category.publish', $sub->id) }}"
                                                                                                class="btn btn-sm btn-info publish"><i
                                                                                                    class="fa fa-arrow-circle-up"
                                                                                                    aria-hidden="true"></i></a>
                                                                                        @else
                                                                                            <a href="#"
                                                                                                data-id="{{ $sub->id }}"
                                                                                                data-url="{{ route('superAdmin.category.unpublish', $sub->id) }}"
                                                                                                class="btn btn-sm btn-warning unpublish">
                                                                                                <i class="fa fa-arrow-circle-down "
                                                                                                    aria-hidden="true"></i>
                                                                                            </a>
                                                                                        @endif
                                                                                    </div>
                                                                                @endif
                                                                                <div class="pull-right"
                                                                                    style="float: right; margin-right: 0.5rem">
                                                                                    @if ($pvalue->name == 'category-edit')
                                                                                        <a href="#"
                                                                                            data-toggle="modal"
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
                                                                                        <a href="#"
                                                                                            data-id="{{ $sub->id }}"
                                                                                            data-url="{{ route('superAdmin.category.deleted', $sub->id) }}"
                                                                                            {{-- data-toggle="modal" data-target="#myModal"
                                                                        data-modal-action="openconfimdialog" --}}
                                                                                            id="deleteCategory"
                                                                                            class="btn btn-sm btn-info  btn-danger pull-right delete-category"><i
                                                                                                class="fa fa-trash"></i>
                                                                                        </a>
                                                                                    @endif
                                                                                </div>
                                                                            @endif
                                                                        @endforeach
                                                                    @endforeach
                                                                    <br>
                                                                    @if (count($sub->subcategory) > 0)
                                                                        @include(
                                                                            'superAdmin.category.subcategories',
                                                                            [
                                                                                'category' => $sub->subcategory,
                                                                            ]
                                                                        )
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

                            {{-- {!! $categories->render() !!} --}}
                            {!! $categories->links() !!}
                        </div>
                        <!-- /.card-body -->
                        {{-- table-panel --}}
                    </div>
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</section>
<!-- /.content -->
@include ('superadmin.category.commnonmodal')
{{-- @include ('superadmin.category.deletemodal') --}}
{{-- @include ('superadmin.category.cateditmodal')
    @include('superadmin.category.createmodal') --}}
<!-- Button trigger modal -->
<!-- Delete Modal -->
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
    // $(".delete-category").click(function(e) {
    //     var id = $(this).attr("data-id");
    //     var url = $(this).data('url');
    //     alert(id);
    //     e.preventDefault();

    //     $('.setCid').val(id);
    //     $('.setCurl').val(url);

    // });
    // // $("#myModal").modal("show");

    // /*  <button type="button" class="btn btn-primary" data-modal-action="yes"> Yes</button> */
    // // when user click yes, already you stored the value in id, you can pass the vales in ajax and delete action

    // $("[data-modal-action=yes]").click(function(e) {
    //     e.preventDefault();
    //     var id = $('#setCid').val();
    //     var url = $('#setCurl').val();
    //     let dataDelete = {
    //         'id': id,
    //     };

    //     alert(id);

    //     $('.table').load(location.href +
    //         ' #tableLoad'); //data display without reload   
    //     $('#deleteForm')[0].reset(); // form refresh 

    //     $.ajax({
    //         headers: {
    //             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    //         },
    //         type: "POST",
    //         url: url,
    //         data: dataDelete,
    //         dataType: "json",
    //         success: function(res) {
    //             if (res.status == 'success') {
    //                 $("#tableLoad").append(res);
    //                 // $("#myModal").modal("hide");
    //                 // $('#tableLoad')[0].reset(); // form refresh  
    //                 // $("#myModal").find('form').trigger('reset');
    //                 $('.table').load(location.href +
    //                     ' #tableLoad'); //data display without reload    
    //             }
    //         }
    //     });
    //     $("#myModal").modal("hide");
    // });
</script>

{{-- // publish  // unpublish --}}
<script type="text/javascript">
    // publish
    $(document).on('click', '.publish', function(e) {
        e.preventDefault();
        let id = $(this).data('id');
        let url = $(this).data('url');

        let dataDelete = {
            'id': id,
        };

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: "GET",
            url: url,
            data: dataDelete,
            dataType: "json",
            success: function(res) {
                if (res.status == 'success') {
                    $('.table').load(location.href +
                        ' #tableLoad'); //data display without reload                            
                }
            }
        });
    })
    // unpublish
    $(document).on('click', '.unpublish', function(e) {
        e.preventDefault();
        let id = $(this).data('id');
        let url = $(this).data('url');

        let dataDelete = {
            'id': id,
        };

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: "GET",
            url: url,
            data: dataDelete,
            dataType: "json",
            success: function(res) {
                if (res.status == 'success') {
                    $('.table').load(location.href +
                        ' #tableLoad'); //data display without reload                            
                }
            }
        });
    })

    // delete
    $(document).on('click', '.delete-category', function(e) {
        e.preventDefault();
        var id = $(this).attr("data-id");
        var url = $(this).data('url');
        let dataDelete = {
            'id': id,
        };
        // alert(id);
        if (confirm("Are you sure you want to remove this category?") == true) {
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                type: "POST",
                url: url,
                data: dataDelete,
                dataType: "json",
                success: function(res) {
                    if (res.status == 'success') {
                        $('.table').load(location.href +
                            ' #tableLoad'); //data display without reload    
                    }
                }
            });
        }
    });

    // Seach
    $(document).on('keyup', function(e) {
        e.preventDefault();
        let search = $("#catSearch").val();
        console.log(search);
        var data = {
            "search": search
        };

        $.ajax({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: "post",
            url: "{{ route('superAdmin.categoryscat.search') }}",
            data: data,
            success: function(res) {
                $('.table-panel').html(res)
                if (res.status == "Nothing Found") {
                    $('.table-panel').html('<span class="text-danger">' +
                        ' No found any data' + '</span>')
                }
            }
        });
    });
</script>

{{-- Pagination --}}
<script type="text/javascript">
    // https://www.webslesson.info/2018/09/laravel-pagination-using-ajax.html

    // $(window).on('hashchange', function() {
    //     if (window.location.hash) {
    //         var page = window.location.hash.replace('#', '');
    //         if (page == Number.NaN || page <= 0) {
    //             return false;
    //         } else {
    //             fetch_data(page);
    //         }
    //     }
    // });

    // $(document).on('click', '.pagination a', function(e) {
    //     e.preventDefault();
    //     $('li').removeClass('active');
    //     $(this).parent('li').addClass('active');
    //     var urls = $(this).attr('href');

    //     var page = $(this).attr('href').split('page=')[1];
    //     fetch_data(page);
    // })

    // function fetch_data(page) {
    //     $.ajax({
    //         url: "/pagination/fetch_data?page=" + page,
    //         // url: "/pagination/fetch_data?page=" + page,
    //         type: "GET",
    //         success: function(data) {
    //             $(".table-panel").html(data);
    //             location.hash = page;
    //         }
    //     });
    // }
</script>

<script type="text/javascript>">
    $(document).ready(function() {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    })
</script>

{{-- Add javascript --}}
<script type="text/javascript">
    $(document).ready(function() {
        $('.btnSubmit').click(function(e) {
            e.preventDefault();
            let nameEn = $('.name_en').val();
            let nameBn = $('.name_bn').val();

            let titleEn = $('.name_en').val();
            let titleBn = $('.name_bn').val();

            let slugEn = $('.slug_en').val();
            let slugBn = $('.slug_bn').val();

            let status = $('.sts:checked').val() ? $('.sts:checked').val() : '0';
            // let select = document.getElementById("categoryName").value; // another way
            // let email = $('input[name:email').val(),
            // let file =  $("input[type=file]").get(0).files[0];
            let selectElement = document.querySelector('#categoryName');
            let pCatName = selectElement.options[selectElement.selectedIndex].value ?? 0;
            let imageName = $('#image_name').val();

            let dataall = {
                'name_en': nameEn,
                'name_bn': nameBn,

                'title_en': nameEn,
                'title_bn': nameBn,

                'slug_en': slugEn,
                'slug_bn': slugBn,

                'status': status,
                'parent_id': pCatName,
                'image_name': imageName,

            };

            // alert(category);
            // $.ajaxSetup({
            //     headers: {
            //         'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            //     }
            // });
            // alert(status);

            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: "{{ route('superAdmin.category.store') }}",
                type: "POST",
                enctype: 'multipart/form-data',
                data: dataall,
                dataType: "json",
                success: function(res) {
                    if (res.status == 'success') {
                        $('#addCategoryModal').modal('hide'); // Modal hide
                        $('#category-form')[0].reset(); // form refresh  
                        $('#display_image').attr('src', "#");
                        $('#btn_delete_post_main_image').css("opacity", "0.0");

                        $('.table').load(location.href +
                            ' #tableLoad'); //data display without reload
                    }
                },
                error: function(jqXhr, json, errorThrown) { // this are default for ajax errors 
                    $('.errMsgContainer').html('');
                    var errors = jqXhr.responseJSON;
                    $('#category-form')[0].reset(); // form refresh 
                    $.each(errors['errors'], function(index, value) {
                        $('.errMsgContainer').append('<span class="text-danger">' +
                            value + '</span>' + '<br>')
                    });

                }
            });
        });
    })
</script>
{{-- End --}}

{{-- Edit/update javascript --}}
<script type="text/javascript">
    $(document).ready(function() {
        // show Category value for update
        $(document).on('click', '.update-category', function(e) {
            e.preventDefault();
            var id = $(this).data('id');
            let nameEn = $(this).data('name_en');
            let nameBn = $(this).data('name_bn');

            let titleEn = $(this).data('title_en');
            let titleBn = $(this).data('title_bn');

            let slugEn = $(this).data('slug_en');
            let slugBn = $(this).data('slug_bn');

            let status = $(this).data('status');
            let pid = $(this).data('pid');
            let image = $(this).data('image');
            let url = $(this).data('url');

            $('#updata-id').val(id)

            $('.nameEn').val(nameEn)
            $('.nameBn').val(nameBn)

            $('.titleEn').val(titleEn)
            $('.titleBn').val(titleBn)

            $('.slugEn').val(slugEn)
            $('.slugBn').val(slugBn)
            $("#upCategory option:selected").removeAttr("selected")
            $("#upCategory option[value='" + pid + "']").attr('selected', 'selected');
            // https://stackoverflow.com/questions/499405/change-the-selected-value-of-a-drop-down-list-with-jquery
            $('#up-status').val(status)
            if (status == 1) {
                $(".mycheckbox").attr('checked', true);
            } else {
                $(".mycheckbox").attr('checked', false);
            }
            // image
            $('#image_name').val(image);
            $('.getUrl').val(url);


            let imageURL = {!! json_encode(url('/')) !!} + "/upload/";
            let emptyimageURL = {!! json_encode(url('/')) !!} + "/img/profile/cemera.jpg";
            if (image) {
                let dispalyImg = '<div class="post-select-image-container">' +
                    '<a id="btn_delete_post_main_image" onclick="imageRemove()" class="btn btn-danger btn-sm btn-delete-selected-file-image">' +
                    '<img src="' + imageURL + image + '" alt="" id="display_image">' +
                    '<i class="fa fa-times"></i> ' +
                    '</a>' +
                    '</div>';

                document.querySelector('.dispalyImage').innerHTML = dispalyImg;

                // $('.dispalyImage').html('<img src="' + imageURL + image +
                //     '" id="selected_image_file" alt="" class="img-fluid "/>');
            } else {
                $('.dispalyImage').html('<img src="' + emptyimageURL +
                    '" width = "170px" height = "200px"/>');
            }

            // $('.dispalyImage').html('<img src="' + imageURL + image + '"/>');
        })

        // Update
        $('.btn-update').click(function(e) {
            e.preventDefault();


            var updateUrl = $('.getUrl').val();
            // https://www.studentstutorial.com/laravel/laravel-ajax-update

            let id = $('.up-id').val();
            // another way set url in ajax
            // var url = "{{ route('superAdmin.category.update', ':id') }}";
            // var url = url.replace(':id', id);
            // https://w3codegenerator.com/code-snippets/jquery/how-to-pass-javascript-variable-to-laravel-route-on-ajax-call

            let nameEn = $('.up_name_en').val();
            let nameBn = $('.up_name_bn').val();

            let titleEn = $('.up_name_en').val();
            let titleBn = $('.up_name_bn').val();

            let slugEn = $('.upslug_en').val();
            let slugBn = $('.upslug_bn').val();

            let status = $('.up-status:checked').val() ? $('.up-status:checked').val() : '0';
            let selectElement = document.querySelector('.categoryName');
            let pCatName = selectElement.options[selectElement.selectedIndex].value ?? 0;
            let imageName = $('#image_name').val();

            let updateData = {
                'id': id,
                'name_en': nameEn,
                'name_bn': nameBn,

                'title_en': nameEn,
                'title_bn': nameBn,

                'slug_en': slugEn,
                'slug_bn': slugBn,

                'status': status,
                'parent_id': pCatName,
                'image_name': imageName,
            };

            // console.log(updateData);
            // alert(id);

            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: updateUrl,
                type: "PATCH",
                enctype: 'multipart/form-data',
                cache: false,
                data: updateData,
                dataType: "json",
                success: function(res) {
                    if (res.status == 'success') {
                        $('#cateditModal').modal('hide'); // Modal hide
                        $('#updateCatForm')[0].reset(); // form refresh 
                        $('#display_image').attr('src', "#");
                        $('#btn_delete_post_main_image').css("opacity", "1");

                        $('.table').load(location.href +
                            ' #tableLoad'); //data display without reload
                    }
                },
                error: function(jqXhr, json, errorThrown) { // this are default for ajax errors 
                    $('.errMsgContainer').html('');
                    var errors = jqXhr.responseJSON;
                    $('#updateCatForm')[0].reset(); // form refresh 
                    $.each(errors['errors'], function(index, value) {
                        $('.errMsgContainer').append('<span class="text-danger">' +
                            value + '</span>' + '<br>')
                    });
                }
            });
        })

    })
</script>
{{-- End  --}}
