# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'makeover/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'makeover'
  s.version     = Makeover::VERSION
  s.authors     = ['Tom Scott']
  s.email       = ['tscott@weblinc.com']
  s.homepage    = 'http://github.com/tubbo/makeover'
  s.summary     = 'View model library for Rails applications.'
  s.description = "#{s.summary} Extracted from brother.ly."
  s.license     = 'MIT'

  s.files = Dir[
    'lib/**/*',
    'Rakefile',
    'LICENSE.md',
    'CODE_OF_CONDUCT.md',
    'README.md'
  ]

  s.add_dependency 'rails'

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'puma'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'travis-release'
  s.add_development_dependency 'webdrivers'
  s.add_development_dependency 'yard'
end
