class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: { message: "• title: can't be blank" }
  validates :title, uniqueness: { message: "• title: has already been taken" }


  # validates :user, uniqueness: { scope: :work, message: "You can only vote for this work once"
  # validates :title, presence: true, uniqueness: { scope: :category }
  # validates :category, inclusion: { in: %w(book movie album) }

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
    self.filter_category(category).order(votes_count: :desc).first(10)

  end

  def self.spotlight
    unless self.nil?
      self.order(votes_count: :desc).first
    end
  end

  def self.vote_date(vote)
    unless self.nil?
      return(vote.created_at.strftime("%b %d, %Y"))
    end
  end
end
