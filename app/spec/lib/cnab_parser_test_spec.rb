# frozen_string_literal: true

describe CnabParser, '.test?' do
  subject { described_class.test? }

  before do
    stub_const('ENV', 'RUBY_ENV' => 'test')
  end

  it { is_expected.to eq(true) }
end
