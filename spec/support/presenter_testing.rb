# frozen_string_literal: true
class TestModel
  include ActiveModel::Model
  include Makeover::Presentable

  attr_accessor :name, :description
end

class TestModelsPresenter < Makeover::CollectionPresenter
end

class TestModelPresenter < Makeover::Presenter
  attr_reader :optional

  def title
    name.titleize
  end

  def description
    model.description.upcase
  end
end
