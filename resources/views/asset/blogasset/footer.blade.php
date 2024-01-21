<footer id="footer">

    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-3 col-md-6 footer-contact">
                    <h3>Address</h3>
                    <p>
                        123 Pollobi Mirpur-12 <br>
                        Dhaka-1216 <br>
                        Bangladesh <br><br>
                        <strong>Phone:</strong> +8801818123456<br>
                        <strong>Email:</strong> info@example.com<br>
                    </p>
                </div>
                <div class="col-lg-2 col-md-6 footer-links">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                    </ul>
                </div>
                <div class="col-lg-3 col-md-6 footer-links">
                    <h4>Our Services</h4>
                    @php
                        $menu = DB::table('menus')
                            ->get()
                            ->toArray();
                    @endphp
                    @if (isset($menu[1]) ? $menu[1]->location == 2 : '')
                        @include('menu.footer')
                    @else
                        @if (Route::has('login'))
                            <a href="{{ route('superAdmin.menus') }}"
                                style="text-align: center;
                        display: block;
                        font-size: 22px;
                        font-weight: bold;
                        text-transform: uppercase;
                        text-decoration: underline;
                        color: red;">
                                Add Footer Menu</a>
                        @endif
                    @endif

                </div>

                <div class="col-lg-4 col-md-6 footer-newsletter">
                    <h4>Celender</h4>
                    <div class="col-lg-4">
                        <div id="date_container" style="margin: 10px 0 15px 0; height: 255px; position: relative">
                        </div>
                        <div class="well">
                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="hidden" name="archive-date" id="datepicker-always"
                                        class="form-control celecderDispaly" style="width: 100%;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container d-md-flex py-4">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    <div class="copyright">
                        © Copyright <strong><span>webexpert</span></strong>. All Rights Reserved
                    </div>
                    @php
                        $startdate = date('Y-m-d');
                        $enddate = date('Y-m-d h:i:s');
                        $visitor = DB::table('hitlogs')
                            ->selectRaw('count(*) as total_visitor')
                            ->whereDate('created_at', '>=', $startdate)
                            ->whereDate('created_at', '<=', $enddate)
                            ->first();
                        
                    @endphp
                    Today visitor = {{ $visitor->total_visitor }}
                    <div class="credits">
                        Developed by <a href="https://webexpertaz.com/">webexpert</a>
                    </div>
                </div>
                <div class="col-md-6">

                    <div class="social-links mb-3 mb-lg-0 text-center text-md-end">
                        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="google-plus"><i class="bi bi-skype"></i></a>
                        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>
<!-- Vendor JS Files -->
<script src="{{ asset('blogassets/vendor/aos/aos.js') }} "></script>
<script src="{{ asset('blogassets/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('blogassets/vendor/glightbox/js/glightbox.min.js') }}"></script>
<script src="{{ asset('blogassets/vendor/isotope-layout/isotope.pkgd.min.js') }}"></script>
<script src="{{ asset('blogassets/vendor/swiper/swiper-bundle.min.js') }}"></script>
<script src="{{ asset('blogassets/vendor/waypoints/noframework.waypoints.js') }}"></script>
<script src="{{ asset('blogassets/vendor/php-email-form/validate.js') }}"></script>
<!-- Template Main JS File -->
<script src="{{ asset('blogassets/js/main.js') }}"></script>
{{-- Lazy loding... --}}
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- Date picker -->
<script src="https://cdn.jsdelivr.net/npm/zebra_pin@2.0.0/dist/zebra_pin.min.js"></script>
<script src="{{ asset('blogassets/js/zebra_datepicker.min.js') }} "></script>
<script src="{{ asset('blogassets/js/examples.js') }} "></script>
{{-- for Celender --}}
<script>
    $(document).ready(function() {
        $("input.celecderDispaly").Zebra_DatePicker({
            always_visible: $("#date_container"),
            onSelect: function(date) {
                //=====================================  JS Auto data send
                document.forms["archiveform"].submit();
                date.preventDefault();
            }
        });
    });
</script>
{{-- For page load --}}
<script>
    $(".scroll-div div.loding").slice(1).hide();
    var mincount = 1;
    var maxcount = 2;
    $(window).scroll(function() {
        if ($(window).scrollTop() + $(window).height() >= $(document).height() - 420) {
            $(".scroll-div div.loding").slice(mincount, maxcount).fadeIn(1400);
            mincount = mincount + 1;
            maxcount = maxcount + 1;
        }
    });
</script>
