//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./MonstersOnTheWay.sol";

contract MonstersOnTheWayProxy is Ownable, Pausable {
    
    modifier onlyImplementation() {
        require(_msgSender() == _addrOfImplementation, "Only the implementation contract can call this function");
        _; 
    }

    using SafeMath for uint256;

    uint128 private _MAX_NUMBER_OF_TOKENS_MINTABLE = 21000000000000;
    uint32 private _INITALLY_MINTED_TOKENS = 1000000000;
    uint8 private _DECIMALS = 6;
    
    address private _addressOfTheNFTContract;
    address private _addrOfImplementation;
    mapping(bytes32 => bool) private _hashBook;
    mapping(address => uint256) private _balances;

    string private _NAME_OF_TOKEN = "Promethium";
    string private _SYMBOL_OF_TOKEN = "PRM";

    MonstersOnTheWay implementation;

    constructor(address addressOfImplementation) {
        implementation = MonstersOnTheWay(addressOfImplementation);        
    }

    function setAddrOfImplementation(address addrImpl) public onlyOwner() {
        _addrOfImplementation = addrImpl;
    }

    function addToBalance(address to, uint256 value) public onlyImplementation() {
        _balances[to] = _balances[to].add(value);
    }

    function removeFromBalance(address from, uint256 value) public onlyImplementation() {
        _balances[from] = _balances[from].add(value);
    }

    function getName() public view returns(string memory) {
        return _NAME_OF_TOKEN;
    }

    function getSymbol() public view returns(string memory) {
        return _SYMBOL_OF_TOKEN;
    }

    function getTotalOfTokensMintable() public view returns(uint256) {
        return _MAX_NUMBER_OF_TOKENS_MINTABLE;
    }

    function addHashIntoBook(bytes32 hashToAdd) public onlyImplementation() {
        _hashBook[hashToAdd] = true;
    }

    function checkIfHashIsInBook(bytes32 hashToCheck) public view returns(bool) {
        return _hashBook[hashToCheck];
    }

    function getDecimals() public view returns(uint8) {
        return _DECIMALS;
    }
}