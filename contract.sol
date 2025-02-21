// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicNFT {
    mapping(uint256 => string) private _tokenURIs;
    mapping(uint256 => address) private _owners;
    uint256 private _tokenIdCounter;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event MetadataUpdated(uint256 indexed tokenId, string uri);

    function _mint(address to) internal returns (uint256) {
        require(to != address(0), "Cannot mint to zero address");

        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter += 1;

        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);

        return tokenId;
    }

    function _setTokenURI(uint256 tokenId, string memory uri) internal {
        require(_exists(tokenId), "URI set of nonexistent token");
        _tokenURIs[tokenId] = uri;

        emit MetadataUpdated(tokenId, uri);
    }

    function _exists(uint256 tokenId) internal view returns (bool) {
        return _owners[tokenId] != address(0);
    }

    function mintNFT(address to, string memory uri) public returns (uint256) {
        uint256 tokenId = _mint(to);
        _setTokenURI(tokenId, uri);
        return tokenId;
    }

    function updateTokenURI(uint256 tokenId, string memory uri) public {
        require(_exists(tokenId), "URI update of nonexistent token");
        require(msg.sender == _owners[tokenId], "Only the owner can update the token URI");
        _setTokenURI(tokenId, uri);
    }

    function ownerOf(uint256 tokenId) public view returns (address) {
        address owner = _owners[tokenId];
        require(owner != address(0), "Owner query for nonexistent token");
        return owner;
    }

    function tokenURI(uint256 tokenId) public view returns (string memory) {
        require(_exists(tokenId), "URI query for nonexistent token");
        return _tokenURIs[tokenId];
    }
}
