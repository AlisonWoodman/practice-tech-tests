class Account
  START_BALANCE = 0

  attr_accessor :balance, :statement, :credit, :debit, :date, :statement_balance

  def initialize
    @balance = START_BALANCE
    @format_balance = START_BALANCE
    @statement_header = [%w[date credit debit balance]]
    @statement = []
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

  def calculate_date
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def update_balance(amount, type)
    type == :credit ? @balance += amount : @balance -= amount
    @format_balance = ('%.2f' % @balance)
  end

  def calculate_credit_or_debit(amount, type)
    if type == :credit
      @credit = '%.2f' % amount
      @debit = ''
    else
      @debit = '%.2f' % amount
      @credit = ''
    end
  end
end
