# Procedimento do POST /api/v1/medias/mute
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
           # remove_file
end
