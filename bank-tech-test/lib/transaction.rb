class Transaction
  START_BALANCE = 0

  attr_accessor :balance, :credit, :debit, :date

  def initialize
    @balance = START_BALANCE
    @credit = ''
    @debit = ''
    @date = nil
  end

end
