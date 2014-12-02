require 'test_helper'

class MediaListsControllerTest < ActionController::TestCase
  setup do
    @media_list = media_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create media_list" do
    assert_difference('MediaList.count') do
      post :create, media_list: { journalist_ids: @media_list.journalist_ids, name: @media_list.name, user_id: @media_list.user_id }
    end

    assert_redirected_to media_list_path(assigns(:media_list))
  end

  test "should show media_list" do
    get :show, id: @media_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @media_list
    assert_response :success
  end

  test "should update media_list" do
    put :update, id: @media_list, media_list: { journalist_ids: @media_list.journalist_ids, name: @media_list.name, user_id: @media_list.user_id }
    assert_redirected_to media_list_path(assigns(:media_list))
  end

  test "should destroy media_list" do
    assert_difference('MediaList.count', -1) do
      delete :destroy, id: @media_list
    end

    assert_redirected_to media_lists_path
  end
end
