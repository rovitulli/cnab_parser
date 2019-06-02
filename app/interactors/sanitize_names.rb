class SanitizeNames
  include Interactor

  def call
    sanitize
  end

  def sanitize
    context.filedata.each do |transaction|
      transaction["name"] = transaction["name"].strip.capitalize
      transaction["owner"] = transaction["owner"].strip.capitalize
    end
  end
end
