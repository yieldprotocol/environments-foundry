// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.6;
import "@yield-protocol/vault-v2/contracts/Cauldron.sol";
import "ds-test/test.sol";
import "../Common.sol";
import "../BaseMainnet.sol";

contract ContractTest is DSTest {
    Common common;
    Cauldron cauldron;
    BaseMainnet protocolConfig;

    function setUp() public {
        common = new Common();
        protocolConfig = new BaseMainnet();
        cauldron = Cauldron(protocolConfig.cauldronAddress());
    }

    /// @notice Tests whether assets are set correctly in the cauldron
    function testAssets() public {
        bytes6[] memory a = common.getAssetIds();
        for (uint256 index = 0; index < a.length; index++) {
            bytes6 assetId = a[index];
            assertEq(
                cauldron.assets(assetId),
                protocolConfig.assetAddress(assetId)
            );
        }
    }
}
