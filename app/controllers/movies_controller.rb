class MoviesController < ApplicationController

  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [ :create, :edit, :update, :destroy]

  def index
  end

  def new
    @movie = Movie.new
    @user = User.find(params[:user_id])
    @languages = %w(French English Indian German Italian)
  end

  def create
    @movie = Movie.new(params_movie)
    @movie.user = @user
    if @movie.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @photo = @movie.photo
    @favorite = Favorite.where(movie_id: @movie.id, user_id: current_user.id ).first
  end

  def destroy
    @movie.destroy
    redirect_to root_path, notice: "Votre film a été supprimé"
  end

  def edit
    @languages = %w(French English Indian German Italian)
  end

  def update
    @movie.update(params_movie)
    redirect_to user_movie_path(@user, @movie), notice: "Votre film a été mis à jour"
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
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

