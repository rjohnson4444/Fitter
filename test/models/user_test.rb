require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many(:tweets)
  
  test "the truth" do
    assert true
  end
end
