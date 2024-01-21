   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">



   <title>{{ config('app.name', 'Url') }}</title>

   <meta name="viewport" content="width=device-width, initial-scale=1">
   <!-- CSRF Token -->
   <meta name="csrf-token" content="{{ csrf_token() }}">

<link rel="icon" href="images/favicon.ico" type="image/ico" />
@php    
   header("Access-Control-Allow-Origin: %origin%");
@endphp
   <!-- Google Font: Source Sans Pro -->
   <link rel="stylesheet"
       href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
   <!-- Tempusdominus Bootstrap 4 -->
   {{-- <link rel="stylesheet" href="{{ asset('plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}"> --}}
   <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
       integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
   <!-- Font Awesome -->
   {{-- <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css"> --}}
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">



   <!-- Ionicons -->
   <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
   <!-- iCheck -->
   <link rel="stylesheet" href="{{ asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css') }} ">
   <!-- JQVMap -->
   <link rel="stylesheet" href="{{ asset('plugins/jqvmap/jqvmap.min.css') }}">
   {{-- dropzone --}}
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/dropzone.css" />
   <!-- DataTables -->
   <link rel="stylesheet" href="{{ asset('plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
   <link rel="stylesheet" href="{{ asset('plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
   <link rel="stylesheet" href="{{ asset('plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">





   <!-- Theme style -->
   <link rel="stylesheet" href="{{ asset('dist/css/adminlte.min.css') }}">
   <!-- overlayScrollbars -->
   <link rel="stylesheet" href="{{ asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">


   <noscript>
       <link href="<?php echo asset('vendor/bootstrap-toggle/css/bootstrap-toggle.min.css'); ?>" rel="stylesheet">
   </noscript>
   <link rel="preload" href="<?php echo asset('vendor/bootstrap-toggle/css/bootstrap-toggle.min.css'); ?>" as="style" onload="this.onload=null;this.rel='stylesheet'">

   <!-- Daterange picker -->
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
   {{-- <link rel="stylesheet" href="{{ asset('plugins/daterangepicker/daterangepicker.css') }}"> --}}
   <link href="{{ asset('build/css/bootstrap-datetimepicker.min.css') }}" rel="stylesheet" media="screen">

   <noscript>
       <link href="<?php echo asset('vendor/bootstrap/css/bootstrap-datepicker.min.css'); ?>" rel="stylesheet">
   </noscript>
   <link rel="preload" href="<?php echo asset('vendor/jquery-timepicker/jquery.timepicker.min.css'); ?>" as="style" onload="this.onload=null;this.rel='stylesheet'">
   <link rel="preload" href="{{ asset('vendor/daterange/css/daterangepicker.min.css') }}" as="style"
       onload="this.onload=null;this.rel='stylesheet'">

   <link href="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.10.0/dist/css/bootstrap-datepicker3.min.css"
       rel="stylesheet">

{{-- Time  --}}
<link rel="preload" href="https://salepropos.com/demo/vendor/jquery-timepicker/jquery.timepicker.min.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
<noscript><link href="https://salepropos.com/demo/vendor/jquery-timepicker/jquery.timepicker.min.css" rel="stylesheet"></noscript>
   <!-- Custom stylesheet - for tag field-->
   {{-- <link rel="stylesheet" href="https://salepropos.com/demo/css/custom-default.css" type="text/css" id="custom-style"> --}}
   <!-- Latest compiled and minified CSS -->
   <link rel="stylesheet"
       href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

   <!-- Custom Theme Style -->
   <link href="{{ asset('build/css/custom.css') }}" rel="stylesheet">


   <!-- summernote -->
   <link rel="stylesheet" href="{{ asset('plugins/summernote/summernote-bs4.min.css') }} ">
