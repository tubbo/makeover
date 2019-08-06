require 'test_helper'

module Makeover
  class CollectionPresenterTest < ActiveSupport::TestCase
    setup do
      @models = [
        TestModel.new(name: 'test1', description: 'booyah'),
        TestModel.new(name: 'test2', description: 'booyah'),
        TestModel.new(name: 'test3', description: 'booyah')
      ]
      @presenter = TestModelsPresenter.new @models
    end

    test 'presents a collection of models' do
      assert_respond_to @presenter, :each
    end

    test 'decorates collection of models' do
      assert_kind_of Makeover::Presenter, @presenter.first
    end
  end
end
