# Solidity

### Mapping

Like hashmaps in rust. Used to store key-value pairs
`mapping (keyType => valueType)`

The key can also point to a second nested mapping.

### Enums

Define types that contain a set of constants called members. Restrict variable to have predefined values. Representes as uint

### Struct

Define a specialized data type which group related data.

### View and Pure

Getter functions return a value and can be declared as 'view' or 'pure'

- view: functions do not change state values
- pure: functions no not change or read state values

### Modifiers

Code that can run before or after function call to restrict access to certain functions, validate input parameters, and protect against certain attacks.

### Events

Allow contracts to perform logging on Ethereum blockchian. Logs can be parsed to perform updates on frontend. Allows frontend interfaces to listen for specific events and update user interface.

### Constructor

Optional function to be executed when contract is first deployed

### Inheritance

One contract inherits the attributes and methods of another contract using the 'is' keyword.

A function within a partent contract is declared virtual to be overridden by a child. The child contract used the 'override' keyword.

### Transfering ETH

Recommended to use the call function which returns a bool indicating success of the transfer

To recievle ETH, a contract must include
`receive() external payable`
if msg.data is an empty value and
`fallback() external payable`
if otherwise
