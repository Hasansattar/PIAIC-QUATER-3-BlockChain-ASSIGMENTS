const Web3 = require("web3");
require("dotenv").config();
//const rpcurl="http://127.0.0:7545";

rpcURL = `https://rinkeby.infura.io/v3/${process.env.INFURA_URL}`;
const web3 = new Web3(rpcURL);

const getBlockNumberAsync = async () => {
  try {
    // get latest block number
    const blockNumber = await web3.eth.getBlockNumber();
    console.log("get block number", blockNumber);
    // get latest block
    const getLatestBlock = await web3.eth.getBlock("latest");
    console.log("get latest block", getLatestBlock);

    // get latest 10 blocks
    const latest = await web3.eth.getBlockNumber();
    for (let i = 0; i < 10; i++) {
      const tenBlockNumber = await web3.eth.getBlock(latest - i);
      console.log("get ten Block kNumber", tenBlockNumber);
    }

    // get transaction from specific block
    transactionHash =
      "0x53cf2353593955534c550f325f01af9911ca4a37818b7da18a7740d7e2b40b0e";
    const getTransactionBlock = await web3.eth.getTransactionFromBlock(
      transactionHash,
      2
    );

    console.log("get transaction of specific block", getTransactionBlock);
  } catch (error) {
    console.log("error", error);
  }
};

getBlockNumberAsync();
