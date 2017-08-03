pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Rcash.sol";

contract TestRcash {

  address alice=0x21bd4bbc6158cde42ec95d360cb33a54f216dc1d;
  address bob=0x3b61ec8cb903f0a50642d19dfb3bb28eb8c1583f;

  function testInitialBalanceUsingDeployedContract() {

    Rcash cash = Rcash(DeployedAddresses.Rcash());

    uint expected = 1000;

    uint  balance= cash.totalBalance();

    Assert.equal(balance, expected, "Intitalized with 1000rcash");
  }

  function testBuyRcash() {

    Rcash cash = Rcash(DeployedAddresses.Rcash());

    uint aliceBalance= cash.buy(500);
    
    uint expected = 500;

    Assert.equal(aliceBalance, expected, "Transaction falied");
  }

function testSendRcash() {

    Rcash cash = Rcash(DeployedAddresses.Rcash());

    uint aliceBalance= cash.send(bob,400);
    
    uint expected = 100 ;

    Assert.equal(aliceBalance, expected, "First Transaction falied");

    uint bobBalance= cash.getBalance(bob);

    expected = 400;

    Assert.equal(bobBalance, expected, "Second Transaction falied");

  }
  

}
