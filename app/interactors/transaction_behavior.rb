##
# Calls Behavior lib to fetch transaction behavior

class TransactionBehavior
  include Interactor

  before do
    context.transaction_behavior_translator ||= CnabParser::TransactionBehaviorTranslator
  end

  def call
    fail unless fetch_behavior
  end

  def fetch_behavior
    context.filedata.each do |transaction|
      args = { "transaction_type" => transaction["transaction_type"] }
      transaction["transaction_behavior"] = context.transaction_behavior_translator.new(args).translate
    end
  end

  def fail
    context.fail!(message: "Could not fetch transaction behavior")
  end
end
