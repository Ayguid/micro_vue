




<template>
  <div class="">

    <p class="mt-2 mb-2">
      {{(category.get_top_categories['title_'+$root.local])?category.get_top_categories['title_'+$root.local]:category.get_top_categories['title_es']}} -->
      {{(category['title_'+$root.local])?category['title_'+$root.local]:category['title_es']}}</p>

      <p class="">Productos Encontrados : <span v-html="totalRows"></span> </p>

      <filter-menu @filter='filterProducts'
      :country="this.country"
      :category="this.category"
      :menudata="this.menuData"
      :filterAtts="this.filterAtts"
      ></filter-menu>

      <div class="row">
        <product-component  v-for="product in products" :product='product' :key='product.id'></product-component>
      </div>

      <div class="" v-if="totalRows > perPage">
        <b-pagination
        @change="changePage"
        v-model="currentPage"
        align="center"
        limit="10"
        :total-rows="totalRows"
        :per-page="perPage"></b-pagination>
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
        filterAtts:'',
        menuData:'',
      }
    },
    methods:{
      fetchProducts:function(){
        axios.get('api/getProducts/'+this.country.id+'/'+this.category.id+'/'+this.filterAtts+'/'+'?page='+this.currentPage).then((response) => {
          console.log(response);
          this.menuData=response.data.menuData;
          this.products = response.data.products.data;
          this.perPage = response.data.products.per_page;
          this.totalRows = response.data.products.total;
        });
      },
      changePage:function(value){
        this.currentPage=value;
        this.fetchProducts();
      },

      filterProducts:function(obj){
        this.currentPage=1;
        this.filterAtts=this.toJSONString(obj);
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
        return JSON.stringify(obj);
      }
    },

    mounted() {
      this.fetchProducts();
    }

  }
  </script>
