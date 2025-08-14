# Hotel Booking Smart Contract

A simple Ethereum smart contract for booking a hotel room.  
Built using **Solidity** and deployable on any EVM-compatible blockchain.

## Features
- **Enum-based room status** (`vacant` or `occupied`)
- **Owner address** that receives the payment
- **Booking function** that:
  - Checks room availability
  - Requires exact payment (2 ETH)
  - Transfers ETH to the owner
  - Emits an `Occupy` event
