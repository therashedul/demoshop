@extends('layouts.deshboard')
@section('title', 'Barcode Page')
@section('content')
    @if (\Session::has('success'))
        <div class="alert alert-success">
            <p>{{ \Session::get('success') }}</p>
        </div>
    @endif
    <x-backend.superAdmin.barcode.index   
    :barcodes="$barcodes"    
    :products="$products"    
    :brands="$brands"    
    />  
@endsection  

