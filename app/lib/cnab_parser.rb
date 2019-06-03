##
# Main app module
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

require './lib/cnab_parser/file_storer'
require './lib/cnab_parser/store_finder'
require './lib/cnab_parser/balance_calculator'
require './lib/cnab_parser/date_normalizer'
require './lib/cnab_parser/transaction_behavior_translator'
require './lib/cnab_parser/transaction_type_translator'
require './lib/cnab_parser/value_calculator'
require './lib/cnab_parser/store_balance_fetcher'
require './lib/cnab_parser/file_content_parser'

