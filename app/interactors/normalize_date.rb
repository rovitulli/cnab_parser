##
# Calls lib that normalize Date based on context
class NormalizeDate
  include Interactor

  before do
    context.date_normalizer ||= CnabParser::DateNormalizer
  end

  def call
    fail unless normalize
  end

  def normalize
    context.filedata.each do |transaction|
      args = { date: transaction[:date], time: transaction[:time] }
      transaction[:datetime] = context.date_normalizer.new(args).normalize
    end
  end

  def fail
    context.fail!(message: 'Could not normalize date')
  end
end
