@extends('layouts.deshboard')
@section('content')
    <div class="container">
        <a class="btn btn-info" href="javascript:void(0)" id="createNewPost"> Add New Post</a>
        <table class="table table-bordered data-table">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>

                    <th width="100px">Actions</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
    <!-- Modal for Category Add -->

    <div class="modal  fade" id="ajaxModelexa" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable category-modal">
            {{-- <form method="POST" action="{{ route('superAdmin.category.store') }}" enctype="multipart/form-data"
                    style="width: 100%;"> --}}
            <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal">

                @csrf
                <input type="hidden" name="id" id="id">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modelHeading"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="errMsgContainer"></div>
                        @php
                            $langs[] = '';
                        @endphp
                        @foreach (config('app.multilocale') as $lang)
                            <p id="res_en"></p>
                            <p id="res_bn"></p>
                            @php
                                $langs[] = $lang;
                            @endphp
                            <div class="lang_{{ $lang }}">

                                <div class="form-group">
                                    <label class="col-form-label col-md-12 col-sm-12 label-align" for="first-name">Category
                                        Name_{{ $lang }} <span class="required">*</span>

                                    </label>
                                    <div class="col-md-12 col-sm-12 ">
                                        <input type="text" name="name_{{ $lang }}"
                                            class="form-control name_{{ $lang }}" id="mySelect_{{ $lang }}"
                                            onchange="myFunction_{{ $lang }}()" placeholder="" />

                                        <input type="text" name="title_{{ $lang }}"
                                            id="titleSelect_{{ $lang }}" value=""
                                            class="form-control title_{{ $lang }}">

                                        <input type="text" name="slug_{{ $lang }}"
                                            id="slugValue_{{ $lang }}" value=""
                                            class="form-control slug_{{ $lang }}" placeholder="Slug-name">

                                        <input type="text" name="link_{{ $lang }}"
                                            id="linkValue_{{ $lang }}" value=""
                                            class="form-control link_{{ $lang }}">
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    function myFunction_{{ $lang }}() {

                                        var strng = document.getElementById("mySelect_{{ $lang }}").value;
                                        var APP_URL = {!! json_encode(url('/')) !!}
                                        const spt = strng.split(" ");
                                        var imp = spt.join('_');
                                        document.getElementById("linkValue_{{ $lang }}").value = APP_URL + '/' + imp;
                                        // document.getElementById("parmalink").innerHTML = APP_URL + '/' + imp;
                                        document.getElementById("slugValue_{{ $lang }}").value = imp;
                                        document.getElementById("titleSelect_{{ $lang }}").value = strng;
                                    }
                                </script>
                            </div>
                        @endforeach
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align" for="last-name">Select
                                Parent
                                Category
                            </label>
                            <div class="col-md-12 col-sm-12 ">

                                <select class="custom-select" name="parent_id" id="categoryName">
                                    {{-- <select class="custom-select" name="parent_id" id="categoryName"> --}}
                                    <option selected value="0">Choose...</option>
                                    @if ($categories)
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">
                                                @foreach ($langs as $lang)
                                                    {{ $category->{'name_' . $lang} }}
                                                @endforeach

                                            </option>
                                            @if (count($category->subcategory) > 0)
                                                @foreach ($category->subcategory as $sub)
                                                    <option value="{{ $sub->id }}">
                                                        @foreach ($langs as $lang)
                                                            {{ $sub->{'name_' . $lang} }}
                                                        @endforeach

                                                    </option>
                                                    @if (count($sub->subcategory) > 0)
                                                        @include('newcategory.createsubcategories', [
                                                            'category' => $sub->subcategory,
                                                        ])
                                                    @endif
                                                @endforeach
                                            @endif
                                        @endforeach
                                    @endif
                                </select>
                            </div>
                        </div>

                        <div class=" form-group">
                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Status
                            </label>
                            <div class="col-md-6 col-sm-6 ">
                                <input type="hidden" value="0" class="js-switch sts" id="status" name="status">
                                <input type="checkbox" value="1" class="js-switch sts" id="status" name="status"
                                    @if ('checked') checked @endif>
                            </div>
                        </div>
                        {{-- Image --}}
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Category
                                Image<span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12  text-center">
                                <a href="" type="text" class="upload-text" data-toggle="modal"
                                    data-target="#image_file_manager">
                                    Image upload
                                </a>
                                <div id="up_post_select_image_container"
                                    class="up-post-select-image-container dispalyImage ">
                                    <button class="pull-right mt-4" onclick="displayimageRemove()" id="btn_delete">
                                        <i class="fa fa-times"></i>
                                    </button>
                                    <img src="" id="selected_image_file" alt="" class="img-fluid">
                                </div>
                                <input type="hidden" name="image_id" id="image_id" value="">
                                <input type="hidden" name="image_name" id="image_name" value="">
                                <input type="hidden" name="alt" id="alt_value" value="">
                                <input type="hidden" name="title" id="title_value" value="">
                                <input type="hidden" name="caption" id="caption_value" value="">
                                <input type="hidden" name="description" id="description_value" value="">
                            </div>
                        </div>

                        <div class="form-group ">
                            <div class="col-md-12 col-sm-12 mb-3">
                                <button type="submit" class="btn btn-outline-success btn-lg btn-block btnSubmit"
                                    id="submit-all">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
                {{-- modal-content --}}
            </form>
        </div>
    </div>


    {{-- update --}}

    <div class="modal fade" id="cateditModal" tabindex="-1" aria-labelledby="cateditModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable category-modal">
            {{-- <form method="post" action="{{ route('superAdmin.category.update', 1) }}" enctype="multipart/form-data"
                    style="width: 100%;"> --}}

            {{-- <form style="width: 100%;" id="updateCatForm" class="getUrl"> --}}
            <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCategoryModalLabel">Edit Category</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="errMsgContainer"></div>
                        <p id="up_res_en"></p>
                        <p id="up_res_bn"></p>
                        <br />
                        <input type="text" name="id" id="id">
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Category Name English
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="name_en" id="mySelect_en" onchange="myFunction_en()"
                                    class="form-control up_name_en nameEn" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Category Name Bangla
                                <span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                <input type="text" name="name_bn" id="mySelect_bn" onchange="myFunction_bn()"
                                    class="form-control up_name_bn nameBn" required />
                            </div>
                        </div>
                        {{-- <div class="form-group">
                                    <div class="col-md-12 col-sm-12 ">
                                        <label class="col-form-label col-md-12 col-sm-12 label-align">Category Name en
                                            <span class="required">*</span>
                                        </label>
                                        <input type="text" name="name_bn" id="mySelect_bn"
                                            onchange="myFunction_bn()" class="form-control up_name_bn nameBn"
                                            required />
                                    </div>
                                </div> --}}
                        <div class="col-md-12 col-sm-12 ">

                            <input type="hidden" name="title_en" id="titleSelect_en" class="form-control upitleEn">

                            <input type="hidden" name="title_bn" id="titleSelect_bn" class="form-control uptitleBn">

                            <input type="hidden" name="slug_en" id="slugValue_en" class="form-control slugEn upslug_en"
                                required />

                            <input type="hidden" name="slug_bn" id="slugValue_bn"
                                class="form-control slugBn  upslug_bn" required />

                        </div>
                        <script type="text/javascript">
                            function myFunction_en() {
                                var strng = document.getElementById("mySelect_en").value;
                                var APP_URL = {!! json_encode(url('/')) !!}
                                const spt = strng.split(" ");
                                var imp = spt.join('_');
                                document.getElementById("linkValue_en").value = APP_URL + '/' + imp;
                                // document.getElementById("parmalink").innerHTML = APP_URL + '/' + imp;
                                document.getElementById("slugValue_en").value = imp;
                                document.getElementById("titleSelect_en").value = imp;
                            }

                            function myFunction_bn() {
                                var strng = document.getElementById("mySelect_bn").value;
                                var APP_URL = {!! json_encode(url('/')) !!}
                                const spt = strng.split(" ");
                                var imp = spt.join('_');
                                document.getElementById("linkValue_bn").value = APP_URL + '/' + imp;
                                // document.getElementById("parmalink").innerHTML = APP_URL + '/' + imp;
                                document.getElementById("slugValue_bn").value = imp;
                                document.getElementById("titleSelect_bn").value = imp;
                            }
                        </script>

                        <div class="form-group">
                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Status
                            </label>
                            <div class="col-md-9 col-sm-9 pt-2 ">
                                <input type="checkbox" class="js-switch mycheckbox up-status" id="up-status"
                                    name="status">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align" for="last-name">Select
                                Parent
                                Category<span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12 ">
                                @php
                                    $categories = DB::table('categories')->get();
                                @endphp
                                <select class="form-control up-category categoryName" id="upCategory" name="parent_id">
                                    <option value="0">Choose...</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">
                                            {{ $category->{'slug_' . app()->getLocale()} }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        {{-- Image --}}
                        <div class="form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align">Category
                                Image<span class="required">*</span>
                            </label>
                            <div class="col-md-12 col-sm-12  text-center">
                                <a href="" type="text" class="upload-text" data-toggle="modal"
                                    data-target="#image_file_manager">
                                    Image upload
                                </a>
                                <div id="up_post_select_image_container"
                                    class="up-post-select-image-container dispalyImage ">
                                    <button class="pull-right mt-4" onclick="displayimageRemove()" id="btn_delete">
                                        <i class="fa fa-times"></i>
                                    </button>
                                    <img src="" id="selected_image_file" alt="" class="img-fluid">
                                </div>
                                <input type="hidden" name="image_id" id="image_id" value="">
                                <input type="hidden" name="image_name" id="image_name" value="">
                                <input type="hidden" name="alt" id="alt_value" value="">
                                <input type="hidden" name="title" id="title_value" value="">
                                <input type="hidden" name="caption" id="caption_value" value="">
                                <input type="hidden" name="description" id="description_value" value="">
                            </div>
                        </div>

                        <button type=" submit" class="btn btn-outline-success btn-block btn-update"
                            id="submit-all">Update</button>

                    </div>
                </div>
                {{-- modal-content --}}
            </form>
        </div>
    </div>
    @php
        $language = app()->getLocale();
        $updateCategory = 'kk';
        
    @endphp

    <script type="text/javascript">
        $(function() {

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            var table = $('.data-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('superAdmin.category') }}",
                columns: [{
                        data: "DT_RowIndex"
                    },
                    {
                        render: function(data, type, row, meta) {
                            return row.name_{{ $language }};
                        },
                        targets: 0,
                    },
                    // {
                    //     render: function(data, type, row, meta) {
                    //         // var btn = '';
                    //         // if (row.status == 1) {
                    //         //     btn += '<button class="btn btn-success">' + row.id +
                    //         //         '</button>';
                    //         // } else {
                    //         //     btn += '<button class="btn btn-dengar">' + row.id +
                    //         //         '</button>';
                    //         // }

                    //         // return btn;
                    //     },
                    //     // console.log(row);
                    //     // https://www.youtube.com/watch?v=e_Fh1MClfuE&ab_channel=KnowledgeThrusters
                    // },
                    // {
                    //     data: 'DT_RowIndex',
                    //     name: 'DT_RowIndex'
                    // },
                    // {
                    //     data: 'name_en',
                    //     name: 'name_en'
                    // },
                    {
                        data: 'action',
                        name: 'action',
                        orderable: false,
                        searchable: false
                    },
                ]
            });
            // getUserButtons = (name, id) => {
            //     let buttons =
            //         `<button>This is button ${name}/${id}</button> <button>This is button ${name}/${id}</button>`;
            //     return buttons;
            // }

            $('#createNewPost').click(function() {
                $('#submit-all').val("create-post");
                $('#id').val('');
                $('#postForm').trigger("reset");
                $('#modelHeading').html("Create New Post");
                $('#ajaxModelexa').modal('show');
            });

            $('#submit-all').click(function(e) {
                e.preventDefault();

                $(this).html('Sending...');

                $.ajax({
                    data: $('#postForm').serialize(),
                    url: "{{ route('superAdmin.category.store') }}",
                    type: "POST",
                    enctype: 'multipart/form-data',
                    dataType: 'json',
                    success: function(data) {

                        $('#postForm').trigger("reset");
                        $('#ajaxModelexa').modal('hide');
                        table.draw();

                    },
                    error: function(data) {
                        console.log('Error:', data);
                        $('#submit-all').html('Save Changes');
                    }
                });
            });


            $('body').on('click', '.editPost', function() {
                $('#modelHeading').html("Edit Post");
                $('#submit-all').val("edit-user");
                $('#cateditModal').modal('show');


                var id = $(this).data('id');

                alert(id);
                var url = "{{ route('superAdmin.category.update', ':id') }}";
                var catUrl = url.replace(':id', id);
                let nameEn = $(this).data('name_en');
                let nameBn = $(this).data('name_bn');

                let titleEn = $(this).data('name_en');
                let titleBn = $(this).data('name_en');

                let slugEn = $(this).data('slug_en');
                let slugBn = $(this).data('slug_bn');

                let status = $(this).data('status');
                let pid = $(this).data('pid');
                let image = $(this).data('image');

                $('#id').val(id);
                $('#mySelect_en').val(nameEn);
                $('#mySelect_bn').val(nameBn);
                $('#titleSelect_en').val(nameEn);
                $('#titleSelect_bn').val(nameBn);
                $('#slugValue_en').val(slugEn);
                $('#slugValue_bn').val(slugBn);
                $('#categoryName').val(pid);
                $('#status').val(status);
                $('#image_name').val(image);

                // $.get("{{ route('superAdmin.category.store') }}" + '/' + id + '/edit', function(data) {

                //     $('#modelHeading').html("Edit Post");
                //     $('#submit-all').val("edit-user");
                //     $('#ajaxModelexa').modal('show');

                // });

            });
            $('#submit-all').click(function(e) {
                e.preventDefault();

                $(this).html('Sending...');

                $.ajax({
                    type: "PATCH",
                    data: $('#postForm').serialize(),
                    url: catUrl,

                    cache: false,
                    enctype: 'multipart/form-data',
                    dataType: 'json',
                    success: function(data) {

                        $('#postForm').trigger("reset");
                        $('#ajaxModelexa').modal('hide');
                        table.draw();

                    },
                    error: function(data) {
                        console.log('Error:', data);
                        $('#submit-all').html('Save Changes');
                    }
                });
            });



        });
    </script>
@endsection
{{-- <x-backend.superAdmin.category.catindex :categories="$categories" /> --}}
