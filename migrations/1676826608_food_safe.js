var FoodSafe = artifacts.require("./FoodSafe.sol");
module.exports = function(_deployer) {
  _deployer.deploy(FoodSafe);
};
