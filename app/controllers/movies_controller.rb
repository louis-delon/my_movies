class MoviesController < ApplicationController

  before_action :set_movie, only: [
    :show,
    :edit,
    :update,
    :destroy,
    :new_movies_show,
    :own_movies_show

  ]

  before_action :set_user, only: [
    :show,
    :create,
    :edit,
    :update,
    :destroy,
    :own_movies,
    :new_movies_show,
    :own_movies_show
  ]

  before_action :set_favorite, only: [ :new_movies_show, :own_movies_show, :show ]

  def index
    if params[:q]
      @movies = Movie.search_by_title_and_resume(params[:q])
        .page(params[:page])
        .per(10)
    else
      @movies = Movie.all.page(params[:page]).per(10)
    end
  end

  # movies sorted by creation date DESC
  def new_movies
    @movies = Movie.most_recent.page(params[:page]).per(10)
  end

  def new_movies_show
  end

  # movies added to the db by the user itself
  def own_movies
    @movies = Movie.own_movies(@user).page(params[:page]).per(10)
  end

  def own_movies_show
  end

  def new
    @movie = Movie.new
    @user = User.find(params[:user_id])
    @languages = %w(French English Indian German Italian)
  end

  def create
    @movie = Movie.new(params_movie)
    @movie.user = @user
    if @movie.save
      redirect_to own_movies_path(@user), notice: "Félicitation, votre film a été créé!"
    else
      render :new
    end
  end

  def show
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
    redirect_to movie_path(@movie), notice: "Votre film a été mis à jour"
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def set_favorite
    @photo = @movie.photo
    @favorite = Favorite.where(movie_id: @movie.id, user_id: current_user.id ).first
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

