# ArtFlex-NFTs

This project is focused on creating NFTs for AI-generated art with dynamic metadata. The smart contract allows for minting NFTs and updating their metadata, providing flexibility and dynamic content for each token.

## Project Description

The project is a Solidity-based smart contract that enables the creation and management of NFTs (Non-Fungible Tokens) for AI-generated art. Each NFT has dynamic metadata that can be updated by the owner, allowing for a rich and customizable experience. The contract includes functionalities for minting new NFTs, setting their metadata, and updating it as needed.

## Smart Contract Address

The deployed smart contract can be found at the following address:

```
0x32CeeBdC28450279191BE57D12c8Fe6d404ead40
```

## Features

- Mint new NFTs for AI-generated art
- Dynamic metadata that can be updated by the owner
- Secure and decentralized ownership of digital art

## Usage

To use the smart contract, you can interact with it through a web3-enabled interface or directly via smart contract calls. Below is an example of how to mint a new NFT and update its metadata:

### Minting a New NFT

```solidity
// Call the mintNFT function with the recipient's address and the initial metadata URI
uint256 tokenId = contractInstance.mintNFT(recipientAddress, initialURI);
```

### Updating Metadata

```solidity
// Call the updateTokenURI function with the token ID and the new metadata URI
contractInstance.updateTokenURI(tokenId, newURI);
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
