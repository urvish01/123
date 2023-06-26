// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.3;

//import Open Zepplins ERC-20 contract
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//create a sample token 
contract Token is ERC20 {

    //uint public amountAllowed = 10000000000;

    address public owner;

   //mint token
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        owner = msg.sender;
        _mint(msg.sender, 50000 *(10**18));
    }
}