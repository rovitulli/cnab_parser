# frozen_string_literal: true

describe NormalizeDate, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) { { date_normalizer: date_normalizer_double, filedata: file_data } }
  let(:file_data) { [ { date: '20190301',
                        time: '172712' }] }

  let(:date_normalizer_double) do
    double('normalizer', new: normalizer_instance)
  end

  let(:normalizer_instance) { double('normalizer_instance', normalize: 4-10-2019) }

  before do
    allow(date_normalizer_double).to receive(:new).and_return(normalizer_instance)
    context
  end

  it { expect(context.filedata.first).to include(:datetime) }
end
