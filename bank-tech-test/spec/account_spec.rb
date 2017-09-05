require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:starting_balance) { described_class::START_BALANCE }
  let(:test_amount) { 100 }
  let(:current_date) { Time.now.strftime('%d/%m/%Y') }
  let(:headings) { %w[date, credit, debit, balance] }

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
    it 'stores information in statement' do
      subject.create_statement_row(test_amount, :credit)
      expect(subject.statement)
        .to eq [headings, [current_date, test_amount, ' ', subject.balance]]
    end
  end
end
