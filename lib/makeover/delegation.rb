module Makeover
  # +ActiveSupport#delegate+ behavior customization and default
  # delegation to objects like +I18n+ and the derived model class, or a
  # custom one.
  module Delegation
    # @!attribute model_class [w]
    #   Customize the model class that this presenter should wrap.
    attr_writer :model_class

    # Figure out model class of presenter so we can delegate to the
    # proper model_name instance.
    def model_class
      @model_class ||= derived_model_class_name.constantize
    end

    # Wraps +ActiveSupport#delegate+ to specifically delegate methods to
    # the underlying object.
    #
    # @param methods [Array<Symbol>] *methods
    # @param to [Symbol] :to
    # @param options [Hash]
    # @option options [Boolean] :allow_nil
    # @option options [Boolean] :allow_blank
    def delegate(*methods, to: nil, **options)
      if to.nil?
        Makeover.deprecator.deprecation_warning 'delegate without specifying :to'
      end
      to ||= :model
      super(*methods, to: to, **options)
    end

    delegate :model_name, to: :model_class

    # No-op for Draper support.
    #
    # @return [NilClass] +nil+ and a deprecation message.
    def delegate_all
      # noop
    end
    deprecate :delegate_all, deprecator: Makeover.deprecator

   private

    def derived_model_class_name
      name.gsub(/Presenter/, '').classify
    end
  end
end
