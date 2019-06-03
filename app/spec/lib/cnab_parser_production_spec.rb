# frozen_string_literal: true

describe CnabParser, '.production?' do
  subject { described_class.production? }

  before do
    stub_const('ENV', 'RUBY_ENV' => 'production')
  end

  it { is_expected.to eq(true) }
end
