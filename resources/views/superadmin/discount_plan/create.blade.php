@extends('layouts.deshboard')
@section('title', 'Discount Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.discount_plan.create :limscustomerlist="$lims_customer_list" />
@endsection
