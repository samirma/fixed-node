// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IRewardManager {
    
    function balanceOf(address owner) external view returns (uint256 balance);

    function balanceOfId(uint232 id) external view returns (uint256 balance);

    function claimRewardById(uint232 id) external  returns (uint256 balance);

    function claimAllReward(address owner) external returns (uint256 balance);

}