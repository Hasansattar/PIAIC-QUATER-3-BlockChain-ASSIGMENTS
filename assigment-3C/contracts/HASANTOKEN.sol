// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract HASANTOKEN is ERC20Capped,Ownable{
      
      address public admin;
      uint256 public tokenPrice;   // 0.001 ether
      address public priceSetter;
      event Received(address, uint);
    
    constructor( string memory name,string memory symbol,uint256 cap, uint256 _tokenPrice )
    ERC20(name, symbol) 
    ERC20Capped(cap)
    {
     tokenPrice=_tokenPrice; 
        admin=owner(); 
    }
     function balanceadmin()public view returns(uint256){
            return totalSupply();
        } 

        
    function buyTokens() public payable returns(bool){
       require (msg.sender != address(0) , "you are not a valid token holder");
       require(msg.value >= 0.01 ether, "Error, deposit must be >=0.01");
       uint256   amount  =msg.value / tokenPrice;   // 1 ether = 1000 HT token
       require( balanceadmin()> amount*10**18 ,'smart contract dont hold enough tokens');
     
       _transfer(admin,msg.sender,amount*10**18);
     
      return true;

    }
    
    
   
        
    receive() external payable {
      emit Received(msg.sender, msg.value);
    }
    

     function returnToken(uint _tokenCountReturned) public payable returns (bool) {
      require (msg.sender != address(0) , "you are not a valid token holder");
      
      
      uint weiReturned = tokenPrice * _tokenCountReturned;
        _transfer(admin,msg.sender,weiReturned);
    
      return true;
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