class ValidateFileContent
  include Interactor

  def call
    fail unless valid?
  end
    
  def valid?
    context.filedata.any?
  end

  def fail
    context.fail!(rack_response: failing_rack_response)
  end

  def failing_rack_response
    [422, {}, { message: 'Invalid file content'}]
  end
end
