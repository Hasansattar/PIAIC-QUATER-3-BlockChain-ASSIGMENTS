const ERC20 = artifacts.require("ERC20");

module.exports =async function (deployer,network,accounts) {
 await deployer.deploy(ERC20);
};
