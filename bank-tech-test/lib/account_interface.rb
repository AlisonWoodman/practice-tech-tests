class AccountInterface
  attr_reader :account
  attr_accessor :output

  def initialize(account)
    @account = account
    @output = nil
  end

  def make_deposit(amount)
    @account.create_statement_row(amount, :credit)
  end

  def make_withdrawal(amount)
    @account.create_statement_row(amount, :debit)
  end

  def print_statement
    @output = ''
    @account.statement.each do |row|
      @output += row.join(' || ') + "\n"
    end
    puts @output
  end
end
