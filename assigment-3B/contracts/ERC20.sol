// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
 
contract HASANTOKEN is ERC20,Ownable,Pausable{
      uint256 public cap;

    constructor(uint256 initialSupply) ERC20("HASANTOKEN","HT"){
           cap=initialSupply*10;
         _mint(msg.sender, initialSupply);
    }

     
       function  timeBoundTransfer(address account, uint256 amount) public  onlyOwner{
                uint256   duration=1632324013;               // 30 days
                require(block.timestamp ==duration,"you cannot send transaction before 30 days");
                _transfer(msg.sender,account,amount);
           
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