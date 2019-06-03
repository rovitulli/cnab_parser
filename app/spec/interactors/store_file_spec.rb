# frozen_string_literal: true

describe StoreFile, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) do
    { file_storer: file_storer_double,
      file: { tempfile: tempfile,
              filename: filename }
    }
  end

  let(:file_storer_double) do
    double('normalizer', new: storer_instance)
  end

  let(:storer_instance) { double("storer_instance", store: '') }

  let(:tempfile) { '/tmp/test.txt'}
  let(:filename) { 'test.txt'}

  before do
    allow(file_storer_double).to receive(:new).and_return(storer_instance)
    context
  end

  it { expect(storer_instance).to have_received(:store) }
end
