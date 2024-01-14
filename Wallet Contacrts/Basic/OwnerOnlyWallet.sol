// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// The contract is named "Wallet"
contract Wallet {

    // State variable to store the current balance of the contract
    uint CurrentBalance;

    // The address of the owner, initialized with the address that deployed the contract
    address public Owner = msg.sender;

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

    // Function to send the entire balance to a specified address (owner-only)
    function SendTo(address payable to) public {
        // Check if the sender is the owner
        if (Owner == msg.sender) {
            // Transfer the entire balance of the contract to the specified address
            to.transfer(CheckBalance());
        }
    }

    // Function for the owner to perform a one-click withdrawal of the entire balance
    function OneClickWithdrawal() public {
        // Check if the sender is the owner
        if (Owner == msg.sender) {
            // Convert the sender's address to a payable address
            address payable to = payable(msg.sender);
            // Transfer the entire balance of the contract to the owner's address
            to.transfer(CheckBalance());
        }
    }
}
