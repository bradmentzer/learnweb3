# .delegatecall()

The .delegatecall() method is used to call a function in a target contract and when the function is executed in the target contract, the contect is passed from the origional contract. The code from the origional contract gets executed in the carget contract, but variables are modified in origional.
This method uses the storage of the origional contract when executing the function in the target.

## How this works

When using .delegatecall(), all state changes in the target contract reflect origional contracts state. The function is executed on the target contract.

A function in Ethereum can be represented by 4 + 32 _ N bytes where 4 bytes are for the function selector and 32 _ N bytes are for function arguments.

The function selector is got by hashing the function name and its arguments with no empty space and take it's first four bytes.
Function arguments convert each argument into a hex string of length 32 bytes and concatenate them.

## Use

Used with proxy contracts. The storage contract makes a call using .delegatecall() which allows differenct versions of the code while maintaining the same storage. The logic changes but data does not.

This directory contains three contracts: Attack, Good, Helper. Attack is used to change the owner of Good using .delegatecall()

Avoid this attack by using stateless library contracts. The contracts where you delegate the call should only be used for the execution of logic and should not maintain state. Then, it will not be possible for functions to modify the state of the calling contract.
