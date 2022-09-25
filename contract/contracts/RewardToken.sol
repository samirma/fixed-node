// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IRewardManager.sol";

contract RewardToken is ERC20, Ownable {

    IRewardManager rewardManager;

    constructor() ERC20("Reward Token", "RD") {
    }

    function setManager(address _rewardManager) external {
        rewardManager = IRewardManager(_rewardManager);
    }

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}
}