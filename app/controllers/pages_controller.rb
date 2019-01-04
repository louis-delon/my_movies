class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @avatar = current_user.avatar if user_signed_in?
    @movies = Movie.all
  end

  private

  def parsing(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def instantiate_movies
    build_api_url
    movies_list = parsing(movies_url)
    movies_list["results"].each do |movie|
      Movie.create!(
        title: movie["title"],
        resume: movie["overview"],
        photo: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
        user_id: 18
        )
    end
  end

  def build_api_url
    api_key = ENV['SECRET_KEY_THE_MOVIE_DB']
    movies_url = "https://api.themoviedb.org/4/list/1?page=2&api_key=#{api_key}&sort_by=original_order.asc"
  end

end
