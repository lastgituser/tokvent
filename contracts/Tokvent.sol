pragma solidity ^0.4.0;

contract Tokvent {

    uint _totalSupply;

    constructor () {
        
    }

    function totalSupply () public view returns (uint) {
        return _totalSupply;
    }

}
