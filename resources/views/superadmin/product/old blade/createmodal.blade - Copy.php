    <!-- Modal for Category Add -->
    <div class="modal  fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable category-modal">
            {{-- <form method="POST" action="{{ route('superAdmin.category.store') }}" enctype="multipart/form-data"
                style="width: 100%;"> --}}
            <form style="width: 100%;" id="product-form">
                @csrf
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCategoryModalLabel">Add Category</h5>
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
                            @php
                                $langs[] = $lang;
                            @endphp
                            <div class="lang_{{ $lang }}">

                                <div class="form-group">
                                    <label class="col-form-label col-md-12 col-sm-12 label-align"
                                        for="first-name">Category
                                        Name_{{ $lang }} <span class="required">*</span>

                                    </label>
                                    <div class="col-md-12 col-sm-12 ">
                                        <input type="text" name="name_{{ $lang }}"
                                            class="form-control name_{{ $lang }}"
                                            id="mySelect_{{ $lang }}"
                                            onchange="myFunction_{{ $lang }}()" placeholder="" />

                                        <input type="hidden" name="title_{{ $lang }}"
                                            id="titleSelect_{{ $lang }}" value=""
                                            class="form-control title_{{ $lang }}">

                                        <input type="hidden" name="slug_{{ $lang }}"
                                            id="slugValue_{{ $lang }}" value=""
                                            class="form-control slug_{{ $lang }}" placeholder="Slug-name">
                                        <input type="hidden" name="link_{{ $lang }}"
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
                        <div class="item form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align" for="last-name">Select
                                Parent
                                Category
                            </label>
                            <div class="col-md-12 col-sm-12 ">

                                <select class="custom-select" name="parent_id" id="categoryName">
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

                        <div class="item form-group">
                            <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Status
                            </label>
                            <div class="col-md-6 col-sm-6 ">
                                <input type="hidden" value="0" class="js-switch sts" name="status">
                                <input type="checkbox" value="1" class="js-switch sts" name="status"
                                    @if ('checked') checked @endif>
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="col-form-label col-md-12 col-sm-12 label-align" for="last-name">Category
                                Images
                            </label>
                            <div class="col-md-6 col-sm-6 offset-md-3 ">
                                <a href="" type="text" class="upload-text" data-toggle="modal"
                                    data-target="#image_file_manager">
                                    Image upload
                                </a>
                                <div id="post_select_image_container" class="post-select-image-container">
                                    <a href="" type="text" class="upload-text" data-toggle="modal"
                                        data-target="#image_file_manager">
                                        <img src="{{ asset('img/profile/cemera.jpg') }}" width="170px" height="200px"
                                            alt="" title="">
                                    </a>

                                </div>
                                <input type="hidden" name="image_id" id="image_id">
                                <input type="hidden" name="image_name" id="image_name">
                                <input type="hidden" name="alt" id="alt_value">
                                <input type="hidden" name="title" id="title_value">
                                <input type="hidden" name="caption" id="caption_value">
                                <input type="hidden" name="description" id="description_value">
                            </div>
                        </div>


                        <div class="item form-group">
                            <div class="col-md-12 col-sm-12  mt-4">
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


    <!-- Modal -->
    <div class="modal fade" id="image_file_manager">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Image</h5>
                    <div id="msg"></div>
                    <div class="file-manager-search text-center pull-right">
                        <input type="text" id="input_search_image" placeholder="Search Image" name="search"
                            class="form-control">
                    </div>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                {{-- {!! Form::open(['method' => 'get', 'route' => 'user.Users.destroy', 'enctype' => 'multipart/form-data', 'id' => 'myform']) !!} --}}
                <div class="modal-body">
                    <div class="file-manager">
                        <div class="file-manager-left">
                            <form id="dropzoneForm" enctype="multipart/form-data" class="dropzone dropzoneForm"
                                action="{{ route('superAdmin.category.upload') }}">
                                @csrf
                                <p class="file-manager-file-types">
                                    <span>JPG</span>
                                    <span>JPEG</span>
                                    <span>PNG</span>
                                    <span>GIF</span>
                                </p>
                                <p class="dm-upload-icon text-center mt-5">
                                </p>
                            </form>
                            <input type="hidden" name="id" id="selected_img_file_id">
                        </div>
                        {{-- file-manager-left --}}
                        <div class="file-manager-middel">
                            <div class="file-manager-content">
                                <div class="col-sm-12 col-md-12">
                                    <div class="row">
                                        <div id="image_file_upload_response">
                                            <div class="panel panel-default">
                                                <div class="panel-body" id="uploaded_image">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {{-- file-manager-middel --}}
                        <div class="file-manager-right">
                            <div class="form-group">
                                <label>Name</label>
                                <input class="form-control" readonly type="text" name="name"
                                    id="selected_img_name">
                            </div>
                            <div class="form-group">
                                <label>URL</label>
                                <input class="form-control" type="text" name="link"
                                    id="selected_img_file_path">
                            </div>
                            <div class="form-group">
                                <label>Alt</label>
                                <input class="form-control" type="text" name="alt" id="altText">
                            </div>
                            <div class="form-group">
                                <label>Title</label>
                                <input class="form-control" type="text" name="title" id="titleText">
                            </div>
                            <div class="form-group">
                                <label>Caption</label>
                                <input class="form-control" type="text" name="caption" id="captionText">
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <input class="form-control" type="text" name="description" id="descriptionText">
                            </div>
                        </div>
                        {{-- file-manager-right --}}
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="file-manager-footer">

                        <button type="button" id="btn_img_delete"
                            class="btn btn-danger pull-left btn-file-delete"><i class="fas fa-trash"></i>&nbsp;&nbsp;
                            Delete </button>

                        <button type="button" id="btn_img_select" class="btn btn-success btn-file-select"><i
                                class="fas fa-check"></i>&nbsp;&nbsp;
                            Select image</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                    </div>
                </div>
                {{-- {!! Form::close() !!} --}}
            </div>
        </div>
    </div>
    {{-- </div> --}}
    <script type="text/javascript>">
        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
        })
    </script>
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
                            $('#product-form')[0].reset(); // form refresh  
                            $('#display_image').attr('src', "#");
                            $('#btn_delete_post_main_image').css("opacity", "0.0");

                            $('.table').load(location.href +
                                ' #tableLoad'); //data display without reload
                        }
                    },
                    error: function(jqXhr, json, errorThrown) { // this are default for ajax errors 
                        $('.errMsgContainer').html('');
                        var errors = jqXhr.responseJSON;
                        $('#product-form')[0].reset(); // form refresh 
                        $.each(errors['errors'], function(index, value) {
                            $('.errMsgContainer').append('<span class="text-danger">' +
                                value + '</span>' + '<br>')
                        });

                    }
                });
            });
        })
    </script>

    {{-- </div> --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/dropzone.js"></script>
    <script type="text/javascript">
        Dropzone.options.dropzoneForm = {
            maxFilesize: 12,
            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
            previewsContainer: "#dropzoneForm",
            uploadMultiple: false,
            autoProcessQueue: true,
            addRemoveLinks: false,
            dictDefaultMessage: "Drop image here to upload",
            dictFileTooBig: "File is too big 500 MiB. Max filesize: 450MiB.",
            dictInvalidFileType: "You can't upload files of this type.",
            dictResponseError: "Server responded with 404 code",

            success: function(file, response) {
                console.log(response);
            },
            error: function(file, response) {
                return false;
            },

            init: function() {

                var submitButton = document.querySelector("#submit-all");
                myDropzone = this;

                submitButton.addEventListener('click', function() {
                    myDropzone.preventDefault();
                    myDropzone.stopPropagation();
                    myDropzone.processQueue();
                });

                this.on("complete", function() {
                    if (this.getQueuedFiles().length == 0 && this.getUploadingFiles().length == 0) {
                        var _this = this;
                        _this.removeAllFiles();
                    }
                    load_images();
                });

            }

        };
        load_images();

        function load_images() {
            $.ajax({
                url: "{{ route('superAdmin.media.fetch') }}",
                success: function(data) {
                    $('#uploaded_image').html(data);
                }
            })
        }
    </script>
    <script type="text/javascript">
        /*
         *------------------------------------------------------------------------------------------
         * IMAGES
         *------------------------------------------------------------------------------------------
         */
        var base_url = '';
        //select image
        $(document).on('click', '#image_file_manager .file-box', function() {
            $('#image_file_manager .file-box').removeClass('selected');
            $(this).addClass('selected');
            var file_name = $(this).attr('data-file-name');
            var file_id = $(this).attr('data-file-id');
            var file_path = $(this).attr('data-file-path');
            var alt = $(this).attr('data-file-alt');
            var title = $(this).attr('data-file-title');
            var caption = $(this).attr('data-file-caption');
            var description = $(this).attr('data-file-description');
            $('#selected_img_name').val(file_name);
            $('#selected_img_file_id').val(file_id);
            $('#selected_img_file_path').val(file_path);
            $('#altText').val(alt);
            $('#titleText').val(title);
            $('#captionText').val(caption);
            $('#descriptionText').val(description);
            $('#btn_img_delete').show();
            $('#btn_img_select').show();
        });
        //select image Delete
        $(document).on('click', '#image_file_manager #btn_img_delete', function() {
            var file_name = $('#selected_img_name').val();
            $.ajax({
                url: "{{ route('superAdmin.media.delete') }}",
                data: {
                    name: file_name
                },
                success: function(data) {
                    if (data.action == 'image') {
                        // use for animation hidden
                        $("#msg").html(data.msg).show().delay(2000).fadeOut();
                    } else {
                        load_images();
                    }
                }
            })
        });

        //select image file
        $(document).on('click', '#image_file_manager #btn_img_select', function() {
            select_image();
        });

        //select image file on double click
        $(document).on('dblclick', '#image_file_manager .file-box', function() {
            select_image();
        });


        function select_image() {
            var file_name = $('#selected_img_name').val();
            var file_id = $('#selected_img_file_id').val();
            var img_url = $('#selected_img_file_path').val();

            var alt = $('#altText').val();
            var title = $('#titleText').val();
            var caption = $('#captionText').val();
            var description = $('#descriptionText').val();
            $('#alt_value').val(alt);
            $('#title_value').val(title);
            $('#caption_value').val(caption);
            $('#description_value').val(description);
            // ============================ another way value pass, using input name
            // $('input[name=alt]').val(alt);
            // $('input[name=title]').val(title);            

            var image = '<div class="post-select-image-container">' +
                '<a id="btn_delete_post_main_image" onclick="imageRemove()" class="btn btn-danger btn-sm btn-delete-selected-file-image">' +
                '<img src="' + base_url + img_url + '" alt="" id="display_image">' +
                '<i class="fa fa-times"></i> ' +
                '</a>' +
                '</div>';
            document.getElementById("post_select_image_container").innerHTML = image;
            $('input[name=image_id]').val(file_id);
            $('#selected_image_file').css('margin-top', '15px');

            $('input[name=image_name]').val(file_name);
            $('#image_file_manager').modal('toggle');
            $('#image_file_manager .file-box').removeClass('selected');
            $('#btn_img_delete').hide();
            $('#btn_img_select').hide();
            const rightHidden = document.getElementById("rightHide");
            rightHidden.remove();

            document.getElementById("NewClass").className = "col-md-12";

        }

        function imageRemove() {
            // const imageId = document.getElementById("image_id");
            // imageId.remove();
            document.getElementById("image_id").value = '';
            document.getElementById("image_name").value = '';
            document.getElementById('display_image').removeAttribute('src');
            const postElement = document.getElementById("btn_delete_post_main_image");
            postElement.remove();
        }

        function displayimageRemove() {
            // const element = document.getElementById("image_id");

            document.getElementById("image_id").value = '';
            document.getElementById("image_name").value = '';
            document.getElementById('selected_image_file').removeAttribute('src');
            const btnElement = document.getElementById("btn_delete");
            btnElement.remove();
        }


        //search image
        $(document).on('input', '#input_search_image', function() {
            var search = $(this).val();
            var data = {
                "search": search
            };
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                type: "POST",
                url: "{{ route('superAdmin.users.search') }}",
                data: data,
                success: function(response) {
                    document.getElementById("image_file_upload_response").innerHTML = response
                }
            });
        });
    </script>
    {{-- =================================================== --}}
