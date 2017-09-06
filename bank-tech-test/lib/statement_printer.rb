class StatementPrinter
attr_accessor :statement

  def initialize(statement)
    @statement = statement
  end

  def print_statement
    output = "date || credit || debit || balance\n"
    output += @statement.statement.reverse.
    puts output
  end
end
