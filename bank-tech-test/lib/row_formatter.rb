class RowFormatter
attr_accessor :row

  def initialize
    @row = nil
    @date
    @credit
    @debit
  end

  def create_statement_row(transaction)
    format_row(transaction)
    @row = [@date, @credit, @debit, @balance]
  end

  private

  def format_row(transaction)
    format_date(transaction.date)
    format_balance(transaction.balance)
    format_credit_and_debit(transaction.credit, transaction.debit)
  end

  def format_date(date)
    @date = date.strftime('%d/%m/%Y')
  end

  def format_balance(balance)
    @balance =  '%.2f' % balance
  end

  def format_credit_and_debit(credit, debit)
    credit == '' ? @debit = '%.2f' % debit : @credit = '%.2f' % credit
  end
end
