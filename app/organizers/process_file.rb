##
# This organizes all interactor proccess
class ProcessFile
  include Interactor::Organizer

  organize ValidateFile,
           StoreFile,
           ParseFileContent,
           ValidateFileContent,
           SanitizeNames,
           SaveStoresInformation,
           FetchStoresIds,
           NormalizeTransactionValue,
           NormalizeDate,
           MakeReadableType,
           TransactionBehavior,
           SaveTransactionsInformation
end
