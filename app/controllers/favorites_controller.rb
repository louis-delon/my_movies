class FavoritesController < ApplicationController

  before_action :set_movie, only: [:show, :create, :destroy]
  before_action :set_user, only: [:show, :create, :destroy]
  before_action :set_favorite, only: [:show, :destroy]


  def index
    @user = User.find(params[:user_id])
    @favorites = Favorite.where(user_id: current_user.id )
    @movies = @favorites.map { |favorite| Movie.where(id: favorite.movie_id).first}
  end

  def show
    @photo = @movie.photo
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
    @favorite.destroy
    respond_to do |format|
        format.html { redirect_back(fallback_location: root_path) }
        format.js
    end
  end

  private

  # each favorite is saved in db when created
  def instantiate_favorite
    @favorite = Favorite.new
    @favorite.user = @user
    @favorite.movie = @movie
  end

  def set_user
    @user = current_user
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_favorite
    @favorite = Favorite.where(user_id: current_user.id, movie_id: @movie.id).first
  end

end
