@extends('layouts.deshboard')

@section('content')
    <div class="col-md-12 col-sm-12  ">
        <div class="x_panel">
            <div class="x_title">
                <h2>video List</h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="x_content">
                <div class="clearfix"></div>
                <a class="btn btn-primary mb-2 ml-2 pull-right" href="{{ route('superAdmin.video.create') }}">Add Video</a>
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Video</th>
                            <th scope="col">Video Caption</th>
                            <th scope="col">status</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $sl = 1;
                        @endphp
                        @foreach ($videos as $value)
                            {{-- {{ app()->getLocale() }} --}}
                            <tr>
                                <th scope="row">{{ $sl++ }}</th>
                                <td style="width: 30%">
                                    @php
                                        $videoname = $value->video;
                                        $extention = pathinfo($videoname, PATHINFO_EXTENSION);
                                    @endphp
                                    @if ($extention == 'mp4' && !empty($value->video))
                                        <video width="100%" height="160" controls>
                                            <source src="{{ asset('files/' . $value->video) }}" type="video/mp4">
                                            {{-- <source src="movie.ogg" type="video/ogg"> --}}
                                        </video>
                                    @else
                                        <input type="hidden" name="edityoutubevideo" value="{{ $value->video }}"
                                            id="chooseFile" />
                                        @if (!empty($value->video))
                                            <iframe width="100%" height="auto"
                                                src="//www.youtube.com/embed/{{ $value->video }}" frameborder="0"
                                                allowfullscreen></iframe>
                                        @else
                                        @endif
                                    @endif


                                </td>
                                <td>{{ $value->videocaption }}</td>
                                <td>
                                    @if ($value->status == 1)
                                        <a href="{{ route('superAdmin.video.publish', $value->id) }}"
                                            class="btn btn-info btn-sm"><i class="fa fa-arrow-circle-up"
                                                aria-hidden="true"></i> Active</a>
                                    @else
                                        <a href="{{ route('superAdmin.video.unpublish', $value->id) }}"
                                            class="btn btn-info btn-warning btn-sm">
                                            <i class="fa fa-arrow-circle-down " aria-hidden="true"></i> Inactive</a>
                                    @endif
                                </td>

                                <td> <a href="{{ route('superAdmin.video.edit', $value->id) }}"
                                        class="btn btn-sm btn-primary"><i class="fa fa-pencil-square"
                                            aria-hidden="true"></i></a>
                                    <a href="{{ route('superAdmin.video.deleted', $value->id) }}"
                                        class="btn btn-sm btn-info  btn-danger"><i class="fa fa-trash"
                                            aria-hidden="true"></i></a>
                                    <br>

                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
                {!! $videos->links() !!}
            </div>
        </div>
    </div>
@endsection
