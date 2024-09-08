# SimpleDEX Smart Contract

## Overview
The SimpleDEX project is a basic decentralized exchange (DEX) smart contract developed using Solidity. It allows users to swap between two ERC20 tokens at a fixed exchange rate. The contract is designed for simplicity, making it easy for beginners to test and learn about token exchanges on the Ethereum blockchain using Remix IDE.

## Prerequisites

Before starting, ensure you have the following:
- **Remix IDE**: [Remix](https://remix.ethereum.org/) is an online IDE for writing, testing, and deploying Solidity smart contracts.

## Contract Overview

### State Variables
The contract includes three key state variables:
- `owner`: Stores the address of the contract owner, who has permission to modify the exchange rate.
- `tokenA` and `tokenB`: Store the addresses of the two ERC20 tokens that can be exchanged.
- `exchangeRate`: Determines the rate at which `tokenA` is exchanged for `tokenB`.

### Functions
The contract provides the following functions:
- **constructor**: Initializes the contract by setting the owner, the token addresses, and the initial exchange rate.
- **setExchangeRate**: Allows the owner to update the exchange rate between `tokenA` and `tokenB`.
- **exchangeTokenAForTokenB**: Allows users to exchange a specified amount of `tokenA` for `tokenB`, provided the contract has sufficient `tokenB` balance.
- **exchangeTokenBForTokenA**: Allows users to exchange a specified amount of `tokenB` for `tokenA`, provided the contract has sufficient `tokenA` balance.

## Setup Environment

### Step 1: Open Remix IDE
Navigate to [Remix IDE](https://remix.ethereum.org/) in your web browser. Remix is an online development environment for writing, deploying, and testing Solidity smart contracts.

### Step 2: Create a New Solidity File
In the File Explorer section of Remix, create a new Solidity file with the `.sol` extension (e.g., `SimpleDEX.sol`). This file will contain the smart contract code for the SimpleDEX.

### Step 3: Compile the Contract
Once you've written the smart contract code, go to the "Solidity Compiler" tab in Remix. Select the appropriate compiler version (0.8.0 or later) and click the "Compile" button. Ensure there are no errors during compilation.

## Deployment Instructions

### Step 1: Choose Deployment Environment
In the "Deploy & Run Transactions" tab of Remix, select an environment for deployment:
- **Remix VM (Cancun)**: Use this for testing in a simulated blockchain environment provided by Remix. It doesn't require real ETH.

### Step 2: Deploy the Contract
To deploy the contract, provide the following parameters to the constructor:
- **Token A Address**: The address of the first ERC20 token.
- **Token B Address**: The address of the second ERC20 token.
- **Exchange Rate**: The fixed exchange rate between `tokenA` and `tokenB`. For example, an exchange rate of 1:1 can be represented by providing a value like `1000000000000000000` (which corresponds to 1 token with 18 decimals).

Click the "Deploy" button to deploy the contract to the selected environment.

## Testing the Contract

To test the functionality of the contract, you need two ERC20 tokens. You can use existing token contracts or deploy your own simple ERC20 tokens in Remix.

### Step 1: Approve the Contract to Spend Tokens
Before exchanging tokens, ensure that the user has given the contract permission to transfer tokens on their behalf. Use the `approve` function of the token contracts to allow the DEX to spend tokens.

### Step 2: Test Token Swaps
You can now call the following functions to simulate token exchanges:
- **Exchange Token A for Token B**: Use the `exchangeTokenAForTokenB` function, passing in the amount of `tokenA` you want to exchange. The contract will calculate the corresponding amount of `tokenB` and perform the transfer.
- **Exchange Token B for Token A**: Use the `exchangeTokenBForTokenA` function, passing in the amount of `tokenB` you want to exchange. The contract will calculate the corresponding amount of `tokenA` and perform the transfer.

### Step 3: Verify Token Balances
After performing swaps, check the balances of `tokenA` and `tokenB` for both the user and the contract. Ensure that the correct amounts have been exchanged based on the specified exchange rate.

## Example Deployment Parameters

- **Token A Address**: `0x5B38Da6a701c568545dCfcB03FcB875f56beddC4`
- **Token B Address**: `0xAb8483F64d9C6d1EcF9b849Ae677dD3315835Cb2`
- **Exchange Rate**: `1000000000000000000` (which represents a 1:1 exchange rate)

These values are just examples; you can use any valid ERC20 token addresses and adjust the exchange rate as necessary.

## License

This project is licensed under the MIT License.
