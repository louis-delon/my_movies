class FavoritesController < ApplicationController

  before_action :set_movie, only: [:create, :destroy]

  def index
    @favorites = Favorite.where(user_id: current_user.id )
    @movies = @favorites.map { |favorite| Movie.where(id: favorite.movie_id).first}
  end

  def create
    instantiate_favorite
    if @favorite.save!
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'movies/show' }
        format.js
      end
    end
  end

  def destroy
    @favorite = Favorite.where(user_id: current_user.id, movie_id: @movie.id).first
    # binding.pry
    @favorite.destroy
    respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
    end
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
