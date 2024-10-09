// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/cryptography/EIP712.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Votes.sol";

contract MyToken is ERC721, ERC721Enumerable, ERC721URIStorage, ERC721Pausable, Ownable, ERC721Burnable, EIP712, ERC721Votes {
    uint256 private _nextTokenId;

    constructor(address initialOwner)
        ERC721("MyToken", "MTK")
        Ownable(initialOwner)
        EIP712("MyToken", "1")
    {}

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable, ERC721Pausable, ERC721Votes)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable, ERC721Votes)
    {
        super._increaseBalance(account, value);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    uint256[10000] public largeArray1;
    uint256[10000] public largeArray2;
    uint256[10000] public largeArray3;
    uint256[10000] public largeArray4;
    uint256[10000] public largeArray5;

    uint256[10000] public largeArray10;
    uint256[10000] public largeArray20;
    uint256[10000] public largeArray30;
    uint256[10000] public largeArray40;
    uint256[10000] public largeArray50;

    uint256[10000] public largeArray60;
    uint256[10000] public largeArray70;
    uint256[10000] public largeArray80;
    uint256[10000] public largeArray90;
    uint256[10000] public largeArray100;

     function updateLargeArray10(uint256 index, uint256 value) public {
        require(index < largeArray10.length, "Index out of bounds");
        largeArray10[index] = value;
    }

    // Update function for largeArray20
    function updateLargeArray20(uint256 index, uint256 value) public {
        require(index < largeArray20.length, "Index out of bounds");
        largeArray20[index] = value;
    }

    // Update function for largeArray30
    function updateLargeArray30(uint256 index, uint256 value) public {
        require(index < largeArray30.length, "Index out of bounds");
        largeArray30[index] = value;
    }

    // Update function for largeArray40
    function updateLargeArray40(uint256 index, uint256 value) public {
        require(index < largeArray40.length, "Index out of bounds");
        largeArray40[index] = value;
    }

    // Update function for largeArray50
    function updateLargeArray50(uint256 index, uint256 value) public {
        require(index < largeArray50.length, "Index out of bounds");
        largeArray50[index] = value;
    }

    // Update function for largeArray60
    function updateLargeArray60(uint256 index, uint256 value) public {
        require(index < largeArray60.length, "Index out of bounds");
        largeArray60[index] = value;
    }

    // Update function for largeArray70
    function updateLargeArray70(uint256 index, uint256 value) public {
        require(index < largeArray70.length, "Index out of bounds");
        largeArray70[index] = value;
    }

    // Update function for largeArray80
    function updateLargeArray80(uint256 index, uint256 value) public {
        require(index < largeArray80.length, "Index out of bounds");
        largeArray80[index] = value;
    }

    // Update function for largeArray90
    function updateLargeArray90(uint256 index, uint256 value) public {
        require(index < largeArray90.length, "Index out of bounds");
        largeArray90[index] = value;
    }

    // Update function for largeArray100
    function updateLargeArray100(uint256 index, uint256 value) public {
        require(index < largeArray100.length, "Index out of bounds");
        largeArray100[index] = value;
    }
    
    // Repeated functions to inflate the bytecode size
    function setArrayValue1(uint256 index, uint256 value) public {
        require(index < largeArray1.length, "Index out of bounds");
        largeArray1[index] = value;
    }

    function setArrayValue2(uint256 index, uint256 value) public {
        require(index < largeArray2.length, "Index out of bounds");
        largeArray2[index] = value;
    }

    function setArrayValue3(uint256 index, uint256 value) public {
        require(index < largeArray3.length, "Index out of bounds");
        largeArray3[index] = value;
    }

    function setArrayValue4(uint256 index, uint256 value) public {
        require(index < largeArray4.length, "Index out of bounds");
        largeArray4[index] = value;
    }

    function setArrayValue5(uint256 index, uint256 value) public {
        require(index < largeArray5.length, "Index out of bounds");
        largeArray5[index] = value;
    }

    // Add many more functions to inflate the bytecode
    function dummyFunction1() public pure returns (uint256) {
        return 1;
    }

    function dummyFunction2() public pure returns (uint256) {
        return 2;
    }

    // (Repeat as needed to grow the contract size)
    function dummyFunction100() public pure returns (uint256) {
        return 100;
    }
}

