if @movie_review.persisted?
  json.form render(partial: "movies/form_review", formats: :html, locals: {movie: @movie, movie_review: MovieReview.new})
  json.review render(partial: "movies/review", formats: :html, locals: {rating_av: @rating_av, })
  json.average render(partial: "movies/average_rating", formats: :html, locals: {rating_av: @rating_av, reviews: @reviews})
  json.stars render(partial: "movies/stars_average", formats: :html, locals: {rating: @rating_av})
else
  json.form render(partial: "movies/form_review", formats: :html, locals: {movie: @movie, movie_review: @movie_review})
end
