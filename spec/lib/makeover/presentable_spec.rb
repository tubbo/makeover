# frozen_string_literal: true
require 'spec_helper'

module Makeover
  RSpec.describe Presentable do
    subject { TestModel.new }

    it 'presents host object' do
      expect(subject.present).to be_a(TestModelPresenter)
    end

    it 'presents any object' do
      expect(subject.present(AnotherTestModel.new)).to \
        be_a(AnotherTestModelPresenter)
    end
  end
end
