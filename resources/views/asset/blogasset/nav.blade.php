  <!-- ======= Header ======= -->

  <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="{{ url('/') }}"><span>Com</span>pany</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      @php
          $menu = DB::table('menus')
              ->get()
              ->toArray();
      @endphp
      @if (isset($menu[0]) ? $menu[0]->location == 1 : '')
          @include('menu.header')
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
                  Add Header Menu</a>
          @endif
      @endif
  </div>
