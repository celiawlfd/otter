class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    movies = Movie.all
    books = Book.all
    podcasts = Podcast.all
    @culturales = [movies, podcasts, books].flatten.sample(20)
  end
end
