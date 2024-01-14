// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// The contract is named "Wallet"
contract Wallet {

    // State variable to store the current balance of the contract
    uint CurrentBalance;

    // Function to deposit funds into the wallet
    function Deposit() public payable {
        // Increase the current balance by the amount sent with the transaction
        CurrentBalance += msg.value;
    }

    // Function to check the current balance of the wallet
    function CheckBalance() public view returns (uint) {
        // Return the balance of the contract
        return address(this).balance;
    }

    // Function to send the entire balance to a specified address
    function SendTo(address payable to) public {
        // Transfer the entire balance of the contract to the specified address
        to.transfer(CheckBalance());
    }
}
