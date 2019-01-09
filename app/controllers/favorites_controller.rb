class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id )
    @movies = @favorites.map { |favorite| Movie.where(id: favorite.movie_id)}
  end

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @movie = Movie.find(params[:movie_id])
    @favorite.movie = @movie
    if @favorite.save!
      redirect_back(fallback_location: root_path)
    end
  end
end


# si j'ai déjà ajouté
