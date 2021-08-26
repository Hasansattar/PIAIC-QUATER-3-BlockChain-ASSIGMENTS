// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
 
  
contract HASANTOKEN is ERC20,Ownable{
   
              
      uint256 public cap;
      uint256 public tokenPrice; 
      address public priceSetter;
       
        
    constructor(uint256 initialSupply,uint256 _tokenPrice) ERC20("HASANTOKEN","HT"){
            
           tokenPrice=_tokenPrice;
           cap=initialSupply*10;
         _mint(msg.sender, initialSupply);
     
           
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
       
    
    
    
    function generateToken(uint256 amount) public onlyOwner{
        require(amount >0, "Invalid amount");
        require(totalSupply()+amount<cap,"overLimit token: Token generation failed");
        _mint(msg.sender,amount);
        
    }
     
    
    
    
    
}