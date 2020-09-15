let Web3 = require('web3')

let web3 = new Web3(window.web3.currentProvider)

console.log("My web3 is: ", web3.version)

module.exports = web3


