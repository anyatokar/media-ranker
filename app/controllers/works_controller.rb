class WorksController < ApplicationController
  def index
    @albums = Work.albums
    @books = Work.books
    @movies = Work.movies
  end

  def show
  end

  def new
  end

  def edit
  end
end
