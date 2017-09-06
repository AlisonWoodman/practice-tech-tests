class MockTransaction
  attr_accessor :balance, :credit, :debit, :date

  def initialize
    @balance = 100
    @credit = 100
    @debit = ''
    @date = Time.now
  end

end
