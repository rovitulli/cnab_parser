module CnabParser
  module_function

  APP_DIR = Dir.pwd

  def production?
    env == 'production'
  end

  def test?
    env == 'test'
  end

  def development?
    env == 'development'
  end

  def env
    ENV['RUBY_ENV'] || 'development'
  end
end

require './lib/cnab_parser/storer'
