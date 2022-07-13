# Private Data

Function visibility modifiers only affect visibility of the function and not access to their values.
Public functions can be called both externally and by users and smart contracts, and the smart contract itself.
Internal functions can only be called by the smart contract itself and not outside users and smart contracts.
External functins can only be called by external users and smart contracts, but not the smart contract itself.
Private is similar to internal except internal functions are callable by derived contracts whereas private are not.
This works the same for variables marked private.

## Smart contract

This directory contains a smart cont5ract with a user name and password marked as private variables.
