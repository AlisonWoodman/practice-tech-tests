class DataHandler
  attr_reader :transaction, :row_formatter

  def initialize(row_formatter, statement)
    @transaction = nil
    @statement = statement
    @row_formatter = row_formatter
  end

  def create_transaction(amount, type)
    @transaction = Transaction.new
    calculate_date
    calculate_credit_or_debit(amount, type)
    update_balance(amount, type)
    @row_formatter.create_statement_row(@transaction)
  end

  private

  def calculate_date
    @transaction.date = Time.now
  end

  def calculate_credit_or_debit(amount, type)
    type == :credit ? @transaction.credit = amount : @transaction.debit = amount
  end

  def update_balance(amount, type)
    type == :credit ? @transaction.balance += amount : @transaction.balance -= amount
  end
end
