// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "lib/forge-std/src/Test.sol";
import {ShikaToken} from "src/ShikaToken.sol";
import {DeployToken} from "script/DeployToken.sol";

contract ShikaTokenTest is Test {
    error BobBalanceError(uint256 expected, uint256 actual);

    ShikaToken public shikaToken;
    DeployToken public deployToken;

    uint256 public constant STARTING_BALANCE = 100 ether;

    address private bob = makeAddr("bob");
    address private alice = makeAddr("alice");

    function setUp() public {
        deployToken = new DeployToken();
        shikaToken = deployToken.run();

        vm.prank(msg.sender);
        shikaToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        uint256 bobBalance = shikaToken.balanceOf(bob);

        if (bobBalance != STARTING_BALANCE) {
            revert BobBalanceError(STARTING_BALANCE, bobBalance);
        }

        // أو يمكننا استخدام assertEq
        assertEq(bobBalance, STARTING_BALANCE, "Bob's balance should be STARTING_BALANCE");
    }
}