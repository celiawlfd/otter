class Podcast < ApplicationRecord
  has_many :list_podcasts, dependent: :destroy
  has_many :lists, through: :list_podcasts
  validates :title, :description, presence: true
end
