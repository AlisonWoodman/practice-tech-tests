class TransactionHistory
  attr_accessor :history
  
  def initialize
    @history = []
  end

  def store_history(statement)
    @history << statement
  end
end
