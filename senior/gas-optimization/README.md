# Gas Optimization

See also:
[Gas optimization](https://mudit.blog/solidity-gas-optimization-tips/)
[Part 2](https://mudit.blog/solidity-tips-and-tricks-to-save-gas-and-reduce-bytecode-size/)

## Variables

For variables of smaller sizes to be stored in the same slot, they must be declared consecutively.

Elements in memory and calldata cannot be packed and are not optimized by the compiler.

Changing storage variables required more gas than variables in memory. It is better to update storage variables after the logic has implemented.

When writing to storage variables in a loop, you should create a local copy in memory because the cost of addional write is still lower than continuously writing to storage.

Fixed length variables are stored in the stack and variable length variables in the heap. Fixed size variables are better for gas optimization.

## Functions

Calling functions is gas intensive. Call one function and extract all data than calling multiple functions.

Public functions can be called externally and internally. When the contract is creating functions that will only be called externally, external is better.
Public functions are copied to memoty which costs gas where external functions are stored in calldata.
Internal functions are passed as references or the variables and not copied into memory again.

Function midifiers use the same stack as the function they are modifying. An internal function inside of the modifier will solve this.
Internal functions dont share the same restricted stack as the the origional function.

## Libraries

Libraries are statelass contracts. The bytecode of a functin called from a library doesnt get deployed with the contract and this saves gas.

## Short ciruiting conditionals

Its better to write conditions so that the least functions are executed to determine if statement is true.
The most likley variable should be the first condition.
