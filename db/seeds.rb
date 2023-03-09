# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri" # GEM to parse data from web

# url_movies = "https://tmdb.lewagon.com/movie/top_rated"
# movies = JSON.parse(URI.open(url_movies).read)

# Movie.destroy_all
# puts "creating movies"

# movies["results"].each do |movie|
#   movie = Movie.new(
#     title: movie['original_title'],
#     description: movie['overview'],
#     photo_url: "https://image.tmdb.org/t/p/original/#{movie['poster_path']}",
#     year: movie['release_date'],
#     duration: "",
#     director: ""
#   )
#   movie.save!

#   puts "creating movie #{movie.id}, #{movie.title}"
# end

# Book.destroy_all
# puts "Creating Books"

# url_books = "https://www.googleapis.com/books/v1/volumes?q=war"
# books = JSON.parse(URI.open(url_books).read)

# books["items"].each do |book|
#   book = Book.new(
#     title: book["volumeInfo"]['title'],
#     author: book["volumeInfo"]['authors'],
#     description: book["volumeInfo"]['description'],
#     photo_url: book["volumeInfo"]["imageLinks"]["thumbnail"],
#     year: book["volumeInfo"]['publishedDate'],
#     pages_number: book["volumeInfo"]['pageCount']
#   )
#   book.save
#   puts "creating book #{book.id}, #{book.title}"
# end


# url_books = "https://www.googleapis.com/books/v1/volumes?q=cats"
# books = JSON.parse(URI.open(url_books).read)

# books["items"].each do |book|
#   book = Book.new(
#     title: book["volumeInfo"]['title'],
#     author: book["volumeInfo"]['authors'],
#     description: book["volumeInfo"]['description'],
#     photo_url: book["volumeInfo"]["imageLinks"]["thumbnail"],
#     year: book["volumeInfo"]['publishedDate'],
#     pages_number: book["volumeInfo"]['pageCount']
#   )
#   book.save
#   puts "creating book #{book.id}, #{book.title}"
# end

#   url_books = "https://www.googleapis.com/books/v1/volumes?q=seals"
# books = JSON.parse(URI.open(url_books).read)

# books["items"].take(3).each do |book|
#   book = Book.new(
#     title: book["volumeInfo"]['title'],
#     author: book["volumeInfo"]['authors'],
#     description: book["volumeInfo"]['description'],
#     photo_url: book["volumeInfo"]["imageLinks"]["thumbnail"],
#     year: book["volumeInfo"]['publishedDate'],
#     pages_number: book["volumeInfo"]['pageCount']
#   )
#   book.save
#   puts "creating book #{book.id}, #{book.title}"
# end
# puts "done"





require "podcast_api"

api_key = ENV["LISTEN_API_KEY"]
client = PodcastApi::Client.new(api_key: api_key)

puts "Creating Podcasts"

response = client.search(q: 'startup', type: 'podcasts')
puts JSON.parse(response.body).results

# podcasts[:results].each do |podcast|
#   podcast = Podcast.new(
#     title: podcasts[:title_original],
#     publisher: podcasts[:podcast][:publisher_original],
#     description: podcasts[:description_original],
#     image_url: podcasts[:podcast][:image],
#     lenght: podcasts[:audio_lenght_sec]
#   )
#   podcast.save
#   puts "creating book #{podcast.id}, #{podcast.title}"
# end
# puts "done"
