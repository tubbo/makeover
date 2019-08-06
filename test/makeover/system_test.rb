require 'test_helper'
require 'webdrivers'
require 'capybara'

Capybara.server = :puma, { Silent: true }

module Makeover
  class SystemTest < ActionDispatch::SystemTestCase
    driven_by :selenium, \
              using: :headless_chrome,
              screen_size: [1400, 1400]

    fixtures :posts

    setup do
      @post = posts :latest
    end

    test 'decorate and delegate methods' do
      visit posts_path(@post)

      assert_text @post.present.title
      assert_text @post.body
    end

    test 'decorated from the model level' do
      visit posts_path

      assert_text @post.present.title
    end
  end
end
