class NormalizeTransactionValue
  include Interactor

  before do
    context.value_calculator ||= CnabParser::ValueCalculator
  end

  def call
    normalize
  end

  def normalize
    context.filedata.each do |transaction|
      args = { "value" => transaction["value"] }
      transaction["value"] = context.value_calculator.new(args).calculate
    end
  end
end
