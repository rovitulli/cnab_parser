# myapp.rb
require 'sinatra'
require 'sinatra/contrib'
require 'interactor'

Dir['./interactors/**/*.rb'].each(&method(:require))
Dir['./organizers/**/*.rb'].each(&method(:require))

require './lib/cnab_parser'
require_relative 'controllers/application_controller'

class App < Sinatra::Base
  use ApplicationController
end
