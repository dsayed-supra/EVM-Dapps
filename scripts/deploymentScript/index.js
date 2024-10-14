const { ethers } = require("ethers");

const bytecode = ""; // Replace with your contract's bytecode
const abi = [];
async function main() {
   
  // Provider - connect to your custom network using the RPC URL from .env
  const provider = new ethers.JsonRpcProvider(
    "https://rpc-evmstaging.supra.com/rpc/v1/eth"
  );

  // Wallet - sign transactions using your private key
  const wallet = new ethers.Wallet(
    "Private key",
    provider
  );

  // Create a contract factory for deployment
  const contractFactory = new ethers.ContractFactory(abi, bytecode, wallet);

  console.log("Deploying contract...");

  const contract = await contractFactory.deploy();

  await contract.waitForDeployment()

  console.log("Contract deployed at:", contract.target);
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});