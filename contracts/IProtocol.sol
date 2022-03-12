interface IProtocol {
    function getAssetIds() external view returns (bytes6[] memory);

    function getSeriesIds() external view returns (bytes6[] memory);
}
