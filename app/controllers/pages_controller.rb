class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    movies = current_user.following.map(&:lists).flatten.map(&:list_movies).flatten
    books = current_user.following.map(&:lists).flatten.map(&:list_books).flatten
    podcasts = current_user.following.map(&:lists).flatten.map(&:list_podcasts).flatten

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
    respond_to do |format|
      format.html
      format.json {render partial: 'pages/card', locals: { culturale: results }, format: :html}
    end
  end
end
