# frozen_string_literal: true
require 'bundler/setup'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yard'
require 'bundler/gem_tasks'
require 'travis/release/task'

APP_RAKEFILE = File.expand_path('../spec/dummy/Rakefile', __FILE__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

RSpec::Core::RakeTask.new :test

RuboCop::RakeTask.new :lint

Travis::Release::Task.new

YARD::Rake::YardocTask.new :doc

task default: [:test, :build]
