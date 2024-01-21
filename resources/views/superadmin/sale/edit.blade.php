@extends('layouts.deshboard')
@section('title', 'Pruchase Create Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.sale.saleedit
    :limscustomerlist="$lims_customer_list" 
    :limswarehouselist="$lims_warehouse_list"
    :limsbillerlist="$lims_biller_list"
    :limssaledata="$lims_sale_data"
    :limstaxlist="$lims_tax_list"
    :limsproductsaledata="$lims_product_sale_data"    
    />  
    @endsection
