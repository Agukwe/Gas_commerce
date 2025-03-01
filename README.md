# Gas Commerce Clarity Smart Contract

## Overview
The **Gas Commerce** smart contract is built using **Clarity** to facilitate gas token purchases and withdrawals securely and efficiently. The contract includes **admin controls, transaction events, and scalable query functions**, ensuring a seamless experience for users.

## Features
- **Admin Control**: Only the contract owner can modify gas prices and transfer ownership.
- **Gas Purchase**: Users can buy gas based on predefined prices.
- **Gas Withdrawal**: Users can withdraw their gas balance securely.
- **Query Functions**: Users can check balances, verify gas types, and list available gas types.
- **Event Logging**: All key actions are recorded using smart contract events for transparency.

## Functions
### 1. Admin Functions
- `set-gas-price(gas-type, price)`: Updates the price of a specific gas type (Admin only).
- `transfer-ownership(new-owner)`: Transfers contract ownership to another user.

### 2. User Functions
- `purchase-gas(gas-type, amount)`: Allows users to buy gas.
- `withdraw-gas(amount)`: Enables users to withdraw their gas balance.
- `get-balance(user)`: Retrieves the gas balance of a specific user.

### 3. Query Functions
- `gas-type-exists(gas-type)`: Checks if a gas type is listed.
- `list-gas-types()`: Retrieves a list of all available gas types.

## Events
- `gas-purchased(buyer, amount, gas-type)`: Logs when a user purchases gas.
- `gas-withdrawn(user, amount)`: Logs when a user withdraws gas.
- `gas-price-updated(admin, gas-type, price)`: Logs when the gas price is updated.

## Installation
1. Install **Clarity CLI** if not already installed:
   ```sh
   npm install -g @stacks/cli
   ```
2. Deploy the smart contract using the Stacks blockchain.
3. Interact with the contract using Clarity CLI or a front-end interface.

## Security & Scalability Enhancements
- **Role-based Access Control**: Ensures only authorized users can modify gas prices.
- **Event-driven Architecture**: Improves tracking of transactions.
- **Upgradeability Considerations**: Allows future modifications with minimal impact.

## License
This project is open-source and available under the **MIT License**.

---
For further details or contributions, feel free to open a pull request or raise an issue!
