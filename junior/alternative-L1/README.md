# Layer 1

layer 1 chains change the rules of the protocol to scale or provide better usablility. This includes increasing the amount of data included in each block, or accelerating the block confirmation time for each block, to increase overall throughput. This comes with reduced security or decentralization by increasing hardware requirements for nodes.

## Near

Near is as blockchain that uses parallel sharding storage and computation technology to scale. It is PoS and has over 50 validators.

### Sharding

Instad of every node on the network processing every transaction, the blockchain is split ip into multiple smaller parts and each validator only needs to worry about their transactions.
This allows for parallel computation of transactions on different shards. This allows for faster processing of transactions, and hence higher scalability.

The 'Beacon Chain' acts as the manager of all the shards. It is responsible for randomly assigning validators to specific shards, recieving updates from the shards, taking snapshot, and processing stakes. This is the bottleneck for scalability.

The beacon chain manages global state. If each of the nodes in the network becomes 4x faster, including nodes on the Beacon chain, each shard will be able to process 4x more transactions, and also the Beacon chain will be able to manage 4x more shards. Therefore, overall it would lead to an increase of 16x in total transaction processing. This is called quadratic sharding. if each of the nodes in the network becomes 4x faster, including nodes on the Beacon chain, each shard will be able to process 4x more transactions, and also the Beacon chain will be able to manage 4x more shards. Therefore, overall it would lead to an increase of 16x in total transaction processing. This is called quadratic sharding.

If a chain forks, decision for which chain becomes the 'true' chain needs to be made on each shard individually, and the logic for the beacon chain and shard chains is different.

The NEAR blockchain is modeled as a single blockchian where eack block contains all the transactions for all the blocks and changes the state of all shards simultaneously. No node needs to download the full state of each block and only downloads their shards.

In NEAR, if a transaction affects more than 1 shard, it is consecutively executed in each shard separately. The entire transaction is first sent to the first shard that gets affected. Once the transaction is executed, a receipt transaction is generated, that is passed to the next shard which is affected. If more shards are affected, more receipt transactions are generated and passed further down the line.

Each subsequent shard can verify the receipt transaction and get confirmation that the preceding shards have done their work. It then executes whatever needs to happen on that shard, and either ends the transaction or passes it further if more shards are being affected.

### Development

VEAR smart contracts are written in Rust or AssemblyScript. NEAR allows developers to upgrade their smart contracts but this can be taken away to make it trustless.

Accounts on NEAR have human readable names, instead of random letters and numbers like on Ethereum.

## Flow

Flow is a PoS blockchain built by Dapper Labs, the project behind CryptoKitties and NBA Topshot. Execution nodes have high staking and hardware requirements.

Flow is based on four foundations that make it unique and worth discussing:

- Multi-role architecture
- Resource-oriented programming
- Upgradeable smart contracts
- Easy onramps from fiat to crypto

### Multi-role architecture

Instead of each node storing the entire blockchain, flow uses pipelining where tasks are handed to different people with different jobs in a sequence, much like an assebly line building a car.

Flow applies pipelining concepts to the blockchain by separating the jobs of a validator node into four different roles:

- Collection
- Consensus
- Execution
- Verification

Flow scales vertically. This means that even though each validator node takes part in validating each transaction, they do so only at the stages of validation. They can therefore specialize for particular tasks at a particular stage of focus.

### Resource-oriented programming

Smart contracts are develop in a language called Cadence.

[Resouce oriented programming](https://medium.com/dapperlabs/resource-oriented-programming-bee4d69c8f8e) is a new language design to be secure and easy to use. It is statically types and guarentees data storage and data ownership. It manages ownership of resourses instrat of specifying the lifetime of data.

1. Each resource can only exist in one place at any given time. Resources cannot be duplicated or accidentaly deleted, through programming errors or through malicious code.
2. Ownership of a resource is defined by where it is stored in the code.
3. Access to methods on a resource is limited only to the owner.
   - For example, only the owner of an NFT can initiate a function that modifies that NFT. This is built into the language directly by placing that NFT's data into the owner's storage, instead of having to create onlyOwner modifiers or similar workarounds.

### Upgradeable smart contracts

On Flow, developers can choose to deploy smart contracts to the mainnet in a "beta state". While in this state, code can be incrementally updated by the original authors. Users are warned about the contract being in the beta state when interacting with it, and can choose to wait until the code is finalized. Once the authors are confident that their code is safe, they can release control of the contract and it forever becomes non-upgradeable after that.

The Flow transaction format makes guarauntees about what kinds of changes a transaction can and cannot make and wallets can provide human-readable information to users to help them make informed decisions about what they are approving.

## Avalanche

Avalanche is a PoS, open source platform for building dApps in an interoperable ecosystem of blockchains, not a singular blockchian. The most popular chain is the C-chain which is EVM compatible. The Avalanche C-Chain memory pool of transactions is not public, and restricted to validators.

### Architecture

Avalanche uses subnetworks or subnets which are a set of validators who work to acheive consensus on a set of blockchains. Each blockchain on Avalanche is validated by one subnet, but each subnet can validate multiple blockchains. Subnets can control who enters them, private subnets can be created which are similar to private or permissioned blockchains.

## Solana

Solana is a stateless PoS blockchain with added Proof of History. Solana uses Rust to write smart contracts.

### Proof-of-History

Solana requires validators to sign cryptographic proofs which can prove that some time has passed since the last proof they provided by hashing the output of a previous hash. All data that was hashed into the proof must have existed before the proof was created. The validators then share this with all the other nodes, which can reproduce the new hash, and verify the cryptographic proof fast enough.

### Architecture

Solana has deterministic leader selectiom, which means that when a transaction is created, the network already knows who the next block creator is going to be and there is no puzzle to solve in competition against other miners. This means that leaders can be subject to DDoS attacks.

Smart contracts are stateless and do not contain variables in the contract. Data is stored in accounts, which is different from an Ethereum account or address. Accounts are data sotred which users pay rent to have their data stored.

Transactions occure through instructions which is a program which is bundled into a message. A message signed by a sender forms a transaction.
