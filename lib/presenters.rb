require 'presenters/engine'
require 'presenters/version'

module Presenters
  extend ActiveSupport::Autoload

  autoload :Helpers
  autoload :Presenter
  autoload :CollectionPresenter
  autoload :Presentable
  autoload :Relation

  # Presenters configuration.
  def self.config
    Rails.application.config.presenters
  end
end

using Presenters::Relation
