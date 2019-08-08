<template>

  <div class="col-12 col-md-4 col-lg-3">

    <transition name="fade"appear >

      <div class="card">
         <h6 v-if="product.category" class="p-2"><span>Categoria: </span> <a :href="$root.baseUrl+'/cat/'+product.category.id">{{product.category.title_es}}</a> </h6>
        <div class="card-header">{{(product['title_'+$root.local])?product['title_'+$root.local]:product['title_es']}}</div>
        <div class="card-body">
          <a :href="$root.baseUrl+'/showProduct/'+product.id">
          <h6>Title:  {{(product['title_'+$root.local])?product['title_'+$root.local]:product['title_es']}}</h6>
          <h6>Code:   {{product.product_code}}</h6>
          <h6>Desc:   {{(product['desc_'+$root.local])?product['desc_'+$root.local]:product['desc_es']}}</h6>
        </a>
        <div v-if="product.has_image" class="">
          <img v-for="file in product.files" width="100%" v-if="checkFileType(file.file_path)=='img'" :src="$root.baseUrl+'/storage/product_images/'+file.file_path" alt="">
        </div>
        <div v-else class="">
          <img  width="100%" :src="$root.baseUrl+'/images/default.jpeg'" alt="">
        </div>
        <div class="p-2">
          <div v-for="att in product.attributes" v-if="att.attribute.filterable"  class="">
            <h6>  <strong> {{att.attribute.name_es}} </strong>  </h6>
            <h6>{{att.value}}</h6>
          </div>
        </div>
      </div>

      </div>
    </transition>

  </div>

</template>
<script>

export default {
  props:['product'],
  data(){
    return  {
    }
  },
  components: {},
  methods: {
    checkFileType:function(fl){
      if (fl.split('.').pop()=='png'||fl.split('.').pop()=='jpg') {
        return 'img';
      }
    },
  },

  mounted() {
  }

}
</script>
