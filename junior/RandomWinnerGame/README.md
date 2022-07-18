# Chainlink VRF

Computers interacting with the blockchain are both deterministic and transparent, so finding a trusted random number cannot be done nativley in Solidity.

## Oracles

- An oracle sends data from the outside world to a blockchain's smart contract and vice-verca.
- Smart contract can then use this data to make a decision and change its state.
- They act as bridges between blockchains and the external world.
- However it is important to note that the blockchain oracle is not itself the data source but its job is to query, verify and authenticate the outside data and then futher pass it to the smart contract.

- Chainlink VRF's are oracles which used to generate random values.
- These values are verified using cryptographic proofs.
- These proofs prove that the results weren't tampered or manipulated by oracle operators, users, miners etc.
- Proofs are published on-chain so that they can be verified.
- After there verification is successful they are used by smart contracts which requested randomness.

- VRFConsumerBase.sol is the contract that will be calling the VRF Coordinator which is finally reponsible for publishing the randomness. It contains two key functions:
  - requestRandomness, which makes the initial request for randomness.
  - fulfillRandomness, which is the function that receives and does something with verified randomness.
- RandomGameWinner contract will inherit the VRFConsumerBase contract and will call the requestRandomness function within the VRFConsumerBase.
- On calling that function the request to randomness starts and the VRFConsumerBase further calls the VRFCoordinator contract which is reponsible for getting the randomness back from the external world.
- After the VRFCoordinator has the randomness it calls the fullFillRandomness function within the VRFConsumerBase which further then selects the winner.

Note the important part is that eventhough you called the requestRandomness function you get the randomness back in the fullFillRandomness function

Verify Contract Address: 0xB61079C547b6B436619a8219Da958F3cc2E215fc
Successfully verified contract RandomWinnerGame on Etherscan.
https://mumbai.polygonscan.com/address/0xB61079C547b6B436619a8219Da958F3cc2E215fc#code

graph init --contract-name RandomWinnerGame --product hosted-service gatorbait-eth/Learnweb3 --from-contract 0xB61079C547b6B436619a8219Da958F3cc2E215fc --abi ./abi.json --network mumbai graph

Build completed: QmX74GeJpACTHxYJAY6MJEJtTKHPCDcg3oauUmhD6PJPaA

https://api.thegraph.com/subgraphs/name/gatorbait-eth/learnweb3

[Entities](https://thegraph.com/docs/en/developing/creating-a-subgraph/#defining-entities)
