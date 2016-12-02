require 'test_helper'

class VolunteersGroupsControllerTest < ActionController::TestCase
  setup do
    @volunteers_group = volunteers_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteers_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volunteers_group" do
    assert_difference('VolunteersGroup.count') do
      post :create, volunteers_group: { description: @volunteers_group.description, name: @volunteers_group.name }
    end

    assert_redirected_to volunteers_group_path(assigns(:volunteers_group))
  end

  test "should show volunteers_group" do
    get :show, id: @volunteers_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volunteers_group
    assert_response :success
  end

  test "should update volunteers_group" do
    patch :update, id: @volunteers_group, volunteers_group: { description: @volunteers_group.description, name: @volunteers_group.name }
    assert_redirected_to volunteers_group_path(assigns(:volunteers_group))
  end

  test "should destroy volunteers_group" do
    assert_difference('VolunteersGroup.count', -1) do
      delete :destroy, id: @volunteers_group
    end

    assert_redirected_to volunteers_groups_path
  end
end
