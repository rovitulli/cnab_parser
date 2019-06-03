##
# Stores file in filesystem
module CnabParser
  class FileStorer
    attr_reader :file, :file_path, :ruby_file
    
    def initialize(args)
      filename = args.fetch(:filename)
      temp_dir = args.fetch(:temp_dir, CnabParser::APP_DIR + '/tmp')
      @file_path = args.fetch(:file_path, File.join(temp_dir, '/', filename))
      @file = args.fetch(:file)
      @ruby_file = args.fetch(:ruby_file, File)
    end

    def store
      ruby_file.open(file_path, 'wb') do |f|
        f.write(file.read)
      end
    end
  end
end
