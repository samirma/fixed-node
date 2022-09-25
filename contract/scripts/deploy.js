const fs = require('fs');
const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });
//const { CRYPTO_DEVS_NFT_CONTRACT_ADDRESS } = require("../constants");

async function main() {

  const NodeNFT = await ethers.getContractFactory(
    "NodeNFT"
  );

  const RewardManager = await ethers.getContractFactory(
    "RewardManager"
  );

  const RewardToken = await ethers.getContractFactory(
    "RewardToken"
  );

  // deploy the contract
  const deployedNodeNFT = await rewardTokenContract.deploy(
    NodeNFT
  );


  // deploy the contract
  const deployedRewardToken = await rewardManagerContract.deploy(
    RewardToken
  );

  // deploy the contract
  const deployedRewardManager = await rewardManagerContract.deploy(
    deployedRewardToken.address, NodeNFT.address
  );

  // print the address of the deployed contract
  console.log(
    "NodeNFT:", deployedNodeNFT.address
  );
  console.log(
    "RewardToken:", deployedRewardToken.address
  );
  console.log(
    "RewardManager:", deployedRewardManager.address
  );

  fs.createWriteStream("../web/constants/index.js").once('open', function(fd) {
    stream.write("NFT_CONTRACT_ADDRESS=".deployedNodeNFT.address, "\n");
    stream.write("TOKEN_CONTRACT_ADDRES=".deployedRewardToken.address, "\n");
    stream.end();
  });

}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });