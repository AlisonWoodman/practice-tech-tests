User stories:

User can...
1) make a deposit(credit)
2) make a withdrawal(debit)
3) print an account statement, displaying dates and corresponding credit/debit amounts and balances

Objects:

- Account
- Statement with:
  - Deposit amounts
  - Withdrawal amounts
  - Balances
  - Dates
- Bank statement printer?

Methods:

Public:
- make_deposit
- make_withdrawal
- print_statement
Private:
- calculate_date
- display_date
- print_headers
- create_statement_row
- calculate_balance

Classes:
AccountInterface:
  Methods:
    - make_deposit(amount) x
    - make_withdrawal(amount) x
    - print_statement
  Objects:
    - statement
    - balance
    - account
Account
  Methods:
  - calculate_date x
  - print_headers
  - create_statement_row
  - update_balance x
