class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    movies = current_user.following.map(&:lists).flatten.map(&:list_movies).flatten
    uniq_movies = uniq_movies(movies)
    books = current_user.following.map(&:lists).flatten.map(&:list_books).flatten
    uniq_books = uniq_books(books)
    podcasts = current_user.following.map(&:lists).flatten.map(&:list_podcasts).flatten
    uniq_podcasts = uniq_podcasts(podcasts)
    @culturales = [uniq_movies, uniq_podcasts, uniq_books].flatten.shuffle
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
      format.json {render partial: 'shared/card', locals: { culturale: results }, format: :html}
    end
  end


  private

  def uniq_movies(movies)
    movies_id = []
    uniq_movies = []
    movies.each do |movie|
      if movies_id.exclude?(movie.movie_id)
        uniq_movies << movie
        movies_id << movie.movie_id
      else
        next
      end
    end
    uniq_movies
  end

  def uniq_books(books)
    books_id = []
    uniq_books = []
    books.each do |book|
      if books_id.exclude?(book.book_id)
        uniq_books << book
        books_id << book.book_id
      else
        next
      end
    end
    uniq_books
  end

  def uniq_podcasts(podcasts)
    podcasts_id = []
    uniq_podcasts = []
    podcasts.each do |podcast|
      if podcasts_id.exclude?(podcast.podcast_id)
        uniq_podcasts << podcast
        podcasts_id << podcast.podcast_id
      else
        next
      end
    end
    uniq_podcasts
  end

end
