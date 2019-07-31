<template>

  <div class="col-3">

    <transition name="fade"appear >

      <div class="card">
         <h6 v-if="product.category" class="p-2"><span>Categoria: </span> <a :href="'../cat/'+product.category.id">{{product.category.title_es}}</a> </h6>
        <a :href="'../showProduct/'+product.id">
        <div class="card-header">{{(product['title_'+$root.local])?product['title_'+$root.local]:product['title_es']}}</div>
        <div class="card-body">
          Title:  {{(product['title_'+$root.local])?product['title_'+$root.local]:product['title_es']}}<br>
          Code:   {{product.product_code}}<br>
          Desc:   {{(product['desc_'+$root.local])?product['desc_'+$root.local]:product['desc_es']}}<br>
        </div>
        </a>
        <div class="p-2">
          <div v-for="att in product.attributes" class="">
            <h5>{{att.attribute.name_es}}</h5>
            <h5>{{att.value}}</h5>
          </div>
        </div>
        <div v-if="product.has_image" class="">
          <img v-for="file in product.files" width="100%" v-if="checkFileType(file.file_path)=='img'" :src="filePath+'product_images/'+file.file_path" alt="">
        </div>
        <div v-else class="">
          <img  :src="'../../images/default.jpeg'" alt="">
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
      filePath:'../../storage/',
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
