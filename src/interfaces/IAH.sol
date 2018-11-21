pragma solidity ^0.4.24;

/// @title AH Contract Interface
/// @dev Use ERC721 to proxy the owner of NFT
///  Note: The process of ah is:
///        1. seller(entrust)
///        2. bidder(bid)
///        3. buyer(sold)
///        4. seller(pass)
interface IAH {
    /// @notice Entrust a tokenId of erc721
    /// @dev Called by seller
    /// @param _erc721 The address of the erc721 contract
    /// @param _tokenId The id of the token
    /// @param _startingPrice The staringPrice: unit: NATT
    /// @param _type The end period of auction : block number or timestamp or both
    /// @param _blockNum The block number
    /// @param _timestamp The timestamp
    function entrust(
        address _erc721,
        uint256 _tokenId,
        uint256 _startingPrice,
        uint8 _type,
        uint _blockNum,
        uint _timestamp
    )
        external payable;

    /// @notice Bid an offer for a tokenId of erc721
    /// @dev Called by bidder
    /// @param _erc721 The address of the erc721 contract
    /// @param _tokenId The id of the token
    /// @param _offer The price that offered by sender: unit: NATT
    function bid(
        address _erc721,
        uint256 _tokenId,
        uint256 _offer
    )
        external payable;

    /// @notice Use the autoExec feature of CITA.
    ///  Two results:
    ///  1. Sold a tokenId of erc721
    ///  2. Pass a tokenId of erc721. Give back the NFT
    function autoExec() external;

    /// @notice Check the status of NFT
    function checkStatus(address _erc721, uint256 _tokenId) external returns (uint8);

    /// @notice Get all the kind of ERC721
    function allERC721() external returns (address[]);

    /// @notice Get all the tokens of erc721
    function tokens(address _erc721) external returns (uint256[]);

    /// @notice Get the info of NFT
    /// @return starting price, bidded price, status, type, blockNum, timestamp
    function info(address _erc721, uint256 _tokenId) external returns (uint256, uint256, uint8, uint8, uint, uint);
}
