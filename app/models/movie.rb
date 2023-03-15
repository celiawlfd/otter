class Movie < ApplicationRecord
  has_many :list_movies, dependent: :destroy
  has_many :lists, through: :list_movies
  has_many :movie_reviews, dependent: :destroy
  has_many :movie_recommendations
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :description, presence: true


  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:title,:description],
  using: {
    tsearch: { prefix: true }
  }
end
