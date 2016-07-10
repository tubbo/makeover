module Presenters
  class Engine < ::Rails::Engine
    config.presenters = ActiveSupport::OrderedOptions.new

    config.presenters.helpers = [
      ActionView::Helpers
    ]

    config.to_prepare do
      using Presenters::Relation
    end
  end
end
