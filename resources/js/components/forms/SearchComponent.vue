<template>
    <div class="">

      <form id="searchForm" action="" method="get" class="form-inline my-2 my-lg-0" @submit="validateSearch">
        <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="search" name="query">
        <button class="btn btn-outline-success my-2 my-sm-0" name="search" type="submit">Search</button>
      </form>

    </div>
</template>

<script>
    export default {
      props:[],
      data(){
        return  {

        }
      },
      methods:{
        validateSearch:function(event){
          event.preventDefault();
          var form = this.$el.children[0];
          if (form.elements.query.value) {
            axios.get('/searchProduct/'+form.elements.query.value)
            .then(function (response) {
              if (response.data=='Not found') {
                form.elements.query.value="not found";
              }
              else {
                form.submit();
              }
            })
            .catch(function (error) {
              // handle error
            })
            .finally(function () {
              // always executed
            });
          }
        },



      },
      mounted() {
      }
    }
</script>
