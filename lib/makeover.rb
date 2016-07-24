require 'makeover/engine'
require 'makeover/version'

# A simple view model library for Rails applications.
module Makeover
  extend ActiveSupport::Autoload

  autoload :Helpers
  autoload :Presenter
  autoload :CollectionPresenter
  autoload :Presentable
  autoload :Delegation

  def self.deprecator
    ActiveSupport::Deprecation.new next_major_version, name
  end

  def self.next_major_version
    major = VERSION.split('.').first.to_i + 1
    "#{major}.0"
  end
end
