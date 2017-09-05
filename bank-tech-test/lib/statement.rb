class Statement
  attr_accessor :statement

  def initialize
    @statement = []
  end

  def add_statement_row(transaction)
    @statement << format_statement_row(transaction)
  end

  def format_statement_row(transaction)
    array = [transaction.date, transaction.credit, transaction.debit, transaction.balance]
    return array.join(" || ")
  end

end
