pragma solidity ^0.4.0;

contract Tokvent {

    // Total supply of all Tokvent tokens minted.
    uint _totalSupply;

    // Hash map containing information of all balances of all token holders.
    mapping (address => uint) _balances;

    // Hash map containing information about how much money the token owner has
    // allowed the spender to place into the spender's own account.
    mapping (address => mapping (address => uint)) _allowances;

    constructor () {
        
    }

    // Function that returns total supply of all tokens minted.
    function totalSupply () 
                        public view returns (uint) {
        return _totalSupply;
    }

    // Function that returns balance of a particular token owner.
    function balanceOf (address tokenOwner) 
                        public view returns (uint balance) {
        return _balances[tokenOwner];
    }

    // Function that returns amount that the tokenOwner has allowed the spender
    // to take from the tokenOwner's account and place into the spender's
    // account.
    function allowance (address tokenOwner, address spender) 
                        public view returns (uint remaining) {
        return _allowances[tokenOwner][spender];
    }

}
