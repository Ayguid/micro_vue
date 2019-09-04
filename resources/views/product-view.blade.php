@extends('layouts.app')

@php
$product = $data['product'];
$files =$product->getFiles();
$category = $data['category'];
$categories = $data['categories'];
$hash3d=0;
$admin=Auth::guard('admin')->check();

if ($product->has_cad_3d) {
  $hash3d=json_encode(asset('storage/stls/'.$files['stls'][0]->file_path));
}

$lang=App::getLocale();
// if ($lang== 'pt-BR') {
//   $lang='pt';
// }
@endphp

@section('content')
  <div class="container">

    <h3>{{session('country.country_desc')}}</h3>
    {{Lang::get('messages.welcome')}}

    @isset($data['categories'])
      <div class="d-flex flex-wrap justify-content-start">
        @include('components.category-menu')
      </div>
    @endisset

    @isset($data['category'])
      <div class="row">
        <div class="col-6">
          {{-- <a href="{{ url()->previous() }}" class="btn btn-secondary">Back</a> --}}
          <h4 class="m-2">{{$category->father-> {'title_' . $lang} ?? $category->father->title_es}}->
            <a href="{{route('productsCat', $category->id)}}">
              {{$category-> {'title_' . $lang} ?? $category->title_es}}</a>
            </h4>
          </div>


        </div>
      @endisset

      @isset($product)
        <product-view
          :product='{!! json_encode($product) !!}'
        ></product-view>
      @endisset


          </div>

        @endsection

        {{-- <script type="text/javascript">
        var hashLocate={!! $hash3d !!};
        </script> --}}
