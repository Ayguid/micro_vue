@extends('layouts.appAdmin')

@section('content')

  <div class="container">
    <div class="col-md-6 col-md-offset-3">
      @if(Session::has('alert-success'))
        <div class="alert alert-success"><i class="fa fa-check" aria-hidden="true"></i> <strong>{!! session('alert-success') !!}</strong></div>
      @endif
      @if(Session::has('alert-danger'))
        <div class="alert alert-danger"><i class="fa fa-times" aria-hidden="true"></i> <strong>{!! session('alert-danger') !!}</strong>


        </div>
      @endif
    </div>



<div class="row">

@foreach ($data['admins'] as $admin)
<div class="col-12 col-md-4 col-lg-3 col-xl-3 ">
  <a href="{{route('editAdmin', $admin->id)}}">
  <div class="p-3 mb-2 bg-info text-white rounded">
  Email : {{$admin->email}}<br>
  Name : {{$admin->name}}<br>
  Rol : {{$admin->job_title}}<br>
  Pais : {{$admin->country->country_desc ?? 'No country'}}<br>
  Contactable :
  @if ($admin->contactable)
    &#10003;
    @else
    &#10062;  
  @endif
</div>
</a>
</div>
@endforeach

</div>

<p class="mt-2">
  <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Agregar admins
  </a>

</p>
<div class="collapse" id="collapseExample">
  <div class="card card-body">
    @include('admin.forms.admins-form')
  </div>
</div>







  </div>
@endsection
