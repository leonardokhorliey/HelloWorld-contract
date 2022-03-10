//SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {

    uint callId;

    struct User {
        uint identifier;
        string name;
        uint balance;
    }


    struct UserInfo {
        string name;
        uint balance;
    }

    User[] public users;

    mapping(uint => UserInfo) userReferencetoUserInfo;

    constructor(uint _id) public {
        callId = _id;
    }


    function addUser(uint _identifier, string memory _name, uint _balance) public {
        users.push(User({identifier: _identifier, name: _name, balance: _balance}));
        userReferencetoUserInfo[_identifier] = UserInfo({name: _name, balance: _balance});
    }

    function retrieveUser(uint _identifier) public view returns(UserInfo memory) {
        return userReferencetoUserInfo[_identifier];
    }

    function retrieveAllUsers() public view returns(User[] memory) {
        return users;
    }
}