var ConvertLib = artifacts.require("./ConvertLib.sol");
var Rcash = artifacts.require("./Rcash.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, Rcash);
  deployer.deploy(Rcash);
};
