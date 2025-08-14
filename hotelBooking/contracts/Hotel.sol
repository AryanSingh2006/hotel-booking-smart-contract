// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Hotel{

    enum status { vacant, occupied}
    status currentStatus;

    event Occupy (address _occupant, uint _value);

    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
        currentStatus = status.vacant;
    }

    modifier onlyWhileVacant {
        require(currentStatus == status.vacant, "current occupied");
        _;
    }

    modifier cost(uint _cost){
        require(msg.value == _cost, "Not enough ether");
        _;
    }

    function book() payable public onlyWhileVacant cost(2 ether) {

        currentStatus = status.occupied;
        (bool sent,) = owner.call{value: msg.value}("");
        require(sent, "Failed to sent ether");

        emit Occupy(msg.sender, msg.value);

    }

}