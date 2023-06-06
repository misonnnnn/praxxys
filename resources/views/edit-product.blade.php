@extends('layouts.app')

@section('content')

<div class="content-header">
    <div class="container-fluid">
    <div class="row mb-2">
        <div class="col-sm-6">
        <h1 class="m-0">Edit Product  </h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item">Home</li>
            <li class="breadcrumb-item"><a href="{{ URL('products') }}">Product</a></li>
            <li class="breadcrumb-item active">Edit </li>
        </ol>
        </div><!-- /.col -->
    </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>


<div class="container">
    <div id="app">
        <edit-product data-id="{{ $id }}" />
    </div>
</div>
@endsection