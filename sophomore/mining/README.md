# Mining

Mining creates new blocks of transactions to be added to the network and keeps the network safe from attach.

Miners validate transactions and add them to the ledger. This prevents the double-spend of cryptocurrency.

Ethereum started with a block reward of 5 ETH, which was lowered to 3 ETH with the Byzantium upgrade in 2017, and to 2 ETH with the Constantinople upgrade in 2019.

## Process

1. User signs a transaction from their account with their private key
2. Transaction is broadcasted to the network through a node
3. Each node recieves the transaction and adds it to their local mempool. the mempool is a list of transactions that nodes have recieved bt not yet been included in a block.
4. A miner roups transactions to maximize transaction fees and:
   - The miner verifies the validity of the transaction (the users owns the asset, signature is valid)
   - The miner executes the transaction on their local EVM
   - The miner creates Proof-of-Work vertificate of legitimacy for the block, after all transactions have been verified and executed on local EVM
5. Miner produces certificate of legitimacy with user transactions and sends block to the network.
6. Nodes recieve block information and verify vertificate, execute transactions in their local copy of the EVM
7. Once all nodes have verified a new block in their local EVM, it is added to their blockchain node and is accepted at the current state
8. Nodes remove the transaction in the block fro their local mempool
9. Repeat

## Rigs

In the early stages of mining, miners used CPUs, which is expensive and slow. Most miners use GPUs to maximize computation and connect multiple GPUs together in parallel. Application-Specific Integrated Circuit (ASIC) mining uses a specialized chip specifically designed for mining Ethereum.
