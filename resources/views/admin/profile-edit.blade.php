@extends('layouts.appAdmin')

@section('content')

  <div class="container">


      @if(Session::has('alert-success'))
        <div class="alert alert-success"><i class="fa fa-check" aria-hidden="true"></i> <strong>{!! session('alert-success') !!}</strong></div>
      @endif
      @if(Session::has('alert-danger'))
        <div class="alert alert-danger"><i class="fa fa-times" aria-hidden="true"></i> <strong>{!! session('alert-danger') !!}</strong></div>
      @endif



      <a class="btn btn-primary" href="{{route('adminProfiles')}}">Back</a>


    @include('admin.forms.admins-edit-form')




</div>








@endsection
