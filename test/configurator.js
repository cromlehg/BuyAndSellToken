import ether from './helpers/ether';
import tokens from './helpers/tokens';
import {advanceBlock} from './helpers/advanceToBlock';
import {increaseTimeTo, duration} from './helpers/increaseTime';
import latestTime from './helpers/latestTime';
import EVMRevert from './helpers/EVMRevert';

const should = require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(web3.BigNumber))
  .should();

const Configurator = artifacts.require('Configurator.sol');
const Token = artifacts.require('BuyAndSellToken.sol');
const PreICO = artifacts.require('PreICO.sol');
const ICO = artifacts.require('ICO.sol');

contract('Configurator integration test', function (accounts) {
  let configurator;
  let token;
  let preico;
  let ico;

  const manager = '0xb3e3fFeE7bcEC75cbC98bf6Fa5Eb35488b0a0904';

  before(async function () {
    // Advance to the next block to correctly read time in the solidity "now" function interpreted by testrpc
    await advanceBlock();
    configurator = await Configurator.new();
    await configurator.deploy();

    const tokenAddress = await configurator.token();
    const preicoAddress = await configurator.preICO();
    const icoAddress = await configurator.ico();

    token = await Token.at(tokenAddress);
    preico = await PreICO.at(preicoAddress);
    ico = await ICO.at(icoAddress);
  });

  it('contracts should have token address', async function () {
    const tokenOwner = await token.owner();
    tokenOwner.should.bignumber.equal(manager);
  });

  it('contracts should have preICO address', async function () {
    const preicoOwner = await preico.owner();
    preicoOwner.should.bignumber.equal(manager);
  });

  it('contracts should have ICO address', async function () {
    const icoOwner = await ico.owner();
    icoOwner.should.bignumber.equal(manager);
  });

  it('preICO and ICO should have start time as described in README', async function () {
    const preicoStart = await preico.start();
    preicoStart.should.bignumber.equal((new Date('01 May 2018 00:00:00 GMT')).getTime() / 1000);
    const icoStart = await ico.start();
    icoStart.should.bignumber.equal((new Date('01 Jun 2018 00:00:00 GMT')).getTime() / 1000);
  });

  it ('preICO and ICO should have price as described in README', async function () {
    const preicoPrice = await preico.price();
    preicoPrice.should.bignumber.equal(tokens(9000));
    const icoPrice = await ico.price();
    icoPrice.should.bignumber.equal(tokens(4500));
  });

  it ('preICO should have softcap as described in README', async function () {
    const preicoSoftcap = await preico.softcap();
    preicoSoftcap.should.bignumber.equal(ether(500));
  });

  it ('preICO and ICO should have hardcap as described in README', async function () {
    const preicoHardcap = await preico.hardcap();
    preicoHardcap.should.bignumber.equal(ether(16000));
    const icoHardcap = await ico.hardcap();
    icoHardcap.should.bignumber.equal(ether(24000));
  });

  it ('preICO and ICO should have minimal insvested limit as described in README', async function () {
    const preicoMinInvest = await ico.minInvestedLimit();
    preicoMinInvest.should.bignumber.equal(ether(0.1));
    const icoMinInvest = await ico.minInvestedLimit();
    icoMinInvest.should.bignumber.equal(ether(0.1));
  });

  it ('bounty, advisors, developers percent should be as described in README', async function () {
    const bountyPercent = await ico.bountyTokensPercent();
    bountyPercent.should.bignumber.equal(3);
    const advisorsPercent = await ico.advisorsTokensPercent();
    advisorsPercent.should.bignumber.equal(2);
    const developersPercent = await ico.developersTokensPercent();
    developersPercent.should.bignumber.equal(20);
  });

  it ('preICO and ICO should have wallets as described in README', async function () {
    const preicoWallet = await preico.wallet();
    preicoWallet.should.bignumber.equal('0x1cbeeCf1b8a71E7CEB7Bc7dFcf76f7aA1092EA42');
    const icoWallet = await ico.wallet();
    icoWallet.should.bignumber.equal('0x4cF77fF6230A31280F886b5D7dc7324c22443eB5');
  });

  it ('bounty wallet, advisors wallet and developers wallet should be as described in README', async function () {
    const bountyWallet = await ico.bountyTokensWallet();
    bountyWallet.should.bignumber.equal('0x040Dd0f72c2350DCC043E45b8f9425E16190D7e3');
    const advisorsWallet = await ico.advisorsTokensWallet();
    advisorsWallet.should.bignumber.equal('0x9dd06c9697c5c4fc9D4D526b4976Bf5A9960FE55');
    const developersWallet = await ico.developersTokensWallet();
    developersWallet.should.bignumber.equal('0x9fb9B9a8ABdA6626d5d739E7A1Ed80F519ac156D');
  });
});

