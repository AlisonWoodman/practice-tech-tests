require 'account_interface'
require 'transaction'

describe AccountInterface do
  let(:account)               { Account.new }
  subject(:account_interface) { described_class.new(account) }
  let(:test_amount)           { 100.00 }
  let(:format_test_amount) { '%.2f' % 100 }
  let(:current_date)          { Time.now.strftime('%d/%m/%Y') }
  let(:headings)              { %w[date credit debit balance] }
  let(:example_statement)     { "date || credit || debit || balance
#{current_date} || #{format_test_amount} || || #{format_test_amount}\n"}

  describe '#initialize' do
    it 'initialises with an Account' do
      expect(account_interface.account).to eq account
    end
  end

  describe '#make_deposit' do
    it 'calls #create_statement_row with appropriate arguments' do
       expect(account).to receive(:create_statement_row).with(test_amount, :credit)
       account_interface.make_deposit(test_amount)
    end
  end

  describe '#make_withdrawal' do
    it 'calls #create_statement_row with appropriate arguments' do
       expect(account).to receive(:create_statement_row).with(test_amount, :debit)
       account_interface.make_withdrawal(test_amount)
    end
  end

  describe '#print_statement' do
    it 'prints column headings and statement rows' do
      account_interface.make_deposit(test_amount)
      expect{ account_interface.print_statement }.to output(example_statement).to_stdout
    end
  end
end
