pragma solidity ^0.4.18;

import './ownership/Ownable.sol';
import './BuyAndSellToken.sol';
import './PreICO.sol';
import './ICO.sol';

contract Configurator is Ownable {

  BuyAndSellToken public token;

  PreICO public preICO;

  ICO public ico;

  function deploy() public onlyOwner {

    address manager = 0xb3e3fFeE7bcEC75cbC98bf6Fa5Eb35488b0a0904;

    token = new BuyAndSellToken();
    preICO = new PreICO();
    ico = new ICO();

    token.setSaleAgent(preICO);

    preICO.setStart(1526428800); // 16 May 2018 00:00:00 GMT
    preICO.addMilestone(1, 40);
    preICO.addMilestone(13, 30);
    preICO.setToken(token);
    preICO.setPrice(9000000000000000000000);
    preICO.setHardcap(16000000000000000000000);
    preICO.setSoftcap(500000000000000000000);
    preICO.setMinInvestedLimit(100000000000000000);
    preICO.setWallet(0x1cbeeCf1b8a71E7CEB7Bc7dFcf76f7aA1092EA42);
    preICO.setBountyTokensWallet(0x040Dd0f72c2350DCC043E45b8f9425E16190D7e3);
    preICO.setAdvisorsTokensWallet(0x9dd06c9697c5c4fc9D4D526b4976Bf5A9960FE55);
    preICO.setDevelopersTokensWallet(0x9fb9B9a8ABdA6626d5d739E7A1Ed80F519ac156D);
    preICO.setBountyTokens(7200000000000000000000000);
    preICO.setAdvisorsTokens(4800000000000000000000000);
    preICO.setDevelopersTokens(48000000000000000000000000);
    preICO.setNextSaleAgent(ico);

    preICO.mintExtraTokens();

    ico.setStart(1529107200); // 16 Jun 2018 00:00:00 GMT
    ico.addMilestone(7, 25);
    ico.addMilestone(7, 15);
    ico.addMilestone(14, 10);
    ico.setToken(token);
    ico.setPrice(4500000000000000000000);
    ico.setHardcap(24000000000000000000000);
    ico.setMinInvestedLimit(100000000000000000);
    ico.setWallet(0x4cF77fF6230A31280F886b5D7dc7324c22443eB5);

    token.transferOwnership(manager);
    preICO.transferOwnership(manager);
    ico.transferOwnership(manager);
  }

}

