require 'test_helper'

module Makeover
  class PresenterTest < ActiveSupport::TestCase
    setup do
      @model = TestModel.new name: 'test', description: 'booyah'
      @optional = mock
      @optional.stubs(:custom_delegated_method).returns(true)
      @presenter = TestModelPresenter.new @model, optional: @optional
    end

    test 'wraps model' do
      assert_equal @model, @presenter.model
    end

    test 'delegates methods' do
      assert_equal @model.name, @presenter.name
    end

    test 'overrides methods' do
      assert_equal @model.description.upcase, @presenter.description
    end

    test 'adds new methods' do
      assert_equal @model.name.titleize, @presenter.title
    end

    test 'takes in optional context' do
      assert_equal @optional, @presenter.optional
    end

    test 'delegates model name to derived model class' do
      assert_equal TestModel, TestModelPresenter.model_class
      assert_equal TestModel.model_name, TestModelPresenter.model_name
    end

    test 'warns about usage of deprecated methods' do
      capture_io do
        assert_nil TestModelPresenter.delegate_all
      end
    end

    test 'delegates translation methods' do
      assert_respond_to @presenter, :t
      assert_respond_to @presenter, :translate
    end

    test 'delegates methods to model' do
      assert_equal @model.explicit_delegated_method,
                   @presenter.explicit_delegated_method
    end

    test 'delegates custom methods' do
      assert_equal @optional.custom_delegated_method,
                   @presenter.custom_delegated_method
    end
  end
end
