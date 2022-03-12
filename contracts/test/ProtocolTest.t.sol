// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.6;

import "@yield-protocol/vault-v2/contracts/Cauldron.sol";
import "@yield-protocol/utils-v2/contracts/utils/Timelock.sol";
import "ds-test/test.sol";
import "../MainnetConfig.sol";

interface CheatCodes {
    function prank(address) external;

    function warp(uint256) external;
}

contract ProtocolTest is DSTest {
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);

    Cauldron cauldron;
    MainnetConfig protocolConfig;
    Timelock timelock;
    struct Call {
        address target;
        bytes data;
    }

    function setUp() public {
        protocolConfig = new MainnetConfig();
        cauldron = Cauldron(protocolConfig.cauldronAddress());
        timelock = Timelock(protocolConfig.timelock());
    }

    /// @notice Tests whether assets are set correctly in the cauldron
    function testAssets() public {
        bytes6[] memory a = protocolConfig.getAssetIds();
        for (uint256 index = 0; index < a.length; index++) {
            bytes6 assetId = a[index];
            assertEq(
                cauldron.assets(assetId),
                protocolConfig.assetAddress(assetId)
            );
        }
    }

    function testAddAssetProposal() public {
        ITimelock.Call[] memory calls = new ITimelock.Call[](1);

        calls[0].target = protocolConfig.cauldronAddress();
        calls[0].data = abi.encodeWithSignature(
            "addAsset",
            bytes6(0x313567000000),
            0x30D9410ED1D5DA1F6C8391af5338C93ab8d4035C
        );

        bytes32 proposalHash = timelock.hash(calls);

        // Propose
        cheats.prank(0xC7aE076086623ecEA2450e364C838916a043F9a8);
        timelock.propose(calls);

        // Approve
        cheats.prank(protocolConfig.multiSig());
        timelock.approve(proposalHash);

        // Execute
        cheats.prank(0xC7aE076086623ecEA2450e364C838916a043F9a8);
        cheats.warp(block.timestamp + 86400 * 2);
        timelock.execute(calls);
    }
}
