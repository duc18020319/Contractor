const { expect } = require('chai');
const { ethers } = require('hardhat');

describe("Voting contract",function()
{
    let votingToken;
    let votingContract;

    beforeEach(async function()
    {
        const Token = await ethers.getContractFactory("VotingToken");
        votingToken = await Token.deploy("Community Token","COM",100);
        await votingToken.deployed();
    });
    

});