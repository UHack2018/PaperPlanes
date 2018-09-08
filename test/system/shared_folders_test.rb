require "application_system_test_case"

class SharedFoldersTest < ApplicationSystemTestCase
  setup do
    @shared_folder = shared_folders(:one)
  end

  test "visiting the index" do
    visit shared_folders_url
    assert_selector "h1", text: "Shared Folders"
  end

  test "creating a Shared folder" do
    visit shared_folders_url
    click_on "New Shared Folder"

    fill_in "Holding", with: @shared_folder.holding_id
    fill_in "Message", with: @shared_folder.message
    fill_in "Shared Email", with: @shared_folder.shared_email
    fill_in "Shared User", with: @shared_folder.shared_user_id
    fill_in "User", with: @shared_folder.user_id
    click_on "Create Shared folder"

    assert_text "Shared folder was successfully created"
    click_on "Back"
  end

  test "updating a Shared folder" do
    visit shared_folders_url
    click_on "Edit", match: :first

    fill_in "Holding", with: @shared_folder.holding_id
    fill_in "Message", with: @shared_folder.message
    fill_in "Shared Email", with: @shared_folder.shared_email
    fill_in "Shared User", with: @shared_folder.shared_user_id
    fill_in "User", with: @shared_folder.user_id
    click_on "Update Shared folder"

    assert_text "Shared folder was successfully updated"
    click_on "Back"
  end

  test "destroying a Shared folder" do
    visit shared_folders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shared folder was successfully destroyed"
  end
end
