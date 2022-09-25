// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";


contract Admin is Ownable {
    address private admin;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin
    {
        assert(msg.sender == admin);
        _;
    }

    function setAdmin(address _admin) external onlyOwner
    {
        admin = _admin;
    }
}