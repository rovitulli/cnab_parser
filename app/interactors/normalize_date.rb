class NormalizeDate
  include Interactor

  def call
    normalize
  end

  def normalize
    context.filedata.each do |transaction|
      date = transaction["date"]
      time = transaction["time"]
      transaction["datetime"] = CnabParser::DateNormalizer.normalize(date,time)
    end
  end
end
