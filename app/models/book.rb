class Book < ApplicationRecord
  has_many :list_books, dependent: :destroy
  has_many :lists, through: :list_books
  has_many :book_reviews, dependent: :destroy
  validates :title, :description, presence: true
end
