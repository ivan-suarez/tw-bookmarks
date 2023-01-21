<template>
    <p>Bookmarks!!!!</p>
</template>

<script>
export default {
    methods: {
        getBookmarks(params){
            console.log(params.query);
            const { state, code } = params.query;
            console.log(state);
            console.log(code);
        }
    }
}
</script>

<style>

</style>