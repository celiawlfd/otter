class List < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :list_movies, dependent: :destroy
  has_many :movies, through: :list_movies

  has_many :list_books, dependent: :destroy
  has_many :books, through: :list_books

  has_many :list_podcasts, dependent: :destroy
  has_many :podcasts, through: :list_podcasts


  validates :name, presence: true
  validates :photo, presence: true

end
