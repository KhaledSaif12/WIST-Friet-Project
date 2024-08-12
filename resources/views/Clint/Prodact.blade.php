@extends('Clint.layout.master')

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>المنتجات | Big Cart</title>
    <link rel="stylesheet" href="{{ asset('clients/css/style.css')}}" />
    <link rel="stylesheet" href="{{ asset('clients/css/product_style.css')}}" />
    <link rel="stylesheet" href="{{ asset('clients/css/bootsrtap/bootstrap.min.css')}}" />
  </head>

@section('content')
    <!-- Product Cards -->
    <!-- Start Product  -->
    <section class="categories">
      <h2>المنتجات المتوفرة</h2>

      <!-- Product cards -->
      <div id="products">
        @foreach($products_all as $pro)          
        <div class="card">
            <div class="image-container">
              <a href="{{ route('productdetails', ['id' => $pro->id]) }}">
                <img src="{{$pro->photo}}" alt="{{ $pro->name }}" />
              </a>
            </div>

            <div class="container">
              <div>
                <h4 class="product-name">{{ $pro->name }}</h4>
                <h4 class="price">${{$pro->prais}}</h4>
                <p class="product-rating">
                  @for ($i = 0; $i < 5; $i++)
                    <span>&#9733;</span>
                  @endfor
                </p>
              </div>
            </div>
          </div>
        @endforeach
      </div>
    </section>
    <!-- End Product  -->
    @include('Clint.Incloude.Footer')
@endsection
