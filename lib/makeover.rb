# frozen_string_literal: true
require 'makeover/engine'
require 'makeover/version'

# A simple view model library for Rails applications.
module Makeover
  extend ActiveSupport::Autoload

  autoload :Helpers
  autoload :Presenter
  autoload :CollectionPresenter
  autoload :Presentable
end
