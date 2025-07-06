// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract MemoryCastleCollection {
    address public owner;
    string[] private memoryArtifacts;

    event ArtifactAdded(string artifact);
    event ArtifactRemoved(uint256 index);
    event OwnershipTransferred(address indexed oldOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function addMemoryArtifact(string memory artifact) public onlyOwner {
        memoryArtifacts.push(artifact);
        emit ArtifactAdded(artifact);
    }

    function removeMemoryArtifact(uint256 index) public onlyOwner {
        require(index < memoryArtifacts.length, "Invalid index");
        for (uint256 i = index; i < memoryArtifacts.length - 1; i++) {
            memoryArtifacts[i] = memoryArtifacts[i + 1];
        }
        memoryArtifacts.pop();
        emit ArtifactRemoved(index);
    }

    function getArtifact(uint256 index) public view returns (string memory) {
        require(index < memoryArtifacts.length, "Invalid index");
        return memoryArtifacts[index];
    }

    function getTotalArtifacts() public view returns (uint256) {
        return memoryArtifacts.length;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
