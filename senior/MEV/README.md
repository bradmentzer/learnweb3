# Maximal Extractable Value

The [MEV](https://explore.flashbots.net/) that can be extracted from the block production by miners. Miners get to choose which transactions are in included in a block and in the order they are completed.

Independent network participants called searchers exctract a large portion of this value. They pay high gas fees and run bots that automatically submit transactions to make profit. Searchers pay 90% of their profit back to miners.

Gas golfing is making minor optimizations to smart contracts to minimize gas cost as much as possible.Searchers can increase gas price and lower gas fees.

Frontrunners are bots that look through the mempool and search for profitable transactions. They submit the transaction with their address and a higher gas price if the transaaction is profitable.

[Flashbots](https://docs.flashbots.net/flashbots-auction/overview) extend the geth client and allows searchers to submit transactions directly to miners without using the mempool. 

Searchers detect if a user can be liquidates and earn the liquidation fees for completing the transaction first. 

The RPC called by Flashbots is the eth_setBundle

## Sandwich Attack

When making a transaction of a DEX, selling token A for token B would push the price of A down and increase the price of B after the trade is executed. A second transaction, which is the exact same, made after this first one would yield in a lower amount of Token B for the same amount of Token A. Searchers can exploit this fact to actually make the user pay more for Token B.

1. Searcher sells a lot of Token A for Token B, driving down the price of Token A and driving up the price of Token B
2. User's transaction goes through, which also sells a lot of Token A for Token B, but receives less Token B than originally anticipated. This further drives down Token A price and increases Token B price.
3. Searcher sells back their Token B for Token A, ending up with more Token A than they started off with, making a profit.

