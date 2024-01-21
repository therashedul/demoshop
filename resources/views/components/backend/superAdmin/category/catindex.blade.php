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
           /* width: 160px;
                                height: 250px; */
           margin-bottom: 3%;
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

       div#rightHide {
           background-color: #ebebeb;
           padding: 5%;
       }

       img#selected_image_file {
           width: 100%;
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

       #post_select_image_container button#btn_delete {
           margin: 0 auto;
           float: right;
           margin-top: 10px;
       }
   </style>
   <style>
       #tableLoad td.centered {
           text-align: center;
       }
   </style>

   <div class="container">
       <div class="custom-daterange">
           <div class="form-group col-md-4">
               <h5>Start Date <span class="text-danger"></span></h5>
               <div class="controls">
                   <input type="date" name="start_date" id="start_date" class="form-control datepicker-autoclose"
                       placeholder="Please select start date">
                   <div class="help-block"></div>
               </div>
           </div>
           <div class="form-group col-md-4">
               <h5>End Date <span class="text-danger"></span></h5>
               <div class="controls">
                   <input type="date" name="end_date" id="end_date"
                       class="form-control datepicker-autoclose btnchange" placeholder="Please select end date">
                   <div class="help-block"></div>
               </div>
           </div>
           <div class="form-group col-md-4">
               <h5> Search</h5>
               <input type="text" name="name" class="form-control searchEmail" placeholder="Search ...">
               {{-- <div class="text-left" style=" margin-left: 15px;">
                    <button type="text" id="btnFiterSubmitSearch" class="btn btn-info">Submit</button>
                </div> --}}
           </div>
       </div>
       <a class="btn btn-info mb-2 submitOnImage" href="javascript:void(0)" id="createNewCategory"> Add New Post</a>

       <table id="tableLoad" class="table data-table table-bordered table-striped" style="width:100%;">
           <thead>
               <tr>
                   <th>No</th>
                   @php
                       $pcat = DB::table('categories')
                           ->where('parent_id', '!=', '0')
                           ->first();
                       
                   @endphp
                   @if (!empty($pcat))
                       <th>Parent Category</th>
                   @else
                       <th>No Parent</th>
                   @endif
                   <th>Category Name</th>
                   <th>Image</th>
                   <th>Status</th>
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
           <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal getUrl">
               @csrf
               <input type="hidden" name="id" id="id" class="id">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="modelHeading"></h5>
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                       </button>
                   </div>

                   <div class="modal-body">
                       <div class="errMsgContainer"></div>
                       <p id="res_en"></p>
                       <p id="res_bn"></p>
                       <div class="form-group">
                           <label class="col-form-label col-md-12 col-sm-12 label-align">Category Name English
                               <span class="required">*</span>
                           </label>
                           <div class="col-md-12 col-sm-12 ">
                               <input type="text" name="name_en" id="mySelect_en" onchange="myFunction_en()"
                                   class="form-control up_name_en nameEn mySelect_en" required />
                           </div>
                       </div>
                       <div class="form-group">
                           <label class="col-form-label col-md-12 col-sm-12 label-align">Category Name Bangla
                               <span class="required">*</span>
                           </label>
                           <div class="col-md-12 col-sm-12 ">
                               <input type="text" name="name_bn" id="mySelect_bn" onchange="myFunction_bn()"
                                   class="form-control up_name_bn nameBn mySelect_bn" required />
                           </div>
                       </div>

                       <div class="col-md-12 col-sm-12 ">
                           <input type="hidden" name="title_en" id="titleSelect_en"
                               class="form-control uptitleEn titleSelect_en">

                           <input type="hidden" name="title_bn" id="titleSelect_bn"
                               class="form-control uptitleBn titleSelect_bn">

                           <input type="hidden" name="slug_en" id="slugValue_en"
                               class="form-control slugEn upslug_en slugValue_en" required />

                           <input type="hidden" name="slug_bn" id="slugValue_bn"
                               class="form-control slugBn  upslug_bn slugValue_bn" required />
                       </div>
                       <script type="text/javascript">
                           function myFunction_en() {
                               const strng = document.querySelector(".mySelect_en").value;

                               const APP_URL = {!! json_encode(url('/')) !!}
                               const spt = strng.split(" ");
                               const imp = spt.join('_');
                               const link = document.querySelector(".slugValue_en").value = imp;
                               document.querySelector(".titleSelect_en").value = imp;
                           }

                           function myFunction_bn() {
                               const strng = document.querySelector(".mySelect_bn").value;
                               const APP_URL = {!! json_encode(url('/')) !!}
                               const spt = strng.split(" ");
                               const imp = spt.join('_');
                               const link = document.querySelector(".slugValue_bn").value = imp;
                               document.querySelector(".titleSelect_bn").value = imp;
                           }
                       </script>

                       <div class="item form-group">
                           <label class="col-form-label col-md-12 col-sm-12 label-align" for="last-name">Select
                               Parent
                               Category<span class="required">*</span>
                           </label>
                           <div class="col-md-12 col-sm-12 ">
                               @php
                                   $categories = DB::table('categories')->get();
                               @endphp
                               <select class="form-control up-category categoryName upCategory" id="categoryName"
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

                       <div class="form-group">
                           <label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">Status
                           </label>
                           <div class="col-md-9 col-sm-9 pt-2 ">
                               <input type="checkbox" class="js-switch mycheckbox status" id="status"
                                   name="status">
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

                               <div id="post_select_image_container" class="post-select-image-container imageOn"
                                   style="display: none">
                                   <a href="" type="text" class="upload-text" data-toggle="modal"
                                       data-target="#image_file_manager">
                                       <img src="{{ asset('img/profile/cemera.jpg') }}"
                                           class="img-responsive  img-fluid" alt="" title="">
                                   </a>
                               </div>


                               <div id="up_post_select_image_container"
                                   class="up-post-select-image-container dispalyImage imageUp">
                                   <button class="pull-right mt-4" onclick="displayimageRemove()" id="btn_delete">
                                       <i class="fa fa-times"></i>
                                   </button>
                                   <img src="" id="selected_image_file" alt=""
                                       class="img-responsive  img-fluid">
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
                                   id="submit-all" style="display: none">Submit</button>
                               <button type="submit" class="btn btn-outline-success btn-lg btn-block btnSubmit "
                                   id="up-submitbtn" style="display: none">Update</button>
                           </div>
                       </div>
                   </div>
               </div>
               {{-- modal-content --}}
           </form>
       </div>
   </div>

   {{-- Image modal --}}
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
                        action="{{ route('superAdmin.media.upload') }}">
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

   <script type="text/javascript">
       $(document).ready(function() {
           $('.submitOnImage').click(function(e) {
               e.preventDefault();
               document.querySelector(".imageOn").style.display = "block";
               document.querySelector(".imageUp").style.display = "none";
           });

       });
   </script>
   <script type="text/javascript">
       $(document).ready(function() {
           $('.submitUpImage').click(function(e) {
               e.preventDefault();
               document.querySelector(".imageOn").style.display = "none";
               document.querySelector(".imageUp").style.display = "block";
           });

       });
   </script>
   {{-- </div> --}}

   @php
       $language = app()->getLocale();
   @endphp
   <script type="text/javascript">
       $(document).ready(function() {
           $.ajaxSetup({
               headers: {
                   'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
               }
           });
       })
   </script>

   {{-- ajax name check --}}
   <script type="text/javascript">
       $('#mySelect_en').blur(function() {
           var nameValue = $('#mySelect_en ').val();
           const xhttp = new XMLHttpRequest();
           let serverUrl = '/categoryCheck.name/' + nameValue;
           xhttp.open("GET", serverUrl);
           xhttp.onreadystatechange = function() {
               // alert(this.responseText);
               if (this.readyState == 4 && this.status == 200) {
                   document.getElementById("res_en").innerHTML =
                       this.responseText;
                   if (this.responseText == "Name already exist") {
                       $("#res_en").css({
                           "color": "red",
                           "font-size": "1rem"
                       })
                       document.querySelector('#submit-all').disabled = true;
                       document.querySelector('#up-submitbtn').disabled = true;
                   } else {
                       $("#res_en").css({
                           "color": "green",
                           "font-size": "1rem"
                       })
                       document.querySelector('#submit-all').disabled = false;
                       document.querySelector('#up-submitbtn').disabled = false;
                   }
               }
           };
           xhttp.send(null);
       });


       $('#mySelect_bn').blur(function() {
           var nameValue = $('#mySelect_bn ').val();
           const xhttp = new XMLHttpRequest();
           let serverUrl = '/categoryCheck.name/' + nameValue;
           xhttp.open("GET", serverUrl);
           xhttp.onreadystatechange = function() {
               // alert(this.responseText);
               if (this.readyState == 4 && this.status == 200) {
                   document.getElementById("res_bn").innerHTML =
                       this.responseText;
                   if (this.responseText == "Name already exist") {
                       $("#res_bn").css({
                           "color": "red",
                           "font-size": "1rem"
                       })

                       document.querySelector('#submit-all').disabled = true;
                       document.querySelector('#up-submitbtn').disabled = true;
                   } else {
                       $("#res_bn").css({
                           "color": "green",
                           "font-size": "1rem"
                       })
                       document.querySelector('#submit-all').disabled = false;
                       document.querySelector('#up-submitbtn').disabled = false;
                   }
               }
           };
           xhttp.send(null);
       });
   </script>
   {{-- // publish  // unpublish --}}
   <script type="text/javascript">
       // publish
       $(document).on('click', '.publish', function(e) {
           e.preventDefault();
           let id = $(this).data('id');

           var url = "{{ route('superAdmin.category.publish', ':id') }}";
           var pubUrl = url.replace(':id', id);

           let dataPub = {
               'id': id,
           };

           $.ajax({
               headers: {
                   'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
               },
               type: "GET",
               url: pubUrl,
               data: dataPub,
               dataType: "json",
               success: function(res) {
                   if (res.status == 'success') {
                       $('#tableLoad').DataTable().ajax.reload();
                   }
               }
           });
       })
       // unpublish
       $(document).on('click', '.unpublish', function(e) {
           e.preventDefault();
           let id = $(this).data('id');
           let url = "{{ route('superAdmin.category.unpublish', ':id') }}";
           let unUrl = url.replace(':id', id);

           let dataUn = {
               'id': id,
           };

           $.ajax({
               headers: {
                   'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
               },
               type: "GET",
               url: unUrl,
               data: dataUn,
               dataType: "json",
               success: function(res) {
                   if (res.status == 'success') {
                       $('#tableLoad').DataTable().ajax.reload();
                   }
               }
           });
       })
   </script>

   {{-- Datatables --}}
   <script type="text/javascript">
       $(function() {

           $.ajaxSetup({
               headers: {
                   'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
               }
           });

           var table = $('.data-table').DataTable({
               // processing: true,
               // serverSide: true,
               // ajax: {
               //     url: "{{ route('superAdmin.category') }}",
               // },
               // columns: [{
               //         data: 'DT_RowIndex',
               //         name: 'DT_RowIndex'
               //     },
               //     {
               //         data: 'parent',
               //         name: 'parent'
               //     },
               //     {
               //         data: 'name_en',
               //         name: 'name_en'
               //     },
               //     {
               //         data: 'status',
               //         name: 'status'
               //     },
               //     {
               //         data: 'action',
               //         name: 'action',
               //         orderable: false,
               //         searchable: false
               //     },
               // ],
               // columnDefs: [{
               //         orderable: false,
               //         targets: [0, 4]
               //     },
               //     {
               //         className: 'text-center',
               //         targets: [0, 1, 2, 3]
               //     },
               // ],
               // order: [
               //     [0, 'desc']
               // ],
               // dom: 'Bfrtip',

               // language: dt_language, // global variable defined in html      
               // https://jsfiddle.net/cheesyMan/3fy0cxur/48/   
               // https://datatables.net/forums/discussion/60005/conditional-formatting-using-rowcallback    

               columnDefs: [{
                       orderable: true,
                       searchable: true,
                       className: "left",
                       targets: [0, 1, 2, 3, 4, 5]
                   },
                   {
                       data: 'DT_RowIndex',
                       targets: [0],
                   },
                   {
                       data: 'parent',
                       targets: [1],
                   },
                   {
                       data: 'id',
                       targets: [2],
                       render: function(data, type, row, meta) {
                           if (type === 'display') {
                               data = '<a href="http://127.0.0.1:8000/firma/' + encodeURIComponent(
                                   data) + '">' + row.name_{{ $language }} + '</a>';
                           }
                           return data;
                       }
                   },
                   {
                       data: 'category_img',
                       targets: [3],
                   },
                   {
                       data: 'status',
                       targets: [4],
                   },
                   {
                       data: 'action',
                       targets: [5],
                   },
               ],

               rowCallback: function(row, data, index) {
                   $("td:eq(1)", row).css('background-color', '#f7c577')
               },
               order: [
                   [0, 'desc']
               ],
               lengthMenu: [
                   [10, 25, 50, 100, 200],
                   [10, 25, 50, 100, 200]
               ],
               searching: false,
               processing: true,
               serverSide: true,
               stateSave: true,
               autoWidth: false,
               pageLength: 10,
               paging: true,
               info: true,
               buttons: true,
               scrollX: true,
               ordering: false,
               deferRender: true,
               scrollCollapse: true,
               scroller: true,
               responsive: true,

               ajax: {
                   url: "{{ route('superAdmin.category') }}",
                   data: function(d) {
                       d.name_en = $('.searchEmail').val();
                       d.search = $('input[type="search"]').val();

                       d.from_date = $('#start_date').val();
                       d.to_date = $('#end_date').val();

                   }
               },
               dom: 'lBfrtip<"actions">',
               buttons: [{
                       extend: 'copy',
                       text: window.copyButtonTrans,
                       title: 'Datatables example: Customisation of the print view window',
                       exportOptions: {
                           columns: ':visible'
                           // columns: [1, 2, 3] // Column index which needs to export
                       },
                   },
                   {
                       extend: 'csv',
                       text: window.csvButtonTrans,
                       exportOptions: {
                           columns: ':visible'
                           // columns: [1, 2, 3] // Column index which needs to export
                       },

                   },
                   {
                       extend: 'excel',
                       text: window.excelButtonTrans,
                       exportOptions: {
                           columns: ':visible'
                           // columns: [1, 2, 3] // Column index which needs to export
                       },
                   },
                   {
                       extend: 'pdf',
                       text: window.pdfButtonTrans,
                       title: 'Datatables example: Customisation of the print view window',

                       exportOptions: {
                           // columns: ':visible'
                           columns: [1, 2, 3] // Column index which needs to export
                       },

                       // customize: function(doc) {

                       //     $(doc.document.body).find('h1').css('text-align', 'center');
                       //     $(doc.document.body).css('font-size', '9px');
                       //     $(doc.document.body).find('table').addClass('compact').css('font-size',
                       //         'inherit');

                       //     $(doc.document.body).addClass('stylecss');
                       //     $(doc.document.body).css('color', 'red');
                       //     // doc.defaultStyle.fontSize = 19;
                       //     // doc.defaultStyle.fontFamily = 'Arial';
                       // }
                   },
                   {
                       extend: 'print',
                       text: window.printButtonTrans,

                       className: 'btn btn-danger box-shadow--4dp btn-sm-menu',

                       title: 'Datatables example: Customisation of the print view window',
                       messageTop: 'User Report',
                       messageBottom: 'The information in this table is copyright to Sirius Cybernetics Corp.',
                       exportOptions: {
                           // columns: ':visible'
                           columns: [1, 2, 3] // Column index which needs to export
                       },
                       // customize: function(win) {
                       //     $(win.document.body)
                       //         .css('font-size', '10pt')
                       //         .prepend(
                       //             '<div><img src="http://datatables.net/media/images/logo-fade.png" style="position:absolute; top:0; left:0;"  alt="logo"/></div>'
                       //         );

                       //     $(win.document.body).find('table')
                       //         .addClass('compact')
                       //         .css('font-size', 'inherit');
                       // },
                   },
                   {
                       extend: 'colvis',
                       text: window.colvisButtonTrans,
                       exportOptions: {
                           columns: ':visible'
                       }
                   },
               ],

               language: {
                   decimal: "",
                   lengthMenu: "Display _MENU_ records per page",
                   zeroRecords: "Nothing found - sorry",
                   info: "Showing page _PAGE_ of _PAGES_",
                   infoEmpty: "No records available",
                   paginate: {
                       first: "First",
                       last: "Last",
                       next: '&#8594;', // or '→'
                       previous: '&#8592;' // or '←' 
                   },
                   processing: '<span>Processing...</span>',

                   aria: {
                       sortAscending: ": activate to sort column ascending",
                       sortDescending: ": activate to sort column descending"
                   }
               },

           });
           $(".searchEmail").keyup(function() {
               table.draw(true);
           });

           $('.btnchange').change(function() {
               $('#tableLoad').DataTable().draw(true);

               // table.draw(true);
               // $('#tableLoad').DataTable().destroy();

           });
           // $('#btnFiterSubmitSearch').click(function() {
           //     table.draw(true);

           // });
           // getUserButtons = (name, id) => {
           //     let buttons =
           //         `<button>This is button ${name}/${id}</button> <button>This is button ${name}/${id}</button>`;
           //     return buttons;
           // }

           // Add
           $('#createNewCategory').click(function() {
               $('#submit-all').html("Submit");
               $('#id').val('');
               $('#postForm').trigger("reset");
               $('#modelHeading').html("Create New Category");
               $('#ajaxModelexa').modal('show');
               document.getElementById("up-submitbtn").style.display = "none";
               document.getElementById("submit-all").style.display = "block";
           });

           $('#submit-all').click(function(e) {
               e.preventDefault();

               let nameEn = $('.nameEn').val();
               let nameBn = $('.nameBn').val();

               let titleEn = $('.nameEn').val();
               let titleBn = $('.nameBn').val();

               let slugEn = $('.slugEn').val();
               let slugBn = $('.slugBn').val();

               let status = $(".status").is(':checked') ? 1 : 0;
               // alert(status);
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
               console.log(dataall);

               // let status = $('.status:checked').val() ? $('.status:checked').val() : '0';

               $(this).html('Sending...');

               $.ajax({
                   data: dataall,
                   // data: $('#postForm').serialize(),
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

           // Edit / Update
           $('body').on('click', '.editPost', function() {
               $('#modelHeading').html("Edit Category");
               $('#up-submitbtn').html("Update");
               $('#ajaxModelexa').modal('show');
               document.getElementById("submit-all").style.display = "none";
               document.getElementById("up-submitbtn").style.display = "block";

               document.querySelector(".imageOn").style.display = "none";
               document.querySelector(".imageUp").style.display = "block";

               var id = $(this).data('id');

               var url = "{{ route('superAdmin.category.update', ':id') }}";
               var catUrl = url.replace(':id', id);

               let nameEn = $(this).data('name_en');
               let nameBn = $(this).data('name_bn');

               let titleEn = $(this).data('title_en');
               let titleBn = $(this).data('title_bn');

               let slugEn = $(this).data('slug_en');
               let slugBn = $(this).data('slug_bn');

               let status = $(this).data('status');
               let pid = $(this).data('pid');
               let image = $(this).data('category_img');



               $('#id').val(id);
               $('#mySelect_en').val(nameEn);
               $('#mySelect_bn').val(nameBn);
               $('#titleSelect_en').val(nameEn);
               $('#titleSelect_bn').val(nameBn);
               $('#slugValue_en').val(slugEn);
               $('#slugValue_bn').val(slugBn);
               $('#categoryName').val(pid);
               $(".upCategory option:selected").removeAttr("selected")
               $(".upCategory option[value='" + pid + "']").attr('selected', 'selected');
               $('#status').val(status);
               if (status == 1) {
                   $(".status").attr('checked', true);
               } else {
                   $(".status").attr('checked', false);
               }

               // image
               $('#image_name').val(image);
               $('.getUrl').val(url);


               let imageURL = {!! json_encode(url('/')) !!} + "/upload/";
               let emptyimageURL = {!! json_encode(url('/')) !!} + "/img/profile/cemera.jpg";
               if (image) {
                   let dispalyImg = '<div class="post-select-image-container">' +
                       '<a id="btn_delete_post_main_image" onclick="imageRemove()" class="btn btn-danger btn-sm btn-delete-selected-file-image">' +
                       '<img src="' + imageURL + image +
                       '" alt="" class="img-responsive  img-fluid"  id="display_image" >' +
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

               // $.get("{{ route('superAdmin.category.store') }}" + '/' + id + '/edit', function(data) {

               // $('#modelHeading').html("Edit Post");
               // $('#submit-all').val("edit-user");
               // $('#ajaxModelexa').modal('show');

               // });

           });

           $('#up-submitbtn').click(function(e) {
               e.preventDefault();
               $(this).html('Updating...');

               let id = $('.id').val();
               let nameEn = $('.up_name_en').val();
               let nameBn = $('.up_name_bn').val();

               let titleEn = $('.up_name_en').val();
               let titleBn = $('.up_name_bn').val();

               let slugEn = $('.upslug_en').val();
               let slugBn = $('.upslug_bn').val();

               let status = $(".status").is(':checked') ? 1 : 0;
               // let status = $('.status:checked').val() ? $('.status:checked').val() : '0';
               let selectElement = document.querySelector('.categoryName');
               let pCatName = selectElement.options[selectElement.selectedIndex].value ?? '0';
               let imageName = $('#image_name').val();

               // https://www.studentstutorial.com/laravel/laravel-ajax-update


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

               $.ajax({
                   type: "POST",
                   data: updateData,
                   // data: $('#postForm').serialize(),
                   url: "{{ route('superAdmin.category.store') }}",

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
           // Delete
           $('body').on('click', '.deleteCategory', function(e) {
               e.preventDefault();
               var id = $(this).attr("data-id");

               var url = "{{ route('superAdmin.category.deleted', ':id') }}";
               var catUrl = url.replace(':id', id);

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
                       url: catUrl,
                       data: dataDelete,
                       dataType: "json",
                       success: function(res) {
                           $('#postForm').trigger("reset");
                           $('#ajaxModelexa').modal('hide');
                           table.draw();
                       }
                   });
               }
           });
       });
   </script>
   {{-- Image upload --}}
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
               '<img src="' + base_url + img_url + '" alt="" id="display_image" class="img-responsive  img-fluid">' +
               '<i class="fa fa-times"></i> ' +
               '</a>' +
               '</div>';
           var upimage = '<div class="up-post-select-image-container">' +
               '<a id="btn_delete_post_main_image" onclick="imageRemove()" class="btn btn-danger btn-sm btn-delete-selected-file-image">' +
               '<img src="' + base_url + img_url + '" alt="" id="display_image" class="img-responsive  img-fluid">' +
               '<i class="fa fa-times"></i> ' +
               '</a>' +
               '</div>';
           document.getElementById("post_select_image_container").innerHTML = image;
           document.getElementById("up_post_select_image_container").innerHTML = upimage;
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
