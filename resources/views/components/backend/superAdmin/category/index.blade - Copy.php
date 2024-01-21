@extends('layouts.deshboard')
@section('content')
    <x-backend.superAdmin.category.catindex :categories="$categories" />
@endsection
