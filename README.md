![BUY&SELL Token](logo.png "BUY&SELL Token")

http://buyandsell.io

# BUY&SELL Token smart contract

* _Standard_        : [ERC20](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md)
* _[Name](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#name)_            : BUY&SELL Token 
* _[Ticker](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#symbol)_          : BAS
* _[Decimals](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md#decimals)_        : 18
* _Emission_        : Mintable
* _Crowdsales_      : 2
* _Fiat dependency_ : No
* _Tokens locked_   : Yes

## Smart-contracts description

The tokens for the bounty and the team are minted after the ICO  is finished.  
There is a special function to return 3rd party tokens that were sent by mistake (function retrieveTokens()).  
Each stage has a direct minting function in wei. This is made to support the external payment gateways.

### Contracts contains
1. _BuyAndSellToken_ - Token contract
2. _PreICO_ - PreICO contract
3. _ICO_ - ICO contract
4. _Configurator_ - contract with main configuration for production

### How to manage contract
To start working with contract you should follow next steps:
1. Compile it in Remix with enamble optimization flag and compiler 0.4.18
2. Deploy bytecode with MyEtherWallet. Gas 5100000 (actually 5073514).
3. Call 'deploy' function on addres from (3). Gas 4000000 (actually 3979551). 

Contract manager must call finishMinting after each crowdsale milestone!
To support external mint service manager should specify address by calling _setDirectMintAgent_. After that specified address can direct mint tokens by calling _mintTokensByETHExternal_ and _mintTokensExternal_.

### How to invest
To purchase tokens investor should send ETH (more than minimum 0.1 ETH) to corresponding crowdsale contract.
Recommended GAS: 250000, GAS PRICE - 21 Gwei.

### Wallets with ERC20 support
1. MyEtherWallet - https://www.myetherwallet.com/
2. Parity 
3. Mist/Ethereum wallet

EXODUS not support ERC20, but have way to export key into MyEtherWallet - http://support.exodus.io/article/128-how-do-i-receive-unsupported-erc20-tokens

Investor must not use other wallets, coinmarkets or stocks. Can lose money.

## Tokens distribution

* _Bounty tokens_               :  7 200 000
* _Developers tokens_           : 48 000 000
* _Advisors tokens_             :  4 800 000

## Main network configuration

* _Bounty tokens wallet_        : 0x040Dd0f72c2350DCC043E45b8f9425E16190D7e3
* _Developers tokens wallet_    : 0x9fb9B9a8ABdA6626d5d739E7A1Ed80F519ac156D
* _Advisors tokens wallet_      : 0x9dd06c9697c5c4fc9D4D526b4976Bf5A9960FE55
* _Contracts manager_           : 0xb3e3fFeE7bcEC75cbC98bf6Fa5Eb35488b0a0904

### Links
1. _Token_ - https://etherscan.io/token/0xf6621ef67c16ee0c414403a66fba78d3ef35a5d3
2. _PreICO_ - https://etherscan.io/address/0x77299412d0e8c2acd13f69a5edf9ac9219ae1b13
3. _ICO_ - https://etherscan.io/address/0xfd681571852e68e9d30c419e2f5d160d153ad8d1

### Features
* Manually mint tokens by owner or sale agent at any time until token minting finished. 
* Manually mint tokens in ether value by owner or sale agent at corresponding sale contract during current sale processing.  

### Crowdsale stages

#### PreICO
* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 9000 Tokens
* _Hardcap_                     : 16 000 ETH
* _Softcap_                     : 500 ETH
* _Start_                       : 16 May 2018 00:00:00 GMT
* _Wallet_                      : 0x1cbeeCf1b8a71E7CEB7Bc7dFcf76f7aA1092EA42

##### Milestones
1. 1 day, bonus +40%
2. 13 days, bonus +30%

#### ICO
* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 4500 Tokens
* _Hardcap_                     : 24 000 ETH
* _Start_                       : 16 Jun 2018 00:00:00 GMT
* _Wallet_                      : 0x4cF77fF6230A31280F886b5D7dc7324c22443eB5
 
##### Milestones
1. 7 days, bonus +25%
2. 7 days, bonus +15%
3. 14 days, bonus +10% 


## Ropsten network configuration #1

### links
1. _Token_ - https://ropsten.etherscan.io/address/0x8e8f3396138bbd0245f2b06bb5849a0063c50b6d
2. _PreICO_ - https://ropsten.etherscan.io/address/0x555f42ec52699f73f69686985f90359f9c7d8cc4
3. _ICO_ - https://ropsten.etherscan.io/address/0x11a58440c8f0d7abbf27ea6a671c45598cbacec3


### Crowdsale stages

#### PreICO

* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 9000 Tokens
* _Hardcap_                     : 1.6 ETH
* _Softcap_                     : 0.5 ETH
* _Start_                       : 05 Mar 2018 00:00:00 GMT
* _Wallet_                      : 0x8fd94be56237ea9d854b23b78615775121dd1e82

_Milestones_

1. 1 day, bonus +40%
2. 13 days, bonus +30%

##### Purchasers

* 1 ETH => 12,600 tokens (40% bonus), gas = 151240
https://ropsten.etherscan.io/tx/0xdcce65771395c0a09acc0f5cf085af922d96325753c4ebc1f7f67f2bf9320503

* 0.01 ETH => rejected txn, less then mininal investment limit, gas = 21297
https://ropsten.etherscan.io/tx/0x1bcfcbd47dbe8f49fb1ac7104774b40b13aa3ff477111d720b8e66efd955e261

* 1 ETH => 12,600 tokens (40% bonus), gas = 99258
https://ropsten.etherscan.io/tx/0xd2403881c49cdda166e7787e482aad8c466a15b23e2abe4876800ddbffa301e9

* 1 ETH => rejected txn, hardcap is reached, gas = 22515
https://ropsten.etherscan.io/tx/0x8a2972d187d903f698b6ecd7cc72a73360f24753ba1fb20deed9326c3397785a

##### Service operations

* finish, gas = 47309
https://ropsten.etherscan.io/tx/0x276cd8d369ee7681188a70e99f67f36eed65264054c891fef8c909b07e46e4e8

#### ICO

* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 4500 Tokens
* _Hardcap_                     : 2.4 ETH
* _Wallet_                      : 0x8fd94be56237ea9d854b23b78615775121dd1e82
* _Start_                       : 05 Mar 2018 00:00:00 GMT
* _Bounty tokens percent_       : 3%
* _Developers tokens percent_   : 20%
* _Advisors_                    : 2%
* _Bounty tokens wallet_        : 0x8Ba7Aa817e5E0cB27D9c146A452Ea8273f8EFF29
* _Developers tokens wallet_    : 0xaa8ed6878a202eF6aFC518a64D2ccB8D73f1f2Ca
* _Advisors tokens wallet_      : 0x24a7774d0eba02846580A214eeca955214cA776C

_Milestones_

1. 7 days, bonus +25%
2. 7 days, bonus +15%
3. 14 days, bonus +10% 

##### Purchasers
  
* 1 ETH => 5,625 tokens (25% bonus), gas = 87455
https://ropsten.etherscan.io/tx/0x9a25fb4b6ee441c27910802d03f7f9f3024b7d227a91ea24039205b0f139c979

* 0.01 ETH => rejected txn, less then mininal investment limit, gas = 21297
https://ropsten.etherscan.io/tx/0xf467d9876a29f770c292087523c04c2ef8124aa70d6c74f72a586e38752731b0

* 1 ETH => 5,175 tokens (15% bonus), gas = 73887
https://ropsten.etherscan.io/tx/0xdac8daf530fe6911f60dd5d600a2003c0d5ee3a73a767bb2f6d7f1478378e92b

* 1 ETH => rejected txn, ICO is finished, gas = 42888
https://ropsten.etherscan.io/tx/0x9e4dc5dadf1735835b5817103a2837c92b044be3d41bed9ceab30cd701f191db

##### Service operations

* setStart, gas = 28064
https://ropsten.etherscan.io/tx/0xc0175b50e6287f2295e63463a6ad77478a978edece71af20bf87fa7a4981d2f3

* finish, gas = 181088
https://ropsten.etherscan.io/tx/0x9e2d7f50a5398cd287782c42907be60d2ffc419736aed411d55d35baea4e9b20

##### Token holders
https://ropsten.etherscan.io/token/0x8e8f3396138bbd0245f2b06bb5849a0063c50b6d#balances


## Ropsten network configuration #2

### links
1. _Token_ - https://ropsten.etherscan.io/address/0x0f76b9edb6acd0db236cd1b92e63e7afa8bb96f4
2. _PreICO_ - https://ropsten.etherscan.io/address/0x6291eac2ce95e7ea8f63ed6c62170daf6cedf5e4
3. _ICO_ - https://ropsten.etherscan.io/address/0xb43638f404f4165677e24601ea3bc7ad7b0a5302


### Crowdsale stages

#### PreICO

* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 9000 Tokens
* _Hardcap_                     : 1.6 ETH
* _Softcap_                     : 0.5 ETH
* _Start_                       : 15 May 2018 00:00:00 GMT
* _Wallet_                      : 0x8fd94be56237ea9d854b23b78615775121dd1e82
* _Bounty tokens wallet_        : 0x8Ba7Aa817e5E0cB27D9c146A452Ea8273f8EFF29
* _Developers tokens wallet_    : 0xaa8ed6878a202eF6aFC518a64D2ccB8D73f1f2Ca
* _Advisors tokens wallet_      : 0x24a7774d0eba02846580A214eeca955214cA776C
* _Bounty tokens_               :  7 200 000
* _Developers tokens_           : 48 000 000
* _Advisors tokens_             :  4 800 000

_Milestones_

1. 1 day, bonus +40%
2. 13 days, bonus +30%

##### Purchasers

* 1 ETH => 12,600 tokens (40% bonus), gas = 134895
https://ropsten.etherscan.io/tx/0x33b194f2c1486a5cd48e0f25b0ca0e1da3865e21540b282eca4a626efc5bb938

##### Service operations

* finish, gas = 47551
https://ropsten.etherscan.io/tx/0xe44ad3ceec8fc7bbdec710b7b542c64ad0d0b2e4aaa191a877b6034dd998c902

#### ICO

* _Minimal insvested limit_     : 0.1 ETH
* _Base price_                  : 1 ETH = 4500 Tokens
* _Hardcap_                     : 2.4 ETH
* _Wallet_                      : 0x8fd94be56237ea9d854b23b78615775121dd1e82
* _Start_                       : 15 May 2018 00:00:00 GMT

_Milestones_

1. 7 days, bonus +25%
2. 7 days, bonus +15%
3. 14 days, bonus +10% 

##### Purchasers
  
* 1 ETH => 5,625 tokens (25% bonus), gas = 86088
https://ropsten.etherscan.io/tx/0x58a3f08709c84f39596cb49dbc57f1cc4df2e43600bfcc202e2578cb27da36f1

##### Service operations

* finish, gas = 31333
https://ropsten.etherscan.io/tx/0xc6e9edb6cbec51cb53c6bc700f6f814f622a90aaed510639227653d429430b3c
