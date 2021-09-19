const Web3 = require('web3')
//const rpcurl="http://127.0.0:7545";
rpcURL=`https://rinkeby.infura.io/v3/55ed44eac9054342affffcd192c1df86`;
const account="0x0b9B5719AA7181cFd71f86b0BA3f27FA561D6Aa5";
//const private_key=`${process.env.PRIVATE_KEY}`;

const web3 = new Web3(rpcURL);

web3.eth.getBalance(account, (err, wei) => {
    console.log("balnace in wei",wei)
    balance = web3.utils.fromWei(wei, 'ether')
    console.log("balnace in ether",balance)
  })