@extends('layouts.deshboard')
@section('content')
<style>
#tableLoad td.centered {
    text-align: center;
}
</style>
<div class="container">
    <a class="btn btn-info" href="javascript:void(0)" id="createNewCategory"> Add New Post</a>

    <table id="tableLoad" class="table data-table table-bordered table-striped">
        <thead>
            <tr>
                <th>No</th>
                <th>Name</th>
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
        <form style="width: 100%;" id="postForm" name="postForm" class="form-horizontal">
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

                        const APP_URL = {
                            !!json_encode(url('/')) !!
                        }
                        const spt = strng.split(" ");
                        const imp = spt.join('_');
                        const link = document.querySelector(".slugValue_en").value = imp;
                        document.querySelector(".titleSelect_en").value = imp;
                    }

                    function myFunction_bn() {
                        const strng = document.querySelector(".mySelect_bn").value;
                        const APP_URL = {
                            !!json_encode(url('/')) !!
                        }
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
                            <input type="checkbox" class="js-switch mycheckbox status" id="status" name="status">
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

        dom: 'Bfrtip',
        buttons: ['excel'],
        ajax: "{{ route('superAdmin.category') }}",
        columns: [{
                data: "DT_RowIndex",
                class: 'centered',
                title: "ID"
            },
            {
                data: "parent_id",
                render: function(data, type, row, meta) {
                    var cat = '';
                    var pcat = '';
                    let id = row.id;
                    let pid = row.parent_id;
                    if ({
                            data: "parent_id"
                        } === '0') {
                        return row.name_ {
                            {
                                $language
                            }
                        };

                    }

                    // return row.name_{{ $language }};
                    // if (id == 0) {
                    // }

                    // return id + ',' + pid;

                    // if (row.parent_id != 0) {
                    //     cat += pcat + '(' + row.name_{{ $language }} + ')';
                    // } else {
                    //     pcat += row.name_{{ $language }};
                    // }
                    // return ([pcat, cat]);
                },

            },

            // {
            //     render: function(data, type, row, meta) {
            //         return '<a name="deleteAnchor" id="deleteAnchor" class="ajaxCallDelete" value="' +
            //             row.id + '" href="#">Delete</a>';
            //         // var btn = '';
            //         // if (row.status == 1) {
            //         //     btn += '<a class="btn btn-success">' + row.id +
            //         //         '</a>';
            //         // } else {
            //         //     btn += '<a class="btn btn-info">' + row.id +
            //         //         '</a>';
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
            //  https://makitweb.com/add-edit-delete-button-in-yajra-datatables-laravel/  
            {
                data: 'status',
                name: 'status',
                orderable: false,
                searchable: false
            },
            {
                data: 'action',
                name: 'action',
                orderable: false,
                searchable: false
            },
        ],
        columnDefs: [{
                targets: 0,
                data: '0'
            },
            {
                targets: 1,
                render: function(data) {


                    return '<a href="https://stackoverflow.com" style="background: red; color: white;">' +
                        data + '</a>';;
                }
            },
            {
                targets: 2,
                data: '2'
            }
        ]

    });

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
        let image = $(this).data('image');

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
        $('#image_name').val(image);

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
@endsection
{{-- <x-backend.superAdmin.category.catindex :categories="$categories" /> --}}