require 'test_helper'

class LoggedInUserCanViewTweetsTest < ActionDispatch::IntegrationTest
  test "in dashboard" do
    # As a registered twitter user,
    login_user
    # when I login,
    save_and_open_page
    assert_equal dashboard_path, current_path
    # and I visit "/dashboard",
    assert page.has_content?("Twitter Feed")
    # I should see a list of my recent tweets from my twitter feed.
    assert page.has_content?("my tweet")
  end
end