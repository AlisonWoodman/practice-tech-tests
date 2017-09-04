require 'account_interface'
require 'account'

describe AccountInterface do
  let(:account) { Account.new }
  subject(:account_interface) { described_class.new(account) }
  let(:test_amount) { 100 }
  let(:current_date) { Time.now.strftime('%d/%m/%Y') }
  let(:headings) { 'date, || credit, || debit, || balance' }

  it 'initialises with an Account' do
    expect(account_interface.account).to eq account
  end

  it '#make_deposit increases balance by amount deposited' do
    expect { account_interface.make_deposit(test_amount) }
      .to change { account.balance }.from(Account::START_BALANCE).to(test_amount)
  end

  it '#make_deposit changes date variable to current date' do
    expect { account_interface.make_deposit(test_amount) }
      .to change { account.date }.to(current_date)
  end

  it '#make_deposit changes credit amount by amount deposited' do
    expect { account_interface.make_deposit(test_amount) }
      .to change { account.credit }.to(test_amount)
  end

  it '#make_withdrawal decreases balance by amount withdrawn' do
    expect { account_interface.make_withdrawal(test_amount) }
      .to change { account.balance }.from(Account::START_BALANCE).to(-test_amount)
  end

  it '#make_withdrawal changes date variable to current date' do
    expect { account_interface.make_withdrawal(test_amount) }
      .to change { account.date }.to(current_date)
  end

  it '#make_withdrawal changes debit amount by amount deposited' do
    expect { account_interface.make_withdrawal(test_amount) }
      .to change { account.debit }.to(test_amount)
  end

  it '#print_statement prints column headings and statement rows' do
    account_interface.make_deposit(test_amount)
    account_interface.print_statement
    expect(account_interface.output)
      .to eq "#{headings}\n#{current_date} || #{test_amount} ||   || #{test_amount}\n"
  end
end
