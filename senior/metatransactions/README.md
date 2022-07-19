# Metatransactions

Used to provide gas-less transactions to users. A user can sign a message rather than paying gas for a transaction. A third party pays the gas on behalf of the user.

A digital signature is a methematical verification of the authenticity of a message. The message is isgned with a users private key.

The singed message contains:

- sender
- recipient
- amount of tokens
- tokenContract

How this will happen:

- User first approves the TokenSender contract for infinite token transfers (using ERC20 approve function)
- User signs a message containing the above information
- Relayer calls the smart contract and passes along the signed message, and pays for gas
- Smart contract verifies the signature and decodes the message data, and transfers the tokens from sender to recipient
