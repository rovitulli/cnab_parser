class ValidateFile
  include Interactor

  def call
    fail unless valid?
  end

  def valid?
    [".txt"].include?(file_extension)
  end

  def file_extension
    File.extname(context.file["filename"])
  end

  def fail
    context.fail!(message: "File must be 'txt' type")
  end
end
