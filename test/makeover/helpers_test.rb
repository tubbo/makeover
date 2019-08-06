require 'test_helper'

module Makeover
  class HelpersTest < ActiveSupport::TestCase
    setup do
      @helpers = Helpers.new
    end

    test 'delegates to rails app routes' do
      assert_equal '/posts', @helpers.posts_path
    end

    test 'includes helper methods' do
      link = %(<a href="http://example.com">test</a>).html_safe

      assert_equal link, @helpers.link_to('test', 'http://example.com')
    end
  end
end
