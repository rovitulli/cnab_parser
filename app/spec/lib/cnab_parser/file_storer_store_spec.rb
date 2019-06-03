# frozen_string_literal: true

describe CnabParser::FileStorer, '#store' do
  subject(:store) { file_storer.store }
  let(:file_storer) { described_class.new(deps) }

  let(:ruby_file) { class_double('File') }
  let(:filename) { 'teste.txt' }
  let(:file) { '101010010101' }
  let(:file_path) { '/tmp/teste.txt' }

  let(:deps) do
    { filename: filename,
      file: file,
      file_path: file_path,
      ruby_file: ruby_file }
  end

  before do
    allow(ruby_file).to receive(:open).with(file_path, 'wb').and_return('')
    store
  end

  it { expect(ruby_file).to have_received(:open).with(file_path, 'wb' ) }
end
