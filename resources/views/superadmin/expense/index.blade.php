@extends('layouts.deshboard')
@section('title', 'Discount Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.expense.index 
    :limsaccountlist="$lims_account_list" 
    :limsexpensecategorylist="$lims_expenseCategory_list" 
    :limswarehouselist="$lims_warehouse_list" 
    :startingdate="$starting_date" 
    :endingdate="$ending_date" 
    :warehouseid="$warehouse_id" 
    />
@endsection