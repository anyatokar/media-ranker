require "test_helper"

describe Work do
  describe "validations" do

    it "works with valid data" do
      work = works(:the_dude)
      expect(work.valid?).must_equal true
    end

    it "must have a title" do
      work = works(:the_dude)
      work.title = nil
      expect(work.valid?).must_equal false
    end

    it "must have a description" do
      work = works(:the_dude)
      work.description = nil
      expect(work.valid?).must_equal false
    end

    it "must have a publication_year" do
      work = works(:the_dude)
      work.publication_year = nil
      expect(work.valid?).must_equal false
    end

    it "publication year must be numeric" do
      work = works(:the_dude)
      work.publication_year = "Y1892"
      expect(work.valid?).must_equal false
    end

    it "publication year must be positive" do
      work = works(:the_dude)
      work.publication_year = -1
      expect(work.valid?).must_equal false
    end

    it "must have a creator" do
      work = works(:the_dude)
      work.creator = nil
      expect(work.valid?).must_equal false
    end

    it "must have a category" do
      work = works(:the_dude)
      work.category = nil
      expect(work.valid?).must_equal false
    end
  end

  # describe "relationships" do
  #   it "can have many votes" do
  #     expect(@work.votes.count).must_equal 2
  #     @work.votes.each do |vote|
  #       expect(vote).must_be_instance_of Vote
  #     end
  #   end
  # end

  describe "spotlight" do
    it "if there are 10 works or more" do


    end

    it "if there are beween 0 and 10  works" do

    end

    it "if there are 0 works" do

    end
  end

  describe "top_ten" do
    it "if there are 10 works or more" do
      # Work
      # expect()

    end

    it "if there are between 0 and 10  works" do

    end

    it "if there are 0 works" do

    end
  end
end
