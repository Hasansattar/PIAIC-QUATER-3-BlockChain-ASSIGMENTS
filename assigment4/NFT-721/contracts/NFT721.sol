// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

 import "@openzeppelin/contracts/access/Ownable.sol";
 import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
    
    contract NFT721 is Ownable, ERC721 {
    
    string public baseURI = "https://floydnft.com/token/";
    uint public totalSupply;
    uint public salePrice;
    uint private LAST_TOKEN_ID = 100;
    uint lastPublickSaleTokenIndex = 0;
    uint public currentTime;
    uint public saleStartDate;
    uint public saleEndDate;
    
    constructor(uint _salePrice,
    string memory _tokenName,
    string memory _tokenSymbol) ERC721(_tokenName,_tokenSymbol){
        salePrice = _salePrice;
        currentTime=block.timestamp;
    }

     modifier isSaleOn() {
        require(block.timestamp >= saleStartDate && block.timestamp <= saleEndDate, "Sorry, not a Sale period");
        _;
    }
    
       function saleStartAndSaleEnd() public  onlyOwner returns(uint256,uint256){
         saleStartDate=  block.timestamp;
         saleEndDate=  saleStartDate +  30 days;
        return (saleStartDate,saleEndDate);
           
       }
       


    function setPrice(uint256 _setPrice)external  onlyOwner returns(uint256){
          salePrice=_setPrice;
          return salePrice;
          
      }
    
    function _baseURI() internal view override returns(string memory){
        return baseURI;
    }
    
    function setBaseUri(string memory newUri) external onlyOwner {
        baseURI = newUri;
    }
    
    function _mintAndIncrementSupply(address to, uint tokenId) internal{
        _mint(to,tokenId);
        totalSupply++;
    }
    
    function buyNft(uint quantity) external payable isSaleOn {
         require(totalSupply<=100,"total supply should not increased 100");
        uint lastTokenId = lastPublickSaleTokenIndex;
        require(msg.value == salePrice * quantity,"Invalid amount!");
        
        for(uint i = 0; i < quantity; i++){
            lastTokenId++;
            _mintAndIncrementSupply(msg.sender,lastTokenId);
        }
        lastPublickSaleTokenIndex = lastTokenId;
    }
}