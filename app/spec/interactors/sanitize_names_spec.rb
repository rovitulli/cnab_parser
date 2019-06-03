# frozen_string_literal: true

describe SanitizeNames, '#call' do
  subject(:context) { described_class.call(input) }

  let(:input) { { filedata: filedata } }
  let(:filedata) { [{ owner: 'JOÃO das NeVes      ',
                      name:  'JOJINHA DA ESQUINA' }] }

  before do
    context
  end

  it { expect(context.filedata.first).to include(name: "Jojinha da esquina") }
  it { expect(context.filedata.first).to include(owner: "João das neves") }
end
