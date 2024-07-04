require "open-uri"
require "json"

Movie.destroy_all
url = "https://tmdb.lewagon.com/movie/top_rated"
top_rated = URI.open(url).read
movies = JSON.parse(top_rated)

movies["results"].each do |m|
  poster_path = m["poster_path"]
  Movie.create!(
    title: m["title"],
    overview: m["overview"],
    rating: m["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w500#{poster_path}"
    )
end
