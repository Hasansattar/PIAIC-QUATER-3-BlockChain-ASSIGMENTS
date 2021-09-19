const Web3 = require('web3')
//const rpcurl="http://127.0.0:7545";
rpcURL=`https://rinkeby.infura.io/v3/55ed44eac9054342affffcd192c1df86`;
 

const web3 = new Web3(rpcURL);

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



contract_Address="0x794c572e2b3C3bD3d8bc6064bD8e48295099Fc84"


  const contract = new web3.eth.Contract(ABI, contract_Address)

  contract.methods.retrieve().call((err, result) => { console.log(result) })