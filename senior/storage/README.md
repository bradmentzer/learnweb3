# Storage

Smart contracts are run with the Ethereum Virtual Machine (EVM)
The EVM runs OPCODES and deals with data in either the stack or heap.

Ethereum works as a trasaction-based state machine.

## World State

The Ethereum world state is a mapping between addresses and account states Each address has its own state. In short, the world state is comprised of various account states.

## Account State

The account state contains the nonce and balance in ETH. Smart contracts contain a storage hash and a code hash. The hashes act as a reference to a stte tree which stores state variables and bytecde of the smart contract.

- Externally owned account (EOA) (user account) address connects to
  - nonce
  - balance
  - EOA is controlled by provate key. EAO cannot contain EVM code.
- Contract account (smart contract) address connects to
  - nonce
  - balance
  - storage hash
  - code hash
  - Contract contains and is controlled by EVM code

## Types of Transactions

- Create new contracts

  - Creates a new account to the world state
  - Transaction carries bytecode of the contract and initalizing code (constructor calls)

- Send messages
  - making a transaction to transfer ETH or call function on smart contract
  - Account state of existing account is modified

### Messages

Contain data and value

- Data
  - set of bytes
  - indicates the type of transation that takes place
- Value
  - Ether value to be transfered with transaction

## EVM

Ethereum smart contracts runtime enviorment is the EVM. The EVM has a stack-based architecture.

EVM code lives in an immutable storage location. Local variables are stored in wither the stack or the heap.

- Stack

  - stack memory
  - 256 bits x 1024 elements
  - last-in-first-out push/pop structure
  - runs all operations from EVM
  - can define 16 local variables

- Heap

  - volatile memory can store dynamic data
  - byte addressing linear memory
  - all locations initially defined as 0

- Account
  - persistent memory
  - part of world state
  - 256 bits to 256 bits KV storage
  - all locations initally defines as 0
  - each state varible in a smart contract is assigned a slot within the account storage in the order they were defined
