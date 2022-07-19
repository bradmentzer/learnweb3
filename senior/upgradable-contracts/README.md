# Upgradable Contracts

Upgrade contracts ising the [proxy pattern](https://docs.openzeppelin.com/upgrades-plugins/1.x/proxies).

The contract is split into two contracts

- Proxy contract: Responsible for managing the state of the contract which involves persistent storage
- Implementation contract: Responsible for executing the logic and doesn't store persistent state

User calls the proxy contract which does a delegatecall to the implementation crontract that implement the logic.

Delegatecall allows the state to live in one contract and persist across upgrades made to the implementation contract.

The implementation contract can be repleced to upgrade the logic without affecting the state of the proxy.

The three ways to upgrade the implementation project is :

- Diamond Implementation
- Transparent Implementation
- UUPS Implementation

All functions are forwarded to the implementation contract and the address of the implementation contract can be updated using `upgradeTo(address)`

The upgradeTo function in located in the proxy contract for the transparent pattern, and in the implementation contract for the UUPS pattern.

Implementation contracts should not include constructors. They do contain [initializers](https://github.com/OpenZeppelin/openzeppelin-contracts-upgradeable/blob/master/contracts/token/ERC721/ERC721Upgradeable.sol#L45) which allow the code to be included in the bytpecode to the proxy contract can delegatecall the initializer.

## Transparent Pattern

Simple way to separate responsibilities between proxy and implementation. The upgradeTo function is part of the proxy contract and the implementation can be upgraded by calling upgradeTo on the proxy.

There might be a case where proxy and implementation have a function with the same name and arguments, like owner(). The problem is delt by the proxy contract which decided where the call goes dependent on the msg.sender variable.

If the msg.sender is the admin of the proxy then the proxy will not delegate the call and will try to execute the call. If it's not the admin address, the proxy will delegatecall to the Implementation Contract even if the matches one of the proxy's functions.

The proxy contract checking if owner is admin will take unnecessary gas to the majority of transactions.

## UUPS Pattern

The upgradeTo function is also part of the Implementation contract and is callsed using a delegatecall through the proxy by the owner. Whether the admin or user, call calls are sent to implementation contract and the contract does not check for admin, saving gas. Developers can also customize the function by adding items like TimeLock, AccessControl, with every new implentation.

The issue with having upgradeTo inside implentation is is causes increased complexity of code and the contract is more prone to attack. If the upgradeTo function is forgotten in future versions, then the contract can no longer be upgraded.
