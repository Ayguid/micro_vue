@extends('layouts.appAdmin')

@section('content')
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">Admin Dashboard</div>

          <div class="col-md-6 col-md-offset-3">
            @if(Session::has('alert-success'))
              <div class="alert alert-success"><i class="fa fa-check" aria-hidden="true"></i> <strong>{!! session('alert-success') !!}</strong></div>
            @endif
            @if(Session::has('alert-danger'))
              <div class="alert alert-danger"><i class="fa fa-times" aria-hidden="true"></i> <strong>{!! session('alert-danger') !!}</strong></div>
            @endif
          </div>

          @if ($errors->count()>0)
            {{$errors}}
          @endif

          <div class="card-body">


            You are logged in as <strong>ADMIN!</strong>


            <br>

            <div id="accordion">
              <div class="card">
                <div class="card-header" id="headingOne">
                  <h5 class="mb-0">
                    <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                      Categorias
                    </button>
                  </h5>
                </div>

                <div id="collapseOne" class="collapse show"aria-labelledby="headingOne" data-parent="#accordion">
                  <div class="card-body">


                    <div class="mb-2">
                      <div class="row">

                      @foreach (App\Models440\Category::all()->where('parent_id', null) as $cat)
                        <div class="col-4 mb-2">
                          <a href="{{route('showCategory', $cat->id)}}" class="btn btn-primary btn-lg btn-block">{{$cat->title_es}}</a>
                        </div>
                      @endforeach
                    </div>
                    </div>

                    <p>
                      <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        Agregar Categoria
                      </button>
                    </p>
                    <div class="collapse" id="collapseExample">
                      <div class="card card-body">
                        @include('admin.forms.category-form')
                      </div>
                    </div>



                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header" id="headingTwo">
                  <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                      Buscar producto
                    </button>
                  </h5>
                </div>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                  <div class="card-body">

                    <form action="{{route('adminFindProduct')}}" method="get" class="form-inline">
                      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="string">
                      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form>

                  </div>
                </div>
              </div>
              {{-- <div class="card">
                <div class="card-header" id="headingThree">
                  <h5 class="mb-0">
                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                      Administrar un país
                    </button>
                  </h5>
                </div>
                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                  <div class="card-body">

                    @foreach (App\Models440\Country::all() as $country)
                      <a href="#" class="btn btn-primary">{{$country->country_desc}}</a>
                    @endforeach

                  </div>
                </div>
              </div> --}}

            </div>


            <div class="">
              <a href="{{route('fileManager')}}">Media Manager</a>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
@endsection
