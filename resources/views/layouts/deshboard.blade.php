<!DOCTYPE html>
<html lang="en">

<head>

    @include('asset.header')

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        var startTime = new Date();
    </script>

</head>

<body class="hold-transition sidebar-mini layout-fixed" onbeforeunload="MyFunction();">
    <div class="wrapper">
        <!-- Preloader -->
        <div class="preloader flex-column justify-content-center align-items-center">
            <img class="animation__shake" src="{{ asset('dist/img/AdminLTELogo.png') }}" alt="AdminLTELogo" height="60" width="60">
        </div>

        <!-- Navbar -->
        @include('asset.nav')
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        @include('asset.top')

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            @yield('content')
        </div>
        <!-- /page content -->

        <!-- footer content -->
        @include('asset.footer')

        <!-- /footer content -->
    </div>
    {{-- wrapper --}}
    @include('asset.bottomfooter')
    <!-- Scripts -->
    @stack('custom_scripts')

</body>

</html>
