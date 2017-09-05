class MockTransaction
  attr_accessor :balance, :credit, :debit, :date

  def initialize
    @balance = 100
    @credit = 100
    @debit = ''
    @date = "05/09/2017"
  end

end
