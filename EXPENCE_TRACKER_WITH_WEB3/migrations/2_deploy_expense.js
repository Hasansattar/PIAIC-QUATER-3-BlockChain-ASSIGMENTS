const ExpenseTracker = artifacts.require("ExpenseTracker.sol");

module.exports = function(deployer) {
  deployer.deploy(ExpenseTracker);
};
