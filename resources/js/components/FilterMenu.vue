<template>
    <div class="row">

         <form id="filterForm" class="form-inline col-12 m-0 p-0" @change="emitFilterForm">
         <div v-for="catAtt in menudata.attributes" class="mb-3 col-3">
           <div class="input-group">
           <div class="input-group-prepend">
             <label class="input-group-text " for="">
               {{(catAtt['name_'+$root.local])?catAtt['name_'+$root.local]:catAtt['name_es']}}
             </label>
           </div>
           <select class="custom-select" :name="catAtt.id" >
             <option value="null" class="" >--</option>
             <option v-for="catVal in catAtt.uniqueValues"  :value="catVal.value" class="" :disabled="catVal.disabled" >
               {{catVal.value}}
             </option>
           </select>
         </div>
         </div>
       </form>


    </div>
</template>

<script>
    export default {
      props:['country','menudata'],
      data(){
        return  {
        }
      },
      methods:{
        emitFilterForm:function(){
          var form = document.getElementById('filterForm');
          this.$emit('filter', form);
        },

      },
      computed:{

      },

      mounted() {
      }
    }
</script>
