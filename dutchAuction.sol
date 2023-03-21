//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

//getting NFT interface

interface IERC721 {
    function transferFrom(address _from, address to, uint _nftId) external;
}

contract DutchAuction {
    //duration of Aution is 7days
    uint private constant DURATION = 7 days;

    IERC721 public immutable nft;
    uint public immutable nftId;

    address payable public immutable seller;
    uint public immutable startingPrice;
    uint public immutable startAt;
    uint public immutable expireAt;
    uint public immutable discountRate;

    constructor(
        uint _startingPrice,
        uint _discountRate,
        address _nft,
        uint _nftId
    ) {
        require(
            _startingPrice >= _discountRate * DURATION,
            "starting price < discount"
        );
        seller = payable(msg.sender);
        startingPrice = _startingPrice;
        discountRate = _discountRate;
        nft = IERC721(_nft);
        nftId = _nftId;
        startAt = block.timestamp;
        expireAt = block.timestamp + DURATION;
    }

    //get price of NFT
    function getPrice() public view returns (uint) {
        uint timeElapsed = block.timestamp - startAt;
        uint discount = discountRate * timeElapsed;
        return startingPrice - discount;
    }

    //buy nft
    function buy() external payable {
        require(block.timestamp < expireAt, "auction expired");
        //check that msg.sender has send enough eth to this contract
        //check price
        uint price = getPrice();
        require(msg.value >= price, "ETH less than price");

        //trasfer nft to the buyer
        nft.transferFrom(seller, msg.sender, nftId);
        uint refund = msg.value - price;

        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }

        //send all the ETH to seller and close the auction
        selfdestruct(seller);
    }
}
