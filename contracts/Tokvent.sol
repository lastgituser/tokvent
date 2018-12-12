pragma solidity ^0.4.0;

contract Tokvent {

    // Total supply of all Tokvent tokens minted.
    uint _totalSupply;

    // Hash map containing information of all balances of all token holders.
    mapping (address => uint) _balances;

    constructor () {
        
    }

    // Function that returns total supply of all tokens minted.
    function totalSupply () public view returns (uint) {
        return _totalSupply;
    }

    // Function that returns balance of a particular token owner.
    function balanceOf (address tokenOwner) public view returns (uint balance) {
        return _balances[tokenOwner];
    }

}
