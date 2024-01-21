@extends('layouts.deshboard')
@section('title', 'Media Page')
@section('content')
@if (\Session::has('success'))
<div class="alert alert-success">
    <p>{{ \Session::get('success') }}</p>
</div>
@endif
    <x-backend.superAdmin.media.index 
    :data="$data"  />
@endsection

