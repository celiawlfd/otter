class PodcastReview < ApplicationRecord
  belongs_to :podcast
  belongs_to :user

  validates :rating, presence: true
  validates :podcast, uniqueness: { scope: :user }
end
