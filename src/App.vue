<template>
  <div id="app">
    <div>Hello World</div>
    <div>{{ manager }}</div>
  </div>
</template>

<script>
let lotteryInstance = require("./eth/lotteryInstance.js")
export default {
  name: 'App',
  data: () => {
    return {
      manager: "hello",
      winner: "",
    }
  },
  beforeMount: async function() {
    let manager = await lotteryInstance.methods.manager().call()
    this.manager = manager
  },
  methods: {
    test: () => {
      console.log(lotteryInstance)
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
