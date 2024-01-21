@section('title', 'Pruchase page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.purchase.purchaseedit 
    :limswarehouselist="$lims_warehouse_list" 
    :limssupplierlist="$lims_supplier_list"
    :limsproductlistwithoutvariant="$lims_product_list_without_variant"
    :limsproductlistwithvariant="$lims_product_list_with_variant"
    :limstaxlist="$lims_tax_list"
    :limspurchasedata="$lims_purchase_data"
    :limsproductpurchasedata="$lims_product_purchase_data"
    
    />    


