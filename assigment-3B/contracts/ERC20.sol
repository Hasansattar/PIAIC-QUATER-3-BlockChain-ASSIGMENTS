// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
 
contract HASANTOKEN is ERC20,Ownable,Pausable{
      uint256 public cap;
      uint256 public timeDuration;

    constructor(uint256 initialSupply) ERC20("HASANTOKEN","HT"){
        timeDuration=block.timestamp +  30 days; 
        cap=initialSupply*10;
        _mint(msg.sender, initialSupply);
    }

     
       function  timeBoundTransfer(address account, uint256 amount) public  onlyOwner returns(bool){
               // uint256   duration=1632328460;               // 30 days
                require(block.timestamp >=timeDuration,"you cannot send transaction before 30 days");
                _transfer(_msgSender(),account,amount);
            return true;
       }

    function generateToken(uint256 amount) public onlyOwner whenNotPaused {
        require(amount >0, "Invalid amount");
        require(totalSupply()+amount<cap,"overLimit token: Token generation failed");
        _mint(msg.sender,amount);
        
    }
    
    function stopTransaction()public whenNotPaused onlyOwner{
        _pause();
        
    }
    function startTransaction()public whenPaused onlyOwner{
        _unpause();
        
    }
    
    
    
    
}