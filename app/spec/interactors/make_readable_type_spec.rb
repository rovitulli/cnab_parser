# frozen_string_literal: true

describe MakeReadableType, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) do 
    { transaction_type_translator: translator_double,
      filedata: file_data }
  end

  let(:file_data) { [ { transaction_type: '3' }] }

  let(:translator_double) do
    class_double('CnabParser::TransactionTypeTranslator', new: translator_instance)
  end

  let(:translator_instance) { double("Result", translate: 'Financiamento') }

  before do
    allow(translator_double).to receive(:new).and_return(translator_instance)
    context
  end

  it { expect(context.filedata.first).to include(:readable_type) }
end
