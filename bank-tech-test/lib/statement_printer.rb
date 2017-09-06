class StatementPrinter

  def initialize
  end

  def print_statement
    output = "date || credit || debit || balance\n"
    output += @statement.statement.reverse.
    puts output
  end

  def format_rows(statement)
    array = [transaction.date, transaction.credit, transaction.debit, transaction.balance]
    return array.join(" || ")
  end
end
