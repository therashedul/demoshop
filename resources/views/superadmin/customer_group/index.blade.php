@extends('layouts.deshboard')
@section('title', 'Customer Group Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.customer_group.index 
    :limscustomergroupall="$lims_customer_group_all"
     />
@endsection