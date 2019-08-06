require 'test_helper'

module Makeover
  class PresentableTest < ActiveSupport::TestCase
    setup do
      @model = TestModel.new
    end

    test 'presents host object' do
      assert_kind_of TestModelPresenter, @model.present
    end

    test 'presents any object' do
      presenter = @model.present AnotherTestModel.new

      assert_kind_of AnotherTestModelPresenter, presenter
    end
  end
end
