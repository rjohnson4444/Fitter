require 'test_helper'

class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest

  test "logged in" do
    VCR.use_cassette("login_user#user") do
      login_user

      assert_equal 200, page.status_code
      assert_equal "/dashboard", current_path
      assert page.has_content?("Ryan")
      assert page.has_link?("Logout")
    end
  end
end
