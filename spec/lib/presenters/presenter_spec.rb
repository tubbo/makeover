require 'spec_helper'

module Presenters
  RSpec.describe Presenter do
    let :model do
      TestModel.new name: 'test', description: 'booyah'
    end

    let :optional_value do
      'an optional value'
    end

    subject :presenter do
      TestPresenter.new model, optional: optional_value
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
  end
end
