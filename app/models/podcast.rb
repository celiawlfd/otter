class Podcast < ApplicationRecord
  has_many :list_podcasts, dependent: :destroy
  has_many :lists, through: :list_podcasts
  has_many :podcast_reviews, dependent: :destroy
  validates :title, :description, presence: true
  validates :title, uniqueness: true



  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:title,:description],
  using: {
    tsearch: { prefix: true }
  }

end
