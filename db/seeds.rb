require 'open-uri'

def parsing(url)
  uri = URI(url)
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

puts "destroy all users and movies"

Movie.destroy_all
User.destroy_all

puts "create users"

user1 = User.create!(
  email: "louis@gmail.com",
  password: "aaaaaa"
  )

user2 = User.create!(
  email: "louis@holdies.com",
  password: "aaaaaa"
  )

puts "make api call"

api_key = ENV['SECRET_KEY_THE_MOVIE_DB']
movies_urls = {
  page1: "https://api.themoviedb.org/4/list/1?page=1&api_key=#{api_key}&sort_by=original_order.asc&language=fr",
  page2: "https://api.themoviedb.org/4/list/1?page=2&api_key=#{api_key}&sort_by=original_order.asc&language=fr",
  page3: "https://api.themoviedb.org/4/list/1?page=3&api_key=#{api_key}&sort_by=original_order.asc&language=fr"
  # page4: "https://api.themoviedb.org/4/list/1?page=4&api_key=#{api_key}&sort_by=original_order.asc"
}

puts "create Movies form api call"

movies_urls.each_value do |movies_url|
  parsing(movies_url)["results"].each do |movie|
    Movie.create!(
      title: movie["title"],
      resume: movie["overview"],
      photo: open("https://image.tmdb.org/t/p/w500#{movie['poster_path']}"),
      language: movie["original_language"],
      media_type: movie["media_type"],
      popularity: movie["popularity"],
      release_date: movie["release_date"],
      user_id: user1.id
      )
  end
end


# movies_list = parsing(movies_url)

# puts "create Movies form api call"


# movies_list["results"].each do |movie|
#   Movie.create!(
#     title: movie["title"],
#     resume: movie["overview"],
#     photo: open("https://image.tmdb.org/t/p/w500#{movie['poster_path']}"),
#     language: movie["original_language"],
#     media_type: movie["media_type"],
#     popularity: movie["popularity"],
#     release_date: movie["release_date"],
#     user_id: user1.id
#     )
# end
