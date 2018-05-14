pragma solidity ^0.4.18;

import './BASCommonSale.sol';
import './SoftcapFeature.sol';
import './NextSaleAgentFeature.sol';

contract PreICO is NextSaleAgentFeature, SoftcapFeature, BASCommonSale {

  address public bountyTokensWallet;

  address public advisorsTokensWallet;

  address public developersTokensWallet;

  uint public bountyTokens;

  uint public advisorsTokens;

  uint public developersTokens;

  bool public extraMinted;

  function setBountyTokens(uint newBountyTokens) public onlyOwner {
    bountyTokensPercent = newBountyTokensPercent;
  }

  function setAdvisorsTokens(uint newAdvisorsTokens) public onlyOwner {
    advisorsTokensPercent = newAdvisorsTokensPercent;
  }

  function setDevelopersTokens(uint newDevelopersTokens) public onlyOwner {
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

  function mintExtraTokens() public onlyOwner {
    require(!extraMinted); 
    mintTokens(bountyTokensWallet, bountyTokens);
    mintTokens(advisorsTokensWallet, advisorsTokens);
    mintTokens(developersTokensWallet, developersTokens);
    extraMinted = true;
  }

  function mintTokensByETH(address to, uint _invested) internal returns(uint) {
    uint _tokens = super.mintTokensByETH(to, _invested);
    updateBalance(to, _invested);
    return _tokens;
  }

  function finish() public onlyOwner {
    if (updateRefundState()) {
      token.finishMinting();
    } else {
      withdraw();
      token.setSaleAgent(nextSaleAgent);
    }
  }

  function fallback() internal minInvestLimited(msg.value) returns(uint) {
    require(now >= start && now < endSaleDate());
    return mintTokensByETH(msg.sender, msg.value);
  }

}
