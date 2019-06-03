class NormalizeDate
  include Interactor

  before do
    context.date_normalizer ||= CnabParser::DateNormalizer
  end

  def call
    normalize
  end

  def normalize
    context.filedata.each do |transaction|
      args = { "date" => transaction["date"], "time" => transaction["time"] }
      transaction["datetime"] = context.date_normalizer.new(args).normalize
    end
  end
end
