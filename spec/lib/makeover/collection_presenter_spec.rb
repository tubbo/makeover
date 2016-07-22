# frozen_string_literal: true
require 'spec_helper'

module Makeover
  RSpec.describe CollectionPresenter do
    let :models do
      [
        TestModel.new(name: 'test1', description: 'booyah'),
        TestModel.new(name: 'test2', description: 'booyah'),
        TestModel.new(name: 'test3', description: 'booyah')
      ]
    end

    subject :presenter do
      TestModelsPresenter.new models
    end

    it 'presents a collection of models' do
      expect(subject).to respond_to(:each)
    end

    it 'decorates collection of models' do
      expect(subject.first).to be_a(Makeover::Presenter)
    end
  end
end
