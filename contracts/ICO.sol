pragma solidity ^0.4.18;

import './BASCommonSale.sol';

contract ICO is BASCommonSale {

  function finish() public onlyOwner {
     token.finishMinting();
  }

}
