class Movie < ApplicationRecord
  has_many :list_movies
  has_many :lists, through: :list_movie

  validates :name, presence: true
  validates :description, presence: true
  validates :director, presence: true
end
