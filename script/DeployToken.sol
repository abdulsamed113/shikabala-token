// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { Script } from "lib/forge-std/src/Script.sol";
import { ShikaToken } from "src/ShikaToken.sol";

contract DeployToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() public returns (ShikaToken shikaToken) {
        vm.startBroadcast();
        shikaToken = new ShikaToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
    }
}
