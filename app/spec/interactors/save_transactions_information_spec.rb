# frozen_string_literal: true

describe SaveTransactionsInformation, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) do 
    { transaction_class: transaction_class_double, 
      filedata: file_data,
      balance_calculator: balance_calculator_double,
      store_balance_fetcher: store_balance_fetcher_double } 
  end

  let(:transaction_info) do
     {balance: 10,
      card_number: "6777****1313",
      datetime: '12-3-2019',
      readable_type: 'Financiamento',
      store_id: 1,
      transaction_type: "3",
      value: "0000060200"}
  end

  let(:file_data) { [transaction_info] }

  let(:transaction_class_double) do
    double('store_double')
  end

  let(:balance_calculator_double) do
    double('balance_calculator_double', new: balance_instance)
  end

  let(:balance_instance) do
    double('balance_instance', calculate: 10)
  end

  let(:store_balance_fetcher_double) do
    double('store_balance_fetcher_double', new: balance_instance)
  end

  let(:balance_instance) do
    double('balance_instance', fetch: 100)
  end

  let(:active_record_result) do
    double('result', id: 4)
  end

  before do
    allow(transaction_class_double).to receive(:create).with(transaction_info)
                                                       .and_return(active_record_result)
    allow(balance_instance).to receive(:calculate).and_return(10)
    context
  end

  it { expect(transaction_class_double).to have_received(:create) }
end
