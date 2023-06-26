// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";

contract Faucet{

// creat obj
    Token mytoken;
    address public urvish = 0x9f477448F1B96edCE91d0e29Aa0A1f4E816C9A5f; // tpken account address
 
    //mapping to keep track of requested rokens
    //Address and blocktime + 1 day is saved in TimeLock
    mapping(address => uint256) public lockTime;
    mapping(address => uint) public withdrawals_balance;

    //constroctur 
    constructor(address fooAddress) {
        mytoken = Token(fooAddress);
    }

    //withdraw function
    function withdraw(address to, uint amt) public returns(bool){

        //old uders
        uint256 amount = amt*(10**18);

        if(lockTime[to] != 0){

            //user come after 24H minutes
            if(lockTime[to] + 2 minutes <= block.timestamp){
                withdrawals_balance[to] = 0;
            }
          
            require(amount <= 100*(10**18) - withdrawals_balance[to] , "you can clime only 100 coins in 24H");
            require(mytoken.transferFrom(urvish,to, amount), "Deposit is fall");

            withdrawals_balance[to] += amount;  // update balances
            //update time only after 24H
            if(lockTime[to] + 2 minutes <= block.timestamp){
                lockTime[to] = block.timestamp;
            }
 
        }
        else{ 
            // new users
            require(amount <=100*(10**18), "you can clime only 100 coins in 24H");
            //deposit
            require(mytoken.transferFrom(urvish,to, amount), "Deposit is fall");
            //update balances
            withdrawals_balance[to] = amount;
            //update time
            lockTime[to] = block.timestamp;
        }
        
        return true;
    }

}