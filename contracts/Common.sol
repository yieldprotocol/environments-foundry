// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.6;

/// @title A contract containing Ids which are common across the protcol
contract Common {
    // Asset Ids
    bytes6[] public assetIds = [
            bytes6(0x303000000000), //ETH
            bytes6(0x303100000000), //DAI
            bytes6(0x303200000000), //USDC
            bytes6(0x303300000000), //WBTC
            bytes6(0x303400000000), //WSTETH
            bytes6(0x303500000000), //STETH
            bytes6(0x303600000000), //LINK
            bytes6(0x303700000000), //ENS
            bytes6(0x303900000000), //YVUSDC
            bytes6(0x313000000000) //UNI
            // bytes6(0x313100000000),//MKR
            // bytes6(0x313200000000),//FDAI2203
            // bytes6(0x313300000000),//FDAI2206
            // bytes6(0x313400000000),//FUSDC2203
            // bytes6(0x313500000000)//FUSDC2206
        ];

    // Series Ids
    bytes6[] public seriesIds = [
        bytes6(0x303130350000), //FYDAI2203
        bytes6(0x303130360000), //FYDAI2206
        bytes6(0x303230350000), //FYUSDC2203
        bytes6(0x303230360000) //FYUSDC2206
    ];

    function getAssetIds() public view returns (bytes6[] memory) {
        return assetIds;
    }

    function getSeriesIds() public view returns (bytes6[] memory) {
        return seriesIds;
    }
}
