@extends('layouts.deshboard')
@section('title', 'Account Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.account.index   
    :limsaccountall="$lims_account_all"    
    />  
    @endsection   