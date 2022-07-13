# Flash Loans

[Flash loans](https://docs.aave.com/developers/guides/flash-loans) are a DeFi concept from Aave which allows a user to borrow a large quantity of money that is not collateralized.

The borrow must return the amount of the loan with interest by the end of the transaction. if the borrow is unable to pay, the transaction fails.

Flash loans are useful for arbitrage between assets and are used in DeFi hacks.

## Use

To use a flash loan, a user creates a smart contract using a flash loan. The function createFlashLoan() will happen in four steps.

1. Your contract calls a function on a Flash Loan provider, like Aave, indicating which asset you want and how much of it
2. The Flash Loan provider sends the assets to your contract, and calls back into your contract for a different function, executeOperation()
3. The executeOperation function is all custom code you must have written. At the end, you approve the Flash Loan provider to withdraw back the borrowed assets, along with a premium
4. The Flash Loan provider takes back the assets it gave you, along with the premium.

The user started a transaction by calling the createFlashLoan method in FlashLoan Contract. When the user calls this function, the contract calls the Pool Contract, which exposes the liquidity management methods for a pool of assets. When the Pool Contract recieves a request to create a flash loan, it calls executeOperation method with the DAI the user requested. The Pool Contract allows your contrat the asset to borroe and requires you to have the executeOperation method.

After calling the executeOperation method and recieving the DAI, you can call the contraact for Exchange A and buy some token from the DAI the Pool Contract sent. After recieving this token, you ca swap them for DAI by calling Exchange B contract.

Never store flashloan funds in a contract because it is vulnerable to a [griefing attack](https://ethereum.stackexchange.com/questions/92391/explain-griefing-attack-on-aave-flash-loan/92457?newreg=ad9c8df3e40b4314bf0d9461766c1d2c)
