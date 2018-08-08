pragma solidity ^0.4.23;

import './token/CappedToken.sol';
import './token/ERC20Interface.sol';
import './token/PausableSignedTransferToken.sol';

contract ElesToken is CappedToken, PausableSignedTransferToken  {
  string public name = 'Elements Estates Token';
  string public symbol = 'ELES';
  uint256 public decimals = 18;

  // Max supply of 250 million
  uint256 internal maxSupply = 250000000 * 10**decimals;

  constructor()
    CappedToken(maxSupply) public {
      paused = true;
  }

  // @dev Recover any mistakenly sent ERC20 tokens to the Token address
  function recoverERC20Tokens(address _erc20, uint256 _amount) public onlyOwner {
    ERC20Interface(_erc20).transfer(msg.sender, _amount);
  }

}
