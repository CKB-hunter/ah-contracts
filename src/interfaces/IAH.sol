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
    function entrust(address _erc721, uint256 _tokenId, uint256 _startingPrice) external payable;

    /// @notice Bid an offer for a tokenId of erc721
    /// @dev Called by bidder
    function bidder(address _erc721, uint256 _tokenId, uint256 _offer) external payable;

    /// @notice Sold a tokenId of erc721
    /// @dev TBD How to do this? How to decide the auction result? called by front side?
    function sold() external;

    /// @notice Pass a tokenId of erc721. Give back the NFT
    /// @dev TBD How to do this? How to decide the auction result???
    function pass() external;

    /// @notice Check the status of NFT
    function checkStatus(address _erc721, uint256 _tokenId) external returns (uint8);

    /// @notice Get all the kind of ERC721
    function allERC721() external returns (address[]);

    /// @notice Get all the tokens of erc721
    function tokens(address _erc721) external returns (uint256[]);

    /// @notice Get the info of NFT
    /// @return starting price and bidded price
    function auctionInfo(address _erc721, uint256 _tokenId) external returns (uint256, uint256);
}
