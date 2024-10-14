// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract TestContract {

    address  public owner;

    constructor()  {
        owner = msg.sender;
    }

    function changeOwner(address _newOwner) public {
        require(msg.sender == owner, "Only owner can call this method");
        owner = _newOwner;
    }

    function getOwner() public view returns(address) {
        return owner;
    }
}
