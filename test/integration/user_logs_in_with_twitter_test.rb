require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test "logged in" do
    visit "/"
    assert_equal 200, page.status_code
    click_link "Login"
    assert_equal "/dashboard", current_path
    assert page.has_content?("Horace")
    assert page.has_link?("Logout")
  end
end
