class UsersController < ApplicationController
  def index
  end

  def show
  end

#   def new
#     User.check_user(user_input)
#   end
#
#   def create
#     @work = Work.new(work_params) #instantiate a new work
#     if @work.save # save returns true if the database insert succeeds
#       redirect_to work_path(@work) # goes to work page
#       return
#     else # save failed
#     render :new # show the new book form view again
#     return
#     end
#
#   end
#
#   def edit
#   end
# end
#
# def work_params
#   return params.require(:work).permit(:title, :description, :publication_year, :creator, :category)
end