class StatementPrinter

  def initialize
  end

  def print_statement
    output = "date || credit || debit || balance\n"
    @account.statement.reverse.each do |row|
      output += row.join('|| ') + "\n"
    end
    puts output
  end
end
