# frozen_string_literal: true

describe ValidateFile, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) { { file: { filename: 'text.txt' } } }

  before do
    context
  end

  it { expect(context).to be_a_success }
end
