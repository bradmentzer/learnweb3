# Re-entrancy attack

The re-entrancy attack is one of the oldest vulnerablilities in smart contracts and is responsible for the [DAO Hack](https://www.coindesk.com/learn/2016/06/25/understanding-the-dao-attack/) of 2016.

Re-entrency is the vulnerablility in which is Contract A calls a function in Contract B, Contract B can get called back into Contract A while Contract A is processing. This allows for the possibility of draining smart contracts.

Contract a has function f() that

- Checks the balance of ETH deposited into Contract A by Contract B
- Sends the ETH back to Contract B
- Updates the balance of Contract B to 0

Becasue the balance gets updated after ETH is sent, Contract B creates a fallback() which would execute when it recieved ETH and found call f() in Contract A again until it is out of ETH.
