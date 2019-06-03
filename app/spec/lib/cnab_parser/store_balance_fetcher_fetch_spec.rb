# frozen_string_literal: true

describe CnabParser::StoreBalanceFetcher, '#fetch' do
  subject(:fetch) { store_balance_fetcher.fetch }

  let(:store_balance_fetcher) { described_class.new(args) }
  let(:store_class_double) { class_double('Store') }
  let(:active_record_result) { double('Result', current_balance: expected_result) }

  let(:args) do 
    { store_id: 1,
      store_class: store_class_double } 
  end

  let(:expected_result) { 100 }

  before do
    allow(store_class_double).to receive(:find).with(1).and_return(active_record_result)
    fetch
  end

  it { is_expected.to eq(expected_result) }
end
