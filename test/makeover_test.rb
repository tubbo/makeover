require 'test_helper'

class MakeoverTest < ActiveSupport::TestCase
  test 'next major version' do
    assert_equal '2.0', Makeover.next_major_version
  end
end
