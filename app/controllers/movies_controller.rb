class MoviesController < ApplicationController

  def index

  end

  def show
    @movie = Movie.find(params[:id])
  end

  def create
  end

  def destroy
  end

  def edit
  end

  def update
  end

end

