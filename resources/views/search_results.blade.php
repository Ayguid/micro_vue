@extends('layouts.app')
@section('content')
  <div class="container">


    @php
    $lang=App::getLocale();
    // if ($lang== 'pt-BR') {
    //   $lang='pt';
    // }
    @endphp

    @isset($data['categories'])
      <div class="d-flex flex-wrap justify-content-start">
        @include('components.category-menu')
      </div>
    @endisset


      @php
      $admin=Auth::guard('admin')->check();
      @endphp
      <div class="row mt-2">
        @foreach ($data['products'] as $product)
          <product-component class="col-12 col-md-4 col-lg-3"  :product='{{$product}}' :key='{{$product->id}}'></product-component>
        @endforeach
      </div>
      <div class="d-flex justify-content-around">
        {{ $data['products']->appends(request()->except('page'))->links() }}
      </div>
      @if ($data['products']->count()==0)
        <p>No se encontraron productos</p>
        <a class="btn btn-primary" href="{{url()->previous()}}">Back</a>
      @endif


    </div>
  @endsection
