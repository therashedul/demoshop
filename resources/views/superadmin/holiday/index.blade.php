@extends('layouts.deshboard')
@section('title', 'Holiday Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.holiday.index 
    :limsholidaylist="$lims_holiday_list" 
    :approvepermission="$approve_permission" 
    />
@endsection

