class Book < ApplicationRecord
  has_many :list_books, dependent: :destroy
  has_many :lists, through: :list_books
  has_many :book_reviews, dependent: :destroy
  validates :title, :description, presence: true
  validates :title, uniqueness: true


  
  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:title,:description,:author],
  using: {
    tsearch: { prefix: true }
  }

end
