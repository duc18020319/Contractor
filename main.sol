// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.18;

library StringEncode
{
    function encode(string memory self) public pure returns(bytes32)
    {
        bytes32 result = keccak256(abi.encodePacked(self));
        return result;
    }
}

contract Contractor
{
    using StringEncode for string;
    uint256 public total_cash;
    uint8 private id;

    bool private status;

    enum ContractTypes
    {
        Cooperation,
        Purchase,
        Trade
    }

    struct Bill
    {
        string owner;
        uint256 cash;
    }

    mapping(string => uint256) public queryCash;
    mapping(uint256 => string) public queryOwner;
    address public administrator;
    event createBill(string owner,uint256 cash);

    constructor(address _administrator,uint256 _total_cash)
    {
        administrator = _administrator;
        total_cash = _total_cash;
    }

    receive() external payable 
    {

    }

    fallback() external
    {
        
    }

    modifier onlyOwner(address sender)
    {
        require(sender == administrator,"Wrong administration!");
        _;
    }

    function getBill(string memory _owner) public view returns(uint256)
    {
        uint256 cash = queryCash[_owner];
        return cash;
    }

    function addBill(string[] memory _owner,uint256[] memory _cash) public onlyOwner(msg.sender)
    {
        uint256 index = 0;
        if (msg.sender == administrator)
        {
            while (index < _owner.length)
            {
                queryCash[_owner[index]] = _cash[index];
                ++index;
            }
        }
        else 
        {
            revert();
        }
    }

    function encode_string(string memory input) public pure returns(bytes32)
    {
        return input.encode();
    }
}

interface Purchase
{
    function getBill(string memory) external view returns(uint256);
    function addBill(string memory,uint256) external;
}