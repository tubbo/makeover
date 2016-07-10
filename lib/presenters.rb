# frozen_string_literal: true
require 'presenters/engine'
require 'presenters/version'

# A simple view model library for Rails applications.
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
