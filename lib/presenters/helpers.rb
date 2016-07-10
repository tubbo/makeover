# frozen_string_literal: true
module Presenters
  # Access view and route helpers from within the presenters.
  class Helpers
    # Cache instances of +Rails.application.routes.url_helpers+ and
    # +Rails.application.helpers+ when instantiated.
    def initialize
      @routes = Rails.application.routes.url_helpers
      @helpers = Rails.application.helpers
      Rails.configuration.presenters.helpers.each do |helper|
        self.class.send :include, helper
      end
    end

    # Call a method from either the app routes or helpers.
    #
    # @param [Symbol] method - Name of the method being called.
    # @param [Array] arguments - All arguments to the method.
    def method_missing(method, *arguments)
      return super unless respond_to_missing? method
      return @helpers.send method, *arguments if helper? method
      @routes.send method, *arguments
    end

    # Test whether the Routes or Helpers object contain a given method.
    #
    # @param [Symbol] method - Name of the method being tested.
    # @return [Boolean]
    def respond_to_missing?(method, _)
      helper?(method) || route?(method) || super
    end

    private

    # @private
    # @return [Boolean] Test whether this method is a view helper.
    def helper?(method)
      @helpers.respond_to_missing? method
    end

    # @private
    # @return [Boolean] Test whether this method is a route helper.
    def route?(method)
      @routes.respond_to_missing? method
    end
  end
end
