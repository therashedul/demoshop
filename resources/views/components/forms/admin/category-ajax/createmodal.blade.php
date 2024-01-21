<div class="modal fade" id="catAddmodel" tabindex="-1" aria-labelledby="catAddModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="catAddModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_content">
                            <form method="POST" id="categorystore" action="" enctype="multipart/form-data">
                                {{-- <form method="POST" action="{{ route('admin.category.store') }}"> --}}
                                @csrf
                                <x-forms.admin.category.catcreate :categories="$categories" />
                                <div class="item form-group">
                                    <div class="col-md-6 col-sm-6 offset-md-5 mt-4">
                                        <button type="button" class="btn btn-secondary btn-sm"
                                            data-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary btn-sm add_category"
                                            id="submit-all">Submit</button>
                                    </div>
                                </div>
                                @include('components.forms.admin.category.addjs')
                            </form>
                        </div>
                    </div>
                </div>
                <x-forms.admin.category.catcreatemodal />
            </div>
            {{-- <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div> --}}
        </div>
    </div>
</div>
{{-- @include('components.forms.admin.category.catcreatemodal') --}}
