class Transaction
  START_BALANCE = 0

  attr_accessor :balance, :credit, :debit, :date
  
  def initialize
    @balance = START_BALANCE
    @credit = ''
    @debit = ''
    @date = nil
  end

  def create_statement_row(amount, type)
    create_statement_row_variables(amount, type)
    @statement << [@date, @credit, @debit, @format_balance]
  end

  private

  def create_statement_row_variables(amount, type)
    update_balance(amount, type)
    calculate_date
    calculate_credit_or_debit(amount, type)
  end

end
