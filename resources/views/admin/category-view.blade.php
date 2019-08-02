@extends('layouts.appAdmin')

@section('content')

  <div class="container">
    @if(Session::has('alert-success'))
      <div class="alert alert-success"><i class="fa fa-check" aria-hidden="true"></i> <strong>{!! session('alert-success') !!}</strong></div>
    @endif
    @if(Session::has('alert-danger'))
      <div class="alert alert-danger"><i class="fa fa-times" aria-hidden="true"></i> <strong>{!! session('alert-danger') !!}</strong></div>
    @endif



    @isset($category)
      {{-- <h3>View</h3> --}}
      @if ($category->parent_id)
        <a class="" href="{{route('showCategory', $category->parent_id)}}">{{$category->father()->first()->title_es}}</a>
      @endif



      <div class="row">
        <div class="col-4 mt-2">
          <div class="d-flex justify-content-start">

          <h3 >{{$category->title_es}}</h3>
          <a href="{{route('editCategory', $category->id)}}" class=""><img src="{{asset('/icons/edit_icon.svg')}}" alt="" width="30px"></a>
        </div>
        </div>

      </div>



      @if (!$category->parent_id)
        <h4 class="mt-2 text-center">Atributos</h4>
        <div class="p-3 mb-2 bg-secondary rounded">
        <div class="row">
          @foreach ($category->attributes as $attr)
            <div class="col-3 p-2">
              <a class="text-white" href="{{route('editAttribute',$attr->id)}}">{{$attr->name_es}}</a>
              @if ($attr->filterable)
                <img src="{{asset('icons/lens_icon.svg')}}" alt="">
              @endif
            </div>
          @endforeach
        </div>
      </div>
      @endif




      @if ($category->children->count()>0)
          <h4 class="mt-2">Sub Categorias</h4>
          <div class="sub-cats">
          <div class="row">
            @foreach ($category->children as $child)
              <div class="col-3 mb-2">
                <a href="{{route('showCategory', $child->id)}}" class="btn btn-primary btn-lg btn-block">{{$child->title_es}}</a>
              </div>
            @endforeach
          </div>
        </div>
      @endif




      @if (!$category->parent_id)
      <div id="accordion">
        <div class="card">
          <div class="card-header" id="headingOne">
            <h5 class="mb-0">
              <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                Agregar Sub Categoria
              </button>
            </h5>
          </div>
          <div id="collapseOne" class="collapse "aria-labelledby="headingOne" data-parent="#accordion">
            <div class="card-body">
              @include('admin.forms.category-children-form')
            </div>
          </div>
        </div>
      </div>


      <div id="accordion2">
        <div class="card">
          <div class="card-header" id="headingTwo">
            <h5 class="mb-0">
              <button class="btn btn-link" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                Agregar Atributos
              </button>
            </h5>
          </div>
          <div id="collapseTwo" class="collapse "aria-labelledby="headingTwo" data-parent="#accordion2">
            <div class="card-body">
              @include('admin.forms.add-attribute-form')
            </div>
          </div>
        </div>
      </div>
    @endif

      {{-- @if ($category->father()->count()>0) --}}
      @if ($category->parent_id)
        <div class="">
          <div id="accordionProduct">
            <div class="card">
              <div class="card-header" id="headingProduct">
                <h5 class="mb-0">
                  <button class="btn btn-link" data-toggle="collapse" data-target="#collapseProduct" aria-expanded="true" aria-controls="collapseProduct">
                    Agregar Producto
                  </button>
                </h5>
              </div>
              <div id="collapseProduct" class="collapse "aria-labelledby="headingProduct" data-parent="#accordionProduct">
                <div class="card-body">
                  @include('admin.forms.add-product-form')
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="">
          @include('admin.components.products-component', ['products'=>$category->products()->paginate(3)])
        </div>





      @endif





    @endisset

  </div>
@endsection
