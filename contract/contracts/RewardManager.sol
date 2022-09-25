// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./NodeNFT.sol";
import "./RewardToken.sol";
import "./IRewardManager.sol";
import "./Admin.sol";

contract RewardManager is IRewardManager, Ownable, Admin {

    RewardToken rewardToken;
    NodeNFT nodeNFT;

    constructor(address payable _rewardToken, address payable _nodeNFT) {
        rewardToken = RewardToken(_rewardToken);
        nodeNFT = NodeNFT(_nodeNFT);
    }

    function balanceOf(address owner) external view returns (uint256 balance) {
        return 111;
    }

    function balanceOfId(uint232 id) external view returns (uint256 balance) {
        uint createdAt = nodeNFT.createdAt(id);
        uint256 deducted = nodeNFT.deducted(id);
        return createdAt * deducted;
    }

    function claimRewardById(uint232 id) external  returns (uint256 balance) {
        return 0;
    }
    
    function claimAllReward(address _owner) external returns (uint256 balance){
        return 0;
    }

}