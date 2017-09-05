require 'data_handler'
require 'transaction'

describe DataHandler do
  subject(:handler)         { described_class.new }
  let(:starting_balance)    { described_class::START_BALANCE }
  let(:test_amount)         { 100 }
  let(:format_test_amount)  { '%.2f' % 100 }
  let(:current_date)        { Time.now.strftime('%d/%m/%Y') + ' ' }
  let(:headings)            { %w[date credit debit balance] }
  let(:example_row)         { [current_date, format_test_amount + ' ', '', format_test_amount] }

  describe '#create_transaction with credit' do
    before do
      handler.create_transaction(test_amount, :credit)
    end

    it 'creates a transaction' do
      expect(handler.transaction).to be_instance_of Transaction
    end

    it 'changes date variable to current date' do
      expect(handler.transaction.date).to eq current_date
    end

    it 'changes balance by correct amount' do
      expect(handler.transaction.balance).to eq test_amount
    end

    it 'changes credit when type is credit' do
      expect(handler.transaction.credit).to eq test_amount
    end
  end

  describe '#create_transaction with debit' do
    it 'changes debit when type is debit' do
      handler.create_transaction(test_amount, :debit)
      expect(handler.transaction.debit).to eq test_amount
    end
  end
end