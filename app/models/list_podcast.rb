class ListPodcast < ApplicationRecord
  belongs_to :list
  belongs_to :podcast
  validates :podcast, uniqueness: { scope: :list }
end
