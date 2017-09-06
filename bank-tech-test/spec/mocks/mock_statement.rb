require 'mocks/mock_row_formatter'

class MockStatement
  attr_accessor :balance, :credit, :debit, :date

  def initialize(mock_row_formatter)
    @rows = mock_row_formatter
  end

end
