pragma solidity 0.8.4; //Do not change the solidity version as it negativly impacts submission grading
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

contract Vendor is Ownable {
  event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

  YourToken public yourToken;
  uint256 public constant tokensPerEth = 100;


  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }

  function buyTokens() public payable {
    yourToken.transfer(msg.sender, msg.value * tokensPerEth);
    emit BuyTokens(msg.sender, msg.value, msg.value * tokensPerEth);
  }

  function withdraw() public {
    require(msg.sender == owner(), "Caller is not owner");
    payable(owner()).transfer(address(this).balance);
  }

  // ToDo: create a payable buyTokens() function:

  // ToDo: create a withdraw() function that lets the owner withdraw ETH

  // ToDo: create a sellTokens(uint256 _amount) function:
}
