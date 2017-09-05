class DataHandler
  attr_reader :transaction

  def initialize
    @transaction = nil
  end

  def create_transaction(amount, type)
    @transaction = Transaction.new
    calculate_date
    calculate_credit_or_debit(amount, type)
    update_balance(amount, type)
  end

  private

  def calculate_date
    @transaction.date = Time.now.strftime('%d/%m/%Y') + ' '
  end

  def calculate_credit_or_debit(amount, type)
    type == :credit ? @transaction.credit = amount : @transaction.debit = amount
    type == :credit ? @transaction.debit = '' : @transaction.credit = ''
  end

  def update_balance(amount, type)
    type == :credit ? @transaction.balance += amount : @transaction.balance -= amount
  end
end
