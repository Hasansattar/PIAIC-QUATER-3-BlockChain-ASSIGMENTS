pragma solidity ^0.8.0;
import './ERC20.sol';

contract SaleToken{
     address admin;
    uint256 public tokenPrice;
     
     HASANTOKEN public tokenContract;
     
    event Sell(address _buyer,uint256 _amount);  

    constructor(address _tokenContract, uint256 _tokenPrice){
          
          admin=msg.sender;
          tokenPrice=_tokenPrice;
          tokenContract=HASANTOKEN(_tokenContract);
             
    }
     
    function buyTokens() public payable {
      uint256    amount =msg.value / tokenPrice;
            
        require(tokenContract.balanceOf(address(this)) >=  amount*10**18 ,'smart contract dont hold enough tokens');
        
        tokenContract.transfer(msg.sender, amount*10**18);
        
        emit Sell(msg.sender,amount*10**18);
 

    }


   fallback() external payable{
        payable(admin).transfer(msg.value);
         
    }
    
    

}