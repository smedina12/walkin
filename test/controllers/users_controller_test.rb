require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  setup do
    @user = users(:one)
     @user = users(:Sam)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
   test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end
   test "should redirect update when not logged in" do
    patch :update, id: @user, user: { name: @user.name, phone: @user.phone }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch :update, id: @user, user: { email: @user.email, lastName: @user.lastName, name: @user.name, phone: @user.phone }
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, lastName: @user.lastName, name: @user.name, phone: @user.phone }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, lastName: @user.lastName, name: @user.name, phone: @user.phone }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
  
  # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
