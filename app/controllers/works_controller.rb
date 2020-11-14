class WorksController < ApplicationController
  def homepage
    @works = Work.all
    @albums = Work.albums
    @books = Work.books
    @movies = Work.movies
  end

  def index

    @albums = Work.albums
    @books = Work.books
    @movies = Work.movies
  end

  def show
    id = params[:id]
    @work = Work.find_by(id: id)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params) #instantiate a new work
    if @work.save # save returns true if the database insert succeeds
      redirect_to work_path(@work) # goes to work page
      return
    else # save failed
      flash["alert alert-warning"] = "A problem occurred: Could not create work" # how would it know what category?
      render :new # show the new book form view again
      return
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
  end

  def update
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    elsif @work.update(work_params)
      redirect_to work_path(@work) # goes to work page
      return
    else # save failed
      render :edit # show the new book form view again
      return
    end
  end

  def destroy
    id = params[:id]
    @work = Work.find_by(id: id)
    if @work.nil?
      head :not_found
      return
    end
    @work.destroy
    redirect_to root_path
    return
  end

  private

  def work_params
    return params.require(:work).permit(:title, :description, :publication_year, :creator, :category)
  end
end
