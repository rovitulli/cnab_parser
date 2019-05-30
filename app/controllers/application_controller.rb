##
# Mae de todos controllers
class ApplicationController < Sinatra::Base
  set :views, File.expand_path(File.join(__FILE__, '../../views'))

  get '/' do
    erb :index
  end

  post '/proccess_file' do
    erb :table
  end
end
