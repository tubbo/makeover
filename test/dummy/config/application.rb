# frozen_string_literal: true

require_relative 'boot'

# Pick the frameworks you want:
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'action_mailer/railtie'
require 'active_job/railtie'
require 'action_cable/engine'
# require "rails/test_unit/railtie"
require 'sprockets/railtie'

Bundler.require(*Rails.groups)
require 'makeover'

module Dummy
  class Application < Rails::Application
    config.active_record.sqlite3.represent_boolean_as_integer = true
  end
end
