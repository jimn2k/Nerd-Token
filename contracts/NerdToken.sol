// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NerdToken is ERC721 {
    using SafeMath for uint;
    using Counters for Counters.Counter;
    
    Counters.Counter private _nerdometer;
    address private _owner;

    modifier onlyOwner() {
        require(msg.sender == _owner, "Only the owner can do this!");
        _;
    }

    constructor() ERC721("NerdToken","NERD") public {
        _owner = msg.sender;
    }

    function mint(address _to, string memory _tokenURI) public onlyOwner returns(bool){
        _mintWithTokenURI(_to, _tokenURI);
        return true;
    }

    function _mintWithTokenURI(address _to, string memory _tokenURI) internal {
        _nerdometer.increment();
        _mint(_to, _nerdometer.current());
        _setTokenURI(_nerdometer.current(), _tokenURI);
    }
}