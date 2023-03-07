class Movie < ApplicationRecord
  has_many :list_movies
  has_many :lists, through: :list_movie
  has_one_attached :photo_url

  validates :title, presence: true
  validates :description, presence: true
end
