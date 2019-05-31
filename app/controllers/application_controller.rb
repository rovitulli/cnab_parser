##
# Mae de todos controllers
class ApplicationController < Sinatra::Base
  register Sinatra::Contrib
  set :root, CnabParser::APP_DIR
  set :session_secret, 'isto está muito mais seguro agora ha HA HA HA'
  set :lock, true

  #set :views, File.expand_path(File.join(__FILE__, '../../views'))

  get '/' do
    erb :index
  end

  post '/proccess_file' do
    result = ProcessFile.call(params)

    if result.success?
      'vitulli, deu certo!'
    else
      flash.now[:message] = t(result.message)
      erb :index
    end
  end
end
