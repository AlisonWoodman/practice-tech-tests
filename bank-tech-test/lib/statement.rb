class Statement
  attr_accessor :statement

  def initialize
    @statement = []
  end

  def add_statement_row(transaction)
    @statement << transaction
  end

end
