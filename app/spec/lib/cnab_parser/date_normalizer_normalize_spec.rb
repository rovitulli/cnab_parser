# frozen_string_literal: true

describe CnabParser::DateNormalizer, '#normalize' do
  subject(:normalize) { date_normalizer.normalize }

  let(:date_normalizer) { described_class.new(args) }
  let(:date) { '20190319'}
  let(:time) { '153453' }
  let(:datetime_double) { class_double('DateTime') }
  let(:args) { { "date" => date,
                 "time" => time,
                 "datetime_ruby_class" => datetime_double 
             } }
  let(:expected_result) { '2019-03-19T15:34:53+00:00' }

  before do
    allow(datetime_double).to receive(:parse).with(date+time).and_return("2019-03-19T15:34:53+00:00")
    normalize
  end

  it { is_expected.to eq(expected_result) }
end
