# Consensus

Blockchains are distributes decentralized databases and network nodes agree on current state.

Consesnus protocols prevent certain network attacks.

## Proof-of-Work

Miners produce new blocks and process transactions.
Miners use brute force to find the nonce within a given difficulty target.

### Sybil Resistance

Proof-of-Work is technically a sybil restant mechanism and block producer selector.

Sybil resistance is how a protocol protects against a sybil attack. a sybil attack is when one or more useres pretend to be differenct users.

Suppose there are 2 miners on the network. Alice and Bob. By random selection, they should be getting roughly half of the mining rewards each. Now, Charlie comes along, but pretends to be 2 different users - Charlie and Darcy. By random selection now, Charlie would end up receiving 1/2 the mining rewards as he is pretending to be 2 different users, whereas Alice and Bob only get 1/4 each instead of 1/3 which they should.

The large amount of computational power requires to mint the bloock protects against sybil attacks.

## Chain Selection

Two miners can produce a block at the same time. This is called a fork. Nodes need to choose the correct chain to add to to prevent splitting the state.

Bitcoin and ethereum use the logest chain rule and whichever chain is accepted by a higher number of nodes continues to grow and is the correct chain.

Proof of work and the longest chain rule makes up "Nakamoto Consensus"

Blocks that are minted but rolled back and deleted due to the longest chain rule are called uncle blocks. Miners are rewarded 1.75 ETH for minting these uncle blocks as it was a problem of metwork latency.

## Finality

A transaction has inality when it is part of a block that cannot be changed.
The recommended time for finality for Ethereum is 6 blocks or 1 minute.
