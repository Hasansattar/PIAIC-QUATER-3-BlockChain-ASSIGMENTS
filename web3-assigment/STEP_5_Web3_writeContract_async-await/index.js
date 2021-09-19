const  Tx = require('ethereumjs-tx');
const Web3 = require('web3');
require('dotenv').config()
//const rpcurl="http://127.0.0:7545";

rpcURL=`https://rinkeby.infura.io/v3/${process.env.INFURA_URL}`;

const web3 = new Web3(rpcURL);
const account1=`${process.env.Account}`;
const account1_private_key=`${process.env.PRIVATE_KEY}`;
contract_Address="0x794c572e2b3C3bD3d8bc6064bD8e48295099Fc84"

const privateKeyBuffer= Buffer.from(account1_private_key,'hex');

const ABI=[
	{
		"inputs": [],
		"name": "retrieve",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "num",
				"type": "uint256"
			}
		],
		"name": "store",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
]





const contractMethodAsync=async()=>{
  try {
	const contract=new web3.eth.Contract(ABI,contract_Address);

	let txCount= await web3.eth.getTransactionCount(account1);
    //Build a transaction object
    const txObject = {
            nonce:    web3.utils.toHex(txCount),
			to:contract_Address,
            gasLimit: web3.utils.toHex(1000000), // Raise the gas limit to a much higher amount
            gasPrice: web3.utils.toHex(web3.utils.toWei('10', 'gwei')),
            data: contract.methods.store(25).encodeABI(),
          }


		  //Sign the transaction
		  const tx=new Tx.Transaction(txObject,{'chain':'rinkeby'});
		  tx.sign(privateKeyBuffer);
		  const serializedTx=tx.serialize();
		  const raw="0x"+serializedTx.toString('hex');

				//Broadcast the transtion
		  let signedTransaction= await web3.eth.sendSignedTransaction(raw);
		  console.log("SIGNED TRANSACTION",signedTransaction);
    

  } catch (error) {
    console.log("error",error)
  }

}

contractMethodAsync()