class MakeReadableType
  include Interactor

  def call
    readable_type
  end

  def readable_type
    context.filedata.each do |transaction|
      transaction["readable_type"] = CnabParser::TransactionTypeTranslator.translate(transaction["transaction_type"])
    end
  end
end
