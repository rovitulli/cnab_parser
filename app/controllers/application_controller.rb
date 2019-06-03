##
# Application main controller
class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::Contrib
  set :root, CnabParser::APP_DIR
  set :session_secret, 'secure code ;-)'
  set :lock, true

  get '/' do
    @message = session.delete(:message)
    @data = Store.hashed
    erb :index
  end

  post '/proccess_file' do
    result = ProcessFile.call(params)

    if result.success?
      session[:message] = "File upload successfully"
      redirect '/'
    else
      session[:message] = result.message
      redirect '/'
    end
  end

  helpers do
    def transaction_behavior(transaction_type)
      CnabParser::TransactionBehaviorTranslator.new({ 'transaction_type' => transaction_type.to_s }).translate.to_s
    end

    def flash
      @flash = session[:flash]
    end

    def to_currency(value)
      "R$ #{ '%.2f' % value }"
    end
  end
end
