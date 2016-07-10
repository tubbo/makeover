# frozen_string_literal: true
module Presenters
  # Rails integration for the library. Sets up configuration.
  class Engine < ::Rails::Engine
    config.presenters = ActiveSupport::OrderedOptions.new
    config.presenters.helpers = []
  end
end
