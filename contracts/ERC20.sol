// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ERC20 {

    string private _name;
    string private _symbol;
    uint private _totalSupply;
    mapping(address => uint) private _balances;
    mapping(address => mapping(address => uint)) private _allowance;
    // uint public reserve;
    // uint public peg;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
    // event Issued(uint value);
    // event Redeemed(uint value); 


    constructor(string memory name, string memory symbol) {
        _name = name;
        _symbol = symbol;
        _totalSupply = 100;
        _balances[msg.sender] = 100;
    }


    //mint token
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");


        _totalSupply += amount;
        unchecked {
            // Overflow not possible: balance + amount is at most totalSupply + amount, which is checked above.
            _balances[account] += amount;
        }

        emit Transfer(address(0), account, amount);

    }

    // function transfer(address to, uint value) public returns (bool success) {
    //     require(balances[msg.sender] >= value);
    //     balances[msg.sender] -= value;
    //     balances[to] += _value;
    //     emit Transfer(msg.sender, to, value);
    //     return true;
    // }

    //chack balance
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function totalSupply() public view virtual returns (uint256) {
        return _totalSupply;
    }
    function name() public view virtual returns (string memory) {
        return _name;
    }

    function transfer(address to, uint amount) public virtual returns (bool) {
        address owner = msg.sender;
        _transfer(owner, to, amount);
        return true;
    }

    function _transfer(address from, address to, uint256 amount) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
            // Overflow not possible: the sum of all balances is capped by totalSupply, and the sum is preserved by
            // decrementing then incrementing.
            _balances[to] += amount;
        }

        emit Transfer(from, to, amount);

    }


    //approve allowance 
    function approve(address spender, uint value) public returns (bool success) {
        _allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    
    //chack allowance 
    function allowance(address owner, address spender) public view virtual returns (uint256) {
        return _allowance[owner][spender];
    }

    function transferFrom(address from, address to, uint value) public returns (bool success) {
        require(_balances[from] >= value && _allowance[from][msg.sender] >= value);
        _transfer(from, to, value);
        emit Transfer(from, to, value);
        return true;
    }

    function decimals() public view returns (uint8) {
        return 18;
    }

}
