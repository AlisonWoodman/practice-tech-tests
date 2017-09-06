require 'transaction'

describe Transaction do
  subject(:transaction)         { described_class.new }
  let(:starting_balance)    { described_class::START_BALANCE }

  describe '#initialize' do
    it 'creates a balance of 0' do
      expect(transaction.balance).to eq starting_balance
    end

    it 'creates a credit string field' do
      expect(transaction.credit).to eq ''
    end

    it 'creates a debit string field' do
      expect(transaction.debit).to eq ''
    end

    it 'creates a date variable set to nil' do
      expect(transaction.date).to eq nil
    end
  end
end
