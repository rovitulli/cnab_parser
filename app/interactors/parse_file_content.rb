class ParseFileContent
  include Interactor

  PARSE_REGEX = /^(?<type>[0-9]{1})(?<date>[0-9]{8})(?<value>[0-9]{10})(?<cpf_code>[0-9]{11})(?<card>.{12})(?<datetime>[0-9]{6})(?<name>.{14})(?<store>.{18,})/

  def call
    parse_file
  end

  def file_path
    File.join(CnabParser::APP_DIR, "/tmp", context.file["filename"])
  end

  def parse_file
    data = []
    File.foreach(file_path) do |line|

    require 'pry'; binding.pry
      result = line.match(PARSE_REGEX)
      next unless result
      data << result
    end

    context.filedata = data
  end
end
