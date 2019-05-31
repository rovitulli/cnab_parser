##
# Mae de todos controllers
class ApplicationController < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  register Sinatra::Contrib
  set :root, CnabParser::APP_DIR
  set :session_secret, 'isto está muito mais seguro agora ha HA HA HA'
  set :lock, true

  get '/' do
    erb :index
  end

  post '/proccess_file' do
    result = ProcessFile.call(params)

    if result.success?
      result.inspect
    else
      result.message
    end
  end
end
