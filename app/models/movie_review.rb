class MovieReview < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :rating, presence: true
  validates :content, length: { minimum: 3 }
end
