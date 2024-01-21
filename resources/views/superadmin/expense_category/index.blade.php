@extends('layouts.deshboard')
@section('title', 'Expense Category Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.expense_category.index 
    :limsexpensecategoryall="$lims_expense_category_all" 
    />
@endsection
