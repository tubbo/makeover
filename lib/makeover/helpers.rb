# frozen_string_literal: true

module Makeover
  # Access view and route helpers from within the makeover.
  class Helpers
    include ActionView::Helpers

    # Cache instances of +Rails.application.routes.url_helpers+ and
    # +Rails.application.helpers+ when instantiated.
    def initialize
      self.class.send :include, Rails.application.routes.url_helpers
      self.class.send :include, Rails.application.helpers
      Rails.configuration.makeover.helpers.each do |helper|
        self.class.send :include, helper
      end
    end
  end
end
