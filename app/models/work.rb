class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  def self.filter_category(category)
    Work.where(category: category)
  end

  def self.movies
    Work.filter_category(:movie)
  end

  def self.albums
    Work.filter_category(:album)
  end

  def self.books
    Work.filter_category(:book)
  end

  def self.top_ten

    # id = params[:id]
    self.first(10)

    # filtered = Work.category
    # filtered.sort_by(:id)

  end



end
