pragma solidity ^0.4.18;

import './BASCommonSale.sol';

contract ICO is BASCommonSale {

  address public bountyTokensWallet;

  address public advisorsTokensWallet;
  
  address public developersTokensWallet;

  uint public bountyTokensPercent;
  
  uint public advisorsTokensPercent;

  uint public developersTokensPercent;

  function setBountyTokensPercent(uint newBountyTokensPercent) public onlyOwner {
    bountyTokensPercent = newBountyTokensPercent;
  }
  
  function setAdvisorsTokensPercent(uint newAdvisorsTokensPercent) public onlyOwner {
    advisorsTokensPercent = newAdvisorsTokensPercent;
  }

  function setDevelopersTokensPercent(uint newDevelopersTokensPercent) public onlyOwner {
    developersTokensPercent = newDevelopersTokensPercent;
  }

  function setBountyTokensWallet(address newBountyTokensWallet) public onlyOwner {
    bountyTokensWallet = newBountyTokensWallet;
  }

  function setAdvisorsTokensWallet(address newAdvisorsTokensWallet) public onlyOwner {
    advisorsTokensWallet = newAdvisorsTokensWallet;
  }

  function setDevelopersTokensWallet(address newDevelopersTokensWallet) public onlyOwner {
    developersTokensWallet = newDevelopersTokensWallet;
  }

  function finish() public onlyOwner {
    uint summaryTokensPercent = bountyTokensPercent.add(advisorsTokensPercent).add(developersTokensPercent);
    uint mintedTokens = token.totalSupply();
    uint allTokens = mintedTokens.mul(percentRate).div(percentRate.sub(summaryTokensPercent));
    uint advisorsTokens = allTokens.mul(advisorsTokensPercent).div(percentRate);
    uint bountyTokens = allTokens.mul(bountyTokensPercent).div(percentRate);
    uint developersTokens = allTokens.mul(developersTokensPercent).div(percentRate);
    mintTokens(advisorsTokensWallet, advisorsTokens);
    mintTokens(bountyTokensWallet, bountyTokens);
    mintTokens(developersTokensWallet, developersTokens);
    token.finishMinting();
  }

}
