module CnabParser
  module_function

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
