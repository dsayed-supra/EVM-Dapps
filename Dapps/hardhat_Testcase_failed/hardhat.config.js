require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  networks:{
    supra:{
      url:`https://rpc-evmstaging.supra.com/rpc/v1/eth`,
      accounts: {
        mnemonic:process.env.SUPRAMNEMONIC, //paste your mnemonic key 
        path: "m/44'/60'/0'/0",
        initialIndex: 0,
        count: 20,
        passphrase: "",
      },
    },
    sepolia:{
      url:`https://eth-sepolia.g.alchemy.com/v2/6VIk-hwmxSKdcxCMiZPKqE4P0mprIa3w`,
      accounts: {
        mnemonic:process.env.SEPOLIAMNEMONIC, //paste your mnemonic key 
        path: "m/44'/60'/0'/0",
        initialIndex: 0,
        count: 20,
        passphrase: "",
      },
    }
  }
};
