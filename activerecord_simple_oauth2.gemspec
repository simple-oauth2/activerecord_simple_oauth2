# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'activerecord_simple_oauth2/version'

Gem::Specification.new do |s|
  s.name        = 'activerecord_simple_oauth2'
  s.version     = ActiveRecord::Simple::OAuth2.gem_version
  s.date        = '2017-01-17'
  s.summary     = 'Mixin for ActiveRecord ORM'
  s.description = 'ActiveRecord mixin for SimpleOAuth2 authorization'
  s.authors     = ['Volodimir Partytskyi']
  s.email       = 'volodimir.partytskyi@gmail.com'
  s.homepage    = 'https://github.com/simple-oauth2/activerecord_simple_oauth2'
  s.license     = 'MIT'

  s.require_paths = %w[lib]
  s.files         = Dir['LICENSE', 'lib/**/*']

  s.required_ruby_version = '>= 2.2.2'

  s.add_runtime_dependency 'simple_oauth2', '0.1.0'

  s.add_development_dependency 'rspec-rails', '~> 3.6.0', '>= 3.6.0'
  s.add_development_dependency 'database_cleaner', '~> 1.5.0', '>= 1.5.0'
end
