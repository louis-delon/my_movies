# require 'net/http'
# require 'json'

def parsing(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

Movie.destroy_all
User.destroy_all

puts "create user"

user = User.create!(
  email: "louis@gmail.com",
  password: "aaaaaa"
  )

puts "make api call"

api_key = ENV['SECRET_KEY_THE_MOVIE_DB']
movies_url = "https://api.themoviedb.org/4/list/1?page=2&api_key=#{api_key}&sort_by=original_order.asc"
movies_list = parsing(movies_url)

puts "create Movies form api call"

movies_list["results"].each do |movie|
  Movie.create!(
    title: movie["title"],
    resume: movie["overview"],
    photo: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    language: movie["original_language"],
    type: movie["media_type"],
    popularity: movie["media_popularity"]
    user_id: user.id
    )
end


