@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.discount.create 
    :limsdiscountplanlist="$lims_discount_plan_list"
     />

