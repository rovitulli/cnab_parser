class MakeReadableType
  include Interactor

  before do
    context.transaction_type_translator ||= CnabParser::TransactionTypeTranslator
  end

  def call
    readable_type
  end

  def readable_type
    context.filedata.each do |transaction|
      args = { "transaction_type" => transaction["transaction_type"] }
      transaction["readable_type"] = context.transaction_type_translator.new(args).translate
    end
  end
end
