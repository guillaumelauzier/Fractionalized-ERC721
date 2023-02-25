pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract FractionalizedERC721 is ERC721 {
    uint256 public totalShares;
    uint256 public nextTokenId;
    mapping(uint256 => uint256) public tokenShares;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        totalShares = 0;
        nextTokenId = 1;
    }

    function mint(uint256 _shares) public {
        require(_shares > 0, "Shares must be greater than zero.");
        totalShares += _shares;
        for (uint256 i = 0; i < _shares; i++) {
            _safeMint(msg.sender, nextTokenId);
            tokenShares[nextTokenId] = 1;
            nextTokenId++;
        }
    }

    function transferShares(uint256 _tokenId, address _to, uint256 _shares) public {
        require(ownerOf(_tokenId) == msg.sender, "You must own the token to transfer shares.");
        require(_shares <= tokenShares[_tokenId], "You cannot transfer more shares than you own.");
        tokenShares[_tokenId] -= _shares;
        for (uint256 i = 0; i < _shares; i++) {
            _safeMint(_to, nextTokenId);
            tokenShares[nextTokenId] = 1;
            nextTokenId++;
        }
        _burn(_tokenId);
    }
}
