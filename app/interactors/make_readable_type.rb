##
# Call lib that tranlate transaction type to a human readable format
class MakeReadableType
  include Interactor

  before do
    context.transaction_type_translator ||= CnabParser::TransactionTypeTranslator
  end

  def call
    fail unless readable_type
  end

  def readable_type
    context.filedata.each do |transaction|
      args = { "transaction_type" => transaction["transaction_type"] }
      transaction["readable_type"] = context.transaction_type_translator.new(args).translate
    end
  end

  def fail
    context.fail!(message: "Could make readable transaction type")
  end
end
