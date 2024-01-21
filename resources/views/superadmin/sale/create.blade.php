@section('title', 'Pruchase Create Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.sale.salecreate 
    :limscustomerlist="$lims_customer_list" 
    :limswarehouselist="$lims_warehouse_list"
    :limsbillerlist="$lims_biller_list"
    :limspossettingdata="$lims_pos_setting_data"
    :limstaxlist="$lims_tax_list"
    :limsrewardpointsettingdata="$lims_reward_point_setting_data"
    
    />    