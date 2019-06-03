##
# Calls file storer to store file into local filesystem

class StoreFile
  include Interactor

  before do
    context.file_storer ||= CnabParser::FileStorer
  end
  def call
    fail unless store
  end

  def store
    args = { filename: context.file[:filename],
             file: context.file[:tempfile] }

    context.file_storer.new(args).store
  end

  def fail
    context.fail!(message: 'Could not store file')
  end
end
