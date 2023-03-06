class List < ApplicationRecord
  belongs_to :user
  has_many :list_movies

  validates :name, presence: true
end
