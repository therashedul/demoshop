@extends('layouts.deshboard')
@section('title', 'Couriers Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.courier.index :couriers="$couriers" />
@endsection