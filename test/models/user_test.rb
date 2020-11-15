require "test_helper"

describe User do
  describe "validations" do
    it "valid with valid name" do
      user = users(:user1)
      expect(user.valid?).must_equal true
    end

    it "must have a name" do
      user = users(:user1)
      user.name = nil
      expect(user.valid?).must_equal false
      expect(user.errors.messages).must_include :name
    end

    it "must have a name" do
      user = users(:user1)
      user.name = nil
      expect(user.valid?).must_equal false
      expect(user.errors.messages).must_include :name
    end

    it "name must be unique" do
      user1 = users(:user1)
      user2 = users(:user2)

      user1.name = user2.name
      expect(user1.valid?).must_equal false
      expect(user1.errors.messages).must_include :name
    end
  end

  describe "Relations User has many Votes" do
    it "User can have many Votes" do
      user = users(:user1)
      expect(user.votes.count).must_equal 3
    end

    it "User can have 0 Votes" do
      user = users(:user6)
      expect(user.votes.count).must_equal 0
    end
  end

  describe "Relations User is indirectly related to Work through Votes" do
    it "user can have many Works through Votes" do
      user = users(:user1)
      expect(user.works.count).must_equal 3
    end
  end

  describe "custom methods" do
    it "returns vote_count for a user" do
      user = users(:user1)
      expect(User.vote_count(user)).must_equal 3
    end

    it "returns date_joined for a user" do
      user = users(:user1)
      expect(User.date_joined(user)).must_equal "Nov 15, 2020"
    end
  end
end
