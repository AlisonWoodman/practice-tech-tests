class AccountInterface
  attr_reader :data_handler

  def initialize(data_handler)
    @data_handler = data_handler
  end

  def make_deposit(amount)
    @data_handler.create_transaction(amount, :credit)
  end

  def make_withdrawal(amount)
    @data_handler.create_transaction(amount, :debit)
  end

  def print_statement
    @data_handler.statement.print_statement
  end
end
