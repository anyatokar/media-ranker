require "test_helper"

describe Work do
  describe "validations" do

    it "works with valid data" do
      # @work = Work.create(title: "Test", description: "Test", publication_year: 1892, creator: "Test", category: "album")
      # @work.title = nil
      work = works(:the_dude)
      # result = work.valid?
      expect(work.valid?).must_equal true
    end

    it "must have a title" do
      @work = Work.create(title: nil, description: "Test", publication_year: 1892, creator: "Test", category: "album")
      @work.title = nil
      result = @work.valid?
      expect(result).must_equal false
    end

    it "must have a description" do
      @work = Work.create(title: "Test", description: nil, publication_year: 1892, creator: "Test", category: "album")
      @work.description = nil
      result = @work.valid?
      expect(result).must_equal false
    end

    it "must have a publication_year" do
      @work = Work.create(title: "Test", description: "Test", publication_year: nil, creator: "Test", category: "album")
      @work.publication_year = nil
      result = @work.valid?
      expect(result).must_equal false
    end

    it "publication year must be nuremic" do
      @work = Work.create(title: "Test", description: "Test", publication_year: "1892", creator: "Test", category: "album")
      @work.publication_year = nil
      result = @work.valid?
      expect(result).must_equal false
    end

    it "publication year must be positive" do
      @work = Work.create(title: "Test", description: "Test", publication_year: -1, creator: "Test", category: "album")
      @work.publication_year = nil
      result = @work.valid?
      expect(result).must_equal false
    end

    it "must have a creator" do
      @work = Work.create(title: "Test", description: "Test", publication_year: 1892, creator: nil, category: "album")
      @work.creator = nil
      result = @work.valid?
      expect(result).must_equal false
    end

    it "must have a category" do
      @work = Work.create(title: "Test", description: "Test", publication_year: 1892, creator: nil, category: nil)
      @work.category = nil
      result = @work.valid?
      expect(result).must_equal false
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
