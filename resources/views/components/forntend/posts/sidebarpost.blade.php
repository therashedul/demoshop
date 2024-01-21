       <style>
           #details_content .dtl_section {
               position: relative;
               margin-top: 10px;
               font-size: 16px;
               overflow: hidden;
           }

           .share_section .socialShare>a {
               display: block;
               float: left;
               margin: 2px;
               width: 36px;
               height: 36px;
               text-align: center;
               background: #666;
               color: #fff;
               border-radius: 50%;
               -moz-border-radius: 50%;
               -webkit-border-radius: 50%;
           }

           .share_section .socialShare>a>i {
               position: relative;
               top: 7px;
           }
       </style>




       <section id="blog" class="blog">
           <div class="container" data-aos="fade-up">
               <div class="row">
                   <div class="col-md-8 entries">
                       <div id="details_content" class="bottom_border infinity-data">
                           <!-- ======= Single Post Content ======= -->
                           <article class="entry entry-single mb-5">
                               <h1 class="entry-title">
                                   {{ $post->{'title_' . app()->getLocale()} }} </h1>
                               <div class="entry-img">
                                   @if (!empty($post->image))
                                       <figure class="my-4">
                                           <img src="{{ asset('singleimg/' . $post->image) }}"
                                               alt="{{ $post->{'title_' . app()->getLocale()} }}"
                                               title="{{ $post->{'title_' . app()->getLocale()} }}" class="img-fluid">
                                           {{-- <figcaption>Lorem ipsum dolor sit amet consectetur adipisicing elit. Explicabo, odit?
                                </figcaption> --}}
                                       </figure>
                                   @else
                                   @endif
                               </div>
                               <div class="clearfix mt-2">
                                   <div class="share_section hidden-print">
                                       <div class="socialShare">
                                           <a class="xoom-out"><i class="fa fa-minus fa-md"></i></a> &nbsp
                                           <a class="xoom-in"><i class="fa fa-plus fa-md"></i></a>
                                           {{-- <a href="{{ route('post.single', ['slug' => $post->{'slug_' . app()->getLocale()}, 'id' => $post->id]) }}/print"
                                          title="Print news" target="_blank" class="print-btn"><i
                                              class="fa fa-print fa-md"></i></a> --}}
                                       </div>
                                   </div>
                               </div>
                               <script type="text/javascript">
                                   jQuery(document).ready(function($) {
                                       var xoom_co = 0,
                                           news_hl1 = 20,
                                           news_hl2 = 34,
                                           news_hl3 = 18,
                                           common = 16;

                                       $('.xoom-in,.xoom-out').css({
                                           'cursor': 'pointer'
                                       });

                                       $('.xoom-in').on('click', function() {

                                           if (xoom_co <= 10) {

                                               xoom_co = xoom_co + 1;
                                               news_hl1 = news_hl1 + 1;
                                               news_hl2 = news_hl2 + 1;
                                               news_hl3 = news_hl3 + 1;
                                               common = common + 1;



                                               $('#details_content .headline_section > h3').css({

                                                   'font-size': parseInt(news_hl1) + 'px',

                                                   'line-height': parseInt(news_hl1 + 4) + 'px'

                                               });

                                               $('#details_content .headline_section > h1').css({

                                                   'font-size': parseInt(news_hl2) + 'px',

                                                   'line-height': parseInt(news_hl2 + 4) + 'px'

                                               });

                                               $('#details_content .headline_section > h4').css({

                                                   'font-size': parseInt(news_hl3) + 'px',

                                                   'line-height': parseInt(news_hl3 + 4) + 'px'

                                               });

                                               $('#details_content .news_date_time > p,#details_content .dtl_section').css({

                                                   'font-size': parseInt(common) + 'px',

                                                   'line-height': parseInt(common + 18) + 'px'

                                               });

                                           }

                                       });

                                       $('.xoom-out').on('click', function() {

                                           if (xoom_co > -5) {

                                               xoom_co = xoom_co - 1;
                                               news_hl1 = news_hl1 - 1;
                                               news_hl2 = news_hl2 - 1;
                                               news_hl3 = news_hl3 - 1;
                                               common = common - 1;



                                               $('#details_content .headline_section > h3').css({

                                                   'font-size': parseInt(news_hl1) + 'px',

                                                   'line-height': parseInt(news_hl1 + 4) + 'px'

                                               });

                                               $('#details_content .headline_section > h1').css({

                                                   'font-size': parseInt(news_hl2) + 'px',

                                                   'line-height': parseInt(news_hl2 + 4) + 'px'

                                               });

                                               $('#details_content .headline_section > h4').css({

                                                   'font-size': parseInt(news_hl3) + 'px',

                                                   'line-height': parseInt(news_hl3 + 4) + 'px'

                                               });

                                               $('#details_content .news_date_time > p,#details_content .dtl_section').css({

                                                   'font-size': parseInt(common) + 'px',

                                                   'line-height': parseInt(common + 18) + 'px'

                                               });

                                           }

                                       });
                                   });
                               </script>

                               <div class="dtl_section entry-content">
                                   @php
                                       $frstl = mb_substr($post->{'content_' . app()->getLocale()}, 3, 1, 'UTF-8');
                                   @endphp
                                   @php
                                       $fullcont = substr($post->{'content_' . app()->getLocale()}, 0); //4
                                   @endphp
                                   <p>
                                       {{-- <span class="firstcharacter">{{ $frstl }}</span> --}}
                                       {!! $fullcont !!}
                                   </p>

                                   @if (!empty($post->file))
                                       <p><a href="{{ asset('files/' . $post->file) }}" class="btn btn-info"> <i
                                                   class="fas fa-cloud-download-alt"></i>
                                               @if (!empty($languagechange))
                                                   {{ $languagechange->{'download_' . app()->getLocale()} }} :
                                               @else
                                                   Downlaod
                                               @endif
                                           </a>
                                       </p>
                                   @else
                                   @endif
                               </div>

                               @php
                                   $video = $post->video;
                                   $extention = pathinfo($video, PATHINFO_EXTENSION);
                                   
                               @endphp
                               @if ($extention == 'mp4' && !empty($post->video))
                                   <video width="320" height="240" controls>
                                       <source src="{{ asset('files/' . $post->video) }}" type="video/mp4">
                                       {{-- <source src="movie.ogg" type="video/ogg"> --}}
                                   </video>
                               @else
                                   @if (!empty($post->video))
                                       <div class="video-block">
                                           <div class="video-post">
                                               <iframe width="50%"
                                                   height="auto"src="//www.youtube.com/embed/{{ $post->video }}"
                                                   frameborder="0"
                                                   allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                   allowfullscreen></iframe>
                                           </div>
                                       </div>
                                   @endif
                               @endif
                           </article><!-- End Single Post Content -->
                           {{-- {!! Share::page(url ('post.single', ['slug' => $post->{'slug_' . app()->getLocale()}, 'id' => $post->id]))->facebook()->twitter()->whatsapp() !!} --}}
                           {!! $sharebuttons !!}
                           @if (Auth::check())
                               <a class="btn btn-outline-primary"
                                   href="{{ route('superAdmin.post.edit', $post->id) }}">Edit
                                   Post</a>
                           @else
                           @endif
                       </div>

                   </div>

                   <div class="col-md-4">
                       <div class="sidebar">
                           <h3 class="sidebar-title">Recent Posts</h3>
                           <div class="sidebar-item recent-posts">
                               @php
                                   $latestPosts = DB::table('posts')
                                       ->orderBy('id', 'DESC')
                                       ->offset(0)
                                       ->limit(15)
                                       ->get();
                               @endphp
                               @foreach ($latestPosts as $latestPost)
                                   @php
                                       $latestMeta = DB::table('postmetas')
                                           ->where('post_id', $latestPost->id)
                                           ->first();
                                   @endphp
                                   @if (!empty($latestMeta))
                                       @php
                                           $latestCategoryName = DB::table('categories')
                                               ->where('id', $latestMeta->cat_id)
                                               ->orWhere('id', '!=', '')
                                               ->first();
                                       @endphp
                                       <div class="post-item clearfix">
                                           <h4>
                                               <a
                                                   href="{{ route('post.single', ['slug' => $latestPost->{'slug_' . app()->getLocale()}, 'id' => $latestPost->id]) }}">{{ $latestPost->{'title_' . app()->getLocale()} }}</a>
                                           </h4>
                                       </div>
                                   @else
                                       <p>please, post add in categories </p>
                                   @endif
                               @endforeach
                           </div><!-- End sidebar recent posts-->
                           <h3 class="sidebar-title mt-4">Tags</h3>
                           @php
                               $tages = DB::table('posts')
                                   ->where('tag', '!=', '')
                                   ->get();
                           @endphp
                           <div class="sidebar-item tags">
                               <ul>
                                   @foreach ($tages as $tage)
                                       @php
                                           $pieces = explode(',', $tage->tag);
                                       @endphp
                                       @foreach ($pieces as $tag)
                                           <li>
                                               <a
                                                   href="{{ route('post.single', ['slug' => $tage->{'slug_' . app()->getLocale()}, 'id' => $tage->id]) }}">{{ $tag }}</a>
                                           </li>
                                       @endforeach
                                   @endforeach
                               </ul>
                           </div><!-- End sidebar tags-->
                       </div><!-- End sidebar -->

                   </div>
               </div>
           </div>
       </section>
