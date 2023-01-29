<template>
    <p>Bookmarks!!!!</p>
    <p>State: {{state}}</p>
    <p>Code: {{code}}</p>
    <button @click="exportToPDF">Export to PDF</button>
    <div id="element-to-convert">
    <bookmark-item v-for='item in bookmarks' :item='item' :key='item.id'></bookmark-item>
    </div>
</template>

<script>
import axios from 'axios'
import BookmarkItem from '../components/BookmarkItem.vue'
import html2pdf from "html2pdf.js"
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
      exportToPDF() {
			html2pdf(document.getElementById('element-to-convert'));
		},
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