// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Ownable {
    //privet owner address
    address private _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    // Initializes the contract setting the deployer as the initial owner.
    constructor() {
        _transferOwnership(msg.sender); // set the deployer as the initial owner
    }

    //Throws if called by any account other than the owner.
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    //Returns the address of the current owner.
    function owner() public view virtual returns (address) {
        return _owner;
    }

    //Throws if the sender is not the owner.
    function _checkOwner() internal view virtual {
        require(owner() == msg.sender, "Ownable: caller is not the owner");
    }

    //transfer Ownership
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0),"Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    //transfer Ownership helper function
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}
