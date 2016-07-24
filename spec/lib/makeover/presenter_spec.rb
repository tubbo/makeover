# frozen_string_literal: true
require 'spec_helper'

module Makeover
  RSpec.describe Presenter do
    let :model do
      TestModel.new name: 'test', description: 'booyah'
    end

    let :optional_value do
      double custom_delegated_method: 'custom'
    end

    subject :presenter do
      TestModelPresenter.new model, optional: optional_value
    end

    it 'wraps model' do
      expect(presenter.model).to eq model
    end

    it 'delegates methods' do
      expect(presenter.name).to eq model.name
    end

    it 'overrides methods' do
      expect(presenter.description).to eq model.description.upcase
    end

    it 'adds new methods' do
      expect(presenter.title).to eq model.name.titleize
    end

    it 'takes in optional context' do
      expect(presenter.optional).to eq optional_value
    end

    it 'delegates model name to derived model class' do
      expect(TestModelPresenter.send :derived_model_class_name).to eq('TestModel')
      expect(TestModelPresenter.model_class).to eq(TestModel)
      expect(TestModelPresenter.model_name).to eq(TestModel.model_name)
    end

    it 'warns about usage of deprecated methods' do
      expect(TestModelPresenter.delegate_all).to be nil
    end

    it 'delegates translation methods' do
      expect(presenter).to respond_to(:t)
      expect(presenter).to respond_to(:translate)
    end

    it 'delegates methods to model' do
      expect(presenter.explicit_delegated_method).to eq(model.explicit_delegated_method)
    end

    it 'delegates custom methods' do
      expect(presenter.custom_delegated_method).to eq(optional_value.custom_delegated_method)
      allow(presenter).to receive(:optional).and_return nil
      expect(presenter.custom_delegated_method).to be nil
    end
  end
end
