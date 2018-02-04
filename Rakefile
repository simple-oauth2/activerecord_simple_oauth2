ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
require 'rspec/core/rake_task'
require 'simple_oauth2'
load 'tasks/otr-activerecord.rake'

OTR::ActiveRecord.db_dir = 'db'
OTR::ActiveRecord.migrations_paths = ['db/migrations']

desc 'Default: run specs.'
task default: :spec

namespace :db do
  task :environment do
    require_relative 'config/db'
  end
end

RSpec::Core::RakeTask.new(:spec) do |config|
  config.verbose = false
end

Bundler::GemHelper.install_tasks
