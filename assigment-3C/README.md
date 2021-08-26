# Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```

***ASSIGMENT 3C***

  We will continue with the previous token and extend that token with new features.
 1. Owner can transfer the ownership of the Token Contract.
 2. Owner can approve or delegate anybody to manage the pricing of tokens.
 3. Update pricing method to allow owner and approver to change the price of the token
 4. Add the ability that Token Holder can return the Token and get back the Ether based on the current price.

