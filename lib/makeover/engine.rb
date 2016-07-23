module Makeover
  # Rails integration for the library. Sets up configuration.
  class Engine < ::Rails::Engine
    config.makeover = ActiveSupport::OrderedOptions.new
    config.makeover.helpers = []
  end
end
