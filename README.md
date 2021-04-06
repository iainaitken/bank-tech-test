# Bank Tech Test

| [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) | [![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide) |

## Tech Stack

Ruby version 2.7.2

Gems:

* Coveralls
* RSpec
* Rubocop
* SimpleCov

## Usage

[Installation, usage directions]

## Specifications

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance Criteria

Given a client makes a deposit of 1000 on 10-01-2012

And a deposit of 2000 on 13-01-2012

And a withdrawal of 500 on 14-01-2012

When she prints her bank statement she would see

> date || credit || debit || balance
> 
> 14/01/2012 || || 500.00 || 2500.00
> 
> 13/01/2012 || 2000.00 || || 3000.00
> 
> 10/01/2012 || 1000.00 || || 1000.00

## Design Notes

* Probably only need one class to implement core functionality. A BankAccount class would:
  * Know the balance; and
  * Contain methods to deposit/withdraw funds.
* A separate Printer class could contain the logic to print to screen.
* To store data in memory without a database, we would likely need to save/load to a CSV file. This could also be contained in a distinct class, perhaps File?
* The Printer and File classes may not need instances to be created, so class methods might be more appropriate here.

### CRC Cards

| BankAccount |     |
| ----------- | --- |
| Knows balance |   |
| Deposit funds |   |
| Withdraw funds |  |

| Printer     |     |
| ----------- | --- |
| Prints statement to screen | BankAccount |

| File     |     |
| ----------- | --- |
| Load account data | BankAccount |
| Save account data | BankAccount |
