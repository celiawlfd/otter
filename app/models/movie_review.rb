class MovieReview < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :rating, presence: true
  validates :movie, uniqueness: { scope: :user }
end
