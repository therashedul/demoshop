<!-- ======= Contact Section ======= -->
@php
    $page = DB::table('pages')
        ->where('title_en', '=', 'Contact Us')
        ->first();
    // print_r($pages);
    // die();
@endphp
<div class="col-lg-12 text-center my-2" style="margin-top: 7% !important;">
    <h1 class="page-title">{{ $page->{'name_' . app()->getLocale()} }}</h1>
</div>
<div class="map-section mt-5">
    {!! $page->{'content_' . app()->getLocale()} !!}
    {{-- <iframe style="border:0; width: 100%; height: 350px;"
        src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621"
        frameborder="0" allowfullscreen></iframe> --}}
</div>

<section id="contact" class="contact">
    <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
            <div class="col-lg-10">
                <div class="info-wrap">
                    <div class="row">
                        <div class="col-lg-4 info">
                            <i class="bi bi-geo-alt"></i>
                            <h4>Location:</h4>
                            <p>Mirpur-12<br>Dhaka-1206</p>
                        </div>

                        <div class="col-lg-4 info mt-4 mt-lg-0">
                            <i class="bi bi-envelope"></i>
                            <h4>Email:</h4>
                            <p>info@example.com<br>contact@example.com</p>
                        </div>

                        <div class="col-lg-4 info mt-4 mt-lg-0">
                            <i class="bi bi-phone"></i>
                            <h4>Call:</h4>
                            <p>8801818123456<br>8801709123456</p>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <div class="row mt-5 justify-content-center" data-aos="fade-up">
            <div class="col-lg-10">
                @if (Session::has('success'))
                    <div class="alert alert-success">
                        {{ Session::get('success') }}
                        @php
                            Session::forget('success');
                        @endphp
                    </div>
                @endif
                {{-- <form method="POST" action="{{ route('contact-form.store') }}" role="form" class="php-email-form">
                    {{ csrf_field() }}
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <input type="text" name="name" class="form-control" placeholder="Your Name"
                                value="{{ old('name') }}" id="name" required>
                            @if ($errors->has('name'))
                                <span class="text-danger">{{ $errors->first('name') }}</span>
                            @endif

                        </div>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                            <input type="text" name="email" class="form-control" placeholder="Email"
                                value="{{ old('email') }}" required>
                            @if ($errors->has('email'))
                                <span class="text-danger">{{ $errors->first('email') }}</span>
                            @endif
                        </div>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                            <input type="text" name="phone" class="form-control" placeholder="Phone"
                                value="{{ old('phone') }}" required>
                            @if ($errors->has('phone'))
                                <span class="text-danger">{{ $errors->first('phone') }}</span>
                            @endif
                        </div>
                        <div class="col-md-6 form-group mt-3 mt-md-0">
                            <input type="text" name="subject" class="form-control" placeholder="Subject"
                                value="{{ old('subject') }}" required>
                            @if ($errors->has('subject'))
                                <span class="text-danger">{{ $errors->first('subject') }}</span>
                            @endif
                        </div>
                    </div>
                    <div class="form-group mt-3">
                        <textarea name="message" rows="3" class="form-control" placeholder="Message" required>{{ old('message') }}</textarea>
                        @if ($errors->has('message'))
                            <span class="text-danger">{{ $errors->first('message') }}</span>
                        @endif
                    </div>
                    <div class="my-3">
                        <div class="loading">Loading</div>
                        <div class="error-message"></div>
                        <div class="sent-message">Your message has been sent. Thank you!</div>
                    </div>
                    <div class="text-center"><button type="submit">Send Message</button></div>
                </form> --}}
            </div>

        </div>

    </div>
</section><!-- End Contact Section -->
