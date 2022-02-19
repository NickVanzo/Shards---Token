const Migrations = artifacts.require("Migrations");
const Shards = artifacts.require("../contracts/Shards");

module.exports = async function (deployer) {
  await deployer.deploy(Shards);
};
