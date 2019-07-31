@extends('layouts.appAdmin')

@section('content')

  <div class="container">
    @if(Session::has('alert-success'))
      <div class="alert alert-success"><i class="fa fa-check" aria-hidden="true"></i> <strong>{!! session('alert-success') !!}</strong></div>
    @endif
    @if(Session::has('alert-danger'))
      <div class="alert alert-danger"><i class="fa fa-times" aria-hidden="true"></i> <strong>{!! session('alert-danger') !!}</strong></div>
    @endif


    <a class="btn btn-secondary" href="{{route('admin.dashboard')}}">Back to Dashboard</a>

      @include('admin.components.products-component', ['products'=>$data['products']])
      @if ($data['products']->count()==0)
        <p>
          No se encontraron productos
        </p>
      @endif


  </div>
@endsection
