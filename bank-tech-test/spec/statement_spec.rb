require 'statement'
require 'mock_transaction'

describe Statement do
  subject(:statement)         { described_class.new }
  let(:transaction)           { MockTransaction.new}

  describe '#add_statement_row' do
    it 'adds row to statement array' do
      statement.add_statement_row(transaction)
      expect(statement.statement).not_to be []
    end
  end
end
