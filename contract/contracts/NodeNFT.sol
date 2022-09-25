// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IRewardManager.sol";
import "./Admin.sol";

contract NodeNFT is ERC721Enumerable, Ownable, Admin {
    string _baseTokenURI;

    // Node details
    struct NodeDetail {
        uint createdAt;
        uint232 deducted;
    }

    mapping(uint256 => NodeDetail) public nodeDetails;

    // _paused is used to pause the contract in case of an emergency
    bool public _paused;

    // total number of tokenIds minted
    uint256 public tokenIds;

    modifier onlyWhenNotPaused {
        require(!_paused, "Contract currently paused");
        _;
    }

    constructor (string memory baseURI) ERC721("RewardNode", "NODE") {
        _baseTokenURI = baseURI;
    }

    function mint(address _owner) public payable onlyWhenNotPaused onlyAdmin {
        tokenIds += 1;
        _safeMint(_owner, tokenIds);
    }

    function createdAt(uint256 id) public view returns(uint) {
        return nodeDetails[id].createdAt;
    }

    function deducted(uint256 id) public view returns(uint) {
        return nodeDetails[id].deducted;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function setPaused(bool val) public onlyOwner {
        _paused = val;
    }

      // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}
}