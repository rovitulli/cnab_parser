# frozen_string_literal: true

describe CnabParser::BalanceCalculator, '#calculate"' do
  subject(:calculate) { balance_calculator.calculate }

  let(:balance_calculator) { described_class.new(args) }

  let(:args) { { store_current_balance: 0,
                 transaction_value: 100,
                 transaction_behavior: :+
             } }

  let(:expected_result) { 100 }

  before do
    calculate
  end

  it { is_expected.to eq(expected_result) }
end

