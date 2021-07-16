pragma solidity 0.8.0;


contract parentVahicle{
    string start= "The Vehicle has just Started";
    string accelerate="The Vehicle has just Accelerated";
    string stop="The Vehicle has just Stopped";
    string service="The Vehicle is being serviced";
    
    function Start() public view returns(string memory){
         return start  ;
        
    }
    
    function Accelerate() public view returns(string memory){
        return  accelerate;
        
    }
    function Stop() public view returns(string memory){
        return  stop;
        
    }
    function Service() view public virtual returns(string memory){
        return  service;
    }
    
    
}



contract Cars is parentVahicle{
      string  a= "The car is being serviced";
      
     function Service() view public override returns(string memory){
        return  a;
    }
    
}
contract Truck is parentVahicle{
     string  a= "The truck is being serviced";
     
      function Service() view public override returns(string memory){
         return  a;
    }
    
}
contract motorCycle is parentVahicle{
        string a= "The motorCycle is being serviced";
        
      function Service() view public override returns(string memory){
       return  a;
    }
    
}



contract Alto is Cars{

}

contract Hino is Truck{
    
}
contract Yamaha is motorCycle{
    
}

contract carServiceStation {
     
    function vehicleService(Cars acar) public view returns(string memory){
    return  acar.Service();
        
    
    }
    
}

contract truckServiceStation{
    
      function vehicleService(Truck atruck) public view returns(string memory){
      return atruck.Service();
   
        
    }
    
}
contract motorCycleServiceStation{
    
      function vehicleService(motorCycle amotorCycle) public view  returns(string memory){
      return amotorCycle.Service(); 
        
        
    }
    
    
} 

