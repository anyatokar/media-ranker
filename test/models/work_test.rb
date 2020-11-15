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
    it "has a title" do




    end
  end


  describe "spotlight" do
    it "if there are 10 works or more" do
      expect(works.top_ten.count).must_equal 11



    end

    it "if there is a tie" do

    end

    it "if there are 0 works" do

    end
  end

  describe "top_ten" do
    it "if there are 10 works or more" do

    end

    it "if there are between 0 and 10  works" do

    end

    it "if there are 0 works" do

    end
  end
end
