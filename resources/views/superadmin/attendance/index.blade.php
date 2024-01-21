@extends('layouts.deshboard')
@section('title', 'Addendance Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.attendance.index   
    :limsemployeelist="$lims_employee_list"    
    :limshrmsettingdata="$lims_hrm_setting_data"    
    :limsattendanceall="$lims_attendance_all"    
    />  
    @endsection  
    