class VotesController < ApplicationController
  def index
  end

  def show
  end

  def upvote
    work = Work.find_by(id: params[:work_id])
    user = User.find_by(id: session[:user_id])
    if user.nil?
      flash["alert alert-warning"] = "A problem occurred: Please login to vote"
      redirect_back(fallback_location: works_path)
    else
      @vote = Vote.new(work_id: work.id, user_id: user.id)
      if @vote.save
        flash["alert alert-success"] = "Successfully upvoted!"
        redirect_back(fallback_location: works_path)
      else
        flash["alert alert-warning"] = "A problem occured: Could not upvote."
        flash["alert alert-warning2"] = "• #{@vote.errors.first[1]}"
        # @vote.errors.each do |column, message|
        #   flash["alert alert-warning2"] = "• #{message}"
        # end

        # flash["alert alert-warning2"] = @vote.errors.full_messages.to_sentence


        # @vote.errors.each do |column, message|
        #   puts message
        # end
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
