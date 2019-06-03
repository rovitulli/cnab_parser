class SanitizeNames
  include Interactor

  def call
    fail unless sanitize
  end

  def sanitize
    context.filedata.each do |transaction|
      transaction["name"] = transaction["name"].strip.capitalize
      transaction["owner"] = transaction["owner"].strip.capitalize
    end
  end

  def fail
    context.fail!(message: "could not sanitize names")
  end
end
