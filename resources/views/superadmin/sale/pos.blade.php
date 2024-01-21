@extends('layouts.top-head') 
@section('title', 'Pos Create Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.sale.salepos
    :limscustomergroupall="$lims_customer_group_all"
    :limscustomerlist="$lims_customer_list"   
    :limsrewardpointsettingdata="$lims_reward_point_setting_data"   
    :limswarehouselist="$lims_warehouse_list"
    :limsbillerlist="$lims_biller_list"
    :limstaxlist="$lims_tax_list"
    :limsproductlist="$lims_product_list"
    :productnumber="$product_number"    
    :limspossettingdata="$lims_pos_setting_data"
    :limsbrandlist="$lims_brand_list"  
    :limscategorylist="$lims_category_list"
    :recentsale="$recent_sale"  
    :recentdraft="$recent_draft"
    :limscouponlist="$lims_coupon_list"   
    :flag="$flag"    
    />  
    @endsection    
