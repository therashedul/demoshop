@extends('layouts.deshboard')
@section('title', 'Account Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.adjustment.edit   
    :limsadjustmentdata="$lims_adjustment_data"    
    :limswarehouselist="$lims_warehouse_list"    
    :limsproductadjustmentdata="$lims_product_adjustment_data"    
    />  
    @endsection  