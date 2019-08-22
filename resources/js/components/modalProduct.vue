<template>
    <div class="container">

      {{product.title_es}}



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
          checkFileStl:function(fls){
            for (var i = 0; i < fls.length; i++) {
              if (fls[i].file_path.split('.').pop()=='stl') {
                return fls[i];
              }
            }
          },
        },
        mounted() {
          if (this.product.has_cad_3d) {
          window.location.hash=this.$root.baseUrl+'/storage/stls/'+this.checkFileStl(this.product.files).file_path;
          }
        }

    }
</script>
