require 'spec_helper'

module Presenters
  RSpec.describe Helpers do
    subject { described_class.new }

    it 'delegates to rails app routes' do
      expect(subject).to respond_to(:root_path)
    end

    it 'includes helper methods' do
      expect(subject).to respond_to(:link_to)
    end
  end
end
