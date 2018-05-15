import ether from '../helpers/ether';
import tokens from '../helpers/tokens';
import {advanceBlock} from '../helpers/advanceToBlock';
import {increaseTimeTo, duration} from '../helpers/increaseTime';
import latestTime from '../helpers/latestTime';
import EVMRevert from '../helpers/EVMRevert';

require('chai')
  .use(require('chai-as-promised'))
  .use(require('chai-bignumber')(web3.BigNumber))
  .should();

export default function (Token, Crowdsale, wallets) {
  let token;
  let crowdsale;

  before(async function () {
    // Advance to the next block to correctly read time in the solidity "now" function interpreted by testrpc
    await advanceBlock();
  });

  beforeEach(async function () {
    token = await Token.new();
    crowdsale = await Crowdsale.new();
    await token.setSaleAgent(crowdsale.address);
    await crowdsale.setToken(token.address);
    await crowdsale.setStart(latestTime());
    await crowdsale.setPrice(this.price);
    await crowdsale.setSoftcap(this.softcap);
    await crowdsale.setHardcap(this.hardcap);
    await crowdsale.setMinInvestedLimit(this.minInvestedLimit);
    await crowdsale.addMilestone(1, 40);
    await crowdsale.addMilestone(13, 30);
    await crowdsale.setWallet(this.wallet);
    await crowdsale.setBountyTokensWallet(wallets[3]);
    await crowdsale.setAdvisorsTokensWallet(wallets[4]);
    await crowdsale.setDevelopersTokensWallet(wallets[5]);
    await crowdsale.setBountyTokens(this.BountyTokens);
    await crowdsale.setAdvisorsTokens(this.AdvisorsTokens);
    await crowdsale.setDevelopersTokens(this.DevelopersTokens);
  });

  it('should correctly mint bonuses for bounty, advisors and developers just once', async function () {
    const owner = await crowdsale.owner();
    await crowdsale.mintExtraTokens({from: owner});

    const bountyTokens = await token.balanceOf(wallets[3]);
    const advisorsTokens = await token.balanceOf(wallets[4]);
    const developersTokens = await token.balanceOf(wallets[5]);

    bountyTokens.should.bignumber.equal(this.BountyTokens);
    advisorsTokens.should.bignumber.equal(this.AdvisorsTokens);
    developersTokens.should.bignumber.equal(this.DevelopersTokens);

    await crowdsale.mintExtraTokens({from: owner}).should.be.rejectedWith(EVMRevert);
  });
}
