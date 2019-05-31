# Procedimento do POST /api/v1/medias/mute
class ProcessFile
  include Interactor::Organizer

  organize StoreFile
           #ValidateFileFormat,
           #ValidateFileContent,
           #ParseFileContent,
           #RecordFileInformation
end
