@extends('layouts.deshboard')
@section('title', 'Pruchase page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.purchase.purchaseindex 
    :purchase="$purchase" 
    :limsaccountlist="$lims_account_list"
    :allpermission="$all_permission"
    :startingdate="$starting_date"
    :endingdate="$ending_date"
    :warehouseid="$warehouse_id"
    :purchasestatus="$purchase_status"
    :paymentstatus="$payment_status"
    :limswarehouselist="$lims_warehouse_list"
    
    />    
@endsection
