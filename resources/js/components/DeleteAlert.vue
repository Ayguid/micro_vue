<template>
    <div class="">

    </div>


</template>

<script>

    export default {
      props:['who'],
        methods:{
          validateDelete:function(event){
            var currOb = this;
            document.getElementById(this.who).onsubmit=function(event){
              event.preventDefault();
              var target = event.target;
              currOb.$bvModal.msgBoxConfirm('Estas Seguro? THIS CANNOT BE UNDONE!')
              .then(value => {
                console.log(value);
                if (value) {
                  target.submit();
                }
              })
            }
          },
        },
        mounted() {
            console.log('Component mounted.');
            this.validateDelete();
        }
    }
</script>
