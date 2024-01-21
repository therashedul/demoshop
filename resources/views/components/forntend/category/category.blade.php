@php
    $posts = [];
@endphp
@foreach ($postmeta as $meta)
    @php
        $posts[] = DB::table('posts')
            ->where('id', $meta->post_id)
            ->orderBy('id', 'DESC')
            ->first();
    @endphp
@endforeach
@php
    $languagechange = DB::table('lang_changes')->first();
@endphp
<!-- ======= Breadcrumbs ======= -->

<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h2>Blog</h2>
            @php
                $link = '';
            @endphp
            {{-- <ol>
                @for ($i = 2; $i <= count(Request::segments()); $i++)
                    @if (($i < count(Request::segments())) & ($i > 0))
                        @php $link .= ' / ' . Request::segment($i); @endphp
                        <li>
                            <a href="{{ $link }}"
                                style="font-weight: bold;">{{ ucwords(str_replace('-', ' ', Request::segment($i))) }}</a>
                            >
                        </li>
                    @else
                        {{ ucwords(str_replace('-', ' ', Request::segment($i))) }}
                    @endif
                @endfor

            </ol>
           // Help LInk: https://stackoverflow.com/questions/37966729/laravel-dynamic-breadcrumbs-with-links --}}
        </div>
    </div>
</section><!-- End Breadcrumbs -->
<!-- ======= Blog Section ======= -->
<section id="blog" class="blog">
    <div class="container" data-aos="fade-up">

        <div class="row">

            <div class="col-lg-8 entries">
                @foreach ($posts as $post)
                    @if (!empty($post->id))
                        <article class="entry" data-aos="fade-up">
                            <div class="entry-img">
                                <a
                                    href="{{ route('post.single', ['slug' => $post->{'slug_' . app()->getLocale()}, 'id' => $post->id]) }}">
                                    @if (!empty($post->image))
                                        <img src="{{ asset('images/' . $post->image) }}" alt=""
                                            class="img-fluid" style="width: 100%;">
                                    @else
                                        No Image
                                    @endif
                                </a>
                            </div>
                            <h2 class="entry-title">
                                <a
                                    href="{{ route('post.single', ['slug' => $post->{'slug_' . app()->getLocale()}, 'id' => $post->id]) }}">{{ $post->{'title_' . app()->getLocale()} }}</a>
                            </h2>

                            <div class="entry-meta">
                                <ul>
                                    <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <time
                                            datetime="2020-01-01">{{ date('d-M-y', strtotime($post->created_at)) }}</time>
                                    </li>
                                </ul>
                            </div>
                            <div class="entry-content">
                                <p>
                                    {!! strlen($post->{'content_' . app()->getLocale()}) >= 300
                                        ? substr_replace($post->{'content_' . app()->getLocale()}, '....', 130)
                                        : $post->{'content_' . app()->getLocale()} !!}
                                </p>
                                <div class="read-more">
                                    <a
                                        href="{{ route('post.single', ['slug' => $post->{'slug_' . app()->getLocale()}, 'id' => $post->id]) }}">Read
                                        More</a>
                                </div>
                            </div>


                        </article><!-- End blog entry -->
                    @endif
                @endforeach
                <div class="blog-pagination">
                    {{ $postmeta->links() }} {{-- check for page --}}
                </div>
            </div><!-- End blog entries list -->

            <div class="col-lg-4">
                <div class="sidebar">
                    <h3 class="sidebar-title">Recent Posts</h3>
                    <div class="sidebar-item recent-posts">
                        @php
                            $latestPosts = DB::table('posts')
                                ->orderBy('id', 'DESC')
                                ->offset(0)
                                ->limit(5)
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
            </div><!-- End blog sidebar -->
        </div>
    </div>
</section><!-- End Blog Section -->
