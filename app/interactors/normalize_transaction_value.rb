##
# Calls lib that calculate the transaction value
class NormalizeTransactionValue
  include Interactor

  before do
    context.value_calculator ||= CnabParser::ValueCalculator
  end

  def call
    fail unless normalize
  end

  def normalize
    context.filedata.each do |transaction|
      args = { value: transaction[:value] }
      transaction[:value] = context.value_calculator.new(args).calculate
    end
  end

  def fail
    context.fail!(message: 'Could not normalize value')
  end
end
