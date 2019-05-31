module CnabParser
  ##
  # Interpreta saida do astats
  module Storer
    module_function

    def store(filename, file)
      temp_dir = CnabParser::APP_DIR + "/tmp"
      file_path = File.join(temp_dir, "/", filename )

      File.open(file_path, 'wb') do |f|
        f.write(file.read)
      end
    end
  end
end
