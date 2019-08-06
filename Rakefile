# frozen_string_literal: true

require 'bundler/setup'
require 'rubocop/rake_task'
require 'yard'
require 'bundler/gem_tasks'
require 'travis/release/task'
require 'rake/testtask'

APP_RAKEFILE = File.expand_path('test/dummy/Rakefile', __dir__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

ENV['COVERAGE'] = 'true'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
  t.warning = false
end

RuboCop::RakeTask.new :lint

Travis::Release::Task.new

YARD::Rake::YardocTask.new :doc

task default: %i[test build]
