# myapp.rb
require 'sinatra/base'
require 'interactor'
require_relative 'lib/cnab_parser'
require_relative 'controllers/application_controller'

class App < Sinatra::Base
  use ApplicationController
end
