##
# Calls file parser and insert parsed values into context
class ParseFileContent
  include Interactor

  before do
    context.file_content_parser ||= CnabParser::FileContentParser
    context.file_path ||= File.join(CnabParser::APP_DIR, '/tmp', context.file[:filename])
  end

  def call
    fail unless parse_file
  end

  def parse_file
    args = { file_path: context.file_path }
    context.filedata = context.file_content_parser.new(args).parse
  end

  def fail
    context.fail!(message: 'Could not parse file properly')
  end
end
