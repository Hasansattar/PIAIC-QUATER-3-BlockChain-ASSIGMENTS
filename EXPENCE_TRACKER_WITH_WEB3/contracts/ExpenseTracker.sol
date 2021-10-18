pragma solidity 0.8.0;

contract ExpenseTracker {

    int public balance = 1;

    Transaction[] public transaction;

    struct Transaction {
        address transactionOwner;
        string transactionDescription;
        int64 amount;
    }

    function addTransaction(string memory _description, int64 _amount) public {
        Transaction memory addTx = Transaction(msg.sender, _description, _amount);
        transaction.push(addTx);
        balance += _amount;
    }

    function getTransactionCount() public view returns(uint) {
        return transaction.length;
    }
}