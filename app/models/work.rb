class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :title, :description, :publication_year, :creator, :category, presence: true
  validates :publication_year, numericality: { only_integer: true, greater_than: 0 }


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

  def self.top_ten(category)
    self.filter_category(category).order(id: :desc).first(10)
  end
end
