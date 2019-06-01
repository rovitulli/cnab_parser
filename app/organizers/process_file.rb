# Procedimento do POST /api/v1/medias/mute
class ProcessFile
  include Interactor::Organizer

  organize ValidateFile,
           StoreFile,
           ParseFileContent,
           ValidateFileContent,
           RecordStoresInformation
 #          RecordTransationsInformation
end
