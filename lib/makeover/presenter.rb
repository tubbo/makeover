# frozen_string_literal: true
module Makeover
  # Base Presenter class for all decorator objects.
  class Presenter < Delegator
    # @!attribute [r] model
    #   @return [Object] Object being delegated to.
    attr_reader :model

    # Wrap a new model as a presenter object.
    #
    # @param model [Object] Model object to wrap.
    # @param context [Hash] Extra context for the presenter.
    def initialize(model, **context)
      @model = model
      context.each do |option, value|
        instance_variable_set "@#{option}", value
      end
    end

    # Wraps +ActiveSupport#delegate+ to specifically delegate methods to
    # the underlying object.
    #
    # @param methods [Array<Symbol>] *methods
    # @param to [Symbol] :to
    # @param options [Hash]
    # @option options [Boolean] :allow_nil
    # @option options [Boolean] :allow_blank
    def self.delegate(*methods, to: :model, **options)
      super(*methods, to: to, **options)
    end

    # Return the model object.
    #
    # @return [Object]
    def __getobj__
      @model
    end

    # Delegate to view context to run helper methods.
    #
    # @return [Makeover::Helpers]
    def helpers
      @helpers ||= Helpers.new
    end
    alias h helpers
  end
end
