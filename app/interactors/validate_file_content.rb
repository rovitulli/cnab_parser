class ValidateFileContent
  include Interactor

  def call
    fail unless valid?
  end

  def valid?
    context.filedata.any?
  end

  def fail
    context.fail!(message: 'Invalid file content :-/')
  end
end
