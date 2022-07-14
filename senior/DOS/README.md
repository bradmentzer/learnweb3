# DOS Attack

Denial of Service (DOS) attack is designed to disable, shut down, or distrupt a network, service, or website. Regular users are unable to access the service.

There will be two smart contracts - Good.sol and Attack.sol. Good.sol will b run a sample auction where it will have a function where user can become the current winner of the auction by sending Good.sol higher amount of ETH than was sent by the previous winner. After the winner is replaced, the old winner is sent back the money which he initially sent to the contract.
Attack.sol will attack so after it's the current winner, it will not allow anyone else to replace it.
