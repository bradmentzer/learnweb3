# Randomness

The tokenURI of NFT collections often uses [abi.encode](https://medium.com/@libertylocked/what-are-abi-encoding-functions-in-solidity-0-4-24-c1a90b5ddce8).
encodePacked takes the value and concatenates multiple values into a singe bytes array and gets rid of padding.
For example, uint256 has 256 bits, but the number 1 using abi.encode would be a string of 255 0 and 1. abi.encodePacked gets rid of the padding 0s and concatenates the value 1.

- How the attack takes place is as follows:

  - The hacker calls the attack function from the Attack.sol
  - attack further guesses the number using the same method as Game.sol which is uint(keccak256(abi.encodePacked(blockhash(block.number), block.timestamp)))
  - Attacker is able to guess the same number because blockhash and block.timestamp is public information and everybody has access to it
  - The attacker then calls the guess function from Game.sol
  - guess first calls the pickACard function which generates the same number using uint(keccak256(abi.encodePacked(blockhash(block.number), block.timestamp))) because pickACard and attack were both called in the same block.
  - guess compares the numbers and they turn out to be the same.
  - guess then sends the Attack.sol 0.1 ether and the game ends
  - Attacker is successfully able to guess the random number

# Use Chainlink VRF for verified randomness
