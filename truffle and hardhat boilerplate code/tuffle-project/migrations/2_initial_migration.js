const HasanToken = artifacts.require("HasanToken");

module.exports = async function (deployer,network,accounts) {
    await deployer.deploy(HasanToken);
};
