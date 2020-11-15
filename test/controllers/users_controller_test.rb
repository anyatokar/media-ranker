require "test_helper"

describe UsersController do
  it "must get index" do
    get users_index_url
    must_respond_with :success
  end

  it "must get show" do
    get users_show_url
    must_respond_with :success
  end

  it "must get new" do
    get users_new_url
    must_respond_with :success
  end

  it "must get edit" do
    get users_edit_url
    must_respond_with :success
  end

  # describe "testing session" do
  #   it "returns 200 OK for a logged-in user" do
  #     # Arrange
  #     perform_login
  #
  #     # Act
  #     get current_user_path
  #
  #     # Assert
  #     must_respond_with :success
  #   end
  # end
end
