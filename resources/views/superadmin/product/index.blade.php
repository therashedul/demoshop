@extends('layouts.deshboard')
@section('title', 'Product page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.product.productIndex :products="$products" :brands="$brands" :categories="$categories"/>    
@endsection