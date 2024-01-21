@extends('layouts.deshboard')
@section('content')
    <style>
        /****** CODE ******/

        .file-upload {
            display: block;
            text-align: center;
            font-family: Helvetica, Arial, sans-serif;
            font-size: 12px;
        }

        .file-upload .file-select {
            display: block;
            border: 2px solid #dce4ec;
            color: #34495e;
            cursor: pointer;
            height: 40px;
            line-height: 40px;
            text-align: left;
            background: #FFFFFF;
            overflow: hidden;
            position: relative;
        }

        .file-upload .file-select .file-select-button {
            background: #dce4ec;
            padding: 0 10px;
            display: inline-block;
            height: 40px;
            line-height: 40px;
        }

        .file-upload .file-select .file-select-name {
            line-height: 40px;
            display: inline-block;
            padding: 0 10px;
        }

        .file-upload .file-select:hover {
            border-color: #34495e;
            transition: all .2s ease-in-out;
            -moz-transition: all .2s ease-in-out;
            -webkit-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
        }

        .file-upload .file-select:hover .file-select-button {
            background: #34495e;
            color: #FFFFFF;
            transition: all .2s ease-in-out;
            -moz-transition: all .2s ease-in-out;
            -webkit-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
        }

        .file-upload.active .file-select {
            border-color: #3fa46a;
            transition: all .2s ease-in-out;
            -moz-transition: all .2s ease-in-out;
            -webkit-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
        }

        .file-upload.active .file-select .file-select-button {
            background: #3fa46a;
            color: #FFFFFF;
            transition: all .2s ease-in-out;
            -moz-transition: all .2s ease-in-out;
            -webkit-transition: all .2s ease-in-out;
            -o-transition: all .2s ease-in-out;
        }

        .file-upload .file-select input[type=file] {
            z-index: 100;
            cursor: pointer;
            position: absolute;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            opacity: 0;
            filter: alpha(opacity=0);
        }

        .file-upload .file-select.file-select-disabled {
            opacity: 0.65;
        }

        .file-upload .file-select.file-select-disabled:hover {
            cursor: default;
            display: block;
            border: 2px solid #dce4ec;
            color: #34495e;
            cursor: pointer;
            height: 40px;
            line-height: 40px;
            margin-top: 5px;
            text-align: left;
            background: #FFFFFF;
            overflow: hidden;
            position: relative;
        }

        .file-upload .file-select.file-select-disabled:hover .file-select-button {
            background: #dce4ec;
            color: #666666;
            padding: 0 10px;
            display: inline-block;
            height: 40px;
            line-height: 40px;
        }

        .file-upload .file-select.file-select-disabled:hover .file-select-name {
            line-height: 40px;
            display: inline-block;
            padding: 0 10px;
        }
    </style>

    <div class="row">
        <div class="col-md-12 col-sm-12 ">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Video</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>

                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <form method="POST" action="{{ route('superAdmin.video.store') }}" enctype="multipart/form-data">
                        @csrf

                        <div class="lang">
                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Video

                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <div class="file-upload">
                                        <div class="file-select">
                                            <div class="file-select-button" id="fileName">Choose Video</div>
                                            <div class="file-select-name" id="noFile">Select Video (mp4)</div>
                                            <input type="file" name="video" id="chooseFile" class="custom-file-input"
                                                id="chooseVideo" accept="video/mp4,video/x-m4v,video/*">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Youtub Video Url

                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <div class="file-upload">

                                        <div class="custom-file">
                                            {{-- <input type="file" name="video" class="custom-file-input" id="chooseVideo"
                                            accept="video/mp4,video/x-m4v,video/*"> --}}
                                            <div class="extention-panel" id="btn_delete_post_main_video">
                                                <input id="myUrl" type="text" name="youtubevideo"
                                                    class="form-control mb-2" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Video Caption

                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <input type="text" name="videocaption" class="form-control">
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Select Category
                                </label>
                                @php
                                    $categories = DB::table('categories')->get();
                                    // print_r($categories);
                                @endphp
                                <div class="col-md-6 col-sm-6 ">
                                    <select class="custom-select" name="category_id">
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}">
                                                {{ $category->{'name_' . app()->getLocale()} }}
                                            </option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>

                            <div class="item form-group">
                                <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Status

                                </label>
                                <div class="col-md-6 col-sm-6 ">
                                    <label>
                                        <input type="hidden" value="0" class="js-switch" name="status">
                                        <input type="checkbox" value="1" class="js-switch" name="status"
                                            @if ('checked') checked @endif>
                                    </label>

                                </div>
                            </div>




                        </div>
                        <div class="item form-group">
                            <div class="col-md-6 col-sm-6 offset-md-3 mt-4">
                                <button type="submit" class="btn btn-primary btn-lg" id="submit-all"
                                    style="width: 100%;">Submit</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <script>
        $('#chooseFile').bind('change', function() {
            var filename = $("#chooseFile").val();
            if (/^\s*$/.test(filename)) {
                $(".file-upload").removeClass('active');
                $("#noFile").text("No file chosen...");
            } else {
                $(".file-upload").addClass('active');
                $("#noFile").text(filename.replace("C:\\fakepath\\", ""));
            }
        });
    </script>
@endsection
