<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <p>{{message}}</p>
    <button v-on:click="hello()" >Log in</button>
  <HelloWorld msg="Welcome to Your Vue.js App"/>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import axios from 'axios'

export default {
  name: 'App',
  data: ()=>{
      return{
          message:"hi"
      }
  },
  components: {
    HelloWorld
  }, methods: {
      async hello(){
          console.log("helllo")
          this.message = await axios.get("https://8081-cs-515518291237-default.cs-europe-west1-iuzs.cloudshell.dev");
      }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
