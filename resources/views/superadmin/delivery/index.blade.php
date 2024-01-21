@extends('layouts.deshboard')
@section('title', 'Customer Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.delivery.index 
    :limsdeliveryall="$lims_delivery_all"
    :couriarname="$couriarName"
     />
@endsection