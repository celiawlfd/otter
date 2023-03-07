class List < ApplicationRecord
  has_one_attached :photo

  belongs_to :user
  has_many :list_movies, dependent: :destroy
  has_many :movies, through: :list_movies

  validates :name, presence: true
end
