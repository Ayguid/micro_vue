<template>
  <div class="container">

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



    <!-- // ORIGINAL START


    <h6 >Code:   {{product.product_code}}</h6>
    {{product.title_es}}




    {{product}}

    <div v-for="att in product.attributes" class="">
    <h6>  <strong> {{att.attribute.name_es}} </strong>  </h6>
    <h6>{{$t(att.value)}}</h6>
    <h6>{{(att['value_'+$root.local])?att['value_'+$root.local]:att['value_es']}}</h6>
  </div>


  <div v-if="product.has_image" class="">
  <img v-for="file in product.files" width="100%" v-if="checkFileType(file.file_path)=='img'" :src="$root.baseUrl+'/storage/product_images/'+file.file_path" alt="">
  <img v-for="file in product.files" width="100%" v-if="$checkFileType(file.file_path)=='img'" :src="$root.baseUrl+'/storage/product_images/'+file.file_path" alt="">
</div>
<div v-else class="">
<img  width="100%" :src="$root.baseUrl+'/images/default.jpeg'" alt="">
</div>





<iframe v-if="product.has_cad_3d" class="mb-3" id="viewers" :src="$root.baseUrl+'/Online3DViewer-master/website/index.html'"  width="100%" height="500" frameborder="0" scrolling="no" allowfullscreen="allowfullscreen"></iframe>

// ORIGINAL END -->



<div class="tab-content" id="myTabContent">

  <div class="tab-pane fade show active" id="datos" role="tabpanel" aria-labelledby="datos-tab">
    <div class="col-12 border border-top-0 pt-2 pb-2">

      <h5> {{(product['title_'+$root.local])?product['title_'+$root.local]:product['title_es']}} </h5>

      <h6>Codigo :   {{product.product_code}}</h6>

      <!-- @if ($admin)
      <a href="{{route('editProduct', $product->id)}}">edit</a>
      @endif -->

      <div class="row">
        <div class="col-12 col-md-4 col-lg-4">
          <div v-if="product.has_image" class="">
            <!-- <img v-for="file in product.files" width="100%" v-if="checkFileType(file.file_path)=='img'" :src="$root.baseUrl+'/storage/product_images/'+file.file_path" alt=""> -->
            <img v-for="file in product.files" width="100%" v-if="$checkFileType(file.file_path)=='img'" :src="$root.baseUrl+'/storage/product_images/'+file.file_path" alt="">
          </div>

          <div v-else class="">
            <img  class="productPic" width="100%" :src="$root.baseUrl+'/storage/images/default.jpeg'" alt="">
          </div>


          <!-- <p>
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
      </p> -->
    </div>

    <div class="col-12 col-md-8 col-lg-8">

      <div class="row">
        <div class="col-12">
          <strong>Descripción : </strong>
          <h6> {{(product['desc_'+$root.local])?product['desc_'+$root.local]:product['desc_es']}}</h6>
          <hr>
        </div>
      </div>

      <div class="row">
        <div v-for="att in product.attributes" class="">
          <div v-if="att.attribute.filterable" class="col-12 col-md-6 col-lg-6">

            <h6>  <strong> {{att.attribute.name_es}} </strong>  </h6>
            <h6>{{$t(att.value)}}</h6>
            <!-- <h6>{{(att['value_'+$root.local])?att['value_'+$root.local]:att['value_es']}}</h6> -->
          </div>
        </div>
        <div v-for="att in product.attributes" class="">
          <div v-if="!att.attribute.filterable" class="col-12 col-md-6 col-lg-6">

            <h6>  <strong> {{att.attribute.name_es}} </strong>  </h6>
            <h6>{{$t(att.value)}}</h6>
            <!-- <h6>{{(att['value_'+$root.local])?att['value_'+$root.local]:att['value_es']}}</h6> -->
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

</div>



<div class="tab-pane fade" id="viewers" role="tabpanel" aria-labelledby="contact-tab">
  <div v-if="product.has_cad_3d" class="">
    <iframe class="mb-3" id="viewers" :src="$root.baseUrl+'/Online3DViewer-master/website/index.html'"  width="100%" height="500" frameborder="0" scrolling="no" allowfullscreen="allowfullscreen"></iframe>
  </div>

  <div v-else class="alert alert-info mt-3" role="alert">
    <p>Visualizador 3D no disponible.</p>
  </div>


  <div v-if="product.has_cad_2d" id="d_container">
    <div id="tapador">MICRO SA</div>
    <div id="tapadorBottom"></div>
    <!-- <iframe onload=""  id="cadView" src="//sharecad.org/cadframe/load?url=micro.plankwebdev.com/storage/dxfs/{{$files['dxfs'][0]->file_path}}" width="100%" height="500" frameborder="0" scrolling="no" allowfullscreen="allowfullscreen"></iframe> -->

  </div>

  <div v-else class="alert alert-info" role="alert">
    <p>Visualizador 2D no disponible.</p>
  </div>


</div>



<div class="tab-pane fade p-3" id="downloads" role="tabpanel" aria-labelledby="downloads-tab">

  <h4>Pdf's</h4>

  <div v-if="product.has_pdf" class="">
    <div class="">

      <!-- @foreach ($files['pdfs'] as $pdf) -->
      <!-- <a target="_blank" class="btn" role="button" href="{{asset('storage/pdfs/'.$pdf->file_path)}}" >
      <i class="far fa-file-pdf bigIcon"></i>{{$pdf->file_path}}</a> -->
    </div>
    <!-- @endforeach -->



  </div>
  <div v-else class="">


    <p>
      No Contiene archivos Pdf.
    </p>
  </div>



  <h4 class="pt-3">Zips's</h4>
  <div v-if="product.has_zip" class="">

    <!-- @guest
    <p>Por favor login/registrate para poder descargar los archivos</p>
    @else
    @foreach ($files['zips'] as $zip)
    <a target="_blank" class="btn" role="button" href="{{asset('storage/zips/'.$zip->file_path)}}" >
    <i class="far fa-file-archive bigIcon"></i>{{$zip->file_path}}</a>
    @endforeach
    @endguest -->


  </div>

  <div v-else class="">
    <p>
      No Contiene archivos Zip.
      <!-- <p>
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
  </p> -->
</div>

</div>
</div>




</div>
</template>

<script>
export default {
  props:['product'],
  data(){
    return  {
    }
  },
  methods:{

  },
  mounted() {
    if (this.product.has_cad_3d) {
      window.location.hash=this.$root.baseUrl+'/storage/stls/'+this.$checkFileStl(this.product.files).file_path;
    }
  }
}
</script>
