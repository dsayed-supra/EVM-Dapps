const {ethers} = require('hardhat');

const {expect} = require('chai')

describe("Test", function () {
  let test;
  before( async () => {
    [owner, newOwner,randomUser] = await ethers.getSigners();
    const Test = await ethers.getContractFactory("TestContract") ;
    test = await Test.connect(owner).deploy();
    await test.waitForDeployment()
    console.log('====================================');
    console.log("Test contract address", test.target);
    console.log('====================================');
  });

  it("Positive: change owner of the  contract ", async function () {
    const tx = await test.connect(owner).changeOwner(newOwner.address);
    await tx.wait();
  
    expect(await test.getOwner()).to.equal(newOwner.address);
  })

  it("Negative: It should not allow non-owner to change the ownership of contract", async function (){
    await expect(test.connect(randomUser).changeOwner(randomUser.address)).to.be.revertedWith('Only owner can call this method');
  })


})
