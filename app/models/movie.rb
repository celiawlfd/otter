class Movie < ApplicationRecord
  has_many :list_movies, dependent: :destroy
  has_many :lists, through: :list_movies
  has_many :movie_reviews, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end

