@extends('layouts.app')
@section('content')
  <div class="container">

    <h3>{{session('country.country_desc')}}</h3>
    {{Lang::get('messages.welcome')}}

    @php
    $lang=App::getLocale();
    if ($lang== 'pt-BR') {
      $lang='pt';
    }
    @endphp




      @php
      $admin=Auth::guard('admin')->check();
      @endphp
      <div class="row mt-2">
        @foreach ($data['products'] as $product)
          <product-component  :product='{{$product}}' :key='{{$product->id}}'></product-component>
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
