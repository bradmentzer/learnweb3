# Ceramic

Ceramic is a mutable, decentralized, general purpose data network for buildng web3 apps.

Ceramic is building:

- A generalized data protocol
  - where data can be modified only by the owner
  - with high volume data processing
  - with global data availability and consistency
  - with support for fast querying
  - with interoperable data across applications
  - and community governance

dApps can use Ceramic's data protocol to build standardized multi-chain reputation systems. A user can connect multiple wallets to their decentralized identity, belong from different blockchains, and data can be written to and updated from the user's decentralized data store on Ceramic.

Decentralized identity on Ceramic is by the 3ID system where a user can link multiple wallets to form a singular 3ID. Data on Ceramic is refered to as Streams. Streams have a uniqure StreamID which remains the same throught the lifetime of a stream. Owners can change the contents of a stream.

Streams have a genesis state which is the inital data. Users creat commits on streams which modicies the data. The latest state of a stream is the tip.

Self.ID is a single libreay that encapsulates 3ID accounts in a single browser.
