@extends('layouts.deshboard')
@section('content')
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

        .col-file-manager {
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

        div#post_select_image_container .post-select-image-container img {
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
    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    @if ($message = Session::get('success'))
        <div class="alert alert-success alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>{{ $message }}</strong>
        </div>
    @endif
    @php
        $langs[] = '';
    @endphp
    @foreach (config('app.multilocale') as $lang)
        @php
            $langs[] = $lang;
        @endphp
        <div class="lang_{{ $lang }}">
            <div class="item form-group">
                <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Category
                    Name_{{ $lang }}

                    <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 ">
                    <input type="text" name="name_{{ $lang }}" class="form-control"
                        id="mySelect_{{ $lang }}" onchange="myFunction_{{ $lang }}()" placeholder="" />

                    <input type="hidden" name="title_{{ $lang }}" id="titleSelect_{{ $lang }}"
                        value="" class="form-control">

                    <input type="hidden" name="slug_{{ $lang }}" id="slugValue_{{ $lang }}" value=""
                        class="form-control" placeholder="Slug-name">
                    <input type="hidden" name="link_{{ $lang }}" id="linkValue_{{ $lang }}"
                        value="" class="form-control">
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
        <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Select
            Parent
            Category<span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 ">
            <select class="custom-select" name="parent_id" id="inputGroupSelect01">
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
            <input type="hidden" value="0" class="js-switch" name="status">
            <input type="checkbox" value="1" class="js-switch" name="status"
                @if ('checked') checked @endif>
        </div>
    </div>

    <div class="item form-group" style="display: none;">
        <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Display for only Super admin
        </label>
        <div class="col-md-6 col-sm-6 ">
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
                        @if ($pvalue->name == 'category-privatecat')
                            <input type="checkbox" value="0" class="js-switch" name="privatecat">
                            <input type="hidden" value="1" class="js-switch" name="privatecat"
                                @if ('checked') checked @endif>
                        @endif
                    @endif
                @endforeach
            @endforeach

        </div>
    </div>


    {{-- =========================== --}}
    {{-- Endforeach --}}
    <div class="item form-group" style="display: none;">
        <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Category
            Images<span class="required">*</span>
        </label>
        <div class="col-md-6 col-sm-6 ">
            <a href="" type="text" class="upload-text" data-toggle="modal" data-target="#image_file_manager">
                Image upload
            </a>
            <div id="post_select_image_container" class="post-select-image-container">
                <a href="" type="text" class="upload-text" data-toggle="modal" data-target="#image_file_manager">
                    <img src="{{ asset('img/profile/profile-image.png') }}" width="170px" height="200px" alt=""
                        title="">
                </a>
            </div>
            <input type="hidden" name="image_id" id="image_id">
            <input type="hidden" name="image_name" id="image_name">
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <div class="row">
        <div class="col-md-12 col-sm-12 ">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Category</h2>
                    <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content">
                    <form method="POST" action="{{ route('supeAdmin.category.store') }}">
                        @csrf
                        {{-- <x-forms.category.catcreate :categories="$categories" /> --}}
                        <div class="item form-group">
                            <div class="col-md-6 col-sm-6 offset-md-5 mt-4">
                                <button type="submit" class="btn btn-primary btn-lg " id="submit-all">Submit</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
    {{-- <x-forms.category.catcreatemodal /> --}}
@endsection
