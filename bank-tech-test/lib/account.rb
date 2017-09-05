class Account
  START_BALANCE = 0

  attr_accessor :balance, :statement, :credit, :debit, :date

  def initialize
    @balance = START_BALANCE
    @statement = [%w[date credit debit balance]]
    @credit = ' '
    @debit = ' '
    @date = nil
  end

  def create_statement_row(amount, type)
    create_statement_row_variables(amount, type)
    @statement << [@date, @credit, @debit, @balance]
  end

  private

  def create_statement_row_variables(amount, type)
    update_balance(amount, type)
    calculate_date
    calculate_credit_or_debit(amount, type)
  end

  def calculate_date
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def update_balance(amount, type)
    type == :credit ? @balance += amount : @balance -= amount
  end

  def calculate_credit_or_debit(amount, type)
    type == :credit ? @credit = amount : @debit = amount
  end
end
