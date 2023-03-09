# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri" # GEM to parse data from web

url_movies = "https://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url_movies).read)

Movie.destroy_all
puts "creating movies"

movies["results"].each do |movie|
  movie = Movie.new(
    title: movie['original_title'],
    description: movie['overview'],
    photo_url: "https://image.tmdb.org/t/p/original/#{movie['poster_path']}",
    year: movie['release_date'],
    duration: "",
    director: ""
  )
  movie.save!

  puts "creating movie #{movie.id}, #{movie.title}"
end

url_books = "https://www.googleapis.com/books/v1/volumes?q=amour"
books = JSON.parse(URI.open(url_books).read)

Book.destroy_all
puts "Creating Books"

books["items"].each do |book|
  book = Book.new(
    title: book['title'],
    author: book['authors'],
    description: book['description'],
    photo_url: book["imageLinks"]["thumbnail"],
    year: book['publishedDate'],
    pages_number: book['pageCount']
  )

  puts "creating book #{book.id}, #{book.title}"
end


puts "done"
