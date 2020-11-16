# 17. Work model has tests with sections on validations (valid and invalid) and relationships (has votes)

# 18. Work model has tests with a section on all business logic methods in
# the model, including their edge cases

require "test_helper"

describe Work do
  describe "validations" do
    it "instance of Work with valid fields passes" do
      work = works(:the_dude)
      expect(work.valid?).must_equal true
    end

    it "must have a title" do
      work = works(:the_dude)
      work.title = nil
      expect(work.valid?).must_equal false
      expect(work.errors.messages).must_include :title
    end

    it "title must be unique" do
      work1 = works(:the_dude)
      work2 = works(:moonrise)
      work1.title = work2.title

      expect(work1.valid?).must_equal false
      expect(work1.errors.messages).must_include :title
    end

    it "doesn't need a description" do
      work = works(:the_dude)
      work.description = nil
      expect(work.valid?).must_equal true
    end

    it "doesn't need a publication_year" do
      work = works(:the_dude)
      work.publication_year = nil
      expect(work.valid?).must_equal true
    end

    it "publication year doesn't need to be numeric" do
      work = works(:the_dude)
      work.publication_year = "Y1892"
      expect(work.valid?).must_equal true
    end

    it "publication year doesn't need to be positive" do
      work = works(:the_dude)
      work.publication_year = -1
      expect(work.valid?).must_equal true
    end

    it "doesn't need a creator" do
      work = works(:the_dude)
      work.creator = nil
      expect(work.valid?).must_equal true
    end

    it "doesn't need a category" do
      work = works(:the_dude)
      work.category = nil
      expect(work.valid?).must_equal true
    end
  end

  describe "relations" do
    it "Work can have many Votes" do
      work = works(:work3)
      expect(work.votes.count).must_equal 3
    end

    it "Work can have 0 Votes" do
      work = works(:work6)
      expect(work.votes.count).must_equal 0
    end

    it "Work can have many Users through Votes" do
      work = works(:work3)
      expect(work.users.count).must_equal 3
    end

    it "Work can have 0 Works through Votes" do
      work = works(:work11)
      expect(work.users.count).must_equal 0
    end
  end

  describe "filter methods do" do
    it "filters by category" do
      expect(Work.filter_category("movie").length).must_equal 3
      expect(Work.filter_category("book").length).must_equal 8
      expect(Work.filter_category("album").length).must_equal 0
    end

  end

  describe "spotlight" do
    it "can select work" do
      # Work.reload
      # works.reload
      # work = works(:work3)
      # p work.votes.count
      # p Work.spotlight.votes.count
      expect(Work.spotlight.title).must_equal "work3 title"

    end

    it "if there is a tie" do


    end

    it "if there are 0 works" do

    end
  end

  describe "top_ten" do
    it "if there are 10 works or more" do
      expect(Work.top_ten(works).length).must_equal 10
    end

    it "if there are between 0 and 10 works" do


      movies = works.select { |work| work.category == "movie" }
      books = works.select { |work| work.category == "book" }

      expect(Work.top_ten(movies).length).must_equal 3
      expect(Work.top_ten(books).length).must_equal 8
    end

    it "if there are 0 works" do
      albums = works.select { |work| work.category == "album" }
      expect(Work.top_ten(albums).length).must_equal 0
    end
  end
end
