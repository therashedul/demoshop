@extends('layouts.deshboard')
@section('title', 'Discount Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.discount.edit 
    :limsdiscountdata="$lims_discount_data"
    :discountplanids="$discount_plan_ids"
    :limsdiscountplanlist="$lims_discount_plan_list"
     />
@endsection