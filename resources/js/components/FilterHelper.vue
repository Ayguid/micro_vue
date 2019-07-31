<template>
    <div class="filter-helper">
       <slot></slot>
    </div>





</template>

<script>
    export default {
      props:['who', 'display'],
      methods:{
        helpForm:function(elm){
          var obj=this;
          var form = document.getElementById(elm);
          form.onchange = function(e){
            axios.get('/api/filterSearch?'+obj.serialize(this))
            .then(function (response) {
              // handle success
              var elmnt=document.getElementById(obj.display)
              response?(elmnt.innerHTML=response.data):(elmnt.innerHTML='');
              console.log(response);
            })
            .catch(function (error) {
              // handle error
              console.log(error);
            })
            .finally(function () {
              // always executed
            });
          }
        },
        serialize:function(form){
          var data;
          var i, j, q = [];
          for (i = form.elements.length - 1; i >= 0; i = i - 1) {
            if (form.elements[i].name === "") {
              continue;
            }
            switch (form.elements[i].nodeName) {
              case 'INPUT':
              switch (form.elements[i].type) {
                case 'hidden':
                case 'number':
                q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                break;
              }
              break;
              case 'SELECT':
              switch (form.elements[i].type) {
                case 'select-one':
                q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].value));
                break;
                case 'select-multiple':
                for (j = form.elements[i].options.length - 1; j >= 0; j = j - 1) {
                  if (form.elements[i].options[j].selected) {
                    q.push(form.elements[i].name + "=" + encodeURIComponent(form.elements[i].options[j].value));
                  }
                }
                break;
              }
              break;

            }
          }
          data = q.join("&");
          return data;
        }


      },
        mounted() {
          this.helpForm(this.who);
        }
    }
</script>
