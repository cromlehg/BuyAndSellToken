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

    preICO.setWallet(0x1cbeeCf1b8a71E7CEB7Bc7dFcf76f7aA1092EA42);
    preICO.setStart(1525132800);
    preICO.setPrice(9000000000000000000000);
    preICO.setMinInvestedLimit(100000000000000000);
    preICO.setToken(token);
    preICO.setHardcap(16000000000000000000000);
    preICO.setSoftcap(500000000000000000000);
    preICO.setBountyTokensWallet(0x040Dd0f72c2350DCC043E45b8f9425E16190D7e3);
    preICO.setAdvisorsTokensWallet(0x9dd06c9697c5c4fc9D4D526b4976Bf5A9960FE55);
    preICO.setDevelopersTokensWallet(0x9fb9B9a8ABdA6626d5d739E7A1Ed80F519ac156D);
    preICO.setBountyTokensPercent(7200000000000000000000000);
    preICO.setAdvisorsTokensPercent(4800000000000000000000000);
    preICO.setDevelopersTokensPercent(48000000000000000000000000);
    preICO.addMilestone(1, 40);
    preICO.addMilestone(13, 30);

    preICO.mintExtraTokens();

    token.setSaleAgent(preICO);

    ico = new ICO();

    ico.addMilestone(7, 25);
    ico.addMilestone(7, 15);
    ico.addMilestone(14, 10);
    ico.setMinInvestedLimit(100000000000000000);
    ico.setToken(token);
    ico.setPrice(4500000000000000000000);
    ico.setWallet(0x4cF77fF6230A31280F886b5D7dc7324c22443eB5);
    ico.setStart(1527811200);
    ico.setHardcap(24000000000000000000000);
    
    preICO.setNextSaleAgent(ico);

    address manager = 0xb3e3fFeE7bcEC75cbC98bf6Fa5Eb35488b0a0904;

    token.transferOwnership(manager);
    preICO.transferOwnership(manager);
    ico.transferOwnership(manager);
  }

}

