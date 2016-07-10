# frozen_string_literal: true
require 'spec_helper'

module Presenters
  RSpec.describe Presentable do
    subject { TestModel.new }

    it 'can be presented' do
      expect(subject.present).to be_a(TestModelPresenter)
    end
  end
end
