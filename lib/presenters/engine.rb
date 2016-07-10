module Presenters
  class Engine < ::Rails::Engine
    config.presenters = ActiveSupport::OrderedOptions.new

    config.presenters.helpers = [
      ActionView::Helpers
    ]
  end
end
