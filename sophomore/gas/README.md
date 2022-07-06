# Gas

Gas is a unit measuring the amount of computational effort a node must use to complete a transactions. Gas fees are paid in ether. The London Upgrade of August 2021 changed how gas fees are calculated.

Gas fees are calculated in gwei. 1 ETH = 10^9 Gwei.

## Pre-London

Before the London upgrade gas fees were calculated by the equation:
`gas fees = gas spent * gas price `
Gas spent is the total abount of gas that was used to execute the transaction and gas price is the abount of ether a user is willing to pay per gas unit.

The cheapest transaction is the transfer of ETH from one account to another, which costs 21,000 gas units.

If Alice wanted to send 1 ETH to Bob, the gas cost will be 21,000 gas. If the gas price is 200 Gwei, the gas fee can be calculated by:
`gas fees = 21,000 * 100 = 2,100,000 Gwei = 0.0021 ETH`

Transactions with higher gas prices will be executed by the miners first. Wallets like MetaMask will automatically estimate gas price based on network congestion.

A smart contract is compiled into bytecode then comiled into [OPCIDES](https://github.com/crytic/evm-opcodes) before deployment. These are operations with fixed gas costs. Smart contracts with more OPCODES require more gas to execute.

### Gas Limits

The maximum amount of gas a user is willing to spend for a transaction. Falied transactions will not have gas refunded.
The Ethereum network limits the amount of gas allowed in a single block. Complex transactions take longer to execute and all nodes must remain in sync.

## Post-London

London fork occured on August 5th, 2021 and introduced:

- better gas fee estimations
- quicker transactions
- burning a percentage of ETH being used as transactions

Instead of wallets scanning the last 1,000 blocks and predicting gas price, post-london introduced every block with a base gas price fee.
This is the minimum price per unit gas for getting a transaction in a block and is calculated natively by the network. Base fees are burnt by the network to offset issuance.
Tipping (priority fees) were introduced to compensate miners for executing transactions.

With this upgrade, the formula to calculate gas fees changed to the following:

`gas fees = gas spent * (base fees + priority fees)`

If Alice had to pay Bob 1 ETH, the gas cost is 21,000, the base fees is 100 Gwei, and Alice decides to include a tip of 10 Gwei.

`total gas fees = 21,000 * (100 Gwei + 10 Gwei) = 2,310,000 Gwei = 0.00231 ETH`

## Variablility

Pre-London blocks had a maximum capacity of 15M gas. Post-London blocks introduced variablility to block size and blocks have a target gals limit of 15M gas, but can increase or decrease to a maximum of 30M gas. Optimization occures through modifying block size and base fees.
If block gas is greater than 15M, base fees are increased. If block gas is smaller than 15M, decreased.
Base fees are increased exponentially by a maximum of 12.5% per block indefinitely if 15M gas target is exceeded.
