# frozen_string_literal: true

describe NormalizeTransactionValue, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) { { value_calculator: value_calculator_double, filedata: file_data } }
  let(:file_data) { [{ value: '0060200' }] }

  let(:value_calculator_double) do
    double('calculator', new: calculator_instance)
  end

  let(:calculator_instance) { double('calculator_instance', calculate: 602) }

  before do
    allow(value_calculator_double).to receive(:new).and_return(calculator_instance)
    context
  end

  it { expect(context.filedata.first).to include(:value) }
end
