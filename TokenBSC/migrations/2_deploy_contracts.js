
const Impl = artifacts.require("../contracts/MonstersOnTheWay");
const Proxy = artifacts.require("../contracts/MonstersOnTheWayProxy");

module.exports = async function (deployer) {
  // let proxy = await deployer.deploy(Proxy);
  let cards = await deployer.deploy(Impl, Proxy.address, "0");
};
