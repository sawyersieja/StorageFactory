//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // stating our version

contract SimpleStorage {
    // Basic Types: boolean, uint, int, address, bytes
    //bool hasFavoriteNumber = true;
    //uint256 favoriteNumber = 23789;
    //string favoriteNumberInText = "23789";
    //int256 favoriteInt = -23789;
    //address myAddress = not entering my address here right now.
    //bytes32 favoriteBytes32 = "cat"; //0x...something to represent whatever the bytes are in hexadecimal.

    /**
     * string object is just a bytes objects specifically for text
     * string can get converted to bytes object really easy because it's basically the same thing. 
    **/


    /**
     * Keep in mind all `types` have a different default value.
     * For instance:
     * uint256 favoriteNumber; //0
    **/

    uint256 myFavoriteNumber; //0

    //uint256[] listOfFavoriteNumbers; 
    struct Person{
        uint256 favoriteNumber;
        string name;
    }
    

    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    // dynamic array
    Person[] public listOfPeople; //[]    

    mapping(string => uint256) public nameToFavoriteNumber;

    // view: reads state from blockchain, no tx required, disallows modification of state.
    // pure: disallow reading from state OR storange, AND disallows modification of state.
    // if another function that costs gas calls a view/pure function, then it DOES cost gas tho.
    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push( Person(_favoriteNumber, _name) );
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}
