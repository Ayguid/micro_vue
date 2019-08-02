@extends('layouts.appAdmin')

@section('content')
    <div class="container">
      @if ($category->parent_id)
        <a class="" href="{{route('showCategory', $category->parent_id)}}">{{$category->father()->first()->title_es}}</a>
      @endif
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


        <a href="{{ url()->previous() }}" class="">Back</a>

        <h3 class="text-center">{{$category->title_es}}</h3>


      @include('admin.forms.category-edit-form')








      @endisset



    </div>
@endsection
