@extends('layouts.deshboard')
@section('title', 'Biller Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.cash_register.index   
    :limscashregisterall="$lims_cash_register_all"  
    />  
@endsection  