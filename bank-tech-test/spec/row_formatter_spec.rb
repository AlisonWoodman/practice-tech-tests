require 'row_formatter'
require 'mocks/mock_transaction'

describe RowFormatter do
  subject(:row_formatter)     { described_class.new }
  let(:transaction)           { MockTransaction.new}
  let(:test_row)              { ["06/09/2017 || ", "100.00 || ", " ||", "100.00"] }

  describe '#initialize' do
    it 'starts with an row variable set to nil' do
      expect(row_formatter.row).to eq []
    end
  end
  describe '#create_statement_row' do
    it 'stores formatted transaction in row' do
      row_formatter.create_statement_row(transaction)
      expect(row_formatter.row).to eq test_row
    end
  end
end
