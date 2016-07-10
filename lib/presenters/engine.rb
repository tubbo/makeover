# frozen_string_literal: true
module Presenters
  class Engine < ::Rails::Engine
    config.presenters = ActiveSupport::OrderedOptions.new
    config.presenters.helpers = []
  end
end
