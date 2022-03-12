// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.6;

/// @title A contract containing the protocol configuration data for the Mainnet
contract BaseMainnet {
    
    // Governance
    address public multiSig = 0xd659565b84BcfcB23B02ee13E46CB51429F4558A;
    address public timelock = 0x3b870db67a45611CF4723d44487EAF398fAc51E3;
    address public cloak = 0xaa7B33685e9730B4D700b8F3F190EcA5EC4cf106;

    // Protocol
    address public cauldronAddress = 0xc88191F8cb8e6D4a668B047c1C8503432c3Ca867;
    address public ladleAddress = 0x6cB18fF2A33e981D1e38A663Ca056c0a5265066A;

    mapping(bytes6 => address) public assetAddress;

    constructor() {
        assetAddress[0x303000000000] = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;//ETh
        assetAddress[0x303100000000] = 0x6B175474E89094C44Da98b954EedeAC495271d0F;//DAI
        assetAddress[0x303200000000] = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;//USDC
        assetAddress[0x303300000000] = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;//WBTC
        assetAddress[0x303400000000] = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;//WSTETH
        assetAddress[0x303500000000] = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;//STETH
        assetAddress[0x303600000000] = 0x514910771AF9Ca656af840dff83E8264EcF986CA;//LINK
        assetAddress[0x303700000000] = 0xC18360217D8F7Ab5e7c516566761Ea12Ce7F9D72;//ENS
        assetAddress[0x313000000000] = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984;//UNI
        assetAddress[0x303900000000] = 0xa354F35829Ae975e850e23e9615b11Da1B3dC4DE;//YVUSDC
    }
}

// Note:
// Assets are obtained by querying the cauldron with all asset ids
// FYToken are obtained by querying the cauldron with all series ids
// Joins are obtained by querying the ladle with all asset ids
// Pools are obtained by querying the ladle with all series ids