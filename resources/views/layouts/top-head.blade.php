<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    @if(!empty($general_setting->site_logo))
    <link rel="icon" type="image/png" href="{{asset('logo', $general_setting->site_logo)}}" />
    @endif
    @if(!empty($general_setting->site_logo))
    <title>{{$general_setting->site_title}}</title>
    @endif
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="manifest" href="{{url('manifest.json')}}">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="@php echo asset('vendor/bootstrap/css/bootstrap.min.css') @endphp" type="text/css">
    <link rel="preload" href="@php echo asset('vendor/bootstrap-toggle/css/bootstrap-toggle.min.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/bootstrap-toggle/css/bootstrap-toggle.min.css') @endphp" rel="stylesheet"></noscript>
    <link rel="preload" href="@php echo asset('vendor/bootstrap/css/bootstrap-datepicker.min.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/bootstrap/css/bootstrap-datepicker.min.css') @endphp" rel="stylesheet"></noscript>
    <link rel="preload" href="@php echo asset('vendor/jquery-timepicker/jquery.timepicker.min.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/jquery-timepicker/jquery.timepicker.min.css') @endphp" rel="stylesheet"></noscript>
    <link rel="preload" href="@php echo asset('vendor/bootstrap/css/awesome-bootstrap-checkbox.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/bootstrap/css/awesome-bootstrap-checkbox.css') @endphp" rel="stylesheet"></noscript>
    <link rel="preload" href="@php echo asset('vendor/bootstrap/css/bootstrap-select.min.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/bootstrap/css/bootstrap-select.min.css') @endphp" rel="stylesheet"></noscript>
    <!-- Font Awesome CSS-->
    <link rel="preload" href="@php echo asset('vendor/font-awesome/css/font-awesome.min.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/font-awesome/css/font-awesome.min.css') @endphp" rel="stylesheet"></noscript>
    <!-- Drip icon font-->
    <link rel="preload" href="@php echo asset('vendor/dripicons/webfont.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/dripicons/webfont.css') @endphp" rel="stylesheet"></noscript>
    <!-- Google fonts - Roboto -->
    <link rel="preload" href="https://fonts.googleapis.com/css?family=Nunito:400,500,700" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="https://fonts.googleapis.com/css?family=Nunito:400,500,700" rel="stylesheet"></noscript>
    <!-- jQuery Circle-->
    <link rel="preload" href="@php echo asset('poscss/grasp_mobile_progress_circle-1.0.0.min.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('poscss/grasp_mobile_progress_circle-1.0.0.min.css') @endphp" rel="stylesheet"></noscript>
    <!-- Custom Scrollbar-->
    <link rel="preload" href="@php echo asset('vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css') @endphp" rel="stylesheet"></noscript>
    <!-- virtual keybord stylesheet-->
    <link rel="preload" href="@php echo asset('vendor/keyboard/css/keyboard.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/keyboard/css/keyboard.css') @endphp" rel="stylesheet"></noscript>
    <!-- date range stylesheet-->
    <link rel="preload" href="@php echo asset('vendor/daterange/css/daterangepicker.min.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/daterange/css/daterangepicker.min.css') @endphp" rel="stylesheet"></noscript>
    <!-- table sorter stylesheet-->
    <link rel="preload" href="@php echo asset('vendor/datatable/dataTables.bootstrap4.min.css') @endphp" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link href="@php echo asset('vendor/datatable/dataTables.bootstrap4.min.css') @endphp" rel="stylesheet"></noscript>
    <link rel="stylesheet" href="@php echo asset('poscss/style.default.css') @endphp" id="theme-stylesheet" type="text/css">
    <link rel="stylesheet" href="{{ asset('poscss/style.css') }}">
    <link rel="stylesheet" href="{{ asset('poscss/custom-default.css') }}">

    <!-- Custom stylesheet - for your changes-->
    @if(!empty($general_setting->theme))
    <link rel="stylesheet" href="@php echo asset('poscss/custom-'.$general_setting->theme) @endphp" type="text/css" id="custom-style">
    @if( Config::get('app.locale') == 'ar' || $general_setting->is_rtl)
      <!-- RTL css -->
      <link rel="stylesheet" href="@php echo asset('vendor/bootstrap/css/bootstrap-rtl.min.css') @endphp" type="text/css">
      <link rel="stylesheet" href="@php echo asset('poscss/custom-rtl.css') @endphp" type="text/css" id="custom-style">
    @endif
    @else
    @endif
  </head>
  <body class="pos-page" onload="myFunction()">
    <div id="loader"></div>

      <div style="display:none;" id="content" class="animate-bottom">
          @yield('content')
      </div>


    <!-- end supplier modal -->
    <script type="text/javascript" src="@php echo asset('vendor/jquery/jquery.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/jquery/jquery-ui.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/jquery/bootstrap-datepicker.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/jquery/jquery.timepicker.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/popper.js/umd/popper.min.js') @endphp">
    </script>
    <script type="text/javascript" src="@php echo asset('vendor/bootstrap/js/bootstrap.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/bootstrap-toggle/js/bootstrap-toggle.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/bootstrap/js/bootstrap-select.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/keyboard/js/jquery.keyboard.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/keyboard/js/jquery.keyboard.extension-autocomplete.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('posjs/grasp_mobile_progress_circle-1.0.0.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/jquery.cookie/jquery.cookie.js') @endphp">
    </script>
    <script type="text/javascript" src="@php echo asset('vendor/jquery-validation/jquery.validate.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js')@endphp"></script>
    @if(!empty($general_setting->theme))
    @if( Config::get('app.locale') == 'ar' || $general_setting->is_rtl)
      <script type="text/javascript" src="@php echo asset('posjs/front_rtl.js') @endphp"></script>
    @else
      <script type="text/javascript" src="@php echo asset('posjs/front.js') @endphp"></script>
    @endif
    @endif
    <script type="text/javascript" src="@php echo asset('vendor/daterange/js/moment.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/daterange/js/knockout-3.4.2.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/daterange/js/daterangepicker.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/datatable/jquery.dataTables.min.js') @endphp"></script>
    <script type="text/javascript" src="@php echo asset('vendor/datatable/dataTables.bootstrap4.min.js') @endphp"></script>

    @stack('scripts')

    <script>
        if ('serviceWorker' in navigator ) {
            window.addEventListener('load', function() {
                navigator.serviceWorker.register('/demo/service-worker.js').then(function(registration) {
                    // Registration was successful
                    console.log('ServiceWorker registration successful with scope: ', registration.scope);
                }, function(err) {
                    // registration failed :(
                    console.log('ServiceWorker registration failed: ', err);
                });
            });
        }
    </script>
    <script type="text/javascript">

          function myFunction() {
              setTimeout(showPage, 150);
          }

          function showPage() {
            document.getElementById("loader").style.display = "none";
            document.getElementById("content").style.display = "block";
            $("#lims_productcodeSearch").focus();
          }

          $("div.alert").delay(3000).slideUp(750);
          $('select').selectpicker({
              style: 'btn-link',
          });



        $("li#notification-icon").on("click", function (argument) {
              $.get('notifications/mark-as-read', function(data) {
                  $("span.notification-number").text(alert_product);
              });
          });

      $("a#add-expense").click(function(e){
        e.preventDefault();
        $('#expense-modal').modal();
      });

      $("a#send-notification").click(function(e){
        e.preventDefault();
        $('#notification-modal').modal();
      });

      $("a#add-account").click(function(e){
        e.preventDefault();
        $('#account-modal').modal();
      });

      $("a#account-statement").click(function(e){
        e.preventDefault();
        $('#account-statement-modal').modal();
      });

      $("a#profitLoss-link").click(function(e){
        e.preventDefault();
        $("#profitLoss-report-form").submit();
      });

      $("a#report-link").click(function(e){
        e.preventDefault();
        $("#product-report-form").submit();
      });

      $("a#purchase-report-link").click(function(e){
        e.preventDefault();
        $("#purchase-report-form").submit();
      });

      $("a#sale-report-link").click(function(e){
        e.preventDefault();
        $("#sale-report-form").submit();
      });

      $("a#payment-report-link").click(function(e){
        e.preventDefault();
        $("#payment-report-form").submit();
      });

      $("a#warehouse-report-link").click(function(e){
        e.preventDefault();
        $('#warehouse-modal').modal();
      });

      $("a#user-report-link").click(function(e){
        e.preventDefault();
        $('#user-modal').modal();
      });

      $("a#customer-report-link").click(function(e){
        e.preventDefault();
        $('#customer-modal').modal();
      });

      $("a#supplier-report-link").click(function(e){
        e.preventDefault();
        $('#supplier-modal').modal();
      });

      $("a#due-report-link").click(function(e){
        e.preventDefault();
        $("#customer-due-report-form").submit();
      });

      $("a#supplier-due-report-link").click(function(e){
        e.preventDefault();
        $("#supplier-due-report-form").submit();
      });

      $('.date').datepicker({
         format: "dd-mm-yyyy",
         autoclose: true,
         todayHighlight: true
       });

      $(".daterangepicker-field").daterangepicker({
          callback: function(startDate, endDate, period){
            var start_date = startDate.format('YYYY-MM-DD');
            var end_date = endDate.format('YYYY-MM-DD');
            var title = start_date + ' To ' + end_date;
            $(this).val(title);
            $('#account-statement-modal input[name="start_date"]').val(start_date);
            $('#account-statement-modal input[name="end_date"]').val(end_date);
          }
      });
    </script>
  </body>
</html>
