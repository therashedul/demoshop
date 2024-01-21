@extends('layouts.deshboard')
@section('title', 'Gift card Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.giftcard.index 
    :limscustomerlist="$lims_customer_list" 
    :limsuserlist="$lims_user_list" 
    />
@endsection