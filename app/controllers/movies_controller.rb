class MoviesController < ApplicationController

  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @movie = Movie.new
    @languages = %w(French English Indian German Italian)
  end

  def create
    @movie = Movie.new(params_movie)
    @movie.user = current_user
    if @movie.save!
      redirect_to movies_path(@movie)
    else
      render :new
    end
  end

  def show
    @photo = @movie.photo
  end

  def destroy
    @movie.destroy
    redirect_to user_movies_path(current_user, @movie)
  end

  def edit
  end

  def update
    @movie.update(params_movie)
    redirect_to user_movie_path(current_user, @movie)
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def params_movie
    params.require(:movie).permit(
      :title,
      :resume,
      :photo,
      :language,
      :release_date
      )
  end
end

