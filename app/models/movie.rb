class Movie < ApplicationRecord
  has_many :list_movies

  validates :name, presence: true
  validates :description, presence: true
  validates :director, presence: true
end
