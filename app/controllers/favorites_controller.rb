class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id )
    @movies = @favorites.map { |favorite| Movie.where(id: favorite.movie_id)}
  end

  def create
  end
end
