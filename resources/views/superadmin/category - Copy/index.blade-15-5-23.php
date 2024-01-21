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
    <style>
        @media (min-width: 576px) {
            .category-modal {
                max-width: 600px !important;
                margin: 1.75rem auto;
            }
        }
    </style>
    <!-- Content Header (Page header) -->
    <section class="content-header">

    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
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
                                                {{-- <a class="btn btn-outline-primary mb-2 ml-2 card-title"
                                                    href="{{ route('superAdmin.category.create') }}">Add
                                                    category</a> --}}
                                                <!-- Button trigger modal -->
                                                <button type="button" class="btn btn-outline-primary mb-2 ml-2 card-title"
                                                    data-toggle="modal" data-target="#addCategoryModal">
                                                    Add Category
                                                </button>
                                            </span>
                                        @endif
                                    @endif
                                @endforeach
                            @endforeach
                        </div>


                        <!-- Modal for Category Add -->
                        <div class="modal  fade" id="addCategoryModal" tabindex="-1"
                            aria-labelledby="addCategoryModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-scrollable category-modal">
                                <form method="POST" action="{{ route('superAdmin.category.store') }}"
                                    enctype="multipart/form-data" style="width: 100%;">
                                    @csrf
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addCategoryModalLabel">Add Category</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="card">
                                                <div class="card-body">
                                                    @php
                                                        $langs[] = '';
                                                    @endphp
                                                    @foreach (config('app.multilocale') as $lang)
                                                        @php
                                                            $langs[] = $lang;
                                                        @endphp
                                                        <div class="lang_{{ $lang }}">

                                                            <div class="form-group">
                                                                <label
                                                                    class="col-form-label col-md-12 col-sm-12 label-align"
                                                                    for="first-name">Category
                                                                    Name_{{ $lang }} <span class="required">*</span>

                                                                </label>
                                                                <div class="col-md-12 col-sm-12 ">
                                                                    <input type="text" name="name_{{ $lang }}"
                                                                        class="form-control"
                                                                        id="mySelect_{{ $lang }}"
                                                                        onchange="myFunction_{{ $lang }}()"
                                                                        placeholder="" />

                                                                    <input type="hidden" name="title_{{ $lang }}"
                                                                        id="titleSelect_{{ $lang }}" value=""
                                                                        class="form-control">

                                                                    <input type="hidden" name="slug_{{ $lang }}"
                                                                        id="slugValue_{{ $lang }}" value=""
                                                                        class="form-control" placeholder="Slug-name">
                                                                    <input type="hidden" name="link_{{ $lang }}"
                                                                        id="linkValue_{{ $lang }}" value=""
                                                                        class="form-control">
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
                                                        <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                            for="last-name">Select
                                                            Parent
                                                            Category
                                                        </label>
                                                        <div class="col-md-12 col-sm-12 ">
                                                            <select class="custom-select" name="parent_id"
                                                                id="inputGroupSelect01">
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
                                                                                    @include(
                                                                                        'newcategory.createsubcategories',
                                                                                        [
                                                                                            'category' =>
                                                                                                $sub->subcategory,
                                                                                        ]
                                                                                    )
                                                                                @endif
                                                                            @endforeach
                                                                        @endif
                                                                    @endforeach
                                                                @endif
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="item form-group">
                                                        <label class="col-form-label col-md-3 col-sm-3 label-align"
                                                            for="last-name">Status
                                                        </label>
                                                        <div class="col-md-6 col-sm-6 ">
                                                            <input type="hidden" value="0" class="js-switch"
                                                                name="status">
                                                            <input type="checkbox" value="1" class="js-switch"
                                                                name="status"
                                                                @if ('checked') checked @endif>
                                                        </div>
                                                    </div>

                                                    {{-- =========================== --}}
                                                    <div class="item form-group">
                                                        <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                            for="last-name">Category
                                                            Images
                                                        </label>
                                                        <div class="col-md-6 col-sm-6 offset-md-3 ">
                                                            <a href="" type="text" class="upload-text"
                                                                data-toggle="modal" data-target="#image_file_manager">
                                                                Image upload
                                                            </a>
                                                            <div id="post_select_image_container"
                                                                class="post-select-image-container">
                                                                <a href="" type="text" class="upload-text"
                                                                    data-toggle="modal" data-target="#image_file_manager">
                                                                    <img src="{{ asset('img/profile/cemera.jpg') }}"
                                                                        width="170px" height="200px" alt=""
                                                                        title="">
                                                                </a>

                                                            </div>
                                                            <input type="hidden" name="image_id" id="image_id">
                                                            <input type="hidden" name="image_name" id="image_name">
                                                            <input type="hidden" name="alt" id="alt_value">
                                                            <input type="hidden" name="title" id="title_value">
                                                            <input type="hidden" name="caption" id="caption_value">
                                                            <input type="hidden" name="description"
                                                                id="description_value">
                                                        </div>
                                                    </div>


                                                    <div class="item form-group">
                                                        <div class="col-md-12 col-sm-12  mt-4">
                                                            <button type="submit"
                                                                class="btn btn-outline-success btn-lg btn-block "
                                                                id="submit-all">Submit</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                        {{-- <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div> --}}
                                    </div>
                                    {{-- modal-content --}}
                                </form>
                            </div>
                        </div>

                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                {{-- <table class="table table-hover table-bordered"> --}}
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Category Name</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $sl = 1;
                                    @endphp
                                    @foreach ($categories as $value)
                                        <tr>
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
                                                                <div class="pull-right"
                                                                    style="float: right; margin-right: 1%;">
                                                                    @if ($value->status == 1)
                                                                        <a style=""
                                                                            href="{{ route('superAdmin.category.publish', $value->id) }}"
                                                                            class="btn btn-sm btn-info "><i
                                                                                class="fa fa-arrow-circle-up"
                                                                                aria-hidden="true"></i></a>
                                                                    @else
                                                                        <a href="{{ route('superAdmin.category.unpublish', $value->id) }}"
                                                                            class="btn btn-sm btn-warning ">
                                                                            <i class="fa fa-arrow-circle-down "
                                                                                aria-hidden="true"></i>
                                                                        </a>
                                                                    @endif
                                                                </div>
                                                            @endif
                                                            <div class="pull-right"
                                                                style="float: right; margin-right: 0.5rem">
                                                                @if ($pvalue->name == 'category-edit')
                                                                    <button type="button"
                                                                        class="btn btn-sm btn-primary pull-right"
                                                                        data-toggle="modal"
                                                                        data-target="#cateditModal_{{ $value->id }}">
                                                                        <i class="fas fa-edit"></i>
                                                                    </button>
                                                                    {{-- <a href="{{ route('superAdmin.category.edit', $value->id) }}"
                                                                        class="btn btn-sm btn-primary pull-right"><i
                                                                            class="fas fa-edit"></i></a> --}}
                                                                @endif
                                                                @if ($pvalue->name == 'category-deleted')
                                                                    <a href="{{ route('superAdmin.category.deleted', $value->id) }}"
                                                                        class="btn btn-sm btn-info  btn-danger pull-right"><i
                                                                            class="fa fa-trash"
                                                                            aria-hidden="true"></i></a>
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
                                                                                        <button type="button"
                                                                                            class="btn btn-sm btn-primary pull-right"
                                                                                            data-toggle="modal"
                                                                                            data-target="#cateditModal_{{ $sub->id }}">
                                                                                            <i class="fas fa-edit"></i>
                                                                                        </button>
                                                                                        {{-- <a href="{{ route('superAdmin.category.edit', $sub->id) }}"
                                                                                            class="btn btn-sm btn-primary  pull-right"><i
                                                                                                class="fas fa-edit"></i></a> --}}
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
                                                                        @include(
                                                                            'superAdmin.category.subcategories',
                                                                            [
                                                                                'category' => $sub->subcategory,
                                                                            ]
                                                                        )
                                                                    @endif
                                                                </td>
                                                            </tr>
                                                            @if (!empty($sub->id))
                                                                <!-- Edit sub cat Modal  -->
                                                                <div class="modal fade"
                                                                    id="cateditModal_{{ $sub->id }}" tabindex="-1"
                                                                    aria-labelledby="cateditModal_{{ $sub->id }}Label"
                                                                    aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        @php
                                                                            $cat = DB::table('categories')
                                                                                ->where('id', '=', $sub->id)
                                                                                ->first();
                                                                            // print_r($cat);
                                                                        @endphp
                                                                        {!! Form::model($cat, [
                                                                            'route' => ['superAdmin.category.update', $cat->id],
                                                                            'method' => 'PATCH',
                                                                            'enctype' => 'multipart/form-data',
                                                                            'id' => 'upload',
                                                                        ]) !!}
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title"
                                                                                    id="cateditModal_{{ $value->id }}Label">
                                                                                    Modal title
                                                                                </h5>
                                                                                <button type="button" class="close"
                                                                                    data-dismiss="modal"
                                                                                    aria-label="Close">
                                                                                    <span aria-hidden="true">&times;</span>
                                                                                </button>
                                                                            </div>
                                                                            <div class="modal-body">

                                                                                <div class="lang">
                                                                                    @php
                                                                                        $langs[] = '';
                                                                                    @endphp
                                                                                    @foreach (config('app.multilocale') as $lang)
                                                                                        @php
                                                                                            $langs[] = $lang;
                                                                                        @endphp
                                                                                        <br />
                                                                                        <div class="form-group">
                                                                                            <label
                                                                                                class="col-form-label col-md-12 col-sm-12 label-align"
                                                                                                for="first-name">Category
                                                                                                Name_{{ $lang }}
                                                                                                <span
                                                                                                    class="required">*</span>

                                                                                            </label>
                                                                                            <div
                                                                                                class="col-md-12 col-sm-12 ">
                                                                                                <input type="text"
                                                                                                    name="name_{{ $lang }}"
                                                                                                    value="{{ $cat->{'name_' . $lang} }}"
                                                                                                    id="mySelect_{{ $lang }}"
                                                                                                    onchange="myFunction_{{ $lang }}()"
                                                                                                    class="form-control"
                                                                                                    placeholder="Category name"
                                                                                                    required />
                                                                                                <input type="hidden"
                                                                                                    name="title_{{ $lang }}"
                                                                                                    id="titleSelect_{{ $lang }}"
                                                                                                    value="{{ $cat->{'title_' . $lang} }}"
                                                                                                    class="form-control">
                                                                                                <input type="hidden"
                                                                                                    name="slug_{{ $lang }}"
                                                                                                    value="{{ $cat->{'slug_' . $lang} }}"
                                                                                                    id="slugValue_{{ $lang }}"
                                                                                                    class="form-control"
                                                                                                    placeholder="Category slug"
                                                                                                    required />
                                                                                                <input type="hidden"
                                                                                                    name="link_{{ $lang }}"
                                                                                                    id="linkValue_{{ $lang }}"
                                                                                                    value=""
                                                                                                    class="form-control">
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
                                                                                                document.getElementById("titleSelect_{{ $lang }}").value = imp;
                                                                                            }
                                                                                        </script>
                                                                                        @php
                                                                                            //print_r($lang);
                                                                                        @endphp
                                                                                    @endforeach
                                                                                    <div class="item form-group">
                                                                                        <label
                                                                                            class="col-form-label col-md-12 col-sm-12 label-align"
                                                                                            for="last-name">Select
                                                                                            Parent
                                                                                            Category<span
                                                                                                class="required">*</span>
                                                                                        </label>
                                                                                        <div class="col-md-12 col-sm-12 ">
                                                                                            <select class="custom-select"
                                                                                                name="parent_id"
                                                                                                id="inputGroupSelect01">
                                                                                                <option selected
                                                                                                    value="0">
                                                                                                    Choose...
                                                                                                </option>
                                                                                                @if ($categories)
                                                                                                    @foreach ($categories as $category)
                                                                                                        @if ($cat->id != $category->id)
                                                                                                            <option
                                                                                                                {{ $category->id == $cat->parent_id ? 'selected=""' : '' }}
                                                                                                                value="{{ $category->id }}">

                                                                                                                {{ $category->{'slug_' . app()->getLocale()} }}

                                                                                                            </option>
                                                                                                        @endif
                                                                                                    @endforeach
                                                                                                @endif
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="item form-group">
                                                                                    <label
                                                                                        class="col-form-label col-md-12 col-sm-12 label-align"
                                                                                        for="last-name">Status
                                                                                    </label>
                                                                                    <div class="col-md-6 col-sm-6 ">
                                                                                        <input type="hidden"
                                                                                            value="0"
                                                                                            class="js-switch"
                                                                                            name="status"
                                                                                            {{ $cat->status == 0 ? 'checked' : '' }}>
                                                                                        <input type="checkbox"
                                                                                            value="1"
                                                                                            class="js-switch"
                                                                                            name="status"
                                                                                            {{ $cat->status == 1 ? 'checked' : '' }}>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label
                                                                                        class="col-form-label col-md-3 col-sm-3 label-align"
                                                                                        for="last-name">Category
                                                                                        Images<span
                                                                                            class="required">*</span>
                                                                                    </label>
                                                                                    <div
                                                                                        class="col-md-12 col-sm-12 offset-md-3">
                                                                                        <a href="" type="text"
                                                                                            class="upload-text"
                                                                                            data-toggle="modal"
                                                                                            data-target="#image_file_manager">
                                                                                            Image upload
                                                                                        </a>
                                                                                        @if (!empty($cat->category_img))
                                                                                            <div id="post_select_image_container"
                                                                                                class="post-select-image-container">
                                                                                                @if ($cat->category_img != null)
                                                                                                    <button
                                                                                                        class="pull-right mt-4"
                                                                                                        onclick="displayimageRemove()"
                                                                                                        id="btn_delete">
                                                                                                        <i
                                                                                                            class="fa fa-times"></i>
                                                                                                    </button>
                                                                                                @endif
                                                                                                <img src="{{ asset('images/' . $cat->category_img) }}"
                                                                                                    id="selected_image_file"
                                                                                                    alt=""
                                                                                                    class="img-fluid">
                                                                                            </div>
                                                                                        @else
                                                                                            <div id="post_select_image_container"
                                                                                                class="post-select-image-container">
                                                                                                <a href=""
                                                                                                    class="upload-text"
                                                                                                    type="text"
                                                                                                    data-toggle="modal"
                                                                                                    data-target="#image_file_manager">
                                                                                                    <img src="{{ asset('img/profile/cemera.jpg') }}"
                                                                                                        width="170px"
                                                                                                        height="200px"
                                                                                                        alt=""
                                                                                                        title="">
                                                                                                </a>

                                                                                            </div>
                                                                                        @endif
                                                                                        {{-- <input type="hidden" name="upload_id" value="{{ $cat->image_id }}"> --}}
                                                                                        <input type="hidden"
                                                                                            name="image_id" id="image_id"
                                                                                            value="">
                                                                                        <input type="hidden"
                                                                                            name="image_name"
                                                                                            id="image_name"
                                                                                            value="{{ $cat->category_img }}">
                                                                                        <input type="hidden"
                                                                                            name="alt" id="alt_value"
                                                                                            value="">
                                                                                        <input type="hidden"
                                                                                            name="title"
                                                                                            id="title_value"
                                                                                            value="">
                                                                                        <input type="hidden"
                                                                                            name="caption"
                                                                                            id="caption_value"
                                                                                            value="">
                                                                                        <input type="hidden"
                                                                                            name="description"
                                                                                            id="description_value"
                                                                                            value="">
                                                                                    </div>
                                                                                </div>
                                                                                <button type=" submit"
                                                                                    class="btn btn-outline-success btn-block"
                                                                                    id="submit-all">Update</button>
                                                                            </div>
                                                                        </div>
                                                                        {!! Form::close() !!}
                                                                    </div>
                                                                </div>
                                                            @endif
                                                        @endforeach
                                                    </table>
                                                @endif
                                            </td>
                                        </tr>

                                        {{-- ============================= --}}
                                        <!-- Button trigger modal edit -->
                                        <!-- Edit cat Modal  -->
                                        <div class="modal fade" id="cateditModal_{{ $value->id }}" tabindex="-1"
                                            aria-labelledby="cateditModal_{{ $value->id }}Label" aria-hidden="true">
                                            <div class="modal-dialog">
                                                @php
                                                    $cat = DB::table('categories')
                                                        ->where('id', '=', $value->id)
                                                        ->first();
                                                    // print_r($cat);
                                                @endphp
                                                {!! Form::model($cat, [
                                                    'route' => ['superAdmin.category.update', $cat->id],
                                                    'method' => 'PATCH',
                                                    'enctype' => 'multipart/form-data',
                                                    'id' => 'upload',
                                                ]) !!}
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title"
                                                            id="cateditModal_{{ $value->id }}Label">
                                                            Modal title
                                                        </h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">

                                                        <div class="lang">
                                                            @php
                                                                $langs[] = '';
                                                            @endphp
                                                            @foreach (config('app.multilocale') as $lang)
                                                                @php
                                                                    $langs[] = $lang;
                                                                @endphp
                                                                <br />
                                                                <div class="form-group">
                                                                    <label
                                                                        class="col-form-label col-md-12 col-sm-12 label-align"
                                                                        for="first-name">Category
                                                                        Name_{{ $lang }} <span
                                                                            class="required">*</span>

                                                                    </label>
                                                                    <div class="col-md-12 col-sm-12 ">
                                                                        <input type="text"
                                                                            name="name_{{ $lang }}"
                                                                            value="{{ $cat->{'name_' . $lang} }}"
                                                                            id="mySelect_{{ $lang }}"
                                                                            onchange="myFunction_{{ $lang }}()"
                                                                            class="form-control"
                                                                            placeholder="Category name" required />
                                                                        <input type="hidden"
                                                                            name="title_{{ $lang }}"
                                                                            id="titleSelect_{{ $lang }}"
                                                                            value="{{ $cat->{'title_' . $lang} }}"
                                                                            class="form-control">
                                                                        <input type="hidden"
                                                                            name="slug_{{ $lang }}"
                                                                            value="{{ $cat->{'slug_' . $lang} }}"
                                                                            id="slugValue_{{ $lang }}"
                                                                            class="form-control"
                                                                            placeholder="Category slug" required />
                                                                        <input type="hidden"
                                                                            name="link_{{ $lang }}"
                                                                            id="linkValue_{{ $lang }}"
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
                                                                        document.getElementById("titleSelect_{{ $lang }}").value = imp;
                                                                    }
                                                                </script>
                                                                @php
                                                                    //print_r($lang);
                                                                @endphp
                                                            @endforeach
                                                            <div class="item form-group">
                                                                <label
                                                                    class="col-form-label col-md-12 col-sm-12 label-align"
                                                                    for="last-name">Select
                                                                    Parent
                                                                    Category<span class="required">*</span>
                                                                </label>
                                                                <div class="col-md-12 col-sm-12 ">
                                                                    <select class="custom-select" name="parent_id"
                                                                        id="inputGroupSelect01">
                                                                        <option selected value="0">Choose...
                                                                        </option>
                                                                        @if ($categories)
                                                                            @foreach ($categories as $category)
                                                                                @if ($cat->id != $category->id)
                                                                                    <option
                                                                                        {{ $category->id == $cat->parent_id ? 'selected=""' : '' }}
                                                                                        value="{{ $category->id }}">

                                                                                        {{ $category->{'slug_' . app()->getLocale()} }}

                                                                                    </option>
                                                                                @endif
                                                                            @endforeach
                                                                        @endif
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="item form-group">
                                                            <label class="col-form-label col-md-12 col-sm-12 label-align"
                                                                for="last-name">Status
                                                            </label>
                                                            <div class="col-md-6 col-sm-6 ">
                                                                <input type="hidden" value="0" class="js-switch"
                                                                    name="status"
                                                                    {{ $cat->status == 0 ? 'checked' : '' }}>
                                                                <input type="checkbox" value="1" class="js-switch"
                                                                    name="status"
                                                                    {{ $cat->status == 1 ? 'checked' : '' }}>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-form-label col-md-3 col-sm-3 label-align"
                                                                for="last-name">Category
                                                                Images<span class="required">*</span>
                                                            </label>
                                                            <div class="col-md-12 col-sm-12 offset-md-3">
                                                                <a href="" type="text" class="upload-text"
                                                                    data-toggle="modal" data-target="#image_file_manager">
                                                                    Image upload
                                                                </a>
                                                                @if (!empty($cat->category_img))
                                                                    <div id="post_select_image_container"
                                                                        class="post-select-image-container">
                                                                        @if ($cat->category_img != null)
                                                                            <button class="pull-right mt-4"
                                                                                onclick="displayimageRemove()"
                                                                                id="btn_delete">
                                                                                <i class="fa fa-times"></i>
                                                                            </button>
                                                                        @endif
                                                                        <img src="{{ asset('images/' . $cat->category_img) }}"
                                                                            id="selected_image_file" alt=""
                                                                            class="img-fluid">
                                                                    </div>
                                                                @else
                                                                    <div id="post_select_image_container"
                                                                        class="post-select-image-container">
                                                                        <a href="" class="upload-text"
                                                                            type="text" data-toggle="modal"
                                                                            data-target="#image_file_manager">
                                                                            <img src="{{ asset('img/profile/cemera.jpg') }}"
                                                                                width="170px" height="200px"
                                                                                alt="" title="">
                                                                        </a>

                                                                    </div>
                                                                @endif
                                                                {{-- <input type="hidden" name="upload_id" value="{{ $cat->image_id }}"> --}}
                                                                <input type="hidden" name="image_id" id="image_id"
                                                                    value="">
                                                                <input type="hidden" name="image_name" id="image_name"
                                                                    value="{{ $cat->category_img }}">
                                                                <input type="hidden" name="alt" id="alt_value"
                                                                    value="">
                                                                <input type="hidden" name="title" id="title_value"
                                                                    value="">
                                                                <input type="hidden" name="caption" id="caption_value"
                                                                    value="">
                                                                <input type="hidden" name="description"
                                                                    id="description_value" value="">
                                                            </div>
                                                        </div>
                                                        <button type=" submit" class="btn btn-outline-success btn-block"
                                                            id="submit-all">Update</button>
                                                    </div>
                                                </div>
                                                {!! Form::close() !!}
                                            </div>
                                        </div>

                                        {{-- ============================= --}}
                                    @endforeach
                                </tbody>

                            </table>
                            {!! $categories->links() !!}
                        </div>
                        <!-- /.card-body -->
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
                            <form id="dropzoneForm" enctype="multipart/form-data" class="dropzone"
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
                                        <div id="image_file_upload_response" class="leftalign-part">
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
                                <input class="form-control" type="text" name="link" id="selected_img_file_path">
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

                        <button type="button" id="btn_img_delete" class="btn btn-danger pull-left btn-file-delete"><i
                                class="fas fa-trash"></i>&nbsp;&nbsp; Delete </button>

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
            const element = document.getElementById("rightHide");
            element.remove();

            document.getElementById("NewClass").className = "col-md-12";

        }

        function imageRemove() {
            // const element = document.getElementById("image_id");
            // element.remove();
            document.getElementById("image_id").value = '';
            document.getElementById("image_name").value = '';
            document.getElementById('display_image').removeAttribute('src');
            const element = document.getElementById("btn_delete_post_main_image");
            element.remove();
        }

        function displayimageRemove() {
            // const element = document.getElementById("image_id");
            // element.remove();
            document.getElementById("image_id").value = '';
            document.getElementById("image_name").value = '';
            document.getElementById('selected_image_file').removeAttribute('src');
            const element = document.getElementById("btn_delete");
            element.remove();
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


    {{-- @include('components.forms.superAdmin.category.catcreatemodal') --}}
@endsection
