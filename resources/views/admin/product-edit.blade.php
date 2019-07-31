@extends('layouts.appAdmin')

@section('content')

  <div class="container">
    @if(Session::has('alert-success'))
      <div class="alert alert-success"><i class="fa fa-check" aria-hidden="true"></i> <strong>{!! session('alert-success') !!}</strong></div>
    @endif
    @if(Session::has('alert-danger'))
      <div class="alert alert-danger"><i class="fa fa-times" aria-hidden="true"></i> <strong>{!! session('alert-danger') !!}</strong></div>
    @endif

    {{-- <a href="javascript:history.back()" class="btn btn-primary">Back</a> --}}
    <a href="{{ url()->previous() }}" class="btn btn-primary">Back</a>

    {{-- {{$product}} --}}

    @php
    $product = $data['product'];
    $productFiles = $product->files;
    $productData = json_encode(
      ['product'=>$product,
      'productFiles'=>$productFiles]
    );
    @endphp
    <drop-zone :data="{{$productData}}"></drop-zone>
    @include('admin.forms.product-edit-form')


    <form id="deleteProductForm" class="" action="{{route('destroyProduct', $product->id)}}" method="post">
      @csrf
      <input name="_method" type="hidden" value="DELETE">
      <button class="btn btn-danger" type="submit" name="button">ELIMINAR PRODUCTO</button>
    </form>

    <delete-alert :who="'deleteProductForm'"></delete-alert>


  </div>
@endsection



{{-- <script type="text/javascript" >
window.onload = function() {

  var deleteProductForm = document.getElementById('deleteProductForm');
  console.log(deleteProductForm);
  deleteProductForm.onsubmit=function(event){
      event.preventDefault();
      console.log(event.target);
  }
};
</script> --}}
