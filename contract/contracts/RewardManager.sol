// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./NodeNFT.sol";
import "./RewardToken.sol";
import "./IRewardManager.sol";

contract RewardManager is IRewardManager, Ownable {

    RewardToken rewardToken;
    NodeNFT nodeNFT;

    constructor(address payable _rewardToken, address payable _nodeNFT) {
        rewardToken = RewardToken(_rewardToken);
        nodeNFT = NodeNFT(_nodeNFT);
    }

    function balanceOf(address owner) external pure returns (uint256 balance) {
        uint createdAt = nodeNFT.createdAt(owner);
        uint232 deducted = nodeNFT.deducted(owner);
        return 111;
    }

    function claimRewardByNode(address _owner) external returns (uint256 balance) {
        return 0;
    }
    
    function claimAllReward(address _owner) external returns (uint256 balance){
        return 0;
    }

}