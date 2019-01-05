# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def parsing(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

Movie.destroy_all

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
    user_id: 1
    )
end


