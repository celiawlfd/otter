class BookReview < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rating, presence: true
  validates :book, uniqueness: { scope: :user }

end
