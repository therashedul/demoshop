        <section>
            <div class="container">
                @php
                    $videos = DB::table('videos')
                        ->where('category_id', '5')
                        ->orderBy('id', 'DESC')
                        ->paginate(20);
                    // print_r($videos[0]);
                @endphp
                <!-- videos -->
                <div class="photo-gallery">
                    <div class="container">
                        <div class="intro">
                            <h2 class="text-center"
                                style="    border-bottom: #ccc solid 1px;
                                            padding-bottom: 10px; margin-bottom: 20px">
                                Videos</h2>
                        </div>

                        <div class="row photos">
                            @foreach ($videos as $videoname)
                                <div class="col-sm-6 col-md-4 col-lg-3 item mb-3">
                                    @php
                                        $video = $videoname->video;
                                        $videoId = $videoname->id;
                                        $extention = pathinfo($video, PATHINFO_EXTENSION);
                                    @endphp

                                    @if ($extention == 'mp4' && !empty($video))
                                        <a href="{{ asset('files/' . $video) }}" data-lightbox="photos"
                                            data-bs-toggle="modal" data-bs-target="#exampleModal_{{ $videoId }}">
                                            <video width="100%" height="auto" controls>
                                                <source src="{{ asset('files/' . $videoname->video) }}"
                                                    type="video/mp4">
                                            </video>
                                        </a>
                                    @else
                                        @if (!empty($videoname->video && $extention == ''))
                                            {{-- help link: https://www.codexworld.com/youtube-video-thumbnail-image-url-php/ --}}
                                            <a href="#" data-bs-toggle="modal"
                                                data-bs-target="#exampleModal_{{ $videoId }}">
                                                @php
                                                    $embedCode = '<iframe width="100%" height="auto" src="https://www.youtube.com/embed/' . $video . '" frameborder="0" allowfullscreen></iframe>';
                                                    
                                                    preg_match('/src="([^"]+)"/', $embedCode, $match);
                                                    
                                                    // Extract video url from embed code
                                                    $videoURL = $match[1];
                                                    $urlArr = explode('/', $videoURL);
                                                    $urlArrNum = count($urlArr);
                                                    
                                                    // YouTube video ID
                                                    $youtubeVideoId = $urlArr[$urlArrNum - 1];
                                                    
                                                    // Generate youtube thumbnail url
                                                    $thumbURL = 'http://img.youtube.com/vi/' . $youtubeVideoId . '/0.jpg';
                                                    
                                                @endphp
                                                <div class="video-block">
                                                    <div class="video-video">
                                                        @php
                                                            // Display thumbnail image
                                                            echo '<img src="' . $thumbURL . '" width="100%" height="auto"/>';
                                                        @endphp
                                                    </div>
                                                </div>
                                            </a>
                                        @endif
                                    @endif
                                </div>
                                <!-- Modal -->
                                <div class="modal fade" id="exampleModal_{{ $videoId }}" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">
                                                    {{ $videoname->videocaption }}
                                                </h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                    aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                @if ($extention == 'mp4' && !empty($video))
                                                    <video width="100%" height="auto" controls>
                                                        <source src="{{ asset('files/' . $videoname->video) }}"
                                                            type="video/mp4">
                                                        {{-- <source src="movie.ogg" type="video/ogg"> --}}
                                                    </video>
                                                @else
                                                    @if (!empty($videoname->video))
                                                        <div class="video-block">
                                                            <div class="video-video">
                                                                <iframe width="100%"
                                                                    height="380vh"src="//www.youtube.com/embed/{{ $videoname->video }}"
                                                                    frameborder="0"
                                                                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                                    allowfullscreen></iframe>
                                                            </div>
                                                        </div>
                                                    @endif
                                                @endif
                                            </div>
                                            {{-- <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-bs-dismiss="modal">Close</button>
                                            </div> --}}
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                        <div class="mt-3">
                            {{ $videos->links() }}
                        </div>
                    </div>
                </div>
                <script>
                    $data = file_get_contents(
                        "https://www.googleapis.com/youtube/v3/videos?key=YOUR_API_KEY&part=snippet&id=T0Jqdjbed40");
                    $json = json_decode($data);
                    var_dump($json);
                </script>

                <script>
                    var tag = document.createElement('script');

                    tag.src = "https://www.youtube.com/iframe_api";
                    var firstScriptTag = document.getElementsByTagName('script')[0];
                    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                    // 3. This function creates an <iframe> (and YouTube player)
                    //    after the API code downloads.
                    var player;

                    function onYouTubeIframeAPIReady() {
                        player = new YT.Player('player', {
                            height: '315',
                            width: '560',
                            videoId: 'l-gQLqv9f4o',
                            events: {
                                'onStateChange': onPlayerStateChange
                            }
                        });
                    }


                    function onPlayerStateChange(event) {
                        if (event.data == YT.PlayerState.PLAYING) {
                            //player is playing
                        } else {
                            //player is paused
                        }
                    }

                    function stopVideo() {
                        player.stopVideo();
                    }

                    function playVideo() {
                        player.playVideo();
                    }

                    function pauseVideo() {
                        player.pauseVideo();
                    }


                    $(document).on('opened.fndtn.reveal', '[data-reveal]', function() {
                        playVideo();
                    });

                    $(document).on('closed.fndtn.reveal', '[data-reveal]', function() {
                        pauseVideo();
                    });
                </script>

        </section>
