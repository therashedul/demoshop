 {{-- <form action="{{ route('post.time') }}" method="post">
       @csrf
       <input type="text" name="duration" value="123">
       <button class="btn  btn-primary">submit</button>
   </form> --}}
 {{-- @include('superadmin.category.createmodal') --}}
 {{-- @include('superadmin.category.imagecreatemodal') --}}

 <!-- jQuery -->
 <script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
 <!-- jQuery UI 1.11.4 -->
 <script src="{{ asset('plugins/jquery-ui/jquery-ui.min.js') }}"></script>
 <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
 <script>
     $.widget.bridge('uibutton', $.ui.button)
 </script>
 <!-- Bootstrap 4 -->
 <script src="{{ asset('plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

 <script type="text/javascript" src="{{ asset('vendor/chart.js/Chart.min.js') }}"></script>
 <script type="text/javascript" src="{{ asset('js/charts-custom.js') }}"></script>
 {{-- =====================Chart and progress bar ============================ --}}
 
 <script type="text/javascript" src="{{ asset('vendor/malihu-custom-scrollbar-plugin/grasp_mobile_progress_circle-1.0.0.min.js')}}"></script>
 <script type="text/javascript" src="https://salepropos.com/demo/vendor/jquery.cookie/jquery.cookie.js">
<script src="{{ asset('plugins/chart.js/Chart.min.js') }}"></script>
</script>
{{-- <script type="text/javascript" src="https://salepropos.com/demo/vendor/chart.js/Chart.min.js"></script> --}}
<script type="text/javascript" src="https://salepropos.com/demo/js/charts-custom.js"></script>
<script type="text/javascript" src="{{ asset('vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js') }}"></script>

{{-- 
<script type="text/javascript" src="https://salepropos.com/demo/vendor/jquery-validation/jquery.validate.min.js"></script>
--}}

 <!-- Sparkline -->
 <script src="{{ asset('plugins/sparklines/sparkline.js') }}"></script>
 <!-- JQVMap -->
 <script src="{{ asset('plugins/jqvmap/jquery.vmap.min.js') }}"></script>
 <script src="{{ asset('plugins/jqvmap/maps/jquery.vmap.usa.js') }}"></script>
 <!-- jQuery Knob Chart -->
 <script src="{{ asset('plugins/jquery-knob/jquery.knob.min.js') }}"></script>

 <!-- Tempusdominus Bootstrap 4 -->
 <script src="{{ asset('plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
 <!-- Summernote -->
 <script src="{{ asset('plugins/summernote/summernote-bs4.min.js') }}"></script>
 <!-- overlayScrollbars -->
{{-- Time --}}
 <script type="text/javascript" src="https://salepropos.com/demo/vendor/jquery/jquery.timepicker.min.js"></script>



 <!-- DataTables  & Plugins -->
 <script src="{{ asset('plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
 {{-- <script type="text/javascript" src="https://cdn.datatables.net/1.12.0/js/jquery.dataTables.js"></script> --}}
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
 {{-- <script src="{{ asset('plugins/datatables/jquery.dataTables.min.js') }}"></script> --}}
 <script src="{{ asset('plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
 {{-- <script type="text/javascript" src="https://cdn.datatables.net/1.12.0/js/dataTables.bootstrap4.js"></script> --}}
 <script src="{{ asset('plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
 {{-- <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.js"></script> --}}

 <script type="text/javascript" src="https://salepropos.com/demo/vendor/datatable/sum().js"></script>
<script type="text/javascript" src="https://salepropos.com/demo/vendor/datatable/dataTables.checkboxes.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/fixedheader/3.1.6/js/dataTables.fixedHeader.min.js"></script>

 <script src="{{ asset('plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
 {{-- <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.3.0/js/responsive.bootstrap4.js"></script>  --}}
 <script src="{{ asset('plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
 <script src="{{ asset('plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
 <script src="{{ asset('plugins/jszip/jszip.min.js') }}"></script>
 <script src="{{ asset('plugins/pdfmake/pdfmake.min.js') }}"></script>
 <script src="{{ asset('plugins/pdfmake/vfs_fonts.js') }}"></script>
 <script src="{{ asset('plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
 <script src="{{ asset('plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
 <script src="{{ asset('plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.2.1/js/dataTables.fixedColumns.min.js">
 </script>
 {{-- Datatable debuger --}}
{{-- <script type="text/javascript" src="https://debug.datatables.net/bookmarklet/DT_Debug.js"></script> --}}







 {{-- ============================================== --}}
 <!-- bootstrap-daterangepicker -->
 {{-- check for product publish date and purchere search date --}}
 <script type="text/javascript" src="{{ asset('vendor/jquery/bootstrap-datepicker.min.js') }}"></script>
 <script type="text/javascript" src="{{ asset('vendor/daterange/js/moment.min.js') }}"></script>
 <script type="text/javascript" src="{{ asset('vendor/daterange/js/knockout-3.4.2.js') }}"></script>
 <script type="text/javascript" src="{{ asset('vendor/daterange/js/daterangepicker.min.js') }}"></script>

 <script type="text/javascript" src="{{ asset('build/js/bootstrap-datetimepicker.js') }}" charset="UTF-8"></script>
 <script type="text/javascript" src="{{ asset('build/js/bootstrap-datetimepicker.fr.js') }} " charset="UTF-8"></script>
 <!-- daterangepicker -->
 {{-- <script src="{{ asset('plugins/moment/moment.min.js') }}"></script>
 <script src="{{ asset('plugins/daterangepicker/daterangepicker.js') }}"></script> --}}

 <!-- Date Time Scripts -->
 <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
 {{-- <script src="https://cdn.jsdelivr.net/npm/bootstrap-datepicker@1.10.0/dist/js/bootstrap-datepicker.min.js"></script> --}}

 {{-- ============================================== --}}
 <!-- Latest compiled and minified JavaScript -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
 <!-- Custom Theme Scripts -->
 <script src="{{ asset('build/js/custom.min.js') }}"></script>

 <!-- AdminLTE App -->
 <script src="{{ asset('dist/js/adminlte.js') }}"></script>
 <!-- AdminLTE for demo purposes -->
 <script src="{{ asset('dist/js/demo.js') }}"></script>
 <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
 <script src="{{ asset('dist/js/pages/dashboard.js') }}"></script>
 {{-- jquery cdn lin --}}
 {{-- <script src="https://code.jquery.com/jquery-3.7.0.min.js"
     integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script> --}}
