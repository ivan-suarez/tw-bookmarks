<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <p>{{message}}</p>
    <button v-on:click="hello()" >Log in</button>
    <input type="text" v-model="callbackurl">
    <button v-on:click="getBookmarks()" >Get bookmarks</button>
  <p>{{tweets}}</p>
</template>

<script>
import axios from 'axios'

export default {
  name: 'App',
  data: ()=>{
      return{
          message:"hi",
          tweets:"",
          callbackurl:""
      }
  },methods: {
      async hello(){
          console.log("helllo")
          const response = await axios.get("http://localhost:8081/generateUrl");
          this.message = response.data;
          // this.message = "hello";
      },
      async getBookmarks(){
          console.log(this.callbackurl);
          const response = await axios.post("http://localhost:8081/getBookmarks", {url: this.callbackurl});
          this.tweets = response.data;
          //this.message = response.data;
          // this.message = "hello";
      },
      onInput(e){
        this.callbackurl = e.target.value;
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
