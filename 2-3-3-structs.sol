// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

/**
 * @title Structs contract
 * @author Famus
 * @notice Storing and viewing user KYC information in a dedicated struct
 */

contract userBalance {
    //struct storing users' information
    struct userKyc {
        string name;
        uint age;
    }

    //mapping storing address, KYC struct pairs
    mapping(address => userKyc) public userData;

    mapping(address => uint) public userbal; // mapping storing user's balance

    function setUserDetails(string calldata _name, uint _age) external {
        userKyc memory userkyc = userKyc(_name, _age);
        userData[msg.sender] = userkyc;
    }

    function getUserDetails()
        external
        view
        returns (string memory name, uint age)
    {
        userKyc memory userkyc = userData[msg.sender];
        return (userkyc.name, userkyc.age);
    }

    function deposit(uint _amount) external {
        userbal[msg.sender] += _amount;
    }

    function checkBalance() external view returns (uint) {
        //returning whoever is calling the function balance;
        return userbal[msg.sender];
    }
}
