const  Tx = require('ethereumjs-tx').Transaction;
const Web3 = require('web3');
require('dotenv').config()
//const rpcurl="http://127.0.0:7545";
rpcURL=`https://rinkeby.infura.io/v3/55ed44eac9054342affffcd192c1df86`;
const account1="0x0b9B5719AA7181cFd71f86b0BA3f27FA561D6Aa5";
const account1_private_key=`${process.env.PRIVATE_KEY}`;
const account2="0xfE416Da6B49b8807fea2dFe19950d528603b00bA";

const web3 = new Web3(rpcURL);

   
const privateKey1 = Buffer.from(account1_private_key, 'hex')
     
web3.eth.getTransactionCount(account1, (err, txCount) => {
  console.log("value of nonce",txCount)  
  const txObject = {
      nonce:    web3.utils.toHex(txCount),
      to:       account2,
      value:    web3.utils.toHex(web3.utils.toWei('0.1', 'ether')),
      gasLimit: web3.utils.toHex(21000),
      gasPrice: web3.utils.toHex(web3.utils.toWei('10', 'gwei'))
    }
      const tx = new Tx(txObject ,{'chain':'rinkeby'} );
      tx.sign(privateKey1)

const serializedTx = tx.serialize();
const raw = '0x' + serializedTx.toString('hex')


web3.eth.sendSignedTransaction(raw, (err, txHash) => {
 if(!err){
  console.log('TRANSACTION SUCCESSFUL:', txHash)
 }
 else{
  console.log('TRANSACTION Error:', txHash)
 }
  
})
    
  })


