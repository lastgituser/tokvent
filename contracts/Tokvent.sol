pragma solidity >= 0.4.0 < 0.6.0;

contract Tokvent {

    // Total supply of all Tokvent tokens minted.
    uint _totalSupply;

    // Hash map containing information of all balances of all token holders.
    mapping (address => uint) _balances;

    // Hash map containing information about how much money the token owner has
    // allowed the spender to place into the spender's own account.
    mapping (address => mapping (address => uint)) _allowances;

    // Funds have been transferred
    event Transfer (address indexed from, address indexed to, uint tokens);

    // Funds have been approved
    event Approval (address indexed tokenOwner, address indexed spender, 
                    uint tokens);

    constructor () public {
        _totalSupply = 100000;
        _balances[msg.sender] = 100000;
    }

    // Total supply of all tokens minted.
    function totalSupply () 
                          public view returns (uint) {
        return _totalSupply;
    }

    // Balance of a particular token owner.
    function balanceOf (address tokenOwner) 
                        public view returns (uint balance) {
        return _balances[tokenOwner];
    }

    // Amount that the tokenOwner has allowed the spender to take from the 
    // tokenOwner's account and place into the spender's account.
    function allowance (address tokenOwner, address spender) 
                        public view returns (uint remaining) {
        return _allowances[tokenOwner][spender];
    }

    // Transfer a certain amount of funds to a certain address.
    function transfer (address to, uint tokens) 
                       public returns (bool success) {
        require (_balances[msg.sender] >= tokens);
        require (_allowances[from][msg.sender] >= tokens);
        require (_balances[to] + tokens > _balances[to]);
        _balances[msg.sender] -= tokens;
        _balances[to] += tokens;
        emit Transfer (msg.sender, to, tokens);
        return true;
    }

    // Approve a certain token holder to take a certain amount of funds from 
    // the current token holder.
    function approve (address spender, uint tokens) 
                      public returns (bool success) {
        require (tokens > 0);
        require (tokens <= _balances[msg.sender]);
        _allowances[msg.sender][spender] = tokens;
        emit Approval (msg.sender, spender, tokens);
        return true;
    }

    // Transfer funds from address "from" and transfer "tokens" to address "to".
    function transferFrom (address from, address to, uint tokens) 
                           public returns (bool success) {
        require (_balances[from] >= tokens);
        require (_allowances[from][msg.sender] >= tokens);
        require (_balances[to] + tokens > _balances[to]);
        _balances[from] -= tokens;
        _allowances[from][msg.sender] -= tokens;
        _balances[to] += tokens;
        emit Transfer (from, to, tokens);
        return true;
    }

}
