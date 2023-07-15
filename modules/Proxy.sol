pragma solidity ^0.8.18;

contract Proxy
{
    uint256 public proxyNumber;
    address public implementation;

    constructor(uint256 _proxyNumber)
    {
        proxyNumber = _proxyNumber;
    }

    function setImplementation(address _implementation) public
    {
        implementation = _implementation;
    }

    fallback() external 
    {
        assembly
        {
            let ptr := mload(0x40)
            calldatacopy(ptr,0,calldatasize())
            let result := delegatecall(gas(),sload(implementation.slot),ptr,calldatasize(),0,0)
            let size := returndatasize()
            returndatacopy(ptr,0,size)
            switch result
                case 0
                {
                    revert(ptr,size)
                }
                default 
                {
                    return(ptr,size)
                }
        }
    }
}