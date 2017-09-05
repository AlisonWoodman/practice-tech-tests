class DataHandler
  attr_reader :transaction

  def initialize
    @transaction = nil
    @statement = Statement.new
  end

  def create_transaction(amount, type)
    @transaction = Transaction.new
    calculate_date
    calculate_credit_or_debit(amount, type)
    update_balance(amount, type)
    @statement.add_statement_row(@transaction)
  end

  private

  def calculate_date
    @transaction.date = Time.now.strftime('%d/%m/%Y') + ' '
  end

  def calculate_credit_or_debit(amount, type)
    type == :credit ? @transaction.credit = '%.2f' % amount : @transaction.debit = '%.2f' % amount
    type == :credit ? @transaction.debit = '' : @transaction.credit = ''
  end

  def update_balance(amount, type)
    type == :credit ? @transaction.balance += amount : @transaction.balance -= amount
  end
end
