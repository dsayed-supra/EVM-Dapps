const { Wallet, HDNodeWallet, ethers } = require("ethers") ;
const  dotenv = require("dotenv");
dotenv.config();

const mnemonic = process.env.MNEMONIC;


const provider = new ethers.JsonRpcProvider("https://rpc-evmstaging.supra.com/rpc/v1/eth");

const wallet = Wallet.fromPhrase(mnemonic);

const firstWallet = wallet.connect(provider);

const generateAccounts = () =>{
    const mnemonicc = ethers.Mnemonic.fromPhrase(mnemonic);
    let accounts = [];
    for (let index = 0; index < 10; index++) {
        const wallet = ethers.HDNodeWallet.fromMnemonic(mnemonicc, `m/44'/60'/0'/0/${index}`);
        console.log(wallet.address);
        accounts.push(wallet.address);
    }
    return accounts
}



const accounts = generateAccounts();

console.log('====================================');
console.log(accounts);
console.log('====================================');

const sendETH = async () => {
  for (let i = 0; i < accounts.length; i++) {
    const tx = {
      to: accounts[i],
      value: ethers.parseEther("1.0") 
    };
    console.log(`Sending 1 ETH to ${accounts[i]}...`);

    const txResponse = await firstWallet.sendTransaction(tx);
    console.log(`Transaction Hash: ${txResponse.hash}`);

    const receipt = await txResponse.wait();
    console.log(`Transaction confirmed for ${accounts[i].address}: Block ${receipt.blockNumber}`);
  }
};

sendETH().catch(console.error);

