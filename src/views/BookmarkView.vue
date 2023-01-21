<template>
    <p>Bookmarks!!!!</p>
    <p>State: {{state}}</p>
    <p>Code: {{code}}</p>
    <p>Bookmarks: {{bookmarks}}</p>
</template>

<script>
import axios from 'axios'

export default {
    data: () =>{
    return{
          state:"",
        code: "",
        bookmarks: "ok"
      }
    },
    methods: {
        async getBookmarks(params){
            console.log(params.query);
            const { state, code } = params.query;
            console.log(state);
            console.log(code);
            this.state = state;
            this.code = code;
            //const response = await axios.get("http://localhost:8081/generateUrl");
            console.log('sending this');
            console.log(params);
            const response = await axios.post("http://localhost:8081/getBookmarks", {url: params});
            console.log(response);
            this.bookmarks = response.data[0]
            console.log(this.bookmarks);
        }
    },
    async mounted(){
        console.log("mounted")
        console.log(this.$route.query);
        const params = this.$route;
        console.log(this.bookmarks);
        const response = await axios.post("http://localhost:8081/getBookmarks", {url: params});
        console.log(response);
        this.bookmarks = response.data[0]
    } 
}
</script>

<style>

</style>