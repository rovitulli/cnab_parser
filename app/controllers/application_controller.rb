##
# Mae de todos controllers
class ApplicationController < Sinatra::Base
  set :views, File.expand_path(File.join(__FILE__, '../../views'))

  get '/' do
    erb :index
  end

  post '/proccess_file' do
    require 'pry'; binding.pry

      filename = params[:file][:filename]
      file = params[:file][:tempfile]

      public_dir = File.expand_path(File.join(__FILE__, '../../public'))

      file_path = File.join(public_dir, "/", filename )

      File.open(file_path, 'wb') do |f|
        f.write(file.read)
      end
  end
end
