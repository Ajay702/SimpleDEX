// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SimpleDEX {
    address public owner;
    IERC20 public tokenA;
    IERC20 public tokenB;
    uint public exchangeRate;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor(address _tokenA, address _tokenB, uint _exchangeRate) {
        owner = msg.sender;
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        exchangeRate = _exchangeRate;
    }

    function setExchangeRate(uint newRate) external onlyOwner {
        exchangeRate = newRate;
    }

    function exchangeTokenAForTokenB(uint amountA) external {
        require(amountA > 0, "Amount must be greater than 0");
        uint amountB = (amountA * exchangeRate) / 1e18;
        require(tokenB.balanceOf(address(this)) >= amountB, "Insufficient tokenB balance");

        require(tokenA.transferFrom(msg.sender, address(this), amountA), "TokenA transfer failed");
        require(tokenB.transfer(msg.sender, amountB), "TokenB transfer failed");
    }

    function exchangeTokenBForTokenA(uint amountB) external {
        require(amountB > 0, "Amount must be greater than 0");
        uint amountA = (amountB * 1e18) / exchangeRate;
        require(tokenA.balanceOf(address(this)) >= amountA, "Insufficient tokenA balance");

        require(tokenB.transferFrom(msg.sender, address(this), amountB), "TokenB transfer failed");
        require(tokenA.transfer(msg.sender, amountA), "TokenA transfer failed");
    }
}