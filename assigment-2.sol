/*Create Crypto Bank Contract

    1) The owner can start the bank with initial deposit/capital in ether (min 50 eths)
    2) Only the owner can close the bank. Upon closing the balance should return to the Owner
    3) Anyone can open an account in the bank for Account opening they need to deposit ether with address
    4) Bank will maintain balances of accounts
    5) Anyone can deposit in the bank
    6) Only valid account holders can withdraw
    7) First 5 accounts will get a bonus of 1 ether in bonus
    8) Account holder can inquiry balance
The depositor can request for closing an account
**/

pragma solidity ^0.8.0;

contract CryptoBank{
     address public owner;
     uint256 public counter;
     uint256 public initialBankCapital;
     address payable[] public accountsAddress;
     
     mapping (address => uint) bankBalance;
     mapping (uint256 => mapping (address => uint256) ) public accountDepositor;
     mapping(address => uint256) public depositStart;
     mapping(address => bool) public isDeposited;
    
     
    event BankClose(string);
    event Deposit(address indexed user, uint256 indexed etherAmount, uint256 indexed timeStart);
    event Withdraw(address indexed user, uint256 etherAmount, uint256 depositTime);
     
     constructor (uint256 _initialBankCapital){
        
             initialBankCapital =_initialBankCapital;
              require(initialBankCapital>=50 ether,"you must have 50 ether min");
              owner = msg.sender;
              bankBalance[owner]=_initialBankCapital;
     }
     
     modifier onlyOwner() {
    require(msg.sender == owner);
    _;
    }

     function closeBank() public payable onlyOwner {
           address payable addr = payable(address(owner));
           selfdestruct(addr); 
        
           emit BankClose("the bank has been closed");
      }

     function deposit(address payable bank) public payable{
            
          require(isDeposited[msg.sender] == false, "Error, deposit already active");
          require(msg.value >= 0.01 ether, "Error, deposit must be >=0.01");
          
                 accountsAddress.push(bank);
                //   for(uint i=0; i<5;i++){
                //         accountsAddress[i] !=msg.sender;
                        
                //         payable(msg.sender).transfer(1 ether);
                //   }
           counter=counter+1;
          bankBalance[owner] += msg.value; 
          depositStart[owner] += block.timestamp;
          isDeposited[msg.sender] = true;
          accountDepositor[counter][msg.sender]=msg.value;
          
          
          emit Deposit(msg.sender, msg.value, block.timestamp);
      }

      function Array() public view returns(uint256){
         return accountsAddress.length;
            }     
     
     
     
     function withdraw() public payable   {
              
            require(isDeposited[msg.sender] == true, "Error, no previous deposit");
                uint256  userBalance = bankBalance[msg.sender]; 
                  uint256 depositTime = block.timestamp - depositStart[msg.sender];
       
                 accountDepositor[counter][msg.sender]-=msg.value;

                 
                 
                  
    payable(msg.sender).transfer(userBalance);
    
        bankBalance[msg.sender]=0;
        depositStart[msg.sender] = 0;
           isDeposited[msg.sender] = false;
           
        emit Withdraw(msg.sender, userBalance, depositTime); 
     }
     
       function accountHolderBalance(address addr) public view returns(uint){
           require(msg.sender==addr,'address is not valid');
        return accountDepositor[counter][addr];
           
       }
       
       function closeAccount(address addr) public payable{
           require(msg.sender==addr,'address is not valid');
           require(msg.value==0,"Account has a amount");
           selfdestruct(payable(msg.sender));
       }
     
     function accountbalance(address _accountholder) public view returns(uint){
          return bankBalance[_accountholder];
          }
     

}