
const Migrations = artifacts.require("Migrations");
const Shards = artifacts.require("../contracts/MonstersOnTheWay");
const Cards = artifacts.require("../contracts/MonstersOnTheWayCards")

module.exports = async function (deployer) {
  await deployer.deploy(Shards);
  await deployer.deploy(Cards);
};
