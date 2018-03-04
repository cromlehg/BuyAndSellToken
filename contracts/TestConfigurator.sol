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
}

contract ICO {
  function setStart(uint newStart) public;
  function addMilestone(uint period, uint bonus) public;
  function setPrice(uint newPrice) public;
  function setMinInvestedLimit(uint newMinInvestedLimit) public;
  function setHardcap(uint newHardcap) public;
  function setWallet(address newWallet) public;
  function setBountyTokensWallet(address newBountyWallet) public;
  function setAdvisorsTokensWallet(address newAdvisorsTokenWallet) public;
  function setDevelopersTokensWallet(address newDevelopersTokensWallet) public;
  function setBountyTokensPercent(uint newBountyTokensPercent) public;
  function setAdvisorsTokensPercent(uint newAdvisorsTokenPercent) public;
  function setDevelopersTokensPercent(uint newDevelopersTokensPercent) public;
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
    preICO.setWallet(0xa86780383E35De330918D8e4195D671140A60A74);
    preICO.setStart(1518393600);
    preICO.setPrice(9000000000000000000000);
    preICO.setMinInvestedLimit(100000000000000000);
    preICO.setHardcap(16000000000000000000000);
    preICO.setSoftcap(500000000000000000000);
    preICO.addMilestone(1, 40);
    preICO.addMilestone(13, 30);
    preICO.setToken(token);

    token.setSaleAgent(preICO);
    preICO.setNextSaleAgent(ico);

    ico.setStart(1520640000);
    ico.addMilestone(7, 25);
    ico.addMilestone(7, 15);
    ico.addMilestone(14, 10);
    ico.setPrice(4500000000000000000000);
    ico.setMinInvestedLimit(100000000000000000);
    ico.setHardcap(24000000000000000000000);
    ico.setWallet(0x98882D176234AEb736bbBDB173a8D24794A3b085);
    ico.setBountyTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setAdvisorsTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setDevelopersTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setBountyTokensPercent(3);
    ico.setAdvisorsTokensPercent(2);
    ico.setDevelopersTokensPercent(20);
    ico.setToken(token);

    token.transferOwnership(owner);
    preICO.transferOwnership(owner);
    ico.transferOwnership(owner);
  }
}
