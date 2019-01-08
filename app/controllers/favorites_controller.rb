class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: current_user.id )
    @movies = @favorites.map { |favorite| Movie.where(id: favorite.movie_id)}
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.movie = @movie
    if @favorite.save!
      puts "xxxxxxxxx JE SUIS DANS CREATE FAVORITE xxxxxxxxxxx"
      redirect_back(fallback_location: root_path)
    end
  end
end
