# frozen_string_literal: true

describe CnabParser::StoreFinder, '#find_id' do
  subject(:find_id) { store_finder.find_id }

  let(:store_finder) { described_class.new(args) }
  let(:store_class_double) { double('Store') }
  let(:active_record_result) { double("Result", id: 1) }

  let(:args) { { store_name: 'Lojao',
                 store_class: store_class_double
             } }
  let(:expected_result) { 1 }

  before do
    allow(store_class_double).to receive(:find_by_name).with('Lojao').and_return(active_record_result)
    find_id
  end

  it { is_expected.to eq(expected_result) }
end
