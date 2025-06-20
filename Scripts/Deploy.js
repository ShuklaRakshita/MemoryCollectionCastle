const hre = require("hardhat");

async function main() {
  const MemoryCastleCollection = await hre.ethers.getContractFactory("MemoryCastleCollection");
  const contract = await MemoryCastleCollection.deploy();

  await contract.deployed();

  console.log(`MemoryCastleCollection deployed to: ${contract.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
