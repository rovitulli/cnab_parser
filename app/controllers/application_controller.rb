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
      hashed = {}
      Store.all.each do |store|
        hashed[store.name] = { info: store,
                               transactions: store.transactions}
      end

      @data = hashed
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
