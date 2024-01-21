@extends('layouts.deshboard')
@section('title', 'Copon Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.coupon.index :coupons="$coupons" />
@endsection