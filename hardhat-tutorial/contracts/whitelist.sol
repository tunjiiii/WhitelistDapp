// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;
    mapping(address => bool) public whitelistedAdresses;
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxWhitlistedAddresses) {
        maxWhitelistedAddresses = _maxWhitlistedAddresses;
    }

    function addAddresssToWhitelist() public {
        require(
            !whitelistedAdresses[msg.sender],
            "Sender is already whitelisted"
        );
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "More addressred canot be added"
        );
        whitelistedAdresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}
