# frozen_string_literal: true

require 'rack/test'
require 'rspec'

ENV['RUBY_ENV'] = 'test'
ENV['RACK_ENV'] = 'test'

require File.expand_path('../app.rb', __dir__)

module RSpecMixin
  include Rack::Test::Methods
  def app
    App
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include RSpecMixin
end
