# tx.origin Attack

tx.origin is a global variable that returns the address that created teh origional transaction, similar to msg.sender.
tx.origin referes to the origional external account that started the transaction and msg.sender is the immediate account that called the function.

## Attack

The attack will happen as follows, initially addr1 will deploy Good.sol and will be the owner but the attacker will somehow fool the user who has the private key of addr1 to call the attack function with Attack.sol.

When the user calls attack function with addr1, tx.origin is set to addr1. attack function further calls setOwner function of Good.sol which first checks if tx.origin is indeed the owner which is true because the original transaction was indeed called by addr1. After verifying the owner, it sets the owner to Attack.sol

And thus attacker is successfully able to change the owner of Good.sol
