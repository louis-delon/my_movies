class FavoritesController < ApplicationController

  before_action :set_movie, only: [:create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id )
    @movies = @favorites.map { |favorite| Movie.where(id: favorite.movie_id)}
  end

  def create
    instantiate_favorite
    if @favorite.save!
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @favorite = Favorite.where(user_id: current_user.id, movie_id: @movie.id).first
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def instantiate_favorite
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.movie = @movie
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end
