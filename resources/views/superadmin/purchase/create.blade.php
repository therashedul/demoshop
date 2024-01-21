
@section('title', 'Pruchase Create Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.purchase.purchasecreate 
    :limswarehouselist="$lims_warehouse_list" 
    :limssupplierlist="$lims_supplier_list"
    :limsproductlistwithoutvariant="$lims_product_list_without_variant"
    :limsproductlistwithvariant="$lims_product_list_with_variant"
    :limstaxlist="$lims_tax_list"
    
    />    


