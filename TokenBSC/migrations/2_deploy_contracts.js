
const Impl = artifacts.require("../contracts/MonstersOnTheWay");
const Proxy = artifacts.require("../contracts/MonstersOnTheWayProxy");

module.exports = async function (deployer) {
  let proxy = await deployer.deploy(Proxy, '0xeac9852225Aa941Fa8EA2E949e733e2329f42195');
  let cards = await deployer.deploy(Impl, Proxy.address);
};
