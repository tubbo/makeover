# frozen_string_literal: true
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'presenters/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'presenters'
  s.version     = Presenters::VERSION
  s.authors     = ['Tom Scott']
  s.email       = ['tscott@weblinc.com']
  s.homepage    = 'http://github.com/tubbo/presenters'
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

  s.add_dependency 'rails' # , "~> 5.0.0"

  s.add_development_dependency 'pg'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'generator_spec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'travis-release'
end
