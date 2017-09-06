require 'statement_printer'
require 'mocks/mock_statement'
require 'mocks/mock_row_formatter'

describe StatementPrinter do
  let(:mock_row_formatter)    { MockRowFormatter.new }
  let(:mock_statement)        { MockStatement.new(mock_row_formatter)}
  subject(:statement_printer) { described_class.new(mock_statement) }
  let(:format_test_amount) { '%.2f' % 100 }
  let(:current_date)          { Time.now.strftime('%d/%m/%Y') }
  let(:printed_statement)     { "date || credit || debit || balance
#{current_date} || #{format_test_amount} || || #{format_test_amount}\n"}

  describe '#print_statement' do
    it 'prints correctly formatted statement' do
      expect{ statement_printer.print_statement }.to output(print_statement).to_stdout
    end
  end
end
