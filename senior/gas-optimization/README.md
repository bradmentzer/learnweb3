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
