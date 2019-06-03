# frozen_string_literal: true

describe TransactionBehavior, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) do
    { transaction_behavior_translator: transaction_behavior_translator_double,
      filedata: file_data }
  end

  let(:file_data) { [{ 'transaction_type'=>'3' }] }

  let(:transaction_behavior_translator_double) do
    double('translator_double', new: translator_instance)
  end

  let(:translator_instance) { double('Result', translate: :-) }

  before do
    allow(transaction_behavior_translator_double).to receive(:new).and_return(translator_instance)
    context
  end

  it { expect(context.filedata.first).to include("transaction_behavior" => :-) }
end
