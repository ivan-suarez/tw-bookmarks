<template>
    <p> this is a bookmark </p>
    <p>{{item}}</p>
</template>

<script>


export default {
    name: 'HelloWorld',
  props: {
    item: {
        type: Object,
        required: true
    }
  }
}
</script>
