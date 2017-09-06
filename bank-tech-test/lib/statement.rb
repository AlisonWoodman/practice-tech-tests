class Statement
  attr_accessor :statement

  def initialize
    @statement = []
  end

  def add_statement_row(row_formatter)
    @statement << row_formatter
  end

end
