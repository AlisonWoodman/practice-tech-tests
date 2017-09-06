require 'data_handler'
require 'transaction'

describe DataHandler do
  let(:statement)           { Statement.new }
  let(:row_formatter)       { RowFormatter.new }
  let(:data_handler)        { described_class.new(row_formatter, statement) }
  let(:test_amount)         { 100 }
  let(:current_date)        { Time.now.strftime('%d/%m/%Y') }

  describe '#create_transaction with credit' do
    before do
      data_handler.create_transaction(test_amount, :credit)
    end

    it 'creates a transaction' do
      expect(data_handler.transaction).to be_instance_of Transaction
    end

    it 'changes date variable to current date' do
      expect(data_handler.transaction.date.strftime('%d/%m/%Y')).to eq current_date
    end

    it 'changes balance by correct amount' do
      expect(data_handler.transaction.balance).to eq test_amount
    end

    it 'changes credit when type is credit' do
      p data_handler.transaction
      expect(data_handler.transaction.credit).to eq test_amount
    end
  end

  describe '#create_transaction with debit' do
    it 'changes debit when type is debit' do
      data_handler.create_transaction(test_amount, :debit)
      expect(data_handler.transaction.debit).to eq test_amount
    end
  end
end
