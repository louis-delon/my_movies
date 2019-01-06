class MoviesController < ApplicationController

  def index

  end

  def new
    @movie = Movie.new
    @languages = %w(French English Indian German Italian)
  end

  def show
    @movie = Movie.find(params[:id])
    @photo = @movie.photo
  end

  def create
    @movie = Movie.new(params_movie)
    @movie.user = current_user
    if @movie.save!
      redirect_to movie_path(@movie)
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

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

