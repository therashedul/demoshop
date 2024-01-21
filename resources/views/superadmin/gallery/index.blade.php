@extends('layouts.deshboard')

@section('content')
    <div class="col-md-12 col-sm-12  ">
        <div class="x_panel">
            <div class="x_title">
                <h2>gallery List</h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="x_content">
                <div class="clearfix"></div>
                <a class="btn btn-primary mb-2 ml-2 pull-right" href="{{ route('superAdmin.gallery.create') }}">Add
                    gallery</a>
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">gallery</th>
                            <th scope="col">gallery Caption</th>
                            <th scope="col">Pupup</th>
                            <th scope="col">Partner</th>
                            <th scope="col">status</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $sl = 1;
                        @endphp
                        @foreach ($gallerys as $value)
                            {{-- {{ app()->getLocale() }} --}}
                            <tr>
                                <th scope="row">{{ $sl++ }}</th>
                                <td class="align-middle" style="width: 30%">
                                    @if (!empty($value->imagename))
                                        <img src="{{ asset('thumbnail/' . $value->imagename) }}" width="50px"
                                            height="40px" alt="" title="">
                                    @else
                                        <img src="{{ asset('img/profile/blank-img.jpg') }}" width="50px" height="40px"
                                            alt="" title="">
                                    @endif
                                </td>
                                <td>{{ $value->imagecaption }}</td>
                                <td>
                                    @if ($value->popup == 1)
                                        <a href="{{ route('superAdmin.gallery.popup', $value->id) }}"
                                            class="btn btn-info btn-sm"><i class="fa fa-arrow-circle-up"
                                                aria-hidden="true"></i> Active</a>
                                    @else
                                        <a href="{{ route('superAdmin.gallery.unpopup', $value->id) }}"
                                            class="btn btn-info btn-warning btn-sm">
                                            <i class="fa fa-arrow-circle-down " aria-hidden="true"></i> Inactive</a>
                                    @endif
                                </td>
                                <td>
                                    @if ($value->partnar == 1)
                                        <a href="{{ route('superAdmin.gallery.partnar', $value->id) }}"
                                            class="btn btn-info btn-sm"><i class="fa fa-arrow-circle-up"
                                                aria-hidden="true"></i> Active</a>
                                    @else
                                        <a href="{{ route('superAdmin.gallery.unpartnar', $value->id) }}"
                                            class="btn btn-info btn-warning btn-sm">
                                            <i class="fa fa-arrow-circle-down " aria-hidden="true"></i> Inactive</a>
                                    @endif
                                </td>
                                <td>
                                    @if ($value->status == 1)
                                        <a href="{{ route('superAdmin.gallery.publish', $value->id) }}"
                                            class="btn btn-info btn-sm"><i class="fa fa-arrow-circle-up"
                                                aria-hidden="true"></i> Active</a>
                                    @else
                                        <a href="{{ route('superAdmin.gallery.unpublish', $value->id) }}"
                                            class="btn btn-info btn-warning btn-sm">
                                            <i class="fa fa-arrow-circle-down " aria-hidden="true"></i> Inactive</a>
                                    @endif
                                </td>

                                <td> <a href="{{ route('superAdmin.gallery.edit', $value->id) }}"
                                        class="btn btn-sm btn-primary"><i class="fa fa-pencil-square"
                                            aria-hidden="true"></i></a>
                                    <a href="{{ route('superAdmin.gallery.deleted', $value->id) }}"
                                        class="btn btn-sm btn-info  btn-danger"><i class="fa fa-trash"
                                            aria-hidden="true"></i></a>
                                    <br>

                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                {!! $gallerys->links() !!}
            </div>
        </div>
    </div>
@endsection
