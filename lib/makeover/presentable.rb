# frozen_string_literal: true
module Makeover
  # Controller and model mixin for presenting objects.
  module Presentable
    extend ActiveSupport::Concern

    included do
      class_attribute :presenter_class
      class_attribute :collection_presenter_class
      class_attribute :presentable_class_name

      alias_method :decorate, :present
      helper_method :present if respond_to? :helper_method

      # @return [Class] Object used to present records.
      def presenter_class
        self.class.presenter_class || default_presenter_class
      end

      # @return [Class] Object used to present collections.
      def collection_presenter_class
        self.class.collection_presenter_class || default_collection_presenter_class
      end

      # Find the class name we use to derive presenter constants.
      #
      # @return [String] Class name for presenter lookup.
      def presentable_class_name
        self.class.presentable_class_name || controller_class_name || self.class.name
      end
    end

    class_methods do
      # Configure the class used to present records by default
      # within this object.
      #
      # @param [Class] custom_presenter_class
      def presented_by(custom_presenter_class)
        self.presenter_class = custom_presenter_class
      end

      # Configure the class used to present collections by default
      # within this object.
      #
      # @param [Class] custom_presenter_class
      def collection_presented_by(custom_presenter_class)
        self.collection_presenter_class = custom_presenter_class
      end
    end

    # Presents the given model or the current object with the current
    # object's configured presenter or the given class in +with:+.
    #
    # @param [Object]     model - Model class to present. (optional)
    # @option [Class]     :with - Presenter object that wraps the model.
    # @option [Hash]  **context - Additional context for the presenter in
    #                     key/value pairs.
    def present(model = nil, with: nil, **context)
      model ||= self
      with ||= model.try(:presenter_class) || presenter_class

      if model.respond_to?(:each) && with != collection_presenter_class
        return present model, with: collection_presenter_class, **context
      else
        with.new model, **context
      end
    end

    private

    # @private
    # @return [Class] Default singular presenter class name.
    def default_presenter_class
      "#{presentable_class_name}Presenter".constantize
    end

    # @private
    # @return [Class] Default collection presenter class name.
    def default_collection_presenter_class
      "#{presentable_class_name.pluralize}Presenter".constantize
    end

    # Return the classified +controller_name+ if this object responds to
    # a method like that (e.g., we're in a controller)
    #
    # @return [String] or +nil+ if not in a controller.
    def controller_class_name
      controller_name.classify if respond_to? :controller_name
    end
  end
end
