
const hre = require("hardhat");

async function main() {

    const [deployer] = await hre.ethers.getSigners();

    console.log(
      "Deploying contracts with the account:",
      deployer.address
    );

  const MyToken = await hre.ethers.getContractFactory("HASANTOKEN");
  const myToken = await MyToken.deploy('HASANTOKEN','HT','1000000000000000000000','100000');

  console.log("deployed at:", myToken.address);





}


main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
