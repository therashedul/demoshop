@extends('layouts.deshboard')
@section('title', 'Department Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.department.index :limsdepartmentall="$lims_department_all" />
@endsection

