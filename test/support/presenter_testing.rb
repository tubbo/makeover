# frozen_string_literal: true

class TestModel
  include ActiveModel::Model
  include Makeover::Presentable

  attr_accessor :name, :description

  def explicit_delegated_method
    'explicit'
  end
end

class AnotherTestModel
  include ActiveModel::Model
  include Makeover::Presentable

  attr_accessor :name, :description
end

class TestModelsPresenter < Makeover::CollectionPresenter
end

class TestModelPresenter < Makeover::Presenter
  attr_reader :optional
  delegate :explicit_delegated_method, to: :model
  delegate :custom_delegated_method, to: :optional, allow_nil: true

  def title
    name.titleize
  end

  def description
    model.description.upcase
  end
end

class AnotherTestModelPresenter < Makeover::Presenter
end
