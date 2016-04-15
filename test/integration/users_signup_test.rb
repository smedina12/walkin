require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Example User",
                                            lastName: "Example last name",
                                            phone:"4646464647",
                                            email: "user@example.com",
                                             }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
