# myapp.rb
require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/flash'
require 'sinatra/activerecord'
require 'interactor'

Dir['./interactors/**/*.rb'].each(&method(:require))
Dir['./organizers/**/*.rb'].each(&method(:require))
Dir['./models/*.rb'].each(&method(:require))

require './lib/cnab_parser'
require_relative 'controllers/application_controller'

class App < Sinatra::Base
  enable :sessions
  use ApplicationController
end
