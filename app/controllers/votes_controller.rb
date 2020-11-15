class VotesController < ApplicationController
  def index
  end

  def show
  end

  def upvote
    work = Work.find_by(id: params[:work_id])
    user = User.find_by(id: session[:user_id])
    if user.nil?
      flash["alert alert-warning"] = "A problem occurred: You must log in to do that"
      redirect_back(fallback_location: works_path)
    else
      @vote = Vote.new(work_id: work.id, user_id: user.id)

      if @vote.save
        success_message = "Successfully upvoted!"
        flash_success(success_message)
        redirect_back(fallback_location: works_path)
      else
        warning_message = "A problem occurred: Could not upvote"
        flash_warning(warning_message, @vote)
        redirect_back(fallback_location: works_path)
      end
    end
  end

  # def new
  #   @vote = Vote.new
  # end

  # def create
  #   @vote = Vote.new
  #
  #
  #
  #     Driver.find_by(available: "true")
  #   @trip = Trip.new(
  #     passenger_id: params[:passenger_id],
  #     driver_id: driver_to_assign.id,
  #     date: Date.today,
  #     cost: rand(1..5000), # set cost to random number
  #     rating: nil # set rating to nil
  #   )
  #   if @trip.save
  #     driver_to_assign.update(available: "false")
  #     redirect_to trip_path(@trip.id)
  #   else
  #     render :new #TODO: alert user somehow
  #     return
  #   end
  #
  # def create
  #   @vote = Vote.new
  #   # if @vote.save
  #   #   return
  #   # else
  #   # render :new
  #   # return
  #   end
  # end

  def edit
  end
end
