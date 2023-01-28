<template>
    <p>Bookmarks!!!!</p>
    <p>State: {{state}}</p>
    <p>Code: {{code}}</p>
    <bookmark-item v-for='item in bookmarks' :item='item' :key='item.id'></bookmark-item>

</template>

<script>
import axios from 'axios'
import BookmarkItem from '../components/BookmarkItem.vue'

export default {
  components: { BookmarkItem },
    data: () =>{
    return{
          state:"",
        code: "",
        bookmarks: null
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
            this.bookmarks = response.data
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
        this.bookmarks = response.data
    } 
}
</script>

<style>

</style>