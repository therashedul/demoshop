
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <div class="container">
        <div class="justify-content-center">
            @if (\Session::has('success'))
                <div class="alert alert-success">
                    <p>{{ \Session::get('success') }}</p>
                </div>
            @endif
            @if (\Session::has('worning'))
                <div class="alert alert-danger">
                    <p>{{ \Session::get('worning') }}</p>
                </div>
            @endif
            <div class="card">
                <div class="card-header">Media
                    <span class="float-right">
                        {{-- <a class="btn btn-primary" href="{{ route('superAdmin.media.create') }}">Create New</a> --}}
                        <button id="toggle" class="btn btn-primary btn-sm"><i class="fas fa-plus"></i> Add Image/file
                        </button>
                        <button id="search_toggle" class="btn btn-info btn-sm"> <i class="fas fa-search"></i> Search
                        </button>
                    </span>
                </div>

                <div class="card-body">
                    <!-- bootstrap image gallery 1 -->

                    @php
                        $rhps = DB::table('role_has_permissions')->get();
                        $permissions = DB::table('permissions')->get();
                        $roles = DB::table('roles')->get();
                    @endphp
                    <div id="third" style=" display: none;">
                        <div class="jumbotron">
                            {{-- <h1 class="text-center">Search</h1> --}}
                            <form id="dropzoneForm" enctype="multipart/form-data" class="dropzone"
                                action="{{ route('superAdmin.media.upload') }}">
                                @csrf
                                <p class="file-manager-file-types">
                                    <span>JPG</span>
                                    <span>JPEG</span>
                                    <span>PNG</span>
                                    <span>GIF</span>
                                    <span>pdf</span>
                                    <span>xlsx</span>
                                    <span>docx</span>
                                </p>
                                <p class="dm-upload-icon text-center mt-5">
                                    {{-- <i class="fas fa-cloud-upload-alt"></i> --}}
                                </p>
                            </form>
                        </div>
                    </div>

                    <div id="search_third" style=" display: none;">
                        <div class="jumbotron justify-content-center">
                            <div class="from-group">
                                <input type="text" name="seach" class="form-control" id="input_search_image_file"
                                    placeholder="Search...">
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-12">
                        <div class="row">
                            <div id="image_file_upload_response">

                            </div>
                        </div>
                    </div>
                    <div id="msg"></div>

                    @foreach ($data as $key => $imagefile)
                        <div class="media-hidden">
                            @if ($imagefile->extention == '.pdf')
                                <div class="col-sm-6 col-md-2 col-lg-2 mb-3">
                                    <input type="hidden" id="selected_img_name_{{ $imagefile->name }}"
                                        value="{{ $imagefile->name }}">
                                    <input type="hidden" id="selected_img_id_{{ $imagefile->id }}"
                                        value="{{ $imagefile->id }}">
                                    <a id="btn_delete_post_main_image" onclick="myFunction_{{ $imagefile->id }}()"
                                        class="btn btn-danger btn_img_delete btn-sm">
                                        <i class="fa fa-times"></i>
                                    </a>
                                    <button type="button" class="btn-field" id="file_manager_{{ $imagefile->id }}"
                                        data-toggle="modal" data-target="#image_file_manager_{{ $imagefile->id }}">

                                        <figure>
                                            <img src="{{ asset('img/' . 'pdf.png') }}"
                                                class="img-thumbnail grayscale file-box">
                                            <figcaption class="text-center">
                                                {{ mb_strimwidth($imagefile->title, 0, 20, '...') }} </figcaption>
                                        </figure>
                                    </button>
                                </div>
                            @elseif ($imagefile->extention == '.docx')
                                <div class="col-sm-6 col-md-2 col-lg-2 mb-3">
                                    <input type="hidden" id="selected_img_name_{{ $imagefile->name }}"
                                        value="{{ $imagefile->name }}">
                                    <input type="hidden" id="selected_img_id_{{ $imagefile->id }}"
                                        value="{{ $imagefile->id }}">
                                    <a id="btn_delete_post_main_image" onclick="myFunction_{{ $imagefile->id }}()"
                                        class="btn btn-danger btn_img_delete btn-sm">
                                        <i class="fa fa-times"></i>
                                    </a>
                                    <button type="button" id="file_manager_{{ $imagefile->id }}" class="btn-field"
                                        data-toggle="modal" data-target="#image_file_manager_{{ $imagefile->id }}">
                                        <figure>
                                            <img src="{{ asset('img/' . 'docx.png') }}" class="img-thumbnail grayscale ">
                                            <figcaption class="text-center">
                                                {{ mb_strimwidth($imagefile->title, 0, 20, '...') }}</figcaption>
                                        </figure>
                                    </button>

                                </div>
                            @elseif ($imagefile->extention == '.xlsx')
                                <div class="col-sm-6 col-md-2 col-lg-2 mb-3">
                                    <input type="hidden" id="selected_img_name_{{ $imagefile->name }}"
                                        value="{{ $imagefile->name }}">
                                    <input type="hidden" id="selected_img_id_{{ $imagefile->id }}"
                                        value="{{ $imagefile->id }}">
                                    <a id="btn_delete_post_main_image" onclick="myFunction_{{ $imagefile->id }}()"
                                        class="btn btn-danger btn_img_delete btn-sm">
                                        <i class="fa fa-times"></i>
                                    </a>
                                    <button type="button" class="btn-field" id="file_manager_{{ $imagefile->id }}"
                                        data-toggle="modal" data-target="#image_file_manager_{{ $imagefile->id }}">
                                        <figure>
                                            <img src="{{ asset('img/' . 'xlsx.png') }}" class="img-thumbnail grayscale">
                                            <figcaption class="text-center">
                                                {{ mb_strimwidth($imagefile->title, 0, 20, '...') }}</figcaption>
                                        </figure>
                                    </button>
                                </div>
                            @else
                                <div class="col-sm-6 col-md-2 col-lg-2 mb-3">
                                    <input type="hidden" id="selected_img_name_{{ $imagefile->name }}"
                                        value="{{ $imagefile->name }}">
                                    <input type="hidden" id="selected_img_id_{{ $imagefile->id }}"
                                        value="{{ $imagefile->id }}">
                                    <a id="btn_delete_post_main_image" onclick="myFunction_{{ $imagefile->id }}()"
                                        class="btn btn-danger btn_img_delete btn-sm">
                                        <i class="fa fa-times"></i>
                                    </a>

                                    <button type="button" class="btn-field" onclick="myFunction()"
                                        id="file_manager_{{ $imagefile->id }}" data-toggle="modal"
                                        data-target="#image_file_manager_{{ $imagefile->id }}">
                                        <figure>
                                            <img src="{{ asset('singleimg/' . $imagefile->name) }}"
                                                class="img-thumbnail grayscale">
                                            <figcaption class="text-center">
                                                {{ mb_strimwidth($imagefile->title, 0, 20, '...') }}</figcaption>
                                        </figure>
                                    </button>
                                </div>
                            @endif
                        </div>

                        <!-- Modal -->
                        <div class="modal fade " id="image_file_manager_{{ $imagefile->id }}" data-backdrop="static"
                            data-keyboard="false" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="file-manager">
                                            <div class="col-md-8">
                                                <div class="file-manager-content justify-content-center">
                                                    @if ($imagefile->id == true && $imagefile->extention == '.pdf')
                                                        <img src="{{ asset('img/' . 'pdf.png') }}"
                                                            class="img-thumbnail grayscale text-center "
                                                            style="width: 40%;   height: auto; margin: 0 auto; display: block;">
                                                        <h3 class="text-center">{{ $imagefile->name }}</h3>
                                                    @elseif ($imagefile->id == true && $imagefile->extention == '.docx')
                                                        <img src="{{ asset('img/' . 'docx.png') }}"
                                                            class="img-thumbnail grayscale text-center "
                                                            style="width: 40%;  height: auto; margin: 0 auto; display: block;">
                                                        <h3 class="text-center">{{ $imagefile->name }}</h3>
                                                    @elseif ($imagefile->id == true && $imagefile->extention == '.xlsx')
                                                        <img src="{{ asset('img/' . 'xlsx.png') }}"
                                                            class="img-thumbnail grayscale text-center "
                                                            style="width: 40%; height: auto; margin: 0 auto; display: block;">
                                                        <h3 class="text-center">{{ $imagefile->name }}</h3>
                                                    @else
                                                        <img src="{{ asset('upload/' . $imagefile->name) }}"
                                                            style="width: 40%; height: 90%; margin: 0 auto; display: block;">
                                                    @endif
                                                </div>
                                            </div>
                                            {{-- file-manager-middel --}}
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input class="form-control" readonly type="text" name="name"
                                                        value="{{ $imagefile->name }}">
                                                </div>
                                                <div class="form-group">
                                                    <label>URL</label>
                                                    @if ($imagefile->id == true && $imagefile->extention == '.pdf')
                                                        <input class="form-control" readonly type="text"
                                                            name="link"
                                                            value="{{ asset('files/' . $imagefile->name) }}">
                                                    @elseif ($imagefile->id == true && $imagefile->extention == '.docx')
                                                        <input class="form-control" readonly type="text"
                                                            name="link"
                                                            value="{{ asset('files/' . $imagefile->name) }}">
                                                    @elseif ($imagefile->id == true && $imagefile->extention == '.xlsx')
                                                        <input class="form-control" readonly type="text"
                                                            name="link"
                                                            value="{{ asset('files/' . $imagefile->name) }}">
                                                    @else
                                                        <input class="form-control" readonly type="text"
                                                            name="link"
                                                            value="{{ asset('upload/' . $imagefile->name) }}">
                                                    @endif
                                                </div>
                                                <div class="form-group">
                                                    <label>Alt</label>
                                                    <input class="form-control" type="text" name="alt"
                                                        value="{{ $imagefile->alt }}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Title</label>
                                                    <input class="form-control" type="text" name="title"
                                                        value="{{ $imagefile->title }}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Caption</label>
                                                    <input class="form-control" type="text" name="caption"
                                                        value="{{ $imagefile->caption }}">
                                                </div>
                                                <div class="form-group">
                                                    <label>Description</label>
                                                    <input class="form-control" type="text" name="description"
                                                        value="{{ $imagefile->description }}">
                                                </div>
                                            </div>
                                            {{-- file-manager-right --}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {{-- ========End Modal======== --}}
                        <script type="text/javascript">
                            function myFunction_{{ $imagefile->id }}() {
                                var file_name = document.getElementById("selected_img_name_{{ $imagefile->name }}").value;
                                var file_id = document.getElementById("selected_img_id_{{ $imagefile->id }}").value;
                                $.ajax({
                                    url: "{{ route('superAdmin.media.delete') }}",
                                    data: ({
                                        name: file_name,
                                        id: file_id
                                    }),
                                    success: function(data) {
                                        if (data.action == 'image') {
                                            // use for animation hidden
                                            $("#msg").html(data.msg).show().delay(1000).fadeOut();
                                            // use for reload
                                            // setTimeout(function() {
                                            //     // window.location.reload(true);
                                            // }, 3000);
                                        } else if (data.action == 'file') {
                                            $("#msg").html(data.msg).show().delay(1000).fadeOut();
                                        } else {
                                            window.location.reload(true);
                                        }

                                    },
                                    error: function(data) {
                                        var errors = data.responseJSON;
                                        console.log(errors);
                                    }
                                })
                            }
                        </script>
                    @endforeach

                    {{-- {{ $data->appends($_GET)->links() }} --}}
                </div>
            </div>
        </div>
    </div>

    {{-- @endforeach --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/dropzone.js"></script>

    <script type="text/javascript">
        Dropzone.options.dropzoneForm = {
            maxFilesize: 12,
            acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg,.pdf,.xlsx,.docx",
            previewsContainer: "#dropzoneForm",
            uploadMultiple: false,
            autoProcessQueue: true,
            addRemoveLinks: false,
            dictDefaultMessage: "Drop image or file here to upload",
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
                this.on("complete", function() {
                    if (this.getQueuedFiles().length == 0 && this.getUploadingFiles().length == 0) {
                        var _this = this;
                        _this.removeAllFiles();
                        window.location.reload(true);
                    }
                });
            }
        };
        //search image
        $(document).on('input', '#input_search_image_file', function() {
            // array value dispay none
            var appmedias = document.getElementsByClassName('media-hidden');
            for (var i = 0; i < appmedias.length; i++) {
                appmedias[i].style.display = 'none';
            }

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
                url: "{{ route('superAdmin.media.search') }}",
                data: data,
                success: function(response) {
                    document.getElementById("image_file_upload_response").innerHTML = response
                }
            });
        });

        const targetDiv = document.getElementById("third");
        const btn = document.getElementById("toggle");
        btn.onclick = function() {
            if (targetDiv.style.display == "block") {
                // targetDiv.style.display = "none";
                targetDiv.style.opacity = 0;
                targetDiv.style.transform = 'scale(0)';
                window.setTimeout(function() {
                    targetDiv.style.display = 'none';
                }, 0); // timed to match animation-duration

            } else {
                targetDiv.style.display = "block";
                window.setTimeout(function() {
                    targetDiv.style.opacity = 1;
                    targetDiv.style.transform = 'scale(1)';
                }, 0);
            }
        };
        const searchtargetDiv = document.getElementById("search_third");
        const searchbtn = document.getElementById("search_toggle");
        searchbtn.onclick = function() {
            if (searchtargetDiv.style.display == "block") {
                searchtargetDiv.style.display = "none";
            } else {
                searchtargetDiv.style.display = "block";

            }
        };
    </script>

