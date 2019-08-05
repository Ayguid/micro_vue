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
        <div class="col-4">
          <h4 class="m-2">{{$category->father-> {'title_' . $lang} ?? $category->father->title_es}}->
            <a href="{{route('productsCat', $category->id)}}">
              {{$category-> {'title_' . $lang} ?? $category->title_es}}</a>
            </h4>
          </div>
          <div class="col-3">
            <a href="{{ url()->previous() }}" class="btn btn-secondary">Back</a>
          </div>
        </div>
      @endisset

      @isset($product)


        <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="datos-tab" data-toggle="tab" href="#datos" role="tab" aria-controls="datos" aria-selected="true">Datos</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="viewers-tab" data-toggle="tab" href="#viewers" role="tab" aria-controls="viewers" aria-selected="false">Visualizador</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="downloads-tab" data-toggle="tab" href="#downloads" role="tab" aria-controls="downloads" aria-selected="false">Descargas</a>
          </li>
        </ul>
        <div class="tab-content" id="myTabContent">

          <div class="tab-pane fade show active" id="datos" role="tabpanel" aria-labelledby="datos-tab">
            <div class="col-12 border mt-2 pt-2">

              <h5>Titulo : {{$product-> {'title_' . $lang} ?? $product->title_es}}  </h5>
              <h6>Codigo : {{$product->product_code}}</h6>
              @if ($admin)
                <a href="{{route('editProduct', $product->id)}}">edit</a>
              @endif

              <div class="row">
                <div class="col-4">
                  @if ($product->has_image)
                    @foreach ($files['images'] as $image)

                      <img class="productPic" width="100%" src="{{asset('storage/product_images/'.$image->file_path)}}" alt="">
                    @endforeach
                  @else
                    <img class="productPic" width="100%" src="{{asset('images/'.'default.jpeg')}}" alt="">
                  @endif

                  <p>
                    <b-button v-b-modal.modal-1>Solicitar Presupuesto</b-button>
                    <b-modal id="modal-1" title="Micro" :hide-footer="true" >
                      <contact-mail-form
                      :modal="'modal-1'"
                      :title="'Contactenos para solicitar un presupuesto'"
                      :image='{!! ($product->has_image)?json_encode(asset('storage/product_images/'.$files['images'][0]->file_path)):json_encode(asset('images/'.'default.jpeg')) !!}'
                      :to="'Comercial'"
                      :data='{!! json_encode($data=['product'=>$product, 'user'=>Auth::user()]) !!}'
                      ></contact-mail-form>
                    </b-modal>
                  </p>
                </div>

                <div class="col-8">

                  <div class="row">
                    <div class="col-12">
                      <h6>{{$product-> {'desc_' . $lang} ?? $product->desc_es}}</h6>
                    </div>
                  </div>

                  <div class="row">
                    @include('components.product-attributes')
                  </div>

                </div>
              </div>
            </div>

          </div>



          <div class="tab-pane fade" id="viewers" role="tabpanel" aria-labelledby="contact-tab">{{-- {{asset('storage/cads2d/FR_QBM1_G14_5U.dwg')}} --}}
            @if ($product->has_cad_3d)
              <iframe class="mb-3" id="viewers" src="{{asset('Online3DViewer-master/website/index.html')}}"  width="100%" height="500" frameborder="0" scrolling="no" allowfullscreen="allowfullscreen"></iframe>
            @else
              <div class="alert alert-info mt-3" role="alert">
                <p>Visualizador 3D no disponible.</p>
              </div>
            @endif
            @if ($product->has_cad_2d)
              <div id="d_container">
                <div id="tapador">MICRO SA</div>
                <div id="tapadorBottom"></div>
                <iframe onload=""  id="cadView" src="//sharecad.org/cadframe/load?url=https://ayguid.github.io/tryDWG/{{$files['dxfs'][0]->file_path}}" width="100%" height="500" frameborder="0" scrolling="no" allowfullscreen="allowfullscreen"></iframe>
              </div>
            @else
              <div class="alert alert-info" role="alert">
                <p>Visualizador 2D no disponible.</p>
              </div>
            @endif

          </div>



          <div class="tab-pane fade" id="downloads" role="tabpanel" aria-labelledby="downloads-tab">

            <h4>Pdf's</h4>
            @if ($product->has_pdf)
              @foreach ($files['pdfs'] as $pdf)
                <a target="_blank" class="btn" role="button" href="{{asset('storage/pdfs/'.$pdf->file_path)}}" >
                  <i class="far fa-file-pdf bigIcon"></i>{{$pdf->file_path}}</a>
                @endforeach
              @else
                <p>
                  No Contiene archivos Pdf.
                </p>
              @endif


              <h4>Zips's</h4>
              @if ($product->has_zip)
                @guest
                  <p>Por favor login/registrate para poder descargar los archivos</p>
                @else
                  @foreach ($files['zips'] as $zip)
                    <a target="_blank" class="btn" role="button" href="{{asset('storage/zips/'.$zip->file_path)}}" >
                      <i class="far fa-file-archive bigIcon"></i>{{$zip->file_path}}</a>
                    @endforeach
                  @endguest
                @else
                  <p>
                    No Contiene archivos Zip.
                    <p>
                      <b-button v-b-modal.modal-2>Solicitar Planos</b-button>
                      <b-modal id="modal-2" title="Micro" :hide-footer="true" >
                        <contact-mail-form
                        :modal="'modal-2'"
                        :title="'Complete el formulario para solicitar archivos CAD del producto.'"
                        :image='{!! ($product->has_image)?json_encode(asset('storage/product_images/'.$files['images'][0]->file_path)):json_encode(asset('images/'.'default.jpeg')) !!}'
                        :to="'Ingenieria'"
                        :data='{!! json_encode($data=['product'=>$product, 'user'=>Auth::user()]) !!}'
                        ></contact-mail-form>
                      </b-modal>
                    </p>
                  @endif
                </div>
              </div>
            @endisset


          </div>

        @endsection

        <script type="text/javascript">
        var hashLocate={!! $hash3d !!};
        </script>
