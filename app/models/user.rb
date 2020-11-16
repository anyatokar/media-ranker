class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  validates :name, presence: { message: "• name: can't be blank" }
  # , uniqueness: { message: "• must be unique" }

  def self.vote_count(user)
    unless user.nil?
      return user.votes.count
    end
  end

  def self.date_joined(user)
    unless user.nil?
      return(user.created_at.strftime("%b %d, %Y"))
    end
  end
end
