class ListMovie < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :movie, uniqueness: { scope: :list }
end

