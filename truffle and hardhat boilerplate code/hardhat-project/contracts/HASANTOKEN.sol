// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract HASANTOKEN is IERC20{

   
    address public owner; 
    string public name;
    string public symbol;
    uint256 public decimals;
    uint256 private _totalSupply; 
     
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
   

    constructor () {
        name = "HASAN-TOKEN";
        symbol = "HT";
        decimals = 18;  
        owner = msg.sender;
           
        _totalSupply = 1000000 * 10**decimals;  
        _balances[owner] = _totalSupply;
        
         
        emit Transfer(address(this),owner,_totalSupply);
     }
      
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

     
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    
    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        address sender = msg.sender;
        require(sender != address(0), " transfer from the zero address");
        require(recipient != address(0), "transfer to the zero address");
        require(_balances[sender] > amount,"transfer amount exceeds balance");

         
        _balances[sender] = _balances[sender] - amount;
      
        _balances[recipient] = _balances[recipient] + amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }

    
    function allowance(address tokenOwner, address spender) public view virtual override returns (uint256) {
        return _allowances[tokenOwner][spender]; 
    }

     
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address tokenOwner = msg.sender;
        require(tokenOwner != address(0), " approve from the zero address");
        require(spender != address(0), "approve to the zero address");
        
        _allowances[tokenOwner][spender] = amount;
        
        emit Approval(tokenOwner, spender, amount);
        return true;
    }

     
    function transferFrom(address tokenOwner, address recipient, uint256 amount) public virtual override returns (bool) {
        address spender = msg.sender;
        uint256 _allowance = _allowances[tokenOwner][spender]; 
        require(_allowance > amount, "transfer amount exceeds allowance");
        
         
        _allowance = _allowance - amount;
        
        _balances[tokenOwner] =_balances[tokenOwner] - amount; 
        
        _balances[recipient] = _balances[recipient] + amount;
        
        emit Transfer(tokenOwner, recipient, amount);
        
        _allowances[tokenOwner][spender] = _allowance;
        
        emit Approval(tokenOwner, spender, amount);
        
        return true;
    }
    

}