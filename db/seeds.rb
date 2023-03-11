# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri" # GEM to parse data from web
require 'rspotify'

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

Book.destroy_all
puts "Creating Books"

url_books = "https://www.googleapis.com/books/v1/users/106574273445809316735/bookshelves/0/volumes/?maxResults=40&key=AIzaSyDyW21hCshvMzC8eV_DQVO1ehDO5p5XoNk"
books = JSON.parse(URI.open(url_books).read)

books["items"].each do |book|
  book = Book.new(
    title: book["volumeInfo"]['title'],
    author: book["volumeInfo"]['authors'],
    description: book["volumeInfo"]['description'],
    photo_url: book["volumeInfo"]["imageLinks"]["thumbnail"],
    year: book["volumeInfo"]['publishedDate'],
    pages_number: book["volumeInfo"]['pageCount']
  )
  book.save
  puts "creating book #{book.id}, #{book.title}"
end

puts "done"


url = 'https://api.spotify.com/v1/search?q=table&type=show&market=BE'
headers = {
  'Accept' => 'application/json',
  'Content-Type' => 'application/json',
  'Authorization' => 'Bearer BQChNFkcrL2KcbjHGH7m6KLAj_TmkqSamC_JutBb-aD0P87acbimQ9-7lKjwEjdBnUEPueJliHKxhLOq1-qf6ujsC07oYe0kNu6qnnu4LI6sHWHR4bgSftHJJVgpRJkNlfF93uyqYHfyVP_ZGB9eNcCxHHy6nR4S0r-pvmbeGSINgsXA'
}

response = URI.open(url, headers).read
podcasts = JSON.parse(response)

Podcast.destroy_all
puts "Creating Podcasts"

podcasts["shows"]["items"].each do |podcast|
  podcast = Podcast.new(
    title: podcast["name"],
    publisher: podcast["publisher"],
    description: podcast["description"],
    photo_url: podcast["images"].first["url"],
    episode_count: podcast["total_episodes"],
    link: podcast["external_urls"]["spotify"]
  )
  podcast.save
  puts "creating podcast #{podcast.id}, #{podcast.title}"
end
puts "done"

url_environment = 'https://api.spotify.com/v1/search?q=environment&type=show&market=BE'
response = URI.open(url_environment, headers).read
podcasts = JSON.parse(response)

podcasts["shows"]["items"].each do |podcast|
  podcast = Podcast.new(
    title: podcast["name"],
    publisher: podcast["publisher"],
    description: podcast["description"],
    photo_url: podcast["images"].first["url"],
    episode_count: podcast["total_episodes"],
    link: podcast["external_urls"]["spotify"]
  )
  podcast.save
  puts "creating podcast #{podcast.id}, #{podcast.title}"
end
puts "done"

url_startup = 'https://api.spotify.com/v1/search?q=startup&type=show&market=BE'
response = URI.open(url_startup, headers).read
podcasts = JSON.parse(response)

podcasts["shows"]["items"].each do |podcast|
  podcast = Podcast.new(
    title: podcast["name"],
    publisher: podcast["publisher"],
    description: podcast["description"],
    photo_url: podcast["images"].first["url"],
    episode_count: podcast["total_episodes"],
    link: podcast["external_urls"]["spotify"]
  )
  podcast.save
  puts "creating podcast #{podcast.id}, #{podcast.title}"
end
puts "done"
