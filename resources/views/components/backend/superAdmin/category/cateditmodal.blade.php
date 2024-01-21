            <style>
                /* ========================= */

                @media (min-width: 1200px) {
                    .modal-lg {
                        max-width: 1250px !important;
                    }
                }

                .modal-file-manager .modal-header .modal-title {
                    float: left;
                }

                .modal-file-manager .modal-content {
                    border-radius: 4px;
                }

                .modal-file-manager .modal-body {
                    padding: 0;
                }

                .file-manager {
                    width: 100%;
                    max-width: 100%;
                    display: table;
                }

                .file-manager-content {
                    height: 422px;
                    overflow-y: auto;
                }

                .file-manager-left {
                    width: 20%;
                    display: table-cell;
                    border-right: 1px solid #eee;
                    vertical-align: top;
                    padding: 15px;
                    background-color: #dce0e6;
                }

                .file-manager-middel {
                    width: auto;
                    display: table-cell;
                    vertical-align: top;
                    padding: 15px;
                }

                .file-manager-right {
                    width: 20%;
                    display: table-cell;
                    vertical-align: top;
                    padding: 15px;
                    background-color: #dce0e6;
                }

                .file-manager-left .btn-upload {
                    display: block;
                    font-size: 14px;
                    position: relative;
                    cursor: pointer !important;
                    padding: 8px 14px;
                }

                .file-manager-left .btn-upload span {
                    cursor: pointer !important;
                    z-index: 10 !important;
                }

                .file-manager-left .btn-upload input {
                    cursor: pointer !important;
                }

                div#image_file_upload_response .col-file-manager {
                    float: left;
                    width: auto;
                    padding: 5px;
                }


                .file-box {
                    display: block;
                    width: 100%;
                    border: 1px solid #eee;
                    cursor: pointer;
                    text-align: center;
                    position: relative;
                    border-radius: 2px;
                }

                .file-box .image-container {
                    display: block;
                    width: 122px;
                    height: 100px;
                    overflow: hidden;
                    text-align: center;
                    border-radius: 2px;
                }

                .file-box .icon-container {
                    padding: 10px;
                    height: 110px;
                }

                .file-box .image-container img {
                    margin: 0 auto;
                    position: relative;
                    width: auto;
                    min-width: 100%;
                    max-width: none;
                    height: 100%;
                    margin-left: 50%;
                    transform: translateX(-50%);
                    object-fit: cover;
                }

                .file-box .file-name {
                    width: 100%;
                    position: absolute;
                    bottom: 0;
                    left: 0;
                    font-size: 12px;
                    line-height: 14px;
                    background-color: #f4f4f4;
                    padding: 2px;
                    display: block;
                    text-align: center;
                    word-break: break-all;
                }

                #audio_file_manager .file-box,
                #video_file_manager .file-box {
                    height: 132px;
                    text-align: center;
                    text-overflow: ellipsis;
                    overflow: hidden;
                }

                .file-icon {
                    width: 80px;
                    margin: 0 auto;
                    -webkit-touch-callout: none;
                    -webkit-user-select: none;
                    -khtml-user-select: none;
                    -moz-user-select: none;
                    -ms-user-select: none;
                    user-select: none;
                    cursor: pointer;
                }

                .file-manager .selected {
                    box-shadow: 0 0 3px rgba(40, 174, 141, 1);
                    border: 1px solid rgba(40, 174, 141, 1);
                }

                .file-manager-footer {
                    margin-left: 235px;
                }

                .btn-file-delete {
                    display: none;
                }

                .btn-file-select {
                    display: none;
                }

                .file-manager-list-item-name {
                    width: 100%;
                    padding: 0 5px;
                    margin: 0;
                    -webkit-touch-callout: none;
                    -webkit-user-select: none;
                    -khtml-user-select: none;
                    -moz-user-select: none;
                    -ms-user-select: none;
                    user-select: none;
                    cursor: pointer;
                }

                .input-file-label {
                    width: 190px;
                    background-color: #5bc0de;
                    color: #fff;
                    text-align: center;
                    text-overflow: ellipsis;
                    overflow: hidden;
                    white-space: nowrap;
                    padding: 0 5px;
                    font-size: 12px;
                }

                .loader-file-manager {
                    display: none;
                    position: relative;
                    width: 100%;
                    text-align: center;
                    margin-top: 10px;
                }

                .loader-file-manager img {
                    position: relative;
                    width: 50px;
                    height: 50px;
                }

                .file-manager-search {
                    /* position: absolute;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             margin-left: 235px; */
                }

                #image_file_manager .modal-header .close {
                    padding: 1rem 1rem;
                    margin: -1rem 1rem auto;
                }

                .file-manager-search input {
                    border-radius: 2px;
                    width: 300px;
                    text-align: center
                }

                .dm-uploaded-files .bg-success {
                    background-color: #28a745;
                }

                .file-manager-file-types {
                    width: 100%;
                    position: relative;
                    margin: 0;
                    left: 0;
                    right: 0;
                    top: 15px;
                    text-align: center;
                }

                .file-manager-file-types span {
                    display: inline-block;
                    font-size: 11px;
                    margin-right: 2px;
                    margin-bottom: 2px;
                    color: #979ba1 !important;
                    padding: 2px 4px;
                    border: 1px dashed #dce0e6 !important;
                    border-radius: 2px;
                }

                @media (max-width: 900px) {
                    .file-manager-left {
                        display: block !important;
                        width: 100% !important;
                        float: left;
                    }

                    .file-manager-middel {
                        display: block !important;
                        width: 100% !important;
                        float: left;
                    }

                    .file-manager-footer {
                        margin-left: 0 !important;
                    }

                    .file-manager-search {
                        position: relative;
                        margin: 0;
                        margin-top: 5px;
                        display: block;
                    }

                    .file-manager-search input {
                        width: 100%;
                    }
                }

                a.upload-text {
                    font-size: 1vw;
                    font-weight: bold;
                    display: inline-block;
                    margin-bottom: 10px;
                }

                div#post_select_image_container {
                    width: 200px;
                    height: 250px;
                }

                div#post_select_image_container .upload-post-select-image-container img {
                    width: 100%;
                }

                .btn-browse-files {
                    background-color: transparent !important;
                    color: #979ba1;
                    border-color: #cfd3d9 !important;
                    margin-top: 10px;
                }

                /* Hide scrollbar for Chrome, Safari and Opera */
                .file-manager-content::-webkit-scrollbar {
                    display: none;
                    background: transparent;
                    width: 0;
                    /* Remove scrollbar space */
                    /* Optional: just make scrollbar invisible */
                }

                /* Hide scrollbar for IE, Edge and Firefox */
                .file-manager-content {
                    -ms-overflow-style: none;
                    /* IE and Edge */
                    scrollbar-width: none;
                    /* Firefox */
                }

                .lang_en {
                    margin-bottom: 3%;
                }
            </style>
            <style>
                @media (min-width: 576px) {
                    .category-modal {
                        max-width: 600px !important;
                        margin: 1.75rem auto;
                    }
                }
            </style>
            <!-- Modal for Category Update -->
            <div class="modal fade" id="cateditModal" tabindex="-1" aria-labelledby="cateditModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-scrollable category-modal">
                    {{-- <form method="post" action="{{ route('superAdmin.category.update', 1) }}" enctype="multipart/form-data"
                    style="width: 100%;"> --}}

                    <form style="width: 100%;" id="updateCatForm" class="getUrl">
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
                                <br />
                                <input type="hidden" name="id" id="updata-id" class="up-id">
                                <div class="form-group">
                                    <label class="col-form-label col-md-12 col-sm-12 label-align"
                                        for="first-name">Category
                                        Name en <span class="required">*</span>
                                    </label>
                                    <div class="col-md-12 col-sm-12 ">
                                        <input type="text" name="name_en" id="mySelect_en" onchange="myFunction_en()"
                                            class="form-control up_name_en nameEn" required />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12 col-sm-12 ">
                                        <label class="col-form-label col-md-12 col-sm-12 label-align"
                                            for="first-name">Category
                                            Name bn <span class="required">*</span>
                                        </label>
                                        <input type="text" name="name_bn" id="mySelect_bn" onchange="myFunction_bn()"
                                            class="form-control up_name_bn nameBn" />
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 ">

                                    <input type="hidden" name="title_en" id="titleSelect_en"
                                        class="form-control upitleEn">

                                    <input type="hidden" name="title_bn" id="titleSelect_bn"
                                        class="form-control uptitleBn">

                                    <input type="hidden" name="slug_en" id="slugValue_en"
                                        class="form-control slugEn upslug_en" required />

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
                                        <select class="form-control up-category categoryName" id="upCategory"
                                            name="parent_id">
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
                                        <div id="post_select_image_container"
                                            class="upload-post-select-image-container dispalyImage ">

                                            <button class="pull-right mt-4" onclick="displayimageRemove()"
                                                id="btn_delete">
                                                <i class="fa fa-times"></i>
                                            </button>

                                            <img src="" id="selected_image_file" alt=""
                                                class="img-fluid">
                                        </div>
                                        <input type="hidden" name="image_id" id="image_id" value="">
                                        <input type="hidden" name="image_name" id="image_name" value="">
                                        <input type="hidden" name="alt" id="alt_value" value="">
                                        <input type="hidden" name="title" id="title_value" value="">
                                        <input type="hidden" name="caption" id="caption_value" value="">
                                        <input type="hidden" name="description" id="description_value"
                                            value="">
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


            <!-- Modal -->
            <div class="modal fade" id="image_file_manager">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackdropLabel">Image</h5>
                            <div id="msg"></div>
                            <div class="file-manager-search text-center pull-right">
                                <input type="text" id="input_search_image" placeholder="Search Image"
                                    name="search" class="form-control">
                            </div>

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        {{-- {!! Form::open(['method' => 'get', 'route' => 'user.Users.destroy', 'enctype' => 'multipart/form-data', 'id' => 'myform']) !!} --}}
                        <div class="modal-body">
                            <div class="file-manager">
                                <div class="file-manager-left">
                                    <form id="dropzoneForm" enctype="multipart/form-data"
                                        class="dropzone dropzoneForm"
                                        action="{{ route('superAdmin.category.upload') }}">
                                        @csrf
                                        <p class="file-manager-file-types">
                                            <span>JPG</span>
                                            <span>JPEG</span>
                                            <span>PNG</span>
                                            <span>GIF</span>
                                        </p>
                                        <p class="dm-upload-icon text-center mt-5">
                                            {{-- <i class="fas fa-cloud-upload-alt"></i> --}}
                                        </p>
                                    </form>
                                    <input type="hidden" name="id" id="selected_img_file_id">
                                    {{-- =============== --}}
                                    {{-- <div id="previewsContainer" name="logo" class="dropzone">
                                <div class="dz-default dz-message">
                                    Drop files here to upload
                                </div>
                            </div> --}}
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
                                        <input class="form-control" type="text" name="description"
                                            id="descriptionText">
                                    </div>
                                </div>
                                {{-- file-manager-right --}}
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="file-manager-footer">

                                <button type="button" id="btn_img_delete"
                                    class="btn btn-danger pull-left btn-file-delete"><i
                                        class="fas fa-trash"></i>&nbsp;&nbsp;
                                    Delete </button>

                                <button type="button" id="btn_img_select" class="btn btn-success btn-file-select"><i
                                        class="fas fa-check"></i>&nbsp;&nbsp;
                                    Select image</button>
                                {{-- Databese value insert --}}
                                {{-- <button type="submit" id="btn_img_select" class="btn btn-primary bg-olive btn-file-select"><i
                                class="fa fa-check"></i>&nbsp;&nbsp; Select image </button> --}}
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
                            let dispalyImg = '<div class="upload-post-select-image-container">' +
                                '<a id="btn_delete_post_main_image" onclick="imageRemove()" class="btn btn-danger btn-sm btn-delete-selected-file-image">' +
                                '<img src="' + imageURL + image + '" alt="" id="display_image">' +
                                '<i class="fa fa-times"></i> ' +
                                '</a>' +
                                '</div>';

                            // document.querySelector('.dispalyImage').innerHTML = dispalyImg;

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

                    var image = '<div class="upload-post-select-image-container">' +
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
