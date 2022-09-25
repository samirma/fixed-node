// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IRewardManager {
    
    function balanceOf(address owner) external view returns (uint256 balance);

    function claimRewardByNode(address owner) external returns (uint256 balance);
    
    function claimAllReward(address owner) external returns (uint256 balance);

}