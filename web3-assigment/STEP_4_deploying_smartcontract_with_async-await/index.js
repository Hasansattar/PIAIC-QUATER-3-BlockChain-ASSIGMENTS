const  Tx = require('ethereumjs-tx');
const Web3 = require('web3');
require('dotenv').config()
//const rpcurl="http://127.0.0:7545";

rpcURL=`https://rinkeby.infura.io/v3/${process.env.INFURA_URL}`;

const web3 = new Web3(rpcURL);
const account1=`${process.env.Account}`;
const account1_private_key=`${process.env.PRIVATE_KEY}`;
 

const
byteCode="608060405234801561001057600080fd5b5061012f806100206000396000f3fe6080604052348015600f57600080fd5b506004361060325760003560e01c80632e64cec11460375780636057361d146051575b600080fd5b603d6069565b6040516048919060c2565b60405180910390f35b6067600480360381019060639190608f565b6072565b005b60008054905090565b8060008190555050565b60008135905060898160e5565b92915050565b60006020828403121560a057600080fd5b600060ac84828501607c565b91505092915050565b60bc8160db565b82525050565b600060208201905060d5600083018460b5565b92915050565b6000819050919050565b60ec8160db565b811460f657600080fd5b5056fea264697066735822122090ac9eef537fc5749ba20e60add8ca1fbfb7e25adc3760910a42ec21a5dac7a964736f6c63430008000033";



const byteCodeBuffer= Buffer.from(byteCode, 'hex');
const privateKeyBuffer= Buffer.from(account1_private_key,'hex');

const contractDeployAsync= async()=>{
  try {
    let txCount= await web3.eth.getTransactionCount(account1);
    const txObject = {
            nonce:    web3.utils.toHex(txCount),
            gasLimit: web3.utils.toHex(1000000), // Raise the gas limit to a much higher amount
            gasPrice: web3.utils.toHex(web3.utils.toWei('10', 'gwei')),
            data: byteCodeBuffer
          }
           const tx=new Tx.Transaction(txObject,{'chain':'rinkeby'});
           tx.sign(privateKeyBuffer);
           const serializedTx=tx.serialize();
           const raw="0x"+serializedTx.toString('hex');


           let signedTransaction= await web3.eth.sendSignedTransaction(raw);
           console.log("SIGNED TRANSACTION",signedTransaction);
    
  } catch (error) {
    console.log("error",error)
  }

}

contractDeployAsync();

