@extends('Clint.layout.master')

@section('content')
<!-- Start Prodcuts Details-->
<div class="container mt-4">
    <button class="btn btn-success back-btn" onclick="history.back();">
        <img src="{{ asset('clients/images/bootstrap-icons-1.11.3/arrow-left-circle.svg') }}" style="filter: invert(100%)" />
        عودة
    </button>
    <div class="product-detail">
        <img src="{{$product->photo}}" alt="{{ $product->name }}" class="product-image img-fluid" />
        <div class="product-actions">
            <div style="background-color: lightgray; border-radius: 50%; width: 35px; height: 35px;">
                <img src="{{ asset('clients/images/bootstrap-icons-1.11.3/eye.svg') }}" style="background-color: lightgray; border-radius: 50%; width: 20px;" />
            </div>
            <button class="btn btn-success">
                <img src="{{ asset('clients/images/bootstrap-icons-1.11.3/cart.svg') }}" style="filter: invert(100%)" />
                إضافة إلى السلة
            </button>
            <div style="background-color: lightgray; border-radius: 50%; width: 35px; height: 35px;">
                <img src="{{ asset('clients/images/bootstrap-icons-1.11.3/heart.svg') }}" />
            </div>
        </div>
        <h1 class="product-name">{{ $product->name }}</h1>
        <div class="product-pricing">
            <span class="former-price">${{ $product->former_price }}</span>
            <span class="current-price">${{ $product->prais }}</span>
        </div>
        <div class="product-rating">
            <span class="stars"> ★★★★★ </span>
            <span class="rating-count">({{ $product->productstatus }} تقييم)</span>
        </div>
        <p class="discount-message text-secondary h5">أسرع ينتهي العرض في:</p>
        <div class="countdown text-dark" dir="rtl">
            <span id="date">{{$product->data}}</span> 
        </div>
    </div>
</div>
<!-- End Prodcuts Details-->
@include('Clint.Incloude.Footer')
@endsection
