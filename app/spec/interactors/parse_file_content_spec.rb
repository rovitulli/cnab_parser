# frozen_string_literal: true

describe ParseFileContent, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) do 
    { file_content_parser: file_content_parser_double, file_path: file_path } 
  end

  let(:file_path) { 'tmp/test.txt' }

  let(:file_content_parser_double) do
    double('parser', new: parser_instance)
  end

  let(:parsed_content) do
    [ { transaction_type:'3',
        date:'20190301',
        value:'0000060200',
        cpf_code:'23270298056',
        card:'6777****1313',
        time:'172712',
        owner:'JOSÉ COSTA',
        name:'MERCEARIA 3 IRMÃOS'}]
  end

  let(:parser_instance) { double('calculator_instance', parse: parsed_content) }

  before do
    allow(file_content_parser_double).to receive(:new).and_return(parser_instance)
    context
  end

  it { expect(context.filedata.first).to include(:card) }
  it { expect(context.filedata.first).to include(:cpf_code) }
  it { expect(context.filedata.first).to include(:date) }
  it { expect(context.filedata.first).to include(:name) }
  it { expect(context.filedata.first).to include(:owner) }
  it { expect(context.filedata.first).to include(:time) }
  it { expect(context.filedata.first).to include(:transaction_type) }
  it { expect(context.filedata.first).to include(:value) }
end
