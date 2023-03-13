class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    movies = Movie.all
    books = Book.all
    podcasts = Podcast.all
    @culturales = [movies, podcasts, books].flatten.shuffle
  end

  def search
    movies = Movie.all
    books = Book.all
    podcasts = Podcast.all
    PgSearch::Multisearch.rebuild(Movie)
    PgSearch::Multisearch.rebuild(Book)
    PgSearch::Multisearch.rebuild(Podcast)

    @results = PgSearch.multisearch(params[:query])
  end

  def search_api
  end

end
