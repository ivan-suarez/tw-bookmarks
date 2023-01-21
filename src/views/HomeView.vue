<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App"/>
    <p>{{message}}</p>
    <button v-on:click="hello()" >Log in</button>
  </div>
</template>

<script>
// @ is an alias to /src
import axios from 'axios'
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'HomeView',
  data: () =>{
    return{
          message:"hi"
      }
  },
  components: {
    HelloWorld
  },
  methods: {
    async hello(){
      console.log("helllo")
      const response = await axios.get("http://localhost:8081/generateUrl");
      this.message = response.data;
      window.location.href = this.message;
    }
  }
 
}
</script>
