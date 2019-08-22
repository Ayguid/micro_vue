@extends('layouts.appAdmin')

@section('content')
  <div class="container">

    <div class="col-md-6 col-md-offset-3">
      @if(Session::has('alert-success'))
        <div class="alert alert-success"><i class="fa fa-check" aria-hidden="true"></i> <strong>{!! session('alert-success') !!}</strong></div>
      @endif
      @if(Session::has('alert-danger'))
        <div class="alert alert-danger"><i class="fa fa-times" aria-hidden="true"></i> <strong>{!! session('alert-danger') !!}</strong></div>
      @endif
    </div>
    <h5>Edit Category</h5>
    @isset($category)

      <a class="" href="{{route('showCategory', $category->id)}}">Back</a>

      <h3 class="text-center">{{$category->title_es}}</h3>


      @include('admin.forms.category-edit-form')



      




    @endisset



  </div>
@endsection
