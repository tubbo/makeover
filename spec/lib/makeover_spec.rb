# frozen_string_literal: true
require 'spec_helper'
require 'makeover'

RSpec.describe Makeover do
  it 'is a view model library for rails applications' do
    expect(described_class).to be_const_defined(:Helpers)
    expect(described_class).to be_const_defined(:Presenter)
    expect(described_class).to be_const_defined(:CollectionPresenter)
    expect(described_class).to be_const_defined(:Presentable)
  end
end
