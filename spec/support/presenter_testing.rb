# frozen_string_literal: true
class TestModel
  include ActiveModel::Model
  include Presenters::Presentable

  attr_accessor :name, :description
end

class TestModelsPresenter < Presenters::CollectionPresenter
end

class TestModelPresenter < Presenters::Presenter
  attr_reader :optional

  def title
    name.titleize
  end

  def description
    model.description.upcase
  end
end
