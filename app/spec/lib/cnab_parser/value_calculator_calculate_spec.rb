# frozen_string_literal: true

describe CnabParser::ValueCalculator, '#calculate' do
  subject(:calculate) { value_calculator.calculate }
  let(:value_calculator) { described_class.new(deps) }

  let(:deps) { { 'value' => '0000060200' } }

  before do
    calculate
  end

  it { is_expected.to eq(602) }
end
