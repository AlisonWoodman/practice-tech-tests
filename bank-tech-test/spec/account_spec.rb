require 'account'

describe Account do
  subject(:account)      { described_class.new }
  let(:starting_balance) { described_class::START_BALANCE }
  let(:test_amount)      { 100 }
  let(:current_date)     { Time.now.strftime('%d/%m/%Y') }
  let(:headings)         { %w[date credit debit balance] }
  let(:example_row)      { [current_date, test_amount, ' ', account.balance] }

  describe '#initialize' do
    it 'creates a balance of 0' do
      expect(subject.balance).to eq starting_balance
    end

    it 'creates a credit string field' do
      expect(subject.credit).to eq ' '
    end

    it 'creates a debit string field' do
      expect(subject.debit).to eq ' '
    end

    it 'creates a date variable set to nil' do
      expect(subject.date).to eq nil
    end

    it 'creates a statement containing relevant headings' do
      expect(subject.statement).to eq [headings]
    end
  end

  describe '#create_statement_row' do
    before do
      subject.create_statement_row(test_amount, :credit)
    end
      it 'updates balance' do
        expect(subject.balance).to eq test_amount
      end

      it 'updates date' do
        expect(subject.date).to eq current_date
      end

      it 'updates credit amount' do
        expect(subject.credit).to eq test_amount
      end

      it 'stores correct information in statement' do
          expect(subject.statement).to eq [headings, example_row]
      end
    end

  describe 'Edge cases: debit' do
    before do
      subject.create_statement_row(test_amount, :debit)
    end
      it 'decreases balance by debit amount' do
        expect(subject.balance).to eq -test_amount
      end

      it 'sets debit variable to debit amount' do
        expect(subject.debit).to eq test_amount
      end
  end
end
