
// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.0;

contract FastFood
{
    uint256 public total_calo;
    uint8 private id;

    bool private available;

    enum TypeFastFood
    {
        Hamburger,
        Chips,
        Taco
    }

    struct Ingredient
    {
        string name;
        uint256 value;
    }

    mapping(string => uint256) public ingredient;
    address public owner;
    event AddIngredient(string name,uint256 calo);

    constructor(address _owner,uint256 _totalCalo)
    {
        owner = _owner;
        total_calo = _totalCalo;
    }
}