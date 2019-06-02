class NormalizeTransactionValue
  include Interactor

  def call
    normalize
  end

  def normalize
    context.filedata.each do |transaction|
      transaction["value"] = CnabParser::ValueCalculator.normalize(transaction["value"])
    end
  end
end
