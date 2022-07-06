# EVM

Blockchains are like distributed ledgers and Ethereum functions like a distributed [state machine](https://en.wikipedia.org/wiki/Finite-state_machine).

The rules for specifying state change is defined by the EVM.

Given a current state and a set of valid transactions, it produces a new state.

`Y(S, T) = S'`

Given old valid state 'S' and new valid transactions 'T', the state transition function 'Y' produces new valid state 'S'.

Ethereum nodes contain implementations of the EVM and the EVM can execute code on it. EVM code is compiled smart contract bytecode that can be natively executed.

## OPCODES

The EVM is a stack machine with a maximum depth of 1024 items. each item is a 256-bit word.

EVM maintains transient memory durning execution as a 32 byte addressed byte array. this memory is not stored and is cleared when a new transaction is executed.

Smart contracts maintain their own state in the bockchain, modeled through the Merkle tree, and is referred to ad EVM storage.

EVM logic allows OPCODES which contain ooperations like XOR, ADD, AND, SUB, MUL, BALANCE and BLOCKHASH.

Comiled smartcontract bytecode represented in hexidecimal compiles down to opcodes which are executed.

The [Ethereum Yellowpapper](https://ethereum.github.io/yellowpaper/paper.pdf) contains specifications for EVM implemntations
