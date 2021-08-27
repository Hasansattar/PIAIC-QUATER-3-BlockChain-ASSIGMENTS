  
/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 require("@nomiclabs/hardhat-waffle");
 require("@nomiclabs/hardhat-etherscan");
 require('dotenv').config()

 
const INFURA_URL_ID=`https://rinkeby.infura.io/v3/${process.env.INFURA_PROJECT}`;
const PRIVATE_KEY=`0x${process.env.PRIVATE_KEY_1}`;



 module.exports = {
  // paths: {
  //   artifacts: './src/artifacts',
  // },

  solidity: "0.8.0",
  networks:{
    localhost: {
      url: "http://127.0.0.1:8545"
    },
    hardhat: {
      chainId: 1337
    },
    rinkeby:{
      url:INFURA_URL_ID,
      accounts:[PRIVATE_KEY]
    },

  },
  //ehtereum API key
  etherscan: {
    apiKey: "ZT7NMAJNR62F53F28IYHFABAFV1WST8U77",
  }
}