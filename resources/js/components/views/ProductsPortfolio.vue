<template>
  <div class="">



    <filter-menu @filter='filterProducts'
    :country="this.country"
    :category="this.category"
    ></filter-menu>



    <div class="row">
      <product-component  v-for="product in products" :product='product' :key='product.id'></product-component>
    </div>

    <div class="row" v-if="totalRows>1">
      <b-pagination
      @change="changePage"
      v-model="currentPage"
      :total-rows="totalRows"
      :per-page="perPage"></b-pagination>
    </div>


  </div>




</div>
</template>

<script>
export default {
  props:['country', 'category'],
  data(){
    return  {
      products:{},
      perPage: 0,
      currentPage: 1,
      totalRows:'',
      atts:'',
    }
  },
  methods:{
    fetchProducts:function(){
      axios.get('api/getProducts/'+this.country.id+'/'+this.category.id+'/'+this.atts+'/'+'?page='+this.currentPage).then((response) => {
        this.products = response.data.data;
        this.perPage = response.data.per_page;
        this.totalRows=response.data.total;
        console.log(response);
      });
    },

    changePage:function(value){
      this.currentPage=value;
      this.fetchProducts();
    },
    filterProducts:function(obj){
      this.currentPage=1;
      this.atts=this.toJSONString(obj);
      this.fetchProducts();
    },

    toJSONString:function (form) {
      var obj ={} ;
      var elements = form.querySelectorAll( "input, select, textarea" );
      for( var i = 0; i < elements.length; ++i ) {
        var element = elements[i];
        var name = element.name;
        var value = element.value;
        if( name ) {
          obj[ name ] = value;
        }
      }
      return JSON.stringify( obj );
    }


  },

  mounted() {
    this.fetchProducts();
  }

}
</script>
