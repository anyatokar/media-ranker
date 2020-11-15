class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  validates :name, presence: { message: "• title: can't be blank" }

  # def self.check_user(user_input)
  #   user = User.where(name: user_input)
  #   if user # is truthy
  #     session[:user_id] = user.id
  #   else
  #     user = User.new(name: user_input)
  #     if user.save
  #       session[:user_id] = user.id
  #       # else redirect_to new_users_path
  #       #
  #     end
  #

  def self.vote_count(user)
    return user.votes.count
  end

  def self.date_joined(user)
      return(user.created_at.strftime("%b %d, %Y"))
  end
end
