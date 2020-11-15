require "test_helper"

describe User do
  describe "testing session" do
    it "returns 200 OK for a logged-in user" do
      # Arrange
      perform_login

      # Act
      get current_user_path

      # Assert
      must_respond_with :success
    end
  end

  describe "validations" do
    it "must have a name" do
      user = users(:user1)
      user.name = nil
      expect(user.valid?).must_equal false
      expect(user.errors.messages).must_include :name
    end

    it "title must be unique" do
      user1 = users(:user1)
      user2 = users(:user1)

      user1.name = user2.name
      expect(user1.valid?).must_equal false
      expect(user1.errors.messages).must_include :name
    end
  end

  describe "relations" do
    it "User has many Votes" do
      user = users(:user1)

      p user.votes.count

    end

    it "User is indirectly related to Work through Votes" do

    end

  end

  describe "custom methods" do
    it "returns votes count for a user" do


    end
  end
end
