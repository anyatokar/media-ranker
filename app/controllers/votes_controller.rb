class VotesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @vote = Vote.new
  end

  def create
    @work = Vote.new(work_params)
    if @work.save
      redirect_to work_path(@work)
      return
    else
    render :new
    return
    end
  end

  def edit
  end
end
