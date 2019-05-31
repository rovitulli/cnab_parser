##
# Verifica se o cliente HTTP (um navegador, normalmente) esta solicitando JSON
class StoreFile
  include Interactor

  def call
    fail unless stored?
  end

  def stored?
    filename = context.file[:filename]
    file = context.file[:tempfile]

    public_dir = File.expand_path(File.join(__FILE__, '../../public'))

    file_path = File.join(public_dir, "/", filename )

    File.open(file_path, 'wb') do |f|
      f.write(file.read)
    end

    [204, {}, '']
  end

  def fail
    context.fail!(message: 'Could not store file', rack_response: [422, {}, ''])
  end
end
