// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract HASANTOKEN is ERC20Capped,Ownable{
    
      uint256 public tokenPrice; 
      address public priceSetter;
        
    
    constructor( string memory name,string memory symbol,uint256 cap, uint256 _tokenPrice )
    ERC20(name, symbol) 
    ERC20Capped(cap)
    {
     tokenPrice=_tokenPrice; 
        
    }
    
    
      function delegationOfPricingManager(address _pricingManagerAddress)  public onlyOwner returns(string memory, address) {
       require(_pricingManagerAddress !=address(0),"address must be valid");
       priceSetter = payable( _pricingManagerAddress);
       return ("the price manager is", _pricingManagerAddress);
   }
     
    
  function tokenPriceUpdate(uint256 _Price)public  returns(bool){
        require(msg.sender == priceSetter || msg.sender == owner(), "you are not authorized to change the token price");
        tokenPrice=_Price;
        return true;
    }
       
    function generateToken(uint256 amount) public virtual onlyOwner{
        _mint(msg.sender,amount);
        
    }
     
    
    
}