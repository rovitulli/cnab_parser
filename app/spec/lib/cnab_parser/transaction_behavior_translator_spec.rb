# frozen_string_literal: true

describe CnabParser::TransactionBehaviorTranslator, '#translate' do
  subject(:translate) { transaction_behavior_translator.translate }
  let(:transaction_behavior_translator) { described_class.new(deps) }

  let(:deps) { { transaction_type: '3' } }

  before do
    translate
  end

  it { is_expected.to eq(:-) }
end
