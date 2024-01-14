// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract BankLikeWallet {
    
    // Mapping to keep track of Ether amounts received from different addresses
    mapping(address => uint) AmountReceived;

    // Function to allow users to deposit Ether into the contract
    function Deposit() public payable {
        // Increment the amount received from the sender's address
        AmountReceived[msg.sender] += msg.value;
    }

    // Function to view the current Ether balance of the contract
    function Balance() public view returns (uint) {
        return address(this).balance;  
    }

    // Function to allow users to withdraw Ether to a specified address
    function Withdraw(address payable to) public {
        // Retrieve the amount only available for withdrawal for the sender
        uint OnlyWithdraw = AmountReceived[msg.sender];
        
        // Reset the amount received by the sender to zero
        AmountReceived[msg.sender] = 0;
        
        // Transfer the withdrawn amount to the specified address
        to.transfer(OnlyWithdraw);
    }
}
