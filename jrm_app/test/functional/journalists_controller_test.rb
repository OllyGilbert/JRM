require 'test_helper'

class JournalistsControllerTest < ActionController::TestCase
  setup do
    @journalist = journalists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journalists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journalist" do
    assert_difference('Journalist.count') do
      post :create, journalist: { first_name: @journalist.first_name, last_name: @journalist.last_name, title: @journalist.title }
    end

    assert_redirected_to journalist_path(assigns(:journalist))
  end

  test "should show journalist" do
    get :show, id: @journalist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journalist
    assert_response :success
  end

  test "should update journalist" do
    put :update, id: @journalist, journalist: { first_name: @journalist.first_name, last_name: @journalist.last_name, title: @journalist.title }
    assert_redirected_to journalist_path(assigns(:journalist))
  end

  test "should destroy journalist" do
    assert_difference('Journalist.count', -1) do
      delete :destroy, id: @journalist
    end

    assert_redirected_to journalists_path
  end
end
