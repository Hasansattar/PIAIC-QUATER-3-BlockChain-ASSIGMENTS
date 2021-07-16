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
contracts of step 3, in the “Vehicle” variable to call the service
function
