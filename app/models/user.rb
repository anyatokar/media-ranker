class User < ApplicationRecord
  has_many :votes
  has_many :works, through: :votes

  validates :name, presence: true

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
  def date
      return(self.created_at.strftime("%b %d, %Y"))
  end
end
