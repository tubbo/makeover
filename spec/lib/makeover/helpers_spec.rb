# frozen_string_literal: true
require 'spec_helper'

module Makeover
  RSpec.describe Helpers do
    subject { described_class.new }

    it 'delegates to rails app routes' do
      expect(subject.posts_path).to eq '/posts'
    end

    it 'includes helper methods' do
      expect(subject.link_to('test', 'http://example.com')).to eq(
        %(<a href="http://example.com">test</a>).html_safe
      )
    end
  end
end
