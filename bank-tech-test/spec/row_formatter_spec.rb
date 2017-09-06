require 'row_formatter'
require 'mocks/mock_transaction'

describe RowFormatter do
  subject(:row_formatter)     { described_class.new }
  let(:transaction)           { MockTransaction.new}

  describe '#initialize' do
    it 'starts with an row variable set to nil' do
      expect(row_formatter.row).to be nil
    end
  end
  describe '#create_statement_row' do
    it 'stores formatted transaction in row' do
      row_formatter.create_statement_row(transaction)
      expect(row_formatter.row).not_to be []
    end
  end
end
