pragma solidity ^0.4.18;

import './ownership/Ownable.sol';

contract BuyAndSellToken {
  function setSaleAgent(address newSaleAgent) public;
  function transferOwnership(address newOwner) public;
}

contract PreICO {
  function setStart(uint newStart) public;
  function addMilestone(uint period, uint bonus) public;
  function setPrice(uint newPrice) public;
  function setMinInvestedLimit(uint newMinInvestedLimit) public;
  function setSoftcap(uint newSoftcap) public;
  function setHardcap(uint newHardcap) public;
  function setWallet(address newWallet) public;
  function setNextSaleAgent(address newICO) public;
  function setToken(address newToken) public;
  function transferOwnership(address newOwner) public;
  function setBountyTokensWallet(address newBountyWallet) public;
  function setAdvisorsTokensWallet(address newAdvisorsTokenWallet) public;
  function setDevelopersTokensWallet(address newDevelopersTokensWallet) public;
  function setBountyTokens(uint newBountyTokens) public;
  function setAdvisorsTokens(uint newAdvisorsToken) public;
  function setDevelopersTokens(uint newDevelopersTokens) public;
  function mintExtraTokens() public;
}

contract ICO {
  function setStart(uint newStart) public;
  function addMilestone(uint period, uint bonus) public;
  function setPrice(uint newPrice) public;
  function setMinInvestedLimit(uint newMinInvestedLimit) public;
  function setHardcap(uint newHardcap) public;
  function setWallet(address newWallet) public;
  function setToken(address newToken) public;
  function transferOwnership(address newOwner) public;
}

contract TestConfigurator is Ownable {
  BuyAndSellToken public token;
  PreICO public preICO;
  ICO public ico;

  function setToken(address _token) public onlyOwner {
    token = BuyAndSellToken(_token);
  }

  function setPreICO(address _preICO) public onlyOwner {
    preICO = PreICO(_preICO);
  }

  function setICO(address _ico) public onlyOwner {
    ico = ICO(_ico);
  }

  function deploy() public onlyOwner {
    token.setSaleAgent(preICO);  
    
    preICO.setToken(token);
    preICO.setStart(1526342400);
    preICO.addMilestone(1, 40);
    preICO.addMilestone(13, 30);
    preICO.setPrice(9000000000000000000000);
    preICO.setMinInvestedLimit(100000000000000000);
    preICO.setHardcap(1600000000000000000);
    preICO.setSoftcap(500000000000000000);
    preICO.setWallet(0x8fD94be56237EA9D854B23B78615775121Dd1E82);
    preICO.setBountyTokensWallet(0x8Ba7Aa817e5E0cB27D9c146A452Ea8273f8EFF29);
    preICO.setAdvisorsTokensWallet(0x24a7774d0eba02846580A214eeca955214cA776C);
    preICO.setDevelopersTokensWallet(0xaa8ed6878a202eF6aFC518a64D2ccB8D73f1f2Ca);
    preICO.setBountyTokens(7200000000000000000000000);
    preICO.setAdvisorsTokens(4800000000000000000000000);
    preICO.setDevelopersTokens(48000000000000000000000000);
    preICO.setNextSaleAgent(ico);
    
    preICO.mintExtraTokens();

    ico.setToken(token);
    ico.setStart(1526342400);
    ico.addMilestone(7, 25);
    ico.addMilestone(7, 15);
    ico.addMilestone(14, 10);
    ico.setPrice(4500000000000000000000);
    ico.setMinInvestedLimit(100000000000000000);
    ico.setHardcap(2400000000000000000);
    ico.setWallet(0x8fD94be56237EA9D854B23B78615775121Dd1E82);

    token.transferOwnership(owner);
    preICO.transferOwnership(owner);
    ico.transferOwnership(owner);
  }
}
