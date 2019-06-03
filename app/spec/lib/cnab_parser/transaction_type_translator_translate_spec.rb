# frozen_string_literal: true

describe CnabParser::TransactionTypeTranslator, '#translate' do
  subject(:translate) { transaction_type_translator.translate }
  let(:transaction_type_translator) { described_class.new(deps) }

  let(:deps) { { transaction_type: '3' } }

  before do
    translate
  end

  it { is_expected.to eq('Financiamento') }
end
