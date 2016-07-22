# frozen_string_literal: true
module Makeover
  # Base Presenter class for all decorator objects.
  class Presenter < Delegator
    attr_reader :model

    def initialize(model, **context)
      @model = model
      context.each do |option, value|
        instance_variable_set "@#{option}", value
      end
    end

    def self.delegate(*methods, to: :model, **options)
      super(*methods, to: to, **options)
    end

    def __getobj__
      @model
    end

    def helpers
      @helpers ||= Helpers.new
    end
    alias h helpers
  end
end
