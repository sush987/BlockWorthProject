// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract BlockWorth{

  uint256 myCybil;
  //uint256 requested = 0;
  uint256 Lending_amount = 500;
  address _borrower;

   constructor() payable{
      
   }
  
  function checkrequireCybil(uint _x) public{
    myCybil = _x;
    require(300 < myCybil && myCybil < 900, "Invalid Cybil Score");
    }

  function applyLoan(uint _amount) payable public{
    require(myCybil > 700, "Loan Request Rejected");
    Lending_amount = _amount;
    _borrower = msg.sender;
    //requested++;

   
  }

   function send() payable public {
        require(msg.value >= Lending_amount);
       payable(_borrower).transfer(Lending_amount);
    }
   function getAddressbalance(address _addr) public view returns(uint){
        return _addr.balance;
   }
  
}