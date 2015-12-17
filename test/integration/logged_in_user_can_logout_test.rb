require 'test_helper'

class LoggedInUserCanLogoutTest < ActionDispatch::IntegrationTest
  test "logout" do
    VCR.use_cassette("logout_user#user") do
      login_user

      click_link "Logout"

      assert_equal 200, page.status_code
      assert_equal root_path, current_path
    end
  end
end
