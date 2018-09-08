require 'test_helper'

class SharedFoldersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shared_folder = shared_folders(:one)
  end

  test "should get index" do
    get shared_folders_url
    assert_response :success
  end

  test "should get new" do
    get new_shared_folder_url
    assert_response :success
  end

  test "should create shared_folder" do
    assert_difference('SharedFolder.count') do
      post shared_folders_url, params: { shared_folder: { holding_id: @shared_folder.holding_id, message: @shared_folder.message, shared_email: @shared_folder.shared_email, shared_user_id: @shared_folder.shared_user_id, user_id: @shared_folder.user_id } }
    end

    assert_redirected_to shared_folder_url(SharedFolder.last)
  end

  test "should show shared_folder" do
    get shared_folder_url(@shared_folder)
    assert_response :success
  end

  test "should get edit" do
    get edit_shared_folder_url(@shared_folder)
    assert_response :success
  end

  test "should update shared_folder" do
    patch shared_folder_url(@shared_folder), params: { shared_folder: { holding_id: @shared_folder.holding_id, message: @shared_folder.message, shared_email: @shared_folder.shared_email, shared_user_id: @shared_folder.shared_user_id, user_id: @shared_folder.user_id } }
    assert_redirected_to shared_folder_url(@shared_folder)
  end

  test "should destroy shared_folder" do
    assert_difference('SharedFolder.count', -1) do
      delete shared_folder_url(@shared_folder)
    end

    assert_redirected_to shared_folders_url
  end
end
