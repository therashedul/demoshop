    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
        integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.8.2/css/lightbox.min.css">
    <section>
        <div class="container" data-aos="fade-up">
            @php
                $gallerys = DB::table('image_galleries')
                    ->where('category_id', '4')
                    ->orderBy('id', 'DESC')
                    ->paginate(20);
                // print_r($gallerys);
            @endphp
            <!-- Gallery -->
            <div class="photo-gallery">
                <div class="container">
                    <div class="intro">
                        <h2 class="text-center"
                            style="border-bottom: #ccc solid 1px;
                                            padding-bottom: 10px; margin-bottom: 20px">
                            Image Gallery</h2>
                    </div>
                    <div class="row photos">
                        @foreach ($gallerys as $gallery)
                            <div class="col-sm-6 col-md-4 col-lg-3 item">
                                @if (!empty($gallery->imagename))
                                    <div data-toggle="modal" data-target="#myModal">
                                        <a href="{{ asset('singleimg/' . $gallery->imagename) }}"
                                            data-lightbox="photos">
                                            <img src="{{ asset('singleimg/' . $gallery->imagename) }}"
                                                data-target="#myCarousel" data-slide-to="0"
                                                alt="{{ $gallery->imagename }}" title="{{ $gallery->imagename }}"
                                                class="img-fluid">
                                            {{-- <img class="img-fluid" src="assets/img/desk.jpg"> --}}
                                        </a>
                                    </div>
                                @else
                                @endif
                            </div>
                        @endforeach
                    </div>
                    <div class="mt-3">
                        {{ $gallerys->links() }}
                    </div>
                </div>
            </div>
        </div>

        <!-- Javascript -->
        <script src="{{ asset('blogassets/js/jquery-3.5.1.min.js') }}"></script>
        <script src="{{ asset('blogassets/js/jquery-migrate-3.3.0.min.js') }}"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.8.2/js/lightbox.min.js"></script>
    </section>
