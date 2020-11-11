class WorksController < ApplicationController
  def homepage
  end


  def index
    # @works = Work.all
    @albums = Work.albums
    @books = Work.books
    @movies = Work.movies
  end

  def show
    id = params[:id]
    @work = Work.find_by(id: id)
  end

  def new
  end

  def edit
  end

  private

  # def work_params
  #   return params.require(:work).permit(:title, :description, :publication_year, :creator, :category)
  # end


end
