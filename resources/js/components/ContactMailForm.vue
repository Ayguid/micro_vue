<template>
  <div class="">



    <form class="" action="index.html" method="post" @submit="sendMail">
      <p>{{this.title}}</p>

      <div class="row">
        <div class="col-6">
          <input type="email" name="to" :value="this.department" hidden>
          <input type="text" name="locale" :value="this.locale" hidden>
          <input type="text" name="product" :value="JSON.stringify(this.data.product)" hidden>
          <h5>Product Title</h5>
          <p>{{this.data.product.title_es}}</p>
          <h5>Product Code</h5>
          <p>
            {{this.data.product.product_code}}
          </p>
          <div class="form-group">
            <label for="email">User Email</label><br>
            <input id="user_email" type="email" name="from" :value="(this.data.user)?this.data.user.email:''">
          </div>
        </div>
        <div class="col-6">
          <img :src="this.image" alt="" width="100%">
        </div>

      </div>

      <div class="form-group">
        <label for="email">Consultas adicionales</label><br>
        <textarea name="textArea" rows="6" ></textarea>
      </div>
      <input type="submit" class="btn btn-primary" name="Enviar" value="Enviar" >



    </form>









    <div class="vld-parent">
      <loading :active.sync="isLoading"
      :can-cancel="false"
      :on-cancel="onCancel"
      :is-full-page="fullPage"></loading>
    </div>

  </div>
</template>
<style media="screen">

textarea
{
  border:1px solid #999999;
  width:100%;
  margin:5px 0;
  padding:3px;
}

</style>

<script>

// Import component
import Loading from 'vue-loading-overlay';
// Import stylesheet
import 'vue-loading-overlay/dist/vue-loading.css';


export default {
  props: ['data', 'department', 'image', 'title', 'modal', 'locale'],
  data(){
    return  {
      contactUrl:'/api/send-mail/',
      isLoading: false,
      fullPage: true,
    }
  },
  components: {
    Loading
  },
  mounted() {

  },
  methods:{
    sendMail:function(event){
      event.preventDefault();
      var formData = new FormData(event.target);
      this.isLoading = true;
      axios.post(this.contactUrl,formData).then((response) => {
        this.isLoading = false;
        console.log(response);
        if (response.data.status == "error") {
          this.$swal({
            type: 'warning',
            title: 'Hubo un error',
            text: JSON.stringify(response.data.errors)
          });
        }
        if (response.data.status == "ok") {
          this.$swal(response.data.message);
          this.$bvModal.hide(this.modal);
        }
      });

    },

    onCancel: function() {
      console.log('User cancelled the loader.')
    }
  }
}
</script>
