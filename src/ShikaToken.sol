// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract ShikaToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("ShikaToken", "SHIKA") {
        _mint(msg.sender, initialSupply);
    }
}
