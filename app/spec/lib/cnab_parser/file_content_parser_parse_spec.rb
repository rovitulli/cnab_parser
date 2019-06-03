# frozen_string_literal: true

describe CnabParser::FileContentParser, '#parse' do
  subject(:parse) { file_content_parser.parse }

  let(:file_content_parser) { described_class.new(args) }
  let(:ruby_file_class) { class_double('File') }
  let(:file_path) { '/tmp/test.txt' }
  let(:args) { { "file_path" => file_path,
                 "ruby_file_class" => ruby_file_class
             } }

  #this must be exact like this
  let(:cnab_example) do
    "3201903010000014200096206760174753****3153153453JOÃO MACEDO   BAR DO JOÃO       "
  end

  let(:expected_result) do 
    { "card_number"=>"4753****3153",
      "cpf_code"=>"09620676017",
      "date"=>"20190301",
      "name"=>"BAR DO JOÃO       ",
      "owner"=>"JOÃO MACEDO   ",
      "time"=>"153453",
      "transaction_type"=>"3",
      "value"=>"0000014200"}
  end

  before do
    allow(ruby_file_class).to receive(:foreach).with(file_path).and_yield(cnab_example)
    parse
  end

  it { is_expected.to include(expected_result) }
end
