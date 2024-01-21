@extends('layouts.deshboard')
@section('title', 'Account Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.adjustment.index   
    :limsadjustmentall="$lims_adjustment_all"    
    />  
    @endsection  
