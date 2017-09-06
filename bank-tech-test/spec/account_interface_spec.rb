require 'account_interface'
require 'transaction'
require 'row_formatter'
require 'statement'

describe AccountInterface do
  let(:statement)             { Statement.new }
  let(:row_formatter)         { RowFormatter.new }
  let(:data_handler)          { DataHandler.new(row_formatter, statement) }
  subject(:account_interface) { described_class.new(data_handler) }
  let(:test_amount)           { 100.00 }
  let(:format_test_amount) { '%.2f' % 100 }
  let(:current_date)          { Time.now.strftime('%d/%m/%Y') }
  let(:headings)              { %w[date credit debit balance] }
  let(:example_statement)     { "date || credit || debit || balance
#{current_date} || #{format_test_amount} || || #{format_test_amount}\n"}

  describe '#initialize' do
    it 'initialises with an Account' do
      expect(account_interface.data_handler).to eq data_handler
    end
  end

  describe '#make_deposit' do
    it 'calls #create_transaction with appropriate arguments' do
       expect(data_handler).to receive(:create_transaction).with(test_amount, :credit)
       account_interface.make_deposit(test_amount)
    end
  end

  describe '#make_withdrawal' do
    it 'calls #create_transaction with appropriate arguments' do
       expect(data_handler).to receive(:create_transaction).with(test_amount, :debit)
       account_interface.make_withdrawal(test_amount)
    end
  end

end
