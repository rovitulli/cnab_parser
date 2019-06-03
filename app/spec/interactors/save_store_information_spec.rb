# frozen_string_literal: true

describe SaveStoresInformation, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) { { store_class: store_class_double, filedata: file_data } }
  let(:file_data) { [ { "transaction_type"=>"3",
                      "date"=>"20190301",
                      "value"=>"0000060200",
                      "cpf_code"=>"23270298056",
                      "card"=>"6777****1313",
                      "time"=>"172712",
                      "owner"=>"JOSÉ COSTA",
                      "name"=>"Lojinha"}] }

  let(:store_class_double) do
    double('store_double')
  end

  let(:active_record_result) do
    double('result', id: 4)
  end

  before do
    allow(store_class_double).to receive(:find_or_create_by).with(name: "Lojinha")
                                                       .and_return(active_record_result)
    context
  end

  it { expect(store_class_double).to have_received(:find_or_create_by) }
end
