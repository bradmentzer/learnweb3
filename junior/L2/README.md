# Layer 2

Layer 2 scaling solutions are built on top of existing L1 blockchains (known as parent chains or root chains). The L1 is the network to which L2s connect.

Layer 2 refers to the secondary framework or protocol that is built on top of a blockchain system. L2s can address the transaction speed and scaling difficulties faced by the parent chain. L2 solutions traditionally offer better transactions fees when compared to transacting on the parent chain.

L2 protocols are designed to integrate with the underlying blockchian to improve transaction thorughput and rely on the consensus mechanism and security of th emain chain. L2 operations can be performed independently of L1 and which is why this is referred to as an "off-chain" solution. L1 = security, L2 = speed.

Transactions on L2 happen on a different chain and these transactions are periodically moved to the main blockchain. The connection between the two chains is referred to as a bridge. A major factor for every L2 is how transactions are validates and confirmed before moving to the main chain.

There are two main dimensions where Layer 2 scaling solutions differ from each other. The first is transaction execution and the second is data availability.

- Transaction execution: Strategies that deal with how transactions are run, wherre they are run, what the trust enviorments are, what the security and decentralization enviorments are, etc..
- Data avaliability: Strategies that deal with whether or not the L2 solutioon makes their transaction data avaliable on the L1 chain

1. State channels
2. Side chains
3. Rollups
   - Optimistic rollups (OR)
   - Zero-knowledge rollups (ZKR)
   - ZKR vs OR
   - Plasma
4. Data avalibility
   - Validiums
   - Volitions

## State Channels

State channels were the first scaling solution for blockchains and are used when two or more users want to do a bunch of transactions in a trusted setting without paying gas every single time.

Let's say Alice and Bob want to put 10 ETH down to play a game of tic tac toe. Also, let's say Alice and Bob trust each other. We might design a smart contract such that each move is recorded on the blockchain, and, at the end of the game, either Alice or Bob receive their winnings. But this would be an expensive game, since each move would cost either Alice or Bob gas fees. This can be solved with state channels.

Instead of designing a smart contract to support tic tac toe move by move, we design a smart contract that allows opening and closing a state channel. Once opened, the state channel will have the default start state of the game, and Alice and Bob can makes moves on it without paying gas fees, because the opened state channel will be off-chain. Every move will not be written to the main chain. When the channel is closed, the end state of the game is written to the main chain, along with processing the winnings from the game. Instead of writing every move to the blockchain, only the start and end of the game is written to the blockchain, saving transaction fees. This is useful for transactions that might consist of a large quantity of moves.

These state channels are also called payment channels in apps that involve crypto transfers.

State channels can be faster with cheaper transactions and also provide more privacy. The state channel was just between Alice and Bob, but since each move was not published to the blockchain, each move is not public.

To open the channel, both Alice and Bob had to put down 10 ETH. That money is locked into the smart contract until the state channel is closed. However, if Alice goes offline on her move, neither party will get their money back. All participants are required to close the state channel.

## Side Chains

A side chain is an independent EVM-compatible blickchian which runs parallel to a main blockchain and has a channel to L1. A side chain has its own validators and consensus method of adding blocks. Side chains accumulate transactions quickly and chaply and sumarize them to the main chain through the channel.

Side chains are based on the EVM and come with the same benefits like writing smart contrancts in solidity and interacting with the chain using web3 APIs.

Side chains can be more centralizes and their consensus protocol uses a less secure or decentralized methos to increase transaction speed.

Side chains are not technically L2s because they do not have the security of the main chain.

## Rollups

Solutions that perform transaction execution on L2 and post transaction data on L1. Moves computation off chain. Transaction data can be verified by the blockchain and is trustless.

Proofs are the main distinction between different types of rollups.

### Optimistic Rollups

In optimistic rollups, batches of transaction data are posted to the main chain and presumed to be valid by default (hence the name optimistic) but can be challenged by other users.

