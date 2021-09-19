const Web3 = require("web3");
require("dotenv").config();
//const rpcurl="http://127.0.0:7545";

rpcURL = `https://rinkeby.infura.io/v3/${process.env.INFURA_URL}`;
const web3 = new Web3(rpcURL);

contract_Address = "0x64e4017FfbB2DDd7cef06eD3b7d583493008Cb12";

const ABI = [
  {
    anonymous: false,
    inputs: [
      {
        indexed: false,
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    name: "NumberCall",
    type: "event",
  },
  {
    inputs: [],
    name: "retrieve",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "num",
        type: "uint256",
      },
    ],
    name: "store",
    outputs: [
      {
        internalType: "uint256",
        name: "",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
];

const contractMethodAsync = async () => {
  try {
    const contract = new web3.eth.Contract(ABI, contract_Address);
    let getAllEvent = await contract.getPastEvents("AllEvents", {
      fromBlock: 0,
      toBlock: "latest",
    });
    console.log("get All Events", getAllEvent);
  } catch (error) {
    console.log("error", error);
  }
};

contractMethodAsync();
