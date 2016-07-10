module Presenters
  class TestModel
    include ActiveModel::Model
    include Presentable

    attr_accessor :name, :description
  end

  class TestPresenter < Presenter
    attr_reader :optional

    def title
      name.titleize
    end

    def description
      model.description.upcase
    end
  end
end
