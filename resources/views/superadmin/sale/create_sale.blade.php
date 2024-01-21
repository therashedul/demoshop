@extends('layouts.top-head') 
@section('title', 'Pos Create Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.sale.sale_create_sale
    :limscustomergroupall="$lims_customer_group_all"
    :limscustomerlist="$lims_customer_list"   
    :limswarehouselist="$lims_warehouse_list"
    :limsbillerlist="$lims_biller_list"
    :limstaxlist="$lims_tax_list"
    :limssaledata="$lims_sale_data"
    :limsproductlist="$lims_product_list"
    :productnumber="$product_number"    
    :limspossettingdata="$lims_pos_setting_data"
    :limsbrandlist="$lims_brand_list"  
    :limscategorylist="$lims_category_list"
    :recentsale="$recent_sale"  
    :recentdraft="$recent_draft"
    :limscouponlist="$lims_coupon_list"   
    :limsproductsaledata="$lims_product_sale_data"   
    :flag="$flag"    
    />  
    @endsection




