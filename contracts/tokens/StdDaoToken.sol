pragma solidity ^0.4.22;

import "zeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";

/**
 * @title StdDaoToken 
 * @dev Currently DaoBase works only with StdDaoToken. It does not support working with 
 * plain ERC20 tokens because we need some extra features like mint(), burn() and transferOwnership()
 *
 * EVERY token that is used on Thetta should support these operations:
 * ERC20:
 *		balanceOf() 
 *		transfer() 
 *
 * Non ERC20:
 *		transferOwnership()
 *		mint()
 *		burn()
*/
contract StdDaoToken is MintableToken, BurnableToken, DetailedERC20 {
	constructor(string _name, string _symbol, uint8 _decimals) public
		DetailedERC20(_name, _symbol, _decimals)
	{
	}

	// this is an override of BurnableToken method
	function burn(address _who, uint256 _value) external onlyOwner{
		_burn(_who, _value);
	}
}
