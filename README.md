  ***ASSIGMNET-1***
  
1) Create a first "ParentVehicle" contract that includes the following functions
start - returns String message” The Vehicle has just Started”
accelerate - returns String message” The Vehicle has just Accelerated”
stop -- returns String message” The Vehicle has just Stopped”
service- returns String message” The Vehicle is being serviced”

2) Next Create following Child contracts for a different type of vehicles, that inherits Vehicle
Cars
Truck
MotorCycle,

(The contract shall override the Service Method to return, w Cars/ Truck/ Motor Cycle is being serviced)

3) Then create smart contracts for “Alto Mehran, “ Hino, Yamaha, that may inherit the relevant smart contract(s) as in step 2.

4)
Create 3 Service Stations for each vehicle type, with the same
function “vehicleService that takes the address of the deployed
contracts of step 3, in the “Vehicle” variable to call the service function


 ***ASSIGMNET-2***

     Create Crypto Bank Contract
    1) The owner can start the bank with initial deposit/capital in ether (min 50 eths)
    2) Only the owner can close the bank. Upon closing the balance should return to the Owner
    3) Anyone can open an account in the bank for Account opening they need to deposit ether with address
    4) Bank will maintain balances of accounts
    5) Anyone can deposit in the bank
    6) Only valid account holders can withdraw
    7) First 5 accounts will get a bonus of 1 ether in bonus
    8) Account holder can inquiry balance
    9)The depositor can request for closing an account
    
  ***ASSIGMENT-3***
  
    Create a token based on ERC20 which is buyable. Following features should present;
    1. Anyone can get the token by paying against ether
    2. Add fallback payable method to Issue token based on Ether received. Say 1 Ether = 100 tokens.
    3. There should be an additional method to adjust the price that allows the owner to adjust the price.
