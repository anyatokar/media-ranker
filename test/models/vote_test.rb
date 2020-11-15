require "test_helper"

describe Vote do
  describe "validations" do
    # this doesnt check for unique though
    it "valid with user and work" do
      vote = votes(:vote3)
      expect(vote.valid?).must_equal true
    end

    it "invalid without user" do
      vote = votes(:vote1)
      vote.user_id = nil
      expect(vote.valid?).must_equal false
      expect(vote.errors.messages).must_include :user
    end

    it "invalid without work" do
      vote = votes(:vote1)
      vote.work_id = nil
      expect(vote.valid?).must_equal false
      expect(vote.errors.messages).must_include :work
    end
  end


  describe "relations" do
    it "a vote must have one user" do
      vote = votes(:vote3)
      expect(vote.user.name).must_equal "Rosalba Okuneva"
    end

    it "a vote must have one work" do
      vote = votes(:vote3)
      expect(vote.work.title).must_equal "work3 title"
    end

  end
end

#can only vote for one