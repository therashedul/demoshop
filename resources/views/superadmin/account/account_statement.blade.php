@extends('layouts.deshboard')
@section('title', 'Account Create Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.account.account_statement    
    />  
    @endsection   
