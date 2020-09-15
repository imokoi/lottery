<template>
  <div id="app">
    <div>Hello World</div>
  </div>
</template>

<script>
let web3 = require("./utils/initWeb3.js")

export default {
  name: 'App',

  methods: {
    test: () => {
      console.log(web3)
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
