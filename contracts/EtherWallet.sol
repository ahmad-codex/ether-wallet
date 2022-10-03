// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 

contract EtherWallet {
    address public owner;
    constructor(address _owner) {
        owner = _owner;
    }

    //empty payable function to allow the smart contract (wallet) to receive ether
    function deposit() payable public {

    }

    function send(address payable to, uint amount) public isOwner {
        to.transfer(amount);
    }

    function balanceOf() public view returns(uint) {
        return address(this).balance;
    }

    modifier isOwner() {
        require(msg.sender == owner, 'Only owner is allowed!');
        _;
    }
}