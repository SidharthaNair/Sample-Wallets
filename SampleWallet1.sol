// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

///This contract simply take a deposit, check the balance of the contract and withdraw to the same account. 

contract PersonalWallet{

    uint CurrentBalance; 

    function Deposit() public payable{
        CurrentBalance = msg.value;
    }

    function CheckBalance() public view returns(uint){
        return address(this).balance; 
    }

    function Withdraw() public {
        address payable to = payable(msg.sender);
        to.transfer(CheckBalance());

    }

}
