require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:starting_balance) { described_class::START_BALANCE }
  let(:test_amount) { 100 }
  let(:current_date) { Time.now.strftime('%d/%m/%Y') }
  let(:headings) { %w[date, credit, debit, balance] }

  it 'initializes with a balance of 0' do
    expect(subject.balance).to eq starting_balance
  end

  it 'initializes with a credit string field' do
    expect(subject.credit).to eq ' '
  end

  it 'initializes with a debit string field' do
    expect(subject.debit).to eq ' '
  end

  it 'initializes with a date variable set to nil' do
    expect(subject.date).to eq nil
  end

  it 'initializes with a statement containing relevant headings' do
    expect(subject.statement).to eq [headings]
  end

  it '#create_statement_row stores information in statement' do
    subject.create_statement_row(test_amount, :credit)
    expect(subject.statement)
      .to eq [headings, [current_date, test_amount, ' ', subject.balance]]
  end
end
