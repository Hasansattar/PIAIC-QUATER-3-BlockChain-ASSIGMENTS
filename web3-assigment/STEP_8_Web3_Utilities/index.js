const Web3 = require("web3");
require("dotenv").config();
//const rpcurl="http://127.0.0:7545";

rpcURL = `https://rinkeby.infura.io/v3/${process.env.INFURA_URL}`;
const web3 = new Web3(rpcURL);

const utilitiesAsync = async () => {
  try {
    // Get average gas price in wei from last few blocks median gas price
   const getGasPrice =await web3.eth.getGasPrice();
   console.log("gas price in wei",getGasPrice);
   const result = await web3.utils.fromWei(getGasPrice, 'ether')
   console.log("gas price in ether",result);

// Use sha256 Hashing function
   const shaHash= await web3.utils.sha3('Dapp University');
   console.log("get sha256 hash",shaHash)

// Use keccak256 Hashing function (alias)
   const keccak256= await web3.utils.keccak256('Dapp University');
   console.log("get keccak256 hash",keccak256)

// Get a Random Hex
   const randomHex=await web3.utils.randomHex(32);
   console.log("random hex", randomHex);

   // Get access to the underscore JS library

  } catch (error) {
    console.log("error", error);
  }
};

utilitiesAsync();
