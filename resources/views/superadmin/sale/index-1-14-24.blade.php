@extends('layouts.deshboard')
@section('title', 'Sale page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.sale.saleindex 
    :startingdate="$starting_date" 
    :endingdate="$ending_date" 
    :warehouseid="$warehouse_id" 
    :salestatus="$sale_status"
    :paymentstatus="$payment_status"
    :limsgiftcardlist="$lims_gift_card_list"
    :limspossettingdata="$lims_pos_setting_data"
    :limsrewardpointsettingdata="$lims_reward_point_setting_data"
    :limsaccountlist="$lims_account_list"
    :limswarehouselist="$lims_warehouse_list"
    :limsdelivereslist="$lims_deliveres_list"
    :sales="$sales"    
    />   
@endsection