Challenges to a transactions validity is a submitted through a fraud proof to proove a transaction contained an invalid state. If the fraud proof is valid, these invalid state transitions would be rolled back. If nobody challenges the transaction, it will be committed to the main chain.

- asserter: the proposer attempting to post a proof of transactions on the main chain, thereby asserting their validity
- challenger: the user trying to prove that the proof posted by the asserter is fraudulent
- verifier: a smart contract on the main chain that verifies the proof and checks it's validity

An asserter has to provide a bond to propose a block of transactions, usually in the form of some ETH. A challenger also has to provide a bond (usually ETH) to make a challenge. The verifier will verify the transaction(s) on the main chain.

If the asserter is found to be fraudulent, they lose some of their bond. The verifier gets some of the asserter's bond for processing the verification, and the challenger gets another portion of the asserter's bond as a reward for finding the fraud.

If the asserter is found not to be fraudulent, the challenger loses some of their bond. The verifier gets some of the challenger's bond for processing the verification as before, and this time the asserter gets some of the challenger's bond as a reward for their trouble.

### ZK Rollup

Everyone who proposes a new set of rolled up transactions to be added to the main chain constructs a zero knowledge proof for it. This can be automatically verified by the smart contract that controls adding transactions to the main chain.

### ZK vs OR

ZK rollups do not require a challenger and transactions are verified automatically.

ZK rollups are difficult to construct, mathematically speaking. Every use requires a matching cryptographic proof, which can take a long time to find.

ZK proofs are often complex and expensive to verify. The more operations the smart contract contains, the more expensive it is to run.

## Plasma

[Plasma](http://plasma.io/plasma.pdf) is a framework for building scalable, layer 2 applications.

A chasma chain is a separate offchain cild blockchain that is connected to the mainnet ethereum chain. Plasma uses fraud proofs like OR to solve disputes. A plasma chain uses their own consensus algo to create blocks like a dise chain. The blocks are compressed into a Merkle tree at fixed intervals. The implementation of Plasma gives the ability of hundreds of side chain transactions to be processed offline with only a single hash of the side chain block being added to the Ethereum blockchain.
Plasma chains only interact with the main chain to commit their state and facilitate entry of exit from the plasma chain.
Withdrawals to the main chain are delayed by several days to allow for challenges, as with optimistic rollups.
Plasma implementations rely on validators to watch the network and ensure security.

A popular example of a plasma chain is the Polygon PoS chain.

## Data Avalibility

On main chains, all data is posted publicly on the blockchain. This carries along with it significant privacy issues.

For example, if a professional trading firm was trading massive amounts on money on a DEX, they likely do not want their trading strategies to be made public, otherwise it's not useful to them anymore.

Both rollup techniques store data on-chain by posting verifiable proofs on the main chain, but ZKR's use validity proofs which are verified upon posting, whereas OR's rely on challengers to catch fraudulent proofs. Plasma chains store most data off the main chain, and only need to touch main-chain usually when there is a dispute

### Validium Chains

[Validium](https://ethereum.org/en/developers/docs/scaling/validium/) is similar to ZKR except data is stored off the main chain. Transaction data is not published which introduces new trust assumptions. This is typically achieved through a committee of known entities who stake their business reputation on being reliable data providers. If an L2 node operator stops servicing withdrawal requests, this committee will make its copy of the data publicly available.
Validium is a type of data-availability situation, and does not concern itself with how transactions are executed. Typically you can use a Validium approach with ZKR based transaction execution.

### Volition Chains

Volition chains are those which are derived from Rollups and Validium data-availability approaches. They allow for a hybrid data-availability scenario where users can decide what they want on the main chain and what they do not want on the main chain.

For example, a large trading firm may not want every single trade it makes to be available publicly on the main chain, but at the end of the week require a proof to be posted on the main-chain to inherit it's security benefits. So they can store data off-chain for each individual transaction, but bring it on-chain for the overall week's profit/loss and balance changes.

Similar to Validiums, this is a data-availability situation, and does not concern itself with how the transactions are executed. Typically, you can use a Volition approach with ZKR's.
