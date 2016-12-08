require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @user = users(:owner)
    session[:current_moderator] = @user
  end

  test 'should not delete owner' do
    assert_no_difference('User.count', nil) do
      delete :destroy, id: @user
    end
    assert_redirected_to users_url
  end


end
