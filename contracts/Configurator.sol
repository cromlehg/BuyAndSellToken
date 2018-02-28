pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './MintableToken.sol';
import './BuyAndSellToken.sol';
import './PreICO.sol';
import './ICO.sol';

contract Configurator is Ownable {

  MintableToken public token;

  PreICO public preICO;

  ICO public ico;

  function deploy() public onlyOwner {

    token = new BuyAndSellToken();

    preICO = new PreICO();

    preICO.setWallet(0xa86780383E35De330918D8e4195D671140A60A74);
    preICO.setStart(1518393600);
    preICO.setPrice(9000000000000000000000);
    preICO.setMinInvestedLimit(100000000000000000);
    preICO.setToken(token);
    preICO.setHardcap(16000000000000000000000);
    preICO.setSoftcap(500000000000000000000);
    preICO.addMilestone(1, 40);
    preICO.addMilestone(3, 30);

    token.setSaleAgent(preICO);

    ico = new ICO();

    ico.addMilestone(7, 25);
    ico.addMilestone(7, 15);
    ico.addMilestone(14, 10);
    ico.setMinInvestedLimit(100000000000000000);
    ico.setToken(token);
    ico.setPrice(4500000000000000000000);
    ico.setWallet(0x98882D176234AEb736bbBDB173a8D24794A3b085);
    ico.setBountyTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setAdvisorsTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setDevelopersTokensWallet(0x28732f6dc12606D529a020b9ac04C9d6f881D3c5);
    ico.setStart(1520640000);
    ico.setHardcap(24000000000000000000000);
    ico.setAdvisorsTokensPercent(2);
    ico.setBountyTokensPercent(3);
    ico.setDevelopersTokensPercent(20);

    preICO.setNextSaleAgent(ico);

    address manager = 0x675eDE27cafc8Bd07bFCDa6fEF6ac25031c74766;

    token.transferOwnership(manager);
    preICO.transferOwnership(manager);
    ico.transferOwnership(manager);
  }

}

