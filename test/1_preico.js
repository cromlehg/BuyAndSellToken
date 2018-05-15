import ether from './helpers/ether';
import tokens from './helpers/tokens';
import unixTime from './helpers/unixTime';
import {duration} from './helpers/increaseTime';

import capped from './preico/capped';
import common from './preico/common';
import milestonebonus from './preico/milestonebonus';
import refundable from './preico/refundable';
import additional from './preico/additional';
import bounty from './preico/bounty';

const token = artifacts.require('BuyAndSellToken.sol');
const crowdsale = artifacts.require('PreICO.sol');

contract('PreICO - common test', function (accounts) {
  before(config);
  common(token, crowdsale, accounts);
});

contract('PreICO - capped crowdsale test', function (accounts) {
  before(config);
  capped(token, crowdsale, accounts);
});

contract('PreICO - milestone bonus test', function (accounts) {
  before(config);
  milestonebonus(token, crowdsale, accounts);
});

contract('PreICO - refundable crowdsale test', function (accounts) {
  before(config);
  refundable(token, crowdsale, accounts);
});

contract('PreICO - additional features test', function (accounts) {
  before(config);
  additional(token, crowdsale, accounts);
});

contract('PreICO - bounty test', function (accounts) {
  before(config);
  bounty(token, crowdsale, accounts);
});

function config() {
  // variables list based on info from README
  this.start = unixTime('20 May 2018 00:00:00 GMT');
  this.period = 14;
  this.price = tokens(9000);
  this.softcap = ether(500);
  this.hardcap = ether(16000);
  this.minInvestedLimit = ether(0.1);
  this.wallet = '0xa86780383E35De330918D8e4195D671140A60A74';
  this.BountyTokensWallet = '0x28732f6dc12606D529a020b9ac04C9d6f881D3c5';
  this.AdvisorsTokensWallet = '0x28732f6dc12606D529a020b9ac04C9d6f881D3c5';
  this.DevelopersTokensWallet = '0x28732f6dc12606D529a020b9ac04C9d6f881D3c5';
  this.BountyTokens = tokens(7200000);
  this.AdvisorsTokens = tokens(4800000);
  this.DevelopersTokens = tokens(48000000);

  // variables for additional testing convinience
  this.end = this.start + duration.days(this.period);
  this.beforeStart = this.start - duration.seconds(10);
  this.afterEnd = this.end + duration.seconds(1);
}
