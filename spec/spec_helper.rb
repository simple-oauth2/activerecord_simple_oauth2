ENV['RACK_ENV'] = 'test'

if RUBY_VERSION >= '1.9'
  require 'simplecov'
  require 'coveralls'

  SimpleCov.formatters = [
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]

  SimpleCov.start do
    add_filter '/spec/'
    minimum_coverage(90)
  end
end

require 'ffaker'
require 'active_record'
require 'database_cleaner'

require 'otr-activerecord'
require 'support/application_record'
require 'support/mixins'

RSpec.configure do |config|
  config.order = :random
  config.color = true

  config.before(:suite) do
    require_relative '../config/db'

    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:deletion)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
