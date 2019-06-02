class TransactionBehavior
  include Interactor

  def call
    fetch_behavior
  end

  def fetch_behavior
    context.filedata.each do |transaction|
      transaction["transaction_behavior"] = CnabParser::TransactionBehavior.calculate(transaction["transaction_type"])
    end
  end
end
