# frozen_string_literal: true
module Presenters
  # Controller and model mixin for presenting objects.
  module Presentable
    extend ActiveSupport::Concern

    included do
      class_attribute :presenter_class
      alias_method :decorate, :present
    end

    # Presents the given model or the current object with the current
    # object's configured presenter or the given class in +with:+.
    #
    # @param [Object] model (optional) - Model class to present.
    # @option [Class] :with - Presenter object that wraps the model.
    # @param [Array<Hash>] **context - Additional context for the presenter.
    def present(model = nil, with: nil, **context)
      model ||= self
      current_presenter = with || presenter
      current_presenter.new model, **context
    end

    private

    # @private
    # @return [Class] Presenter class for +#present+. Can be customized
    #                 on the class level by setting
    #                 +self.presenter_class+.
    def presenter
      self.class.presenter_class || "#{self.class.name}Presenter".constantize
    end
  end
end
