# frozen_string_literal: true

describe ValidateFileContent, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) { { filedata: file_data } }

  let(:file_data) { [{ transaction_type: '3' }] }

  before do
    context
  end

  it { expect(context).to be_a_success }
end
