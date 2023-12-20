require "json"
require "open-uri"


Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts "Destroying movie"

puts "Creating movies from API"


url = "http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key"
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)["results"]
movies.each do |movie|
  Movie.create!(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500/#{movie["backdrop_path"]}", rating: movie["vote_average"])
end

list1 = List.create(name: "Top 100 des meilleurs films d'action")
list2 = List.create(name: "Les films à (re)voir <3")

puts "Job is done !"
