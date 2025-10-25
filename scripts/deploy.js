const hre = require("hardhat");

async function main() {
  const QuantumLedger = await hre.ethers.getContractFactory("QuantumLedger");
  const ledger = await QuantumLedger.deploy();
  await ledger.waitForDeployment();

  console.log("QuantumLedger deployed to:", await ledger.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
