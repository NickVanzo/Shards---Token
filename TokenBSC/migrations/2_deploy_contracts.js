
const Shards = artifacts.require("../contracts/MonstersOnTheWay");
const Cards = artifacts.require("../contracts/MonstersOnTheWayCards")

module.exports = async function (deployer) {
  let contract = await deployer.deploy(Shards);
  await deployer.deploy(Cards, Shards.address);
};
