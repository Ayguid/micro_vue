<template>
    <div class="container">

      <h6 >Code:   {{product.product_code}}</h6>
      {{product.title_es}}




      <!-- {{product}} -->

      <div v-for="att in product.attributes" class="">
        <h6>  <strong> {{att.attribute.name_es}} </strong>  </h6>
        <h6>{{$t(att.value)}}</h6>
        <!-- <h6>{{(att['value_'+$root.local])?att['value_'+$root.local]:att['value_es']}}</h6> -->
      </div>


      <div v-if="product.has_image" class="">
        <!-- <img v-for="file in product.files" width="100%" v-if="checkFileType(file.file_path)=='img'" :src="$root.baseUrl+'/storage/product_images/'+file.file_path" alt=""> -->
        <img v-for="file in product.files" width="100%" v-if="$checkFileType(file.file_path)=='img'" :src="$root.baseUrl+'/storage/product_images/'+file.file_path" alt="">
      </div>
      <div v-else class="">
        <img  width="100%" :src="$root.baseUrl+'/images/default.jpeg'" alt="">
      </div>





      <iframe v-if="product.has_cad_3d" class="mb-3" id="viewers" :src="$root.baseUrl+'/Online3DViewer-master/website/index.html'"  width="100%" height="500" frameborder="0" scrolling="no" allowfullscreen="allowfullscreen"></iframe>





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
