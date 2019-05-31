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

    CnabParser::Storer.store(filename, file)
  end

  def fail
    context.fail!(message: 'Could not store file', rack_response: [422, {}, ''])
  end
end
