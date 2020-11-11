class Work < ApplicationRecord

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



end
