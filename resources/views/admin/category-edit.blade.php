@extends('layouts.appAdmin')

@section('content')
    <div class="container">
      @if ($category->parent_id)
        <a class="btn btn-primary" href="{{route('showCategory', $category->parent_id)}}">{{$category->father()->first()->title_es}}</a>
      @endif
      <div class="col-md-6 col-md-offset-3">
        @if(Session::has('alert-success'))
          <div class="alert alert-success"><i class="fa fa-check" aria-hidden="true"></i> <strong>{!! session('alert-success') !!}</strong></div>
        @endif
        @if(Session::has('alert-danger'))
          <div class="alert alert-danger"><i class="fa fa-times" aria-hidden="true"></i> <strong>{!! session('alert-danger') !!}</strong></div>
        @endif
      </div>
      <h3>Edit Category</h3>
      @isset($category)


        <a href="{{ url()->previous() }}" class="btn btn-primary">Back</a>


      @include('admin.forms.category-edit-form')








      @endisset



    </div>
@endsection
