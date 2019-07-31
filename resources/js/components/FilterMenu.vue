<template>
    <div class="">


         <form id="filterForm" class="form-inline" @change="emitFilterForm">

         <div v-for="catAtt in this.categoryatts" class="input-group mb-3 col-3">
           <div class="input-group-prepend">
             <label class="input-group-text " for="">
               {{(catAtt['name_'+$root.local])?catAtt['name_'+$root.local]:catAtt['name_es']}}
             </label>
           </div>
           <select class="custom-select" :name="catAtt.id" >
             <option value="null" class="">--</option>
             <option v-for="catVal in catAtt.uniqueValues"  :value="catVal.value" class="">
               {{catVal.value}}
             </option>
           </select>
         </div>
       </form>


    </div>
</template>

<script>
    export default {
      props:['country', 'category'],
      data(){
        return  {
          url:'api/',
          categoryatts:'',
        }
      },
      methods:{
        emitFilterForm:function(){
          var form = document.getElementById('filterForm');
          this.$emit('filter', form)
        },
        getCatAttributes:function(){
          var obj = this;
          axios.get(this.url+'getMenu?country_id='+this.country.id+'&category_id='+this.category.id)
          .then(function (response) {
            // handle success
            obj.categoryatts= response.data.attributes;
          })
          .catch(function (error) {
            // handle error
          })
          .finally(function () {
            // always executed
          });
        },
        find:function(){

        }


      },
      computed:{
        
      },

      mounted() {
        this.getCatAttributes();
      }
    }
</script>
