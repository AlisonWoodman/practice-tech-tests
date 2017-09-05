class AccountInterface
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def make_deposit(amount)
    @account.create_statement_row(amount, :credit)
  end

  def make_withdrawal(amount)
    @account.create_statement_row(amount, :debit)
  end

  def print_statement
    output = "date || credit || debit || balance\n"
    @account.statement.reverse.each do |row|
      output += row.join(' || ') + "\n"
    end
    puts output
  end
end
